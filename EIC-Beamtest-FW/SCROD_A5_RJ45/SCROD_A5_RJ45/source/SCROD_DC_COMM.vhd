----------------------------------------------------------------------------------
-- Company			: IDLAB
-- Engineer			: Khanh Le
-- 
-- Create Date		: 17:30:05 11/30/2016 
-- Module Name		: SCROD_DC_COMM 
-- Project Name	: BOREHOLE MUON DETECTOR
-- Target Devices	: Spartan 6 XC6SLX150T-3FGG676
-- Tool versions  : ISE VERSION 14.7
-- Description		: Module handles the communication from scrod to daughter cards
--
-- Revision			: 1
----------------------------------------------------------------------------------
library UNISIM;
library IEEE;
Library UNIMACRO;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use UNISIM.VComponents.all;
use UNIMACRO.vcomponents.all;

use work.all;
use work.BMD_definitions.all;


entity SCROD_DC_COMM is
    Port (CLK              : IN STD_LOGIC;
			 DATA_CLK         : IN STD_LOGIC;
			 PC_SEND          : IN STD_LOGIC;
			 TOP_BOT  			: IN STD_LOGIC;
			 START_READOUT    : IN STD_LOGIC_VECTOR(4 downto 0);
			 DC_NO_GO			: IN STD_LOGIC_VECTOR(4 downto 0);
			 OOPS_RESET			: IN STD_LOGIC;
			 --incoming/outgoing signals from daughter-cards 
			SC_DC_RX       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			SC_DC_DATA     : OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);   
			SC_DC_CLK      : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			DC_SC_TX      : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			DC_SC_DATA     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);


			 --internal control registers
			 TX_BUSY          : OUT STD_LOGIC;
			 CTIME            : OUT STD_LOGIC_VECTOR(27 downto 0);
			 OUTPUT_REGISTER  : OUT GPR;
			 --trigger signals
			 DC_TRIG          : IN STD_LOGIC_VECTOR(3 downto 0);
			 ASIC_EN_BITS     : IN STD_LOGIC_VECTOR(3 downto 0);
			 SCROD_TRIG       : OUT STD_LOGIC_VECTOR(3 downto 0);
			 CDT_TRIG         : OUT STD_LOGIC;
			 TOP_TRIG			: INOUT STD_LOGIC;
			 BOT_TRIG			: INOUT STD_LOGIC;
			 --data from top and bot plans
			 DC_FIFO_RD_EN		: IN STD_LOGIC;
			 DC_FIFO_DOUT		: OUT STD_LOGIC_VECTOR(31 downto 0);
			 DC_FIFO_EMPTY		: OUT STD_LOGIC;
			 START_CON        : OUT STD_LOGIC;
			 DONE_CON			: OUT STD_LOGIC;
			 --data to wave fifo for pc 
			 WAVE_FIFO_CLK		: IN STD_LOGIC;
			 WAVE_FIFO_RST		: IN STD_LOGIC;
			 WAVE_WR_EN			: IN STD_LOGIC;
			 WAVE_DIN			: IN STD_LOGIC_VECTOR(31 downto 0);
			 --signals for fiber transceiver
			 mgttxfault       : IN STD_LOGIC;
			 mgtmod0          : IN STD_LOGIC;
			 mgtlos           : IN STD_LOGIC;
			 mgttxdis         : OUT STD_LOGIC;
			 mgtmod2          : OUT STD_LOGIC;
			 mgtmod1          : OUT STD_LOGIC;
			 mgtrxp           : IN STD_LOGIC;
			 mgtrxn           : IN STD_LOGIC;
			 mgttxp           : OUT STD_LOGIC;
			 mgttxn           : OUT STD_LOGIC;
			 mgtclk1p         : IN STD_LOGIC;
			 mgtclk1n         : IN STD_LOGIC);
end SCROD_DC_COMM;

  architecture Behavioral of SCROD_DC_COMM is
--declearing internal signals for scrod and pc state machine
type eth_tx_st is (idle, 
						 dc_wait_reset, 
						 dc_wait_count, 
						 dc_wait_lo, 
						 check_ready, 
						 load_data, 
						 send_wave_fifo,
						 fifo_rst, 
						 fifo_rst_wait, 
						 fifo_rst_wait1, 
						 reg_fifo_load, 
						 reg_fifo_load1, 
						 reg_fifo_load2, 
						 reg_fifo_load3, 
						 reg_fifo_load4, 
						 reg_fifo_load5, 
						 reg_fifo_load6,
						 send_sc_reg_data, 
						 send_dc_reg_data,
						 footer1,
						 footer2,
						 footer3,
						 footer4,
						 done);						 
signal scrod_pc_st : eth_tx_st := idle;
		

signal scrod_pc_busy 		: std_logic:='0';		
signal fifo_rd_en   			: std_logic:='0';
signal fifo_empty   			: std_logic:='1';
signal dc_wait_ct          : integer:=0;
signal reg_update          : std_logic:='0';
signal dc_rst_done 			: std_logic := '0';
signal dc_num              : std_logic_vector(3 downto 0):=x"0";
signal fifo_sel     			: std_logic_vector(3 downto 0):=x"0";
constant dc_fifo          : std_logic_vector(3 downto 0):=x"1";
constant reg_fifo   			: std_logic_vector(3 downto 0):=x"2";
constant waved_fifo   		: std_logic_vector(3 downto 0):=x"3";
constant footer        		: std_logic_vector(3 downto 0):=x"4";

signal reg_fifo_rst   		: std_logic;
signal reg_fifo_din   		: std_logic_vector(31 downto 0);
signal reg_fifo_wr_en 		: std_logic;
signal reg_fifo_rd_en 		: std_logic;
signal reg_fifo_dout  		: std_logic_vector(7 downto 0);
signal reg_fifo_empty 		: std_logic;


signal wave_rd_en : std_logic;
signal wave_empty : std_logic;
signal wave_dout  : std_logic_vector(7 downto 0);
signal wave_full  : std_logic;

signal sc2pc_t_hold : std_logic := '0';
signal sc2pc_trig   : std_logic := '0';

signal top_bot_word : std_logic_vector(31 downto 0);
signal ready_wait   : integer:=0;

signal output_reg : GPR;

--declearing internal signals for dc to scrod triggering state machine
type triger_state is (idle, 
							 check_trig, 
							 trig_send,
							 send_wait,
							 trigg_hold,
							 srt_count,
							 wait_done);
signal trig_st             : triger_state := idle;
signal trigger_wait 			: integer:=0;
signal trig_count          : std_logic_vector(27 downto 0):=(others => '0');
signal sc_trig 				: std_logic_vector(3 downto 0):=(others => '0');
signal trig_sta            : integer := 0;
signal wire_trig          	: std_logic:='0';
signal trig_mode           : std_logic_vector(3 downto 0):=(others => '0');
signal conn_trig 				: std_logic;
signal scrod_trigger 		: std_logic;
signal top_trigger 			: std_logic;
signal bot_trigger 			: std_logic;
signal IO_dir 					: std_logic;
signal top_trig_buf 			: std_logic_vector(1 downto 0);
signal bot_trig_buf 			: std_logic_vector(1 downto 0);
signal clk_counter   		: unsigned(31 downto 0) := (others => '0');
signal pulse_to_count		: std_logic := '0';
signal pulse_count   		: unsigned(31 downto 0) := (others => '0');
signal start_cnt     		: std_logic := '0';
signal CoTrig_cnt          : std_logic_vector(31 downto 0);
signal trig_count_max      : std_logic_vector(15 downto 0);
signal cnt_busy            : std_logic := '0';

--declearing internal signals for scrod to dc tx state machine
type dc_tx_state is (idle, 
							check_empty, 
							load_data, 
							load_dc_num, 
							load_dc_num1, 
							cmd_check, 					
							send_reset,
							dc_rst_wait,
							dc_rst_wait1,
							start_dc_readout, 
							send_reg, 
							send_data, 
							done, 
							wait_state);
signal scrod_dc_st 			: dc_tx_state := idle;

signal scrod_dc_busy       : std_logic:='0';
signal internal_tx     	  	: std_logic:='0';
signal internal_data_out  	: std_logic:='0';
signal bit_count 	    	  	: integer:=31;
signal cmd_type				: std_logic_vector(3 downto 0):=(others => '0');
signal scrod_reg				: std_logic_vector(7 downto 0):=(others => '0');
signal reg_data 				: std_logic_vector(15 downto 0):=(others => '0');
signal wait_count          : integer:=0;
signal reg_value				: std_logic_vector(15 downto 0):=(others => '0');
signal no_go      			: std_logic:='0';		
signal reg_rb_en           : std_logic:='0';
signal readout             : std_logic:='0';
signal rd_out_cmd				: std_logic_vector(31 downto 0):=(others => '0');

--declearing internal signals for dc to scrod communication
signal dc_fifo_wr_en			: std_logic;
signal dc_fifo_din   		: std_logic_vector(31 downto 0):=(others => '0'); 
signal w1r8_fifo_dout  		: std_logic_vector(7 downto 0):=(others => '0');
signal w18_fifo_empty 	 	: std_logic;
signal dc_bit_count      	: integer := 32;
signal dc_fifo_reset 		: std_logic := '0';
signal dc_wr_en 				: std_logic_vector(2 downto 0);
signal dc_reg_rd_en        : std_logic;
signal dc_reg_dout  			: std_logic_vector(7 downto 0);
signal dc_reg_empty 			: std_logic;
signal dc_rx_data 			: std_logic;
signal dc_rx 					: std_logic;
signal internal_din    : std_logic_vector(3 downto 0);

--declearing ethernet internal signals
signal udp_usr_clk  			: std_logic;
signal tx_udp_data  			: std_logic_vector(7 downto 0);
signal tx_udp_valid 			: std_logic := '0';
signal tx_udp_ready 			: std_logic := '0';

type rx_udp_data_aray is array(6 downto 0) of std_logic_vector(7 downto 0);
signal rx_udp_data_i  		: rx_udp_data_aray; 
signal rx_udp_data    		: std_logic_vector(7 downto 0);

signal rx_udp_valid_i 		: std_logic_vector(6 downto 0);
signal rx_udp_valid   		: std_logic := '0';

signal cmd_fifo_reset    	: std_logic;
signal rx_fifo_rd_en      	: std_logic;
signal rx_fifo_data_out   	: std_logic_vector(31 downto 0):=(others => '0');
signal rx_fifo_empty      	: std_logic;

signal tx_mask		:std_logic_vector(3 downto 0);

signal scrod_pc_sta : integer := 0;
signal scrod_dc_sta : integer := 0;




attribute keep: boolean;
attribute keep of scrod_pc_sta     : signal is true;
attribute keep of scrod_dc_sta    : signal is true;
attribute keep of trig_sta    : signal is true;
attribute keep of scrod_trigger    : signal is true;
attribute keep of reg_fifo_din    : signal is true;
attribute keep of sc_trig    : signal is true;
attribute keep of wire_trig    : signal is true;
attribute keep of start_cnt : signal is true; 
------------------------------------------------------------------------------------------------------------
-----------------------------receiving data from DC---------------------------------------------------------
------------------------------------------------------------------------------------------------------------
begin
syncing_process : process (CLK) begin
if rising_edge(CLK) then
	OUTPUT_REGISTER  <= output_reg;
	internal_din(0) <= DC_SC_DATA(0);
	internal_din(1) <= DC_SC_DATA(1);
	internal_din(2) <= DC_SC_DATA(2);
	internal_din(3) <= DC_SC_DATA(3);
	
end if;
end process;

dc_rx_data <= 	internal_din(0) when dc_num = x"1" else
				internal_din(1) when dc_num = x"2" else
				internal_din(2) when dc_num = x"3" else
				internal_din(3) when dc_num = x"4" else
				'0';
			
dc_rx <= 		DC_SC_TX(0) when dc_num = x"1" else
				DC_SC_TX(1) when dc_num = x"2" else
				DC_SC_TX(2) when dc_num = x"3" else
				DC_SC_TX(3) when dc_num = x"4" else
				'0';

DC_SCROD_data: process(DATA_CLK) begin--shifting in bits to internal signal to check for reset command for fifos
if rising_edge(DATA_CLK) then--shifts on rising edge MSB first
	if dc_rx = '1' then		
		dc_fifo_din(31 downto 1) <= dc_fifo_din(30 downto 0); 
		dc_fifo_din(0) <= dc_rx_data;
		
		if dc_bit_count /= 0 then
			dc_bit_count <= dc_bit_count - 1;
			dc_fifo_wr_en  <= '1';
		else
			dc_bit_count  <= 32;
			dc_fifo_wr_en <= '0';
		end if;
	else
		dc_fifo_din   <= (others => '0');
		dc_bit_count  <= 32;
		dc_fifo_wr_en <= '0';
	end if;	
	
	dc_wr_en(2) <= dc_wr_en(1);
	dc_wr_en(1) <= dc_wr_en(0);
	dc_wr_en(2) <= not w18_fifo_empty;

end if;
end process;

--fifo for top DC plan
DC_MAS_RX_FIFO_W1R8 : entity work.CMD_FIFO_w1r8
  PORT MAP (
	 rst    => dc_fifo_reset,
    wr_clk => DATA_CLK,
    rd_clk => DATA_CLK,
    din    => dc_fifo_din(0 downto 0), 
    wr_en  => dc_fifo_wr_en,    
    rd_en  => '1',        
    dout   => w1r8_fifo_dout,            
    full   => open,   
    empty  => w18_fifo_empty);
	 
DC_MAS_RX_FIFO_W8R32 : entity work.CMD_FIFO_w8r32
  PORT MAP (
    rst    => dc_fifo_reset,
    wr_clk => DATA_CLK,
    rd_clk => CLK,
    din    => w1r8_fifo_dout,
    wr_en  => dc_wr_en(2),
    rd_en  => DC_FIFO_RD_EN,
    dout   => DC_FIFO_DOUT,
    full   => open,
    empty  => DC_FIFO_EMPTY);

DC_REG_FIFO_W1R8 : entity work.CMD_FIFO_w1r8
  PORT MAP (
	 rst    => dc_fifo_reset,
    wr_clk => DATA_CLK,
    rd_clk => udp_usr_clk,
    din    => dc_fifo_din(0 downto 0), 
    wr_en  => dc_fifo_wr_en,    
    rd_en  => dc_reg_rd_en,        
    dout   => dc_reg_dout,            
    full   => open,   
    empty  => dc_reg_empty);

----looking for trigger signal from daughter cards
--top_trigger <= '1' when top_fifo_din(27 downto 0) = x"00000CD" else '0';
--bot_trigger <= '1' when bot_fifo_din(27 downto 0) = x"00000CD" else '0';

dc_fifo_reset <= '1' when dc_fifo_din(27 downto 0) = x"ABABABA" else '0';

START_CON <= '1' when dc_fifo_din(31 downto 0) = x"77617665" else '0';
DONE_CON  <= '1' when dc_fifo_din(31 downto 0) = x"FACEFACE" else '0';

------------------------------------------------------------------------------------------------------------
-----------------------------receving trigger from dc-------------------------------------------------------
------------------------------------------------------------------------------------------------------------

trig_counter : COUNTER_LOAD_MACRO
   generic map (
      COUNT_BY => X"000000000001", -- Count by value
      DEVICE => "SPARTAN6",         -- Target Device: "VIRTEX5", "VIRTEX6", "SPARTAN6" 
      WIDTH_DATA => 28)            -- Counter output bus width, 1-48
   port map (
      Q => trig_count,         -- Counter output, width determined by WIDTH_DATA generic 
      CLK => CLK, -- 1-bit clock input
      CE =>  '1',--trig_counter_stop,  -- 1-bit clock enable input
      DIRECTION => '1',  -- 1-bit up/down count direction input, high is count up
      LOAD => '0',       -- 1-bit active high load input
      LOAD_DATA => (others => '0'), -- Counter load data, width determined by WIDTH_DATA generic 
      RST => '0');         -- 1-bit active high synchronous reset
		
		
	
TOP_TRIG_IOBUF : IOBUF
	generic map (
		DRIVE      => 12,
		IOSTANDARD => "DEFAULT",
		SLEW       => "SLOW")
	port map (
		O  => top_trigger, -- Buffer output
		IO => TOP_TRIG,    -- Buffer inout port (connect directly to top-level port)
		I  => scrod_trigger, -- Buffer input
		T  => IO_dir -- 3-state enable input, high=input, low=output
	);
	
	
BOT_TRIG_IOBUF : IOBUF
	generic map (
		DRIVE      => 12,
		IOSTANDARD => "DEFAULT",
		SLEW       => "SLOW")
	port map (
		O  => bot_trigger, -- Buffer output
		IO => BOT_TRIG, -- Buffer inout port (connect directly to top-level port)
		I  => scrod_trigger, -- Buffer input
		T  => IO_dir -- 3-state enable input, high=input, low=output
	);

map_trigger_flip_flop : entity work.edge_to_pulse_converter
	port map(CLOCK        => CLK,
				INPUT_EDGE   => conn_trig,
				OUTPUT_PULSE => pulse_to_count,
				CLOCK_ENABLE => '1');

--anding top and bottom triggers together

conn_trig  <= '0' 				when ASIC_EN_BITS = x"0" else
				  top_trig_buf(1) when ASIC_EN_BITS = x"1" or ASIC_EN_BITS = x"2" or ASIC_EN_BITS = x"3" else
				  bot_trig_buf(1) when ASIC_EN_BITS = x"4" or ASIC_EN_BITS = x"8" or ASIC_EN_BITS = x"C" else
			     top_trig_buf(1) and bot_trig_buf(1);
	

wire_trig <= DC_TRIG(0)                					 				   when ASIC_EN_BITS = x"1" else
				 DC_TRIG(1)                					 				   when ASIC_EN_BITS = x"2" else
				 DC_TRIG(0) and DC_TRIG(1) 					 				   when ASIC_EN_BITS = x"3" else
				 DC_TRIG(2)                					 				   when ASIC_EN_BITS = x"4" else
				 DC_TRIG(0) and DC_TRIG(2) 					 				   when ASIC_EN_BITS = x"5" else
				 DC_TRIG(1) and DC_TRIG(2)					 					   when ASIC_EN_BITS = x"6" else
				 DC_TRIG(0) and DC_TRIG(1) and DC_TRIG(2) 				   when ASIC_EN_BITS = x"7" else
				 DC_TRIG(3)                					 				   when ASIC_EN_BITS = x"8" else
				 DC_TRIG(0) and DC_TRIG(3) 					 				   when ASIC_EN_BITS = x"9" else
				 DC_TRIG(1) and DC_TRIG(3) 					 				   when ASIC_EN_BITS = x"A" else
				 DC_TRIG(0) and DC_TRIG(1) and DC_TRIG(3) 				   when ASIC_EN_BITS = x"B" else
				 DC_TRIG(2) and DC_TRIG(3)					 					   when ASIC_EN_BITS = x"C" else
				 DC_TRIG(0) and DC_TRIG(2) and DC_TRIG(3) 				   when ASIC_EN_BITS = x"D" else
				 DC_TRIG(1) and DC_TRIG(2) and DC_TRIG(3) 				   when ASIC_EN_BITS = x"E" else
				 DC_TRIG(0) and DC_TRIG(1) and DC_TRIG(2) and DC_TRIG(3) when ASIC_EN_BITS = x"F" else '0';

trig_mode      <= output_reg(6)(3 downto 0);
trig_count_max <= output_reg(18);
start_cnt      <= output_reg(19)(0);

--trigger mask for each DC				
SCROD_TRIG  <= sc_trig and ASIC_EN_BITS;

--copy of trigger to CDT
CDT_TRIG    <= wire_trig when trig_mode = x"2" else
					conn_trig when trig_mode = x"3" else '1';

--process sends global tigger to FTSW when both plans have an event
global_trigger_process: process(CLK) begin
if rising_edge(CLK) then

--buffering triggers 
top_trig_buf(1) <= top_trig_buf(0);
top_trig_buf(0) <= top_trigger;

bot_trig_buf(1) <= bot_trig_buf(0);
bot_trig_buf(0) <= bot_trigger;

if OOPS_RESET = '1' then
	trig_st <= idle;
else
	case trig_st is
		when idle =>--waits for top plan to send trigger
			trig_sta      <= 0;
			CoTrig_cnt    <= std_logic_vector(pulse_count);
			sc_trig       <= x"0";
			sc2pc_trig    <= '0';
			scrod_trigger <= '0';
			IO_dir        <= '1';
			trigger_wait  <= 0;
			cnt_busy      <= '0';
			trig_st       <= idle;
			if wire_trig = '1' and trig_mode = x"2" then
				sc_trig   <= x"F";
				trig_st   <= trig_send;
			elsif conn_trig = '1' and trig_mode = x"3" then
				IO_dir        <= '0';
				scrod_trigger <= '1';
				trig_st       <= trig_send;
			elsif start_cnt = '1' then
				cnt_busy      <= '1';
				CoTrig_cnt    <= (others => '0');
				clk_counter   <= (others => '0');
				pulse_count   <= (others => '0');
				trig_st       <= srt_count;
			end if;
		
		when trig_send =>--sends trig to pc
			trig_sta <= 2;
			if scrod_pc_busy = '0' then
				sc2pc_trig <= '1';
				trig_st    <= send_wait;
			else
				sc2pc_trig <= '0';
				trig_st <= trig_send;
			end if;
		
		when send_wait =>--wait for module to send trigger to pc
			trig_sta <= 3;
			if scrod_pc_busy = '1' then
				sc2pc_trig <= '0';
				trig_st    <= trigg_hold;
			else
				if trigger_wait < 10 then
					trigger_wait <= trigger_wait + 1;
				else
					trigger_wait <= 0;
					sc2pc_trig   <= '1';
				end if;
				trig_st <= send_wait;
			end if;
		
		when trigg_hold =>--holding trigger high until data is sent to PC	
			trig_sta <= 4;
			if PC_SEND = '1' then
				trig_st <= idle;	
			else 
				if trigger_wait < 900000000 then
					trigger_wait <= trigger_wait +1;
					trig_st      <= trigg_hold;
				else
					trigger_wait <= 0;
					trig_st      <= idle;
				end if;
			end if;

		when srt_count => --starts count for count max clock cycles
			trig_sta <= 5;
			trig_st  <= srt_count;
			if clk_counter(31 downto 16) /= unsigned(trig_count_max) then
				clk_counter  <= clk_counter + 1;
				if pulse_to_count = '1' and pulse_count /= x"FFFFFFFF" then
					pulse_count <= pulse_count + 1;
				end if;
			else
				trig_st  <= wait_done;
			end if;
			
		when wait_done => --waits for other process to finish 
			trig_sta   <= 6;
			trig_st    <= wait_done;
			CoTrig_cnt <= std_logic_vector(pulse_count);
			if start_cnt = '0' then
				trig_st  <= idle;
			end if;
		
		when others =>
			trig_st <= idle;
			
	end case;		
end if;
end if;
end process;

------------------------------------------------------------------------------------------------------------
-----------------------------sending data from SCROD to PC--------------------------------------------------
------------------------------------------------------------------------------------------------------------

REG_READ_BACK_FIFO : entity work.STATE_FIFO
  PORT MAP (
    rst    => reg_fifo_rst,
    wr_clk => udp_usr_clk,
    rd_clk => udp_usr_clk,
    din    => reg_fifo_din,
    wr_en  => reg_fifo_wr_en,
    rd_en  => reg_fifo_rd_en,
    dout   => reg_fifo_dout,
    full   => open,
    empty  => reg_fifo_empty);

WAVEFORM_FIFO : entity work.WAVE_FIFO
  PORT MAP (
    rst    => WAVE_FIFO_RST,
    wr_clk => WAVE_FIFO_CLK,
    rd_clk => udp_usr_clk,
    din    => WAVE_DIN,
    wr_en  => WAVE_WR_EN,
    rd_en  => wave_rd_en,
    dout   => wave_dout,
    full   => wave_full,
    empty  => wave_empty);
	 
	 
tx_udp_data <= dc_reg_dout    when fifo_sel = dc_fifo   else
					wave_dout      when fifo_sel = waved_fifo else 
					reg_fifo_dout  when fifo_sel = reg_fifo   else 
					x"00"          when fifo_sel = footer     else x"A1";

dc_reg_rd_en    <= fifo_rd_en when fifo_sel = dc_fifo   else '0';
wave_rd_en      <= fifo_rd_en when fifo_sel = waved_fifo else '0';
reg_fifo_rd_en  <= fifo_rd_en when fifo_sel = reg_fifo   else '0';

fifo_empty <= dc_reg_empty   when fifo_sel = dc_fifo    else
				  wave_empty     when fifo_sel = waved_fifo else
				  reg_fifo_empty when fifo_sel = reg_fifo   else '1';

tx_udp_valid <= '1' when scrod_pc_st = send_wave_fifo  or scrod_pc_st = send_sc_reg_data or scrod_pc_st = send_dc_reg_data 
							or scrod_pc_st = footer1 or scrod_pc_st = footer2 or scrod_pc_st = footer3 or scrod_pc_st = footer4
							else '0';


top_bot_word <= x"746f700a" when TOP_BOT = '1' else --'top' in lower case
					 x"626f740a" when TOP_BOT = '0' else --'bot' in lower case
					 x"73746174";                        --'stat' in lower case




--process sends dc data up to pc
SCROD_PC_DATA : process(udp_usr_clk) begin
if rising_edge(udp_usr_clk) then
if OOPS_RESET = '1' then
	scrod_pc_st <= idle;
else

case scrod_pc_st is

	when idle =>--resets all decision signals and waits for triggers from daughter cards
		scrod_pc_sta <= 0;
		fifo_sel     <= reg_fifo;
		fifo_rd_en   <= '0';
		reg_update   <= '0';
		no_go        <= '0';
		sc2pc_t_hold <= '0';
		ready_wait   <= 0;	
		reg_fifo_rst <= '0';
		reg_fifo_din <= (others => '0');
		reg_fifo_wr_en <= '0';
		scrod_pc_busy <= '0';
		scrod_pc_st <= idle;
		if PC_SEND = '1' then --readout of wave fifo to pc
			fifo_sel      <= waved_fifo;
			scrod_pc_busy <= '1';
			scrod_pc_st   <= check_ready;
		elsif reg_rb_en = '1' then--read back scrod/dc register
			reg_update   <= '1';
			reg_fifo_rst <= '1';
			scrod_pc_st  <= fifo_rst;
		elsif DC_NO_GO(4) = '1' then--no response from dc so end "dead"
			no_go        <= '1';
			reg_fifo_rst <= '1';
			scrod_pc_st  <= fifo_rst;
		elsif sc2pc_trig = '1' then--good event trigger send to pc for readout
			sc2pc_t_hold <= '1';
			reg_fifo_rst <= '1';
			scrod_pc_st  <= fifo_rst;
		end if;
			
	when fifo_rst =>--sends reset signal for register read back fifo
		scrod_pc_sta <= 1;
		scrod_pc_busy <= '1';
		reg_fifo_rst  <= '0';
		scrod_pc_st   <= fifo_rst_wait;
		
	when fifo_rst_wait =>--waits one clock cycle
		scrod_pc_sta <= 2;
		scrod_pc_st <= fifo_rst_wait1;
		
	when fifo_rst_wait1 =>--waits one clock cycle
		scrod_pc_sta <= 3;
		reg_fifo_wr_en <= '0';
		reg_fifo_din   <= x"7363726F"; --'scro' : all lower case
		scrod_pc_st    <= reg_fifo_load;
		
	when reg_fifo_load =>--loads part1 of header file into register read back fifo
		scrod_pc_sta <= 4;
		reg_fifo_wr_en <= '1';
		reg_fifo_din   <= x"7363726F"; --'scro' : all lower case
		scrod_pc_st    <= reg_fifo_load1;
		
	when reg_fifo_load1 =>--loads part2 of header file into register read back fifo
		scrod_pc_sta <= 5;
		reg_fifo_wr_en <= '1';
		reg_fifo_din   <= x"64413530"; --'dA50' : all lower case
		scrod_pc_st    <= reg_fifo_load2;
	
	when reg_fifo_load2 =>--loads part3 of header file into register read back fifo
		scrod_pc_sta <= 6;
		reg_fifo_wr_en <= '1';
		reg_fifo_din   <= top_bot_word; --will either say 'top','bot','stat' : all lower case
		scrod_pc_st    <= reg_fifo_load3;
		
	when reg_fifo_load3 =>--loads part4 of header file into register read back fifo
		scrod_pc_sta <= 7;
		reg_fifo_wr_en <= '1';
		reg_fifo_din   <= x"73796e63"; --'sync' : all lower case
		scrod_pc_st    <= reg_fifo_load4;
		
	when reg_fifo_load4 =>--loads requested register value into register read back fifo
		scrod_pc_sta <= 8;
		if dc_num = x"0" and reg_update = '1' then
			reg_fifo_wr_en <= '1';
			reg_fifo_din   <= x"00" & rx_fifo_data_out(23 downto 16) & reg_value; --x"00" & reg num & reg vlaue
			scrod_pc_st    <= reg_fifo_load6;	
		elsif dc_num /= x"0" and reg_update = '1' then
			reg_fifo_wr_en <= '0';--if requested register value is from dc then wait for dc to send value
			reg_fifo_din   <= x"00000000";
			scrod_pc_st    <= dc_wait_reset;
		elsif sc2pc_t_hold = '1' then
			reg_fifo_wr_en <= '1';
			reg_fifo_din   <= x"74726967";-- 'trig': in lower case, sending trigger to pc 
			scrod_pc_st    <= reg_fifo_load6;
		elsif no_go = '1' then
			reg_fifo_wr_en <= '1';
			reg_fifo_din   <= x"64656164";--'dead : : all lower case
			scrod_pc_st    <= reg_fifo_load5;			
		end if;
	
	when 	reg_fifo_load5 => --dc didnt respond so send 'dead' to pc
		scrod_pc_sta <= 9;
		reg_fifo_wr_en <= '1';
		reg_fifo_din   <= x"64656164";--'dead : : all lower case
		scrod_pc_st    <= reg_fifo_load6;
	
	when 	reg_fifo_load6 => --loading last footer
		scrod_pc_sta <= 10;
		reg_fifo_wr_en <= '1';
		reg_fifo_din   <= x"00000000";
		scrod_pc_st    <= check_ready;
		
	when dc_wait_reset =>--waits for dc to send fifo reset signal before moving to next state
		scrod_pc_sta <= 11;
		scrod_pc_st <= dc_wait_reset;
		if dc_fifo_reset = '1' then
			ready_wait  <= 0;
			scrod_pc_st <= dc_wait_lo;
		else
			if ready_wait < 1000 then
				ready_wait  <= ready_wait + 1;
			else
				ready_wait     <= 0;--if dc doesnt respond then send 'dead'
				reg_fifo_din   <= x"64656164";--'dead : : all lower case
				scrod_pc_st    <= reg_fifo_load5;
			end if;
		end if;		
		
	when dc_wait_lo => --waits for dc to finsh transfer
		scrod_pc_sta <= 12;
		scrod_pc_st <= dc_wait_lo;
		if dc_rx = '0' and dc_rx_data = '0' then
			if ready_wait < 50 then
				ready_wait  <= ready_wait + 1;
			else
				ready_wait     <= 0;
				scrod_pc_st    <= check_ready;
			end if;
		end if;

	when check_ready =>--checks if fiber is ready to send data and if fifo is empty
		scrod_pc_sta <= 14;
		reg_fifo_wr_en <= '0';
		if tx_udp_ready = '1' and fifo_empty = '0' then				
			fifo_rd_en  <= '1';
			scrod_pc_st <= load_data;
		else
			fifo_rd_en <= '0';
			if ready_wait < 100000000 then--if not ready before timer then go back to idle
				ready_wait  <= ready_wait + 1;
				scrod_pc_st <= check_ready;
			else
				ready_wait  <= 0;
				scrod_pc_st <= idle;
			end if;
		end if;

	when load_data =>--loads data into fiber module
		scrod_pc_sta <= 15;
		fifo_rd_en  <= '1';
		if reg_update = '1' then 
			scrod_pc_st <= send_sc_reg_data;--read back from dc
		else
			scrod_pc_st <= send_wave_fifo;--reading back from scrod
		end if;
		
	when send_wave_fifo =>--send data from wave fifo to pc
		scrod_pc_sta <= 16;
		fifo_rd_en   <= '1';
		scrod_pc_st  <= send_wave_fifo;
		if fifo_empty = '1' then
			fifo_sel    <= footer;
			scrod_pc_st <= footer1;
		end if;
					
	when send_sc_reg_data => --send register data from scrod to pc
		scrod_pc_sta <= 17;
		fifo_rd_en <= '1';
		scrod_pc_st <= send_sc_reg_data;
		if fifo_empty = '1' then
			fifo_sel    <= dc_fifo;
			scrod_pc_st <= send_dc_reg_data;
		end if;		
	
	when send_dc_reg_data =>--sending register data from dc to pc
		scrod_pc_sta <= 18;
		fifo_rd_en <= '1';
		scrod_pc_st <= send_dc_reg_data;
		if fifo_empty = '1' then
			fifo_sel    <= footer;
			scrod_pc_st <= footer1;
		end if;
	
	when footer1 => -- sending footer1 to pc
		scrod_pc_sta <= 19;
		fifo_rd_en <= '1';
		scrod_pc_st <= footer2;
		
	when footer2 => -- sending footer2 to pc
		scrod_pc_sta <= 20;
		fifo_rd_en <= '1';
		scrod_pc_st <= footer3;
		
	when footer3 => -- sending footer3 to pc
		scrod_pc_sta <= 21;
		fifo_rd_en <= '1';
		scrod_pc_st <= footer4;
		
	when footer4 => -- sending footer4 to pc
		scrod_pc_sta <= 22;
		fifo_rd_en <= '1';
		scrod_pc_st <= done;

	when done =>
		scrod_pc_sta <= 23;
		fifo_rd_en   <= '0';
		reg_update   <= '0';
		no_go        <= '0';
		dc_wait_ct   <= 0;
		scrod_pc_st  <= idle;
			
	when others =>
		scrod_pc_st  <= idle;
		
end case;
end if;
end if;
end process;

------------------------------------------------------------------------------------------------------------
-----------------------------communication from PC to SCROD-------------------------------------------------
------------------------------------------------------------------------------------------------------------
ETH_MODULE: entity work.eth_top PORT MAP(
      ext_user_clk   => clk,
		--data to be sent to PC--
	   tx_udp_data    => tx_udp_data,  
		tx_udp_valid   => tx_udp_valid, 
		tx_udp_ready   => tx_udp_ready,
		--data from PC--
	   rx_udp_data    => rx_udp_data,   
		rx_udp_valid   => rx_udp_valid,
		rx_udp_ready   => '1',
		trx_udp_clock	=> udp_usr_clk,
		--fiber transceiver signals--
		mgttxfault 		=> mgttxfault,  
		mgtmod0 			=> mgtmod0,
		mgtlos 			=> mgtlos,
		mgttxdis 		=> mgttxdis,
		mgtmod2 			=> mgtmod2,
		mgtmod1 			=> mgtmod1,
		mgtrxp 			=> mgtrxp,
		mgtrxn 			=> mgtrxn,
		mgttxp 			=> mgttxp,
		mgttxn 			=> mgttxn,
		mgtclk1p 		=> mgtclk1p,
		mgtclk1n 		=> mgtclk1n);
		
proc_sync_cmd_hdr: process (udp_usr_clk) begin
	if rising_edge(udp_usr_clk) then
		rx_udp_data_i(6) <= rx_udp_data_i(5);
		rx_udp_data_i(5) <= rx_udp_data_i(4);
		rx_udp_data_i(4) <= rx_udp_data_i(3);
		rx_udp_data_i(3) <= rx_udp_data_i(2);
		rx_udp_data_i(2) <= rx_udp_data_i(1);
		rx_udp_data_i(1) <= rx_udp_data_i(0);
		rx_udp_data_i(0) <= rx_udp_data;
		
		
		if (rx_udp_data = x"43" and rx_udp_data_i(0) = x"4e" and rx_udp_data_i(1) = x"59" and rx_udp_data_i(2) = x"53") then --"SYNC"
			cmd_fifo_reset <= '1';
			rx_udp_valid_i <= (others => '0');
		else
			cmd_fifo_reset             <= '0';
			rx_udp_valid_i(6 downto 1) <= rx_udp_valid_i(5 downto 0);
			rx_udp_valid_i(0) 			<= rx_udp_valid;
		end if;	
	end if;
end process;

PC_SCROD_RX_FIFO_W8R32 : entity work.CMD_FIFO_w8r32
  PORT MAP (
	 rst    => cmd_fifo_reset,
    wr_clk => udp_usr_clk,
    rd_clk => DATA_CLK,
    din    => rx_udp_data_i(6), 
    wr_en  => rx_udp_valid_i(6),  
    rd_en  => rx_fifo_rd_en,           
    dout   => rx_fifo_data_out,            
    full   => open,   
    empty  => rx_fifo_empty);  
------------------------------------------------------------------------------------------------------------
-----------------------------sending data form SCROD to DC--------------------------------------------------
------------------------------------------------------------------------------------------------------------

tx_mask<= 	"0001" when dc_num = x"1"  else
				"0010" when dc_num = x"2"  else
				"0100" when dc_num = x"3"  else
				"1000" when dc_num = x"4"  else
				"0000";

SC_DC_RX<=tx_mask and (internal_tx & internal_tx & internal_tx & internal_tx);

SC_DC_DATA<=tx_mask and (internal_data_out & internal_data_out & internal_data_out & internal_data_out);


sending_data : process(DATA_CLK) begin
if rising_edge(DATA_CLK) then

	case scrod_dc_st is
		when idle =>
			scrod_dc_sta <= 0;
			bit_count      	 <= 31;
			rx_fifo_rd_en      <= '0';
			reg_rb_en          <= '0';
			readout            <= '0';
			internal_tx    	 <= '0';
			internal_data_out  <= '0';
			TX_BUSY            <= '0';
			dc_rst_done        <= '0';
			reg_value          <= x"0000";
			scrod_dc_busy      <= '0';
			scrod_dc_st        <= idle;
			if START_READOUT(4) = '1' then
				scrod_dc_busy <= '1';
				readout     <= '1';
				dc_num      <= START_READOUT(3 downto 0);
				rd_out_cmd  <= START_READOUT(3 downto 0) & x"ABCDABC";
				scrod_dc_st <= send_reset;
			elsif rx_fifo_empty = '0' then
				scrod_dc_busy <= '1';
				scrod_dc_st   <= check_empty;
			end if;
		
		when check_empty => --checks if rx fifo is empty
			scrod_dc_sta <= 1;
			bit_count   <= 31;
			internal_tx <= '0';
			output_reg(5) <= x"0000";
			output_reg(0)(0) <= '0';
			scrod_dc_st <= idle;
			if rx_fifo_empty = '0' then 
				rx_fifo_rd_en <= '1';
				TX_BUSY       <= '1';
				scrod_dc_st   <= load_dc_num;
			end if;
		
		when load_dc_num =>--loads dc number into internal regiter for decision making
			scrod_dc_sta  <= 2;
			rx_fifo_rd_en <= '0';
			dc_num        <= rx_fifo_data_out(31 downto 28);
			scrod_dc_st   <= load_dc_num1;
			
		when load_dc_num1 =>--waits one clock cycle 
			scrod_dc_sta <= 3;
			dc_num       <= rx_fifo_data_out(31 downto 28);
			scrod_dc_st  <= load_data;

		when load_data =>--prases out cmd from pc and either sends to dc or does comd
			scrod_dc_sta <= 4;
			if dc_num = x"0" then
				cmd_type    <= rx_fifo_data_out(27 downto 24);
				scrod_reg   <= rx_fifo_data_out(23 downto 16);
				reg_data    <= rx_fifo_data_out(15 downto 0);
				scrod_dc_st <= cmd_check;
			else
				internal_data_out  <= rx_fifo_data_out(bit_count);
				scrod_dc_st 	    <= send_data;
				reg_rb_en          <= '0';
				if rx_fifo_data_out(27 downto 24) = x"D" then--read back dc register value from pc
					reg_rb_en   <= '1';
				end if;
			end if;
	
		when cmd_check =>--checks if command is for scrod, if not sends it to DC
			scrod_dc_sta <= 5;
			if cmd_type = x"E" then--wait command
				wait_count  <= to_integer(unsigned(reg_data));
				scrod_dc_st <= wait_state;	

			elsif cmd_type = x"F" then--program scrod output register
				output_reg(to_integer(unsigned(scrod_reg))) <= reg_data;
				scrod_dc_st <= check_empty;
			
			elsif cmd_type = x"D" then--read back scrod output register in scrod
				if scrod_reg = x"45" then --69
					reg_value <= CoTrig_cnt(15 downto 0);
				elsif scrod_reg = x"60" then --96
					reg_value <= CoTrig_cnt(31 downto 16);
				else
					reg_value <= output_reg(to_integer(unsigned(scrod_reg)));
				end if;
				reg_rb_en   <= '1';
				scrod_dc_st <= done;
			
			elsif cmd_type = x"A" then--start dc readout
				output_reg(5) <= reg_data(15 downto 12) & x"01" & reg_data(3 downto 0);
				scrod_dc_st            <= check_empty;
				
			else
				reg_rb_en   <= '0';
				scrod_dc_st <= done;
			end if;
		
		when send_reset => --sends fifo reset for dc 
			scrod_dc_sta <= 6;
			TX_BUSY     <= '1';
			bit_count   <= 31;
			dc_num      <= START_READOUT(3 downto 0);
			dc_rst_done <= '1';
			internal_data_out <= rd_out_cmd(bit_count);
			scrod_dc_st <= send_data;
		
		when dc_rst_wait => -- waits for reset to complete
			scrod_dc_sta <= 7;
			scrod_dc_st <= dc_rst_wait1;
			
		when dc_rst_wait1 => -- waits for reset to complete
			scrod_dc_sta <= 8;
			rd_out_cmd  <= START_READOUT(3 downto 0) & x"A000000";
			scrod_dc_st <= start_dc_readout;			
			
		when start_dc_readout =>--starts readout of dc 
			scrod_dc_sta <= 9;
			TX_BUSY     <= '1';
			bit_count   <= 31;
			dc_rst_done <= '0';
			internal_data_out <= rd_out_cmd(bit_count);
			scrod_dc_st <= send_data;
		
		when send_data =>--sending data from fifo to DC
			scrod_dc_sta <= 10;
			internal_tx 		<= '1';
			reg_rb_en         <= '0';
			if readout = '1' then
				internal_data_out <= rd_out_cmd(bit_count);
			else
				internal_data_out <= rx_fifo_data_out(bit_count);
			end if;
			if bit_count /= 0 then
				bit_count    <= bit_count - 1;
				scrod_dc_st  <= send_data;
			else
				scrod_dc_st <= done;
			end if;
		
		when wait_state => --waits then returns to get new command
			scrod_dc_sta <= 11;
			if wait_count /= 0 then
				wait_count  <= wait_count - 1;
				scrod_dc_st <= wait_state;
			else
				wait_count <= 0;
				scrod_dc_st <= done;
			end if;
			
		when done =>--done sending data go back to check empty
			scrod_dc_sta <= 12;
			bit_count   		<= 31;
			internal_tx    	<= '0';
			internal_data_out <= '0';
			reg_rb_en         <= '0';
			if reg_update = '1' then--waits for scrod to send register value to pc before going back to check fifo
				scrod_dc_st <= done;
			elsif dc_rst_done = '1' then--reset is done goes back to send trigger
				scrod_dc_st <= dc_rst_wait;
			else
				scrod_dc_st <= idle;
			end if;
			
		when others =>
			bit_count      	 <= 31;
			internal_tx 		 <= '0';
			internal_data_out  <= '0';
			reg_rb_en          <= '0';
			scrod_dc_st 	    <= idle;
			
	end case;
end if;
end process;
end Behavioral;

