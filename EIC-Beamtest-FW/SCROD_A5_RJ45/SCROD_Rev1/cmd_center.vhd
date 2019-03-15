----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:03:54 03/01/2019 
-- Design Name: 
-- Module Name:    cmd_center - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
library UNISIM;
library UNIMACRO;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use UNISIM.VComponents.all;
use UNIMACRO.vcomponents.all;

use work.all;
use work.BMD_definitions.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmd_center is
    Port ( RX_UDP_DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RX_UDP_VALID : in  STD_LOGIC;
           UDP_CLK : in  STD_LOGIC;
           TX_UDP_READY : in  STD_LOGIC;
			  DATA_CLK	:	IN STD_LOGIC;
			  CLK			: IN STD_LOGIC;
			  TOP_BOT   : IN STD_LOGIC;
			  CONTROL_REG : OUT GPR;
           COMMAND : out  STD_LOGIC_VECTOR (31 downto 0);
           QB_RDOUT : out  STD_LOGIC; -- in the future, will be std_logic_vector(7 downto 0); for 8 DC
           QB_SEND : out  STD_LOGIC; -- in the future, will be std_logic_vector(7 downto 0); for 8 DC
           TX_UDP_VALID : out  STD_LOGIC;
           TX_UDP_DATA : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end cmd_center;

architecture Behavioral of cmd_center is
type rx_udp_data_aray is array(6 downto 0) of std_logic_vector(7 downto 0);
signal rx_udp_data_i  : rx_udp_data_aray; 
signal udp_usr_clk 	 : std_logic:= '0';		
signal rx_udp_valid_i : std_logic_vector(6 downto 0):=(others => '0');
signal rx_fifo_data_out : std_logic_vector(31 downto 0):= (others => '0');
signal ready_wait   : integer:=0; 	

signal dc_num              : std_logic_vector(3 downto 0):=x"0";
signal output_reg : GPR;

signal wave_rd_en : std_logic:='0';
signal wave_empty : std_logic:='0';
signal wave_dout  : std_logic_vector(7 downto 0);
signal wave_full  : std_logic;
signal reg_rb_en		: std_logic:='0';
signal reg_update : std_logic:='0';
signal reg_fifo_empty : std_logic:='0';
signal cmd_type		: std_logic_vector(3 downto 0):=(others => '0');
signal scrod_reg		: std_logic_vector(7 downto 0):=(others => '0');
signal reg_data 		: std_logic_vector(15 downto 0):=(others => '0');
signal reg_value	  	: std_logic_vector(15 downto 0):=(others => '0');
--FIFO signals-- 
signal fifo_sel     	 : std_logic_vector(3 downto 0):=x"0";
signal cmd_fifo_reset : std_logic:= '0';
signal rx_fifo_rd_en  : std_logic:= '0'; 
signal rx_fifo_empty  : std_logic:= '0';
signal fifo_rd_en   			: std_logic:='0';
signal fifo_empty   			: std_logic:='1';

signal reg_fifo_din	:	std_logic_vector(31 downto 0):= x"00000000"; --register readback FIFO din
signal reg_fifo_dout : std_logic_vector(7 downto 0) := x"00"; --register readback dataout
signal reg_fifo_wr_en : std_logic:= '0';
signal reg_fifo_rd_en : std_logic:= '0';
signal reg_fifo_rst :std_logic:='0';

signal dc_bit_count      	: integer := 32;
signal dc_fifo_reset 		: std_logic := '0';
signal dc_wr_en 				: std_logic_vector(2 downto 0);
signal dc_reg_rd_en        : std_logic;
signal dc_reg_dout  			: std_logic_vector(7 downto 0);
signal dc_reg_empty 			: std_logic;
signal dc_rx_data 			: std_logic;
signal dc_rx 					: std_logic;
signal dc_fifo_din   		: std_logic_vector(31 downto 0):=(others => '0'); 
signal w1r8_fifo_dout  		: std_logic_vector(7 downto 0):=(others => '0');
signal w18_fifo_empty 	 	: std_logic;
signal top_bot_word : std_logic_vector(31 downto 0);
--DC FIFO signals: Look at later!!!------
signal DC_FIFO_DOUT : STD_LOGIC_VECTOR(31 downto 0);
signal DC_FIFO_RD_EN : STD_LOGIC := '0';
signal DC_FIFO_WR_EN : STD_LOGIC := '0';
signal DC_FIFO_EMPTY	:	STD_LOGIC; --originally on port list, account for later.
constant dc_fifo          : std_logic_vector(3 downto 0):=x"1";
constant reg_fifo   			: std_logic_vector(3 downto 0):=x"2";
constant waved_fifo   		: std_logic_vector(3 downto 0):=x"3";
constant footer        		: std_logic_vector(3 downto 0):=x"4";

TYPE eth_tx_st is (idle, 
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
TYPE Comm_Parse_state is (IDLE, CHECK_EMPTY, LOAD_DATA, LOAD_DC_NUM, LOAD_DC_NUM1, CMD_CHECK, DONE);
signal CCState : Comm_Parse_state := IDLE; --Command Center's main statemachine state
signal PCtxSt : eth_tx_st := idle;

attribute keep: boolean;
attribute keep of reg_fifo_din : signal is true;

begin
udp_usr_clk <= UDP_CLK;
--temporarily disable QBLink ---
QB_SEND <= '0';
QB_RDOUT <= '0';
					 
proc_sync_cmd_hdr: process (udp_usr_clk) begin
	if rising_edge(udp_usr_clk) then
		rx_udp_data_i(6) <= rx_udp_data_i(5);
		rx_udp_data_i(5) <= rx_udp_data_i(4);
		rx_udp_data_i(4) <= rx_udp_data_i(3);
		rx_udp_data_i(3) <= rx_udp_data_i(2);
		rx_udp_data_i(2) <= rx_udp_data_i(1);
		rx_udp_data_i(1) <= rx_udp_data_i(0);
		rx_udp_data_i(0) <= RX_UDP_DATA;
		
		if (RX_UDP_DATA = x"43" and rx_udp_data_i(0) = x"4e" and rx_udp_data_i(1) = x"59" and rx_udp_data_i(2) = x"53") then --"SYNC"
			cmd_fifo_reset <= '1';
			rx_udp_valid_i <= (others => '0');
		else
			cmd_fifo_reset             <= '0';
			rx_udp_valid_i(6 downto 1) <= rx_udp_valid_i(5 downto 0);
			rx_udp_valid_i(0) 			<= RX_UDP_VALID;
		end if;	
	end if;
end process;

---FIFO to Recieve PC Data from Ethernet Module---
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

--Register Readback FIFO---
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

	 
cmd_interpreter : process(DATA_CLK) begin
if rising_edge(DATA_CLK) then
	case CCState is
		when IDLE => 
			rx_fifo_rd_en <= '0';
			reg_rb_en <= '0';
			CCState <= IDLE;
			if rx_fifo_empty = '0' then
				CCState <= CHECK_EMPTY;
			end if;
			
		when CHECK_EMPTY => 
			output_reg(5) <= x"0000";
			output_reg(0)(0) <= '0';
			CCState <= IDLE;
			if rx_fifo_empty = '0' then
				rx_fifo_rd_en <='1';
				CCState <= LOAD_DC_NUM;
			end if;
		
		when LOAD_DC_NUM => 
			rx_fifo_rd_en <= '0';
			dc_num <= rx_fifo_data_out(31 downto 28);
			CCState <= LOAD_DC_NUM1;
			
		when LOAD_DC_NUM1 => 
			dc_num <= rx_fifo_data_out(31 downto 28);
			CCState <= LOAD_DATA;
			
		when LOAD_DATA =>
			if dc_num = x"0" then 
				cmd_type	<= rx_fifo_data_out(27 downto 24);
				scrod_reg <= rx_fifo_data_out(23 downto 16);
				reg_data <= rx_fifo_data_out(15 downto  0);
				CCState <= CMD_CHECK;
			else --temporary: SCROD only Register write and readback test 
				CCState <= IDLE; -- do nothing and go back to IDLE, cmd_type, reg_data, and reg# will not be updated.
			end if;
			
		when CMD_CHECK => 
			if cmd_type = x"F" then
				output_reg(to_integer(unsigned(scrod_reg))) <= reg_data;
				CCState <= CHECK_EMPTY;
			elsif cmd_type = x"D" then
				reg_value <= output_reg(to_integer(unsigned(scrod_reg)));
				reg_rb_en <= '1';
				CCSTATE <= DONE;
			end if;
		when DONE =>
			if reg_update = '1' then
				CCState <= DONE;
			else
				CCState <= IDLE;
			end if;
		end case;
	end if;
end process;

--sending data to PC---
	 
TX_UDP_DATA <= dc_reg_dout    when fifo_sel = dc_fifo   else
					wave_dout      when fifo_sel = waved_fifo else 
					reg_fifo_dout  when fifo_sel = reg_fifo   else 
					x"00"          when fifo_sel = footer     else x"A1";

dc_reg_rd_en    <= fifo_rd_en when fifo_sel = dc_fifo   else '0';
wave_rd_en      <= fifo_rd_en when fifo_sel = waved_fifo else '0';
reg_fifo_rd_en  <= fifo_rd_en when fifo_sel = reg_fifo   else '0';

fifo_empty <= dc_reg_empty   when fifo_sel = dc_fifo    else
				  wave_empty     when fifo_sel = waved_fifo else
				  reg_fifo_empty when fifo_sel = reg_fifo   else '1';

tx_udp_valid <= '1' when PCtxSt = send_wave_fifo  or PCtxSt = send_sc_reg_data or PCtxSt = send_dc_reg_data 
							or PCtxSt = footer1 or PCtxSt = footer2 or PCtxSt = footer3 or PCtxSt = footer4
							else '0';
							
top_bot_word <= x"746f700a" when TOP_BOT = '1' else --'top' in lower case
					 x"626f740a" when TOP_BOT = '0' else --'bot' in lower case
					 x"73746174";                        --'stat' in lower case

data2Eth : process(udp_usr_clk) begin
if rising_edge(udp_usr_clk) then 
	case PCtxSt is 
		when idle =>
			fifo_sel <= reg_fifo;
			fifo_rd_en <= '0';
			reg_update <= '0';
			reg_fifo_rst <= '0';
			reg_fifo_din <= (others=>'0');
			reg_fifo_wr_en <= '0';
			if reg_rb_en = '1' then --read back scrod/dc register
				reg_update <= '1';
				reg_fifo_rst <= '1';
				PCtxSt <= fifo_rst;
			end if;
		
		when fifo_rst =>
			reg_fifo_rst <= '0';
			PCtxSt <= fifo_rst_wait;
		
		when fifo_rst_wait => 
			PCtxSt <= fifo_rst_wait1;
		
		when fifo_rst_wait1 =>
			reg_fifo_wr_en <= '0';
			reg_fifo_din   <= x"7363726F"; --'scro' : all lower case
			PCtxSt <= reg_fifo_load;
			
		when reg_fifo_load =>
			reg_fifo_wr_en <= '1';
			reg_fifo_din <= x"7363726F"; --'scro' : all lower case
			PCtxSt <= reg_fifo_load1;
		
		when reg_fifo_load1 =>
			reg_fifo_wr_en <= '1';
			reg_fifo_din   <= x"64413530"; --'dA50' : all lower case
			PCtxSt <= reg_fifo_load2;
		
		when reg_fifo_load2 =>
			reg_fifo_wr_en <= '1';
			reg_fifo_din <= top_bot_word; --will either say 'top', 'bot', or 'stat' 
			PCtxSt <= reg_fifo_load3;
		
		when reg_fifo_load3 =>
			reg_fifo_wr_en <= '1';
			reg_fifo_din <= x"73796e63"; --'sync'
			PCtxSt <= reg_fifo_load4;
		
		when reg_fifo_load4 =>
			if dc_num = x"0" and reg_update = '1' then
				reg_fifo_wr_en <= '1';
				reg_fifo_din   <= x"00" & rx_fifo_data_out(23 downto 16) & reg_value; --x"00" & reg num & reg vlaue
				PCtxSt    <= reg_fifo_load6;	
			elsif dc_num /= x"0" and reg_update = '1' then
				reg_fifo_wr_en <= '0';--if requested register value is from dc then wait for dc to send value
				reg_fifo_din   <= x"00000000";
				PCtxSt    <= dc_wait_reset;
--			elsif sc2pc_t_hold = '1' then
--				reg_fifo_wr_en <= '1';
--				reg_fifo_din   <= x"74726967";-- 'trig': in lower case, sending trigger to pc 
--				PCtxSt    <= reg_fifo_load6;
--			elsif no_go = '1' then
--				reg_fifo_wr_en <= '1';
--				reg_fifo_din   <= x"64656164";--'dead : : all lower case
--				PCtxSt    <= reg_fifo_load5;			
			end if;
		
		when 	reg_fifo_load5 => 
			PCtxSt    <= reg_fifo_load6;
		
		when reg_fifo_load6 =>
			reg_fifo_wr_en <= '1';
			reg_fifo_din   <= x"00000000";
			PCtxSt    <= check_ready;
		
		when dc_wait_reset =>
			PCtxSt <= dc_wait_reset;
--			if dc_fifo_reset = '1' then
--			ready_wait  <= 0;
--			PCtxSt <= dc_wait_lo;
--			else
--				if ready_wait < 1000 then
--					ready_wait  <= ready_wait + 1;
--				else
--					ready_wait     <= 0;--if dc doesnt respond then send 'dead'
--					reg_fifo_din   <= x"64656164";--'dead : : all lower case
--					PCtxSt    <= reg_fifo_load5;
--				end if;
--			end if;	
		when dc_wait_lo => 
			PCtxSt <= dc_wait_lo;
--		if dc_rx = '0' and dc_rx_data = '0' then
--			if ready_wait < 50 then
--				ready_wait  <= ready_wait + 1;
--			else
--				ready_wait     <= 0;
--				PCtxSt    <= check_ready;
--			end if;
--		end if;
		
		when check_ready => --checks if fiber is ready to send data and if fifo is empty
			reg_fifo_wr_en <= '0';
			if tx_udp_ready = '1' and fifo_empty = '0' then				
				fifo_rd_en  <= '1';
				PCtxSt <= load_data;
			else
				fifo_rd_en <= '0';
				if ready_wait < 100000000 then--if not ready before timer then go back to idle
					ready_wait  <= ready_wait + 1;
					PCtxSt <= check_ready;
				else
					ready_wait  <= 0;
					PCtxSt <= idle;
				end if;
			end if;
		
		when load_data => --loads data into fiber module
			fifo_rd_en <= '1';
			if reg_update = '1' then
				PCtxSt <= send_sc_reg_data;
			else
				PCtxSt <= send_wave_fifo;
			end if;
			
		when send_wave_fifo => --send data from wave fifo to pc
			fifo_rd_en <= '1';
			PCtxSt <= send_wave_fifo;
			if fifo_empty = '1' then
				fifo_sel <= footer;
				PCtxSt <= footer1;
			end if;
			
		when send_sc_reg_data => --send register data from scrod to pc
			fifo_rd_en <= '1';
			PCtxSt <= send_sc_reg_data;
			if fifo_empty = '1' then
				fifo_sel    <= dc_fifo;
				PCtxSt <= send_dc_reg_data;
			end if;
			
		when send_dc_reg_data =>--sending register data from dc to pc
			fifo_rd_en <= '1';
			PCtxSt <= send_dc_reg_data;
			if fifo_empty = '1' then
				fifo_sel    <= footer;
				PCtxSt <= footer1;
			end if;
			
		when footer1 => -- sending footer1 to pc
			fifo_rd_en <= '1';
			PCtxSt <= footer2;
		
		when footer2 => -- sending footer2 to pc
			fifo_rd_en <= '1';
			PCtxSt <= footer3;
		
		when footer3 =>
			fifo_rd_en <= '1';
			PCtxSt <= footer4;
		
		when footer4 => --sending footer4 to pc
			fifo_rd_en <= '1';
			PCtxSt <= done;
		
		when done => 
			fifo_rd_en   <= '0';
			reg_update   <= '0';
	--		no_go        <= '0';
	--		dc_wait_ct   <= 0;
			PCtxSt  <= idle;
		when others =>
			PCtxSt  <= idle;
			
	end case;	
end if;  
end process;
end Behavioral;

