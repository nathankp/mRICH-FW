----------------------------------------------------------------------------------
-- Company        : UH Manoa- Department of Physics
-- Engineer       : KHANH LE
-- Updated        : 
-- Create Date    : 12:33:18 12/26/2017 
-- Module Name    : DataDemuxControl
-- Project Name   : Borehole Moun Detector(BMD)
-- Target Devices : SPARTAN 6 XC6SLX9-2TQG144
-- Tool versions  : ISE 14.7
-- Description    : Module starts readout command to daughter cards, module will either send raw data,  
--						  pedestal subtracted data, pedestal calculated data, or save pedestal calculated data 
--						  to SRAM depending on mode of operations.
--
-- Dependencies   : 1) NO code for reading and writing to SRAM so only MODE 0 can be used
--
-- Revision:   
-- Revision 0.01 - File Created 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.all;
use work.BMD_definitions.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataDemuxControl is
	PORT(
		--GENERAL I/O
		CLK    		: IN STD_LOGIC;
		OOPS   		: IN STD_LOGIC;
		DC_RD_BUSY  : OUT STD_LOGIC;
		RD_SRT 		: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		DC_PED_RD   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		MODE 			: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		FIX_WIN 		: IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		
		
		--I/O TO communication process		
		TX_BUSY 		: IN STD_LOGIC;
		SRT_CON     : IN STD_LOGIC;
		SRT_PC_SEND : OUT STD_LOGIC;
		START_RD		: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		NO_GO 		: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);

		WAVE_WR_EN	: OUT STD_LOGIC;
		WAVE_DIN 	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		WAVE_CLK 	: OUT STD_LOGIC;
		WAVE_RST 	: OUT STD_LOGIC;

		DC_FIFO_EMPTY   : IN STD_LOGIC;
		DC_FIFO_RD_EN   : OUT STD_LOGIC;
		DC_FIFO_DOUT    : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
);
end DataDemuxControl;

architecture Behavioral of DataDemuxControl is
--internal signals for readout pocess
type dc_readout_state is(
	idle,					--waits for send start signal 
	check_tx_busy,		--checks if TX module is busy
	send_rd_srt, 		--sends start readout to dc
	fifo_select,	   --selects correct fifo for enabled dc
	srt_con_wait,		--waits for start condition from dc, if dc doesnt responds sends "DEADBEEF" 
	wait_tx_srt,		--waits for tx sender to start sending
	rd_header_wait,   --waits data to be loaded into fifo
	fifo_wait,        --waits one clk cycle for data to be at fifo output
	rd_header,			--reads 1st part of header, x"77617665"-"wave" in ASCII
	wr_fifo,				--writes header to wave fifo
	wr_last_header,   --writes last header to fifo
	mode_check,			--checks data mode
	sram2bram_srt,		-- start ped data transfer from sram to bram
	fifo2sram_srt,		--starts module that saves ped data into SRAM
	fifo_wait3,			--wait for fifo to get next word
	rd_fifo_wait,		--waits for data to be at dc fifo output
	load_reg,			--loads dc data into register
	load_wave_data,	--loads dc data into wave fifo input
	wr_wave_data,		--wrties wave data into wave fifo
	inc_smp_count,		--increment sample count
	load_bram_add,		--loads address into bram
	bram_wait,			--waits for data to be at bram output
	wr_wave_data1,		--wrties wave data into wave fifo
	inc_smp_count1,	--checks sample count and increments sample count
	load_footer0,
	load_footer,		--loads 1st footer
	load_footer1,		--loads 2nd footer
	load_footer2,		--loads 3rd footer 
	done					--readout complete
);
signal dc_rd_st : dc_readout_state := idle;

signal rd_st 			: integer := 0;
signal smp_count  	: integer := 0;
signal wait_count 	: integer := 0;

signal curr_dcnum 	: std_logic_vector(3 downto 0);
signal curr_smp 		: std_logic_vector(8 downto 0);
signal curr_e_num 	: std_logic_vector(23 downto 0);
signal curr_win_srt  : std_logic_vector(8 downto 0);
signal curr_trig_bit : std_logic_vector(4 downto 0);
signal smp_data 		: std_logic_vector(11 downto 0);
signal dc_data 		: std_logic_vector(31 downto 0);
signal wave_data 		: unsigned(11 downto 0);
signal fifo_sel 		: std_logic_vector(3 downto 0);
signal dc_enabled 	: std_logic_vector(3 downto 0);
signal fifo_empty 	: std_logic := '0';
signal mode01_rd_en 	: std_logic := '0';
signal sram2bram_xfer : std_logic := '0';
signal mode3_rd_en 	: std_logic := '0';
signal fifo2sram_xfer : std_logic := '0';
signal ped_wea			: std_logic_vector(0 downto 0):= "0";
signal ped_addra		: std_logic_vector(10 downto 0);
signal ped_dina		: STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ped_addrb		: std_logic_vector(10 downto 0);
signal ped_doutb		: STD_LOGIC_VECTOR(11 DOWNTO 0);

--internal signals for sram reading process
signal sram2bram_done : std_logic := '0';

--internal signals for sram writing process
signal fifo2sram_done 	: std_logic := '0';


attribute keep: boolean;
attribute keep of DC_RD_BUSY: signal is true;
attribute keep of rd_st: signal is true;
attribute keep of curr_dcnum: signal is true;
attribute keep of curr_smp: signal is true;
attribute keep of curr_e_num: signal is true;
attribute keep of curr_win_srt: signal is true;
attribute keep of curr_trig_bit: signal is true;
attribute keep of dc_data: signal is true;

begin
---------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------IPCORE COMPONENTS---------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
pedarr : entity work.blk_mem_gen_v7_3--bram that saves ped data saved in sram
  PORT MAP (
    clka  => CLK,
    wea 	 => ped_wea,
    addra => ped_addra,
    dina  => ped_dina(11 DOWNTO 0),
    clkb  => CLK,
    addrb => ped_addrb,
    doutb => ped_doutb(11 DOWNTO 0));
	 
	
dc_data    <= DC_FIFO_DOUT;
fifo_empty <= DC_FIFO_EMPTY;

DC_FIFO_RD_EN <= mode01_rd_en when MODE /= x"3" else
				     mode3_rd_en  when MODE = x"3" else '0';
				 
wave_data <= unsigned(smp_data) 							   when MODE = x"0" else --raw data
				 unsigned(smp_data) - unsigned(ped_doutb) when MODE = x"1" else --ped sub data
				 unsigned(ped_doutb) 						   when MODE = x"2" else --ped data readout from sram
				 x"000";																			 --default

WAVE_CLK <= CLK;				 
------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------Process fetches data from DC and starts either sends raw data, pedsub, sram readout, or ped save-----------------------
------------------------------------------------------------------------------------------------------------------------------------------------
DC_read_process:process(CLK) begin
if rising_edge(CLK) then
	if OOPS = '1' then
		dc_rd_st <= idle;
	else
		case dc_rd_st is
			when idle => --waits for send start signal 
				rd_st          <= 0;
				DC_RD_BUSY     <= '0';
				SRT_PC_SEND    <= '0';
				START_RD  	   <= (others => '0'); -- 5 bits
				NO_GO          <= (others => '0'); -- 5 bits
				dc_enabled     <= (others => '0'); -- 4 bits
				curr_dcnum     <= (others => '0'); -- 4 bits
				curr_smp       <= (others => '0'); -- 9 bits
				curr_e_num     <= (others => '0'); -- 24 bits
				curr_win_srt   <= (others => '0'); -- 9 bits
				curr_trig_bit  <= (others => '0'); -- 5 bits			
				smp_data       <= (others => '0'); -- 12 bits
				smp_count	   <= 0;
				wait_count     <= 0;				
				fifo_sel       <= x"0";
				mode01_rd_en   <= '0';
				WAVE_WR_EN     <= '0';
				WAVE_DIN       <= (others => '0'); -- 32 bits
				WAVE_RST       <= '0';
				sram2bram_xfer <= '0';
				fifo2sram_xfer <= '0';
				dc_rd_st       <= idle;								
				if RD_SRT(4) = '1' then --software readout of selected duaghter card  
					DC_RD_BUSY 	 <= '1';
					if MODE = x"2" then
						WAVE_RST     <= '1';
						curr_win_srt <= FIX_WIN;
						curr_dcnum   <= DC_PED_RD;
						dc_rd_st     <= sram2bram_srt;
					else
						dc_enabled   <= RD_SRT(3 downto 0); 
						dc_rd_st     <= check_tx_busy;
					end if;
				end if;		
				
			when check_tx_busy => --checks if TX module is busy
				rd_st    <= 1;
				dc_rd_st <= check_tx_busy;
				if TX_BUSY = '0' then 
					dc_rd_st <= send_rd_srt;
				end if;				

			when send_rd_srt => --sends start readout to dc
				rd_st    <= 2;
				WAVE_RST <= '1';
				START_RD <= '1' & dc_enabled;
				dc_rd_st <= send_rd_srt;
				if TX_BUSY = '1' then
					dc_rd_st <= fifo_select;
				end if;		
				
			when fifo_select => --selects correct fifo for enabled dc
				rd_st    <= 3;
				WAVE_RST <= '0';
				dc_rd_st <= srt_con_wait;
				
			when srt_con_wait => --waits for start condition from dc, if dc doesnt responds sends "DEADBEEF" 
				rd_st    <= 4;
				START_RD <= '0' & dc_enabled;
				dc_rd_st <= srt_con_wait;
				if SRT_CON = '1' then
					dc_rd_st     <= rd_header_wait;
				else
					if wait_count < 900000000 then
						wait_count <= wait_count + 1;
					else
						wait_count <= 0;
						NO_GO      <= '1' & dc_enabled;
						dc_rd_st   <= wait_tx_srt;
					end if;
				end if;
			
			when wait_tx_srt => --waits for tx sender to start sending
				rd_st    <= 5;
				NO_GO    <= '1' & dc_enabled;
				dc_rd_st <= done;
			
			when rd_header_wait => --waits one clk cycle
				rd_st        <= 34;
				mode01_rd_en <= '0';
				WAVE_WR_EN   <= '0';
				dc_rd_st     <= rd_header_wait;
				if fifo_empty = '0' then
					mode01_rd_en <= '1';
					dc_rd_st     <= fifo_wait;
				end if;
				
			when fifo_wait => --waits one clk cycle for data to be at fifo output
				rd_st        <= 6;
				mode01_rd_en <= '0';
				WAVE_WR_EN   <= '0';
				dc_rd_st     <= rd_header;
				
			when rd_header => --reads header file and loads into input of wave fifo
				rd_st        <= 7;
				dc_rd_st     <= rd_header_wait;
				if dc_data(31 downto 28) = x"7" then
					WAVE_DIN     <= dc_data;
					dc_rd_st     <= wr_fifo;
				elsif dc_data(31 downto 28) = x"F" then
					WAVE_DIN     <= dc_data;
					curr_dcnum   <= dc_data(23 downto 20);--dc_enabled;
					curr_smp     <= dc_data(8 downto 0);					
					dc_rd_st     <= wr_fifo;
				elsif dc_data(31 downto 28) = x"C" then
					WAVE_DIN     <= dc_data;
					curr_e_num   <= dc_data(23 downto 0);
					dc_rd_st     <= wr_fifo;
				elsif dc_data(31 downto 28) = x"D" then
					WAVE_DIN       <= dc_data;
					curr_win_srt   <= dc_data(16 downto 8);
					curr_trig_bit  <= dc_data(4 downto 0);
					dc_rd_st       <= wr_last_header;
				end if;
				
			when wr_fifo => --write data into wave fifo
				rd_st        <= 8;
				WAVE_WR_EN   <= '1';
				WAVE_DIN     <= dc_data;
				dc_rd_st     <= rd_header_wait;
				
			when wr_last_header => --writes last header to fifo
				rd_st        <= 9;
				WAVE_WR_EN   <= '1';
				WAVE_DIN     <= dc_data;
				dc_rd_st     <= mode_check;			
			
			when mode_check => --checks data mode
				rd_st          <= 10;
				WAVE_WR_EN     <= '0';	
				mode01_rd_en   <= '0';	
				if MODE = x"0" then --send raw data
					dc_rd_st <= fifo_wait3;
				elsif MODE = x"1" or MODE = x"2" then--read SRAM to do ped sub or send ped data to pc
					sram2bram_xfer <= '1';
					dc_rd_st       <= sram2bram_srt;	
				elsif MODE = x"3" then--save ped data to SRAM
					curr_win_srt 	<= FIX_WIN;
					curr_dcnum   	<= DC_PED_RD;							
					fifo2sram_xfer <= '1';
					dc_rd_st       <= fifo2sram_srt;	
				end if;

			when sram2bram_srt => -- start ped data transfer from sram to bram
				rd_st          <= 11;
				WAVE_RST       <= '0';
				sram2bram_xfer <= '1';
				smp_count      <= 0;
				dc_rd_st       <= sram2bram_srt;
				if sram2bram_done = '1' then
					sram2bram_xfer <= '0';
					dc_rd_st       <= fifo_wait3;
				end if;
				
			when fifo2sram_srt => --starts module that saves ped data into SRAM
				rd_st          <= 12;
				fifo2sram_xfer <= '1';
				dc_rd_st       <= fifo2sram_srt;
				if fifo2sram_done = '1' then
					fifo2sram_xfer <= '0';
					dc_rd_st       <= idle;
				end if;
				
			when fifo_wait3 => --wait for fifo to get next word
				rd_st          <= 13;
				sram2bram_xfer <= '0';
				ped_addrb      <= std_logic_vector(to_unsigned(smp_count,11));
				dc_rd_st       <= fifo_wait3;	
				if fifo_empty = '0' then
					mode01_rd_en <= '1';
					dc_rd_st     <= rd_fifo_wait;	
				end if;					
			
			when rd_fifo_wait => --waits for data to be at dc fifo output
				rd_st        <= 14;
				mode01_rd_en <= '0';
				dc_rd_st     <= load_reg;
			
			when load_reg => --loads dc data into register
				rd_st        <= 15;
				smp_data     <= dc_data(23 downto 12);
				dc_rd_st     <= load_wave_data;	
			
			when load_wave_data => --loads dc data into wave fifo input
				rd_st      <= 16;
				WAVE_DIN   <= x"BD" & '0' & std_logic_vector(to_unsigned(smp_count,11)) & std_logic_vector(wave_data);
				dc_rd_st   <= wr_wave_data;	
				
			when wr_wave_data => --wrties wave data into wave fifo
				rd_st      <= 17;
				WAVE_WR_EN <= '1';
				WAVE_DIN   <= x"BD" & '0' & std_logic_vector(to_unsigned(smp_count,11)) & std_logic_vector(wave_data);
				dc_rd_st   <= inc_smp_count;
				
			when inc_smp_count => --increment sample count
				rd_st      <= 18;
				WAVE_WR_EN <= '0';
				smp_count  <= smp_count + 1;
				if smp_count = NSamplesPerWin*NWIN*NCHPerTX-20 then--starting data transfer to pc
					SRT_PC_SEND <= '1';
				end if;
				dc_rd_st   <= load_bram_add;
				
			when load_bram_add => --loads address into bram
				rd_st      <= 19;
				ped_addrb  <= std_logic_vector(to_unsigned(smp_count,11));
				smp_data   <= dc_data(11 downto 0);
				dc_rd_st   <= bram_wait;
				
			when bram_wait => --waits for data to be at bram output
				rd_st      <= 20;
				ped_addrb  <= std_logic_vector(to_unsigned(smp_count,11));
				dc_rd_st   <= wr_wave_data1;
				
			when wr_wave_data1 => --writes wave data into wave fifo
				rd_st      <= 21;
				WAVE_WR_EN <= '1';
				WAVE_DIN   <= x"BD" & '0' & std_logic_vector(to_unsigned(smp_count,11)) & std_logic_vector(wave_data);
				dc_rd_st   <= inc_smp_count1;			
				
			when inc_smp_count1 => --checks sample count and increments sample count
				rd_st      <= 22;
				WAVE_WR_EN <= '0';
				if smp_count > NSamplesPerWin*NWIN*NCHPerTX-2 then	--all samples for all channels readout reset (2048 = NSamplesPerWin*NWWIN*NCHPerTX) 
					dc_rd_st   <= load_footer0;
				else
					if smp_count = NSamplesPerWin*NWIN*NCHPerTX-20 then--starting data transfer to pc
						SRT_PC_SEND <= '1';
					end if;
					smp_count  <= smp_count + 1;
					dc_rd_st   <= fifo_wait3;
				end if;
			
			when load_footer0 => --loads 1st footer
				WAVE_WR_EN <= '1';
				WAVE_DIN   <=  x"00000000";
				dc_rd_st   <= load_footer;
				
			when load_footer => --loads 1st footer
				rd_st      <= 23;
				WAVE_WR_EN <= '1';
				WAVE_DIN   <= x"E0F1E0F1";
				dc_rd_st   <= load_footer1;
				
			when load_footer1 => --loads 1st footer
				rd_st      <= 24;
				WAVE_WR_EN <= '1';
				WAVE_DIN   <= x"FACEFACE";
				dc_rd_st   <= load_footer2;
				
			when load_footer2 => --loads 1st footer 
				rd_st      <= 25;
				WAVE_WR_EN <= '1';
				WAVE_DIN   <= x"00000000";
				dc_rd_st   <= done;	
							
			when done => --readout complete
				rd_st      <= 26;
				WAVE_WR_EN <= '0';
				dc_rd_st   <= idle;				
					
			when others =>
				dc_rd_st <= idle;
				
		end case;
	end if;
end if;
end process;




------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------Process fetches pedestal data from sram and loads into bram(blk_mem_gen_v7_3)------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------Process saves pedestal data to sram from dc fifo-----------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
--ped_readout_process:process(CLK) begin
--if rising_edge(CLK) then
--	if OOPS = '1' then
--		ped_save_st <= idle;
--	else
--		case ped_save_st is
--			when idle => -- wait for start signal from DC_read_process
--				ped_save_st <= idle;
--				if sram2bram_xfer = '1' then
--					ped_save_st <= load_header;
--				end if;
--				
--			when load_header => --loads 1st header
--			
--			when load_header => --loads 1st header
--			
--			when load_header => --loads 1st header
--			
--			when load_bram_add => --loads bram address
--			
--			when others =>
--				ped_save_st <= idle;
--				
--		end case;
--	end if;
--end if;
--end process; 


end Behavioral;

