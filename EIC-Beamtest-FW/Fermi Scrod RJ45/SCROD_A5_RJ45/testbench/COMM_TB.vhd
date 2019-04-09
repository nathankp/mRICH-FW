--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:33:14 05/17/2017
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/projects/BMD_RevB/Firmware/SCROD_A5_TOP/testbench/COMM_TB.vhd
-- Project Name:  SCROD_A5_TOP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SCROD_DC_COMM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY COMM_TB IS
END COMM_TB;
 
ARCHITECTURE behavior OF COMM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SCROD_DC_COMM
    PORT(
         CLK : IN  std_logic;
         DATA_CLK : IN  std_logic;
         PC_SEND : IN  std_logic;
         FIFO_RESET : IN  std_logic;
         TOP_DC_SC_RX : IN  std_logic;
         TOP_DC_SC_DIN : IN  std_logic;
         BOT_DC_SC_RX : IN  std_logic;
         BOT_DC_SC_DIN : IN  std_logic;
         TOP_SC_DC_TX : OUT  std_logic;
         TOP_SC_DC_DOUT : OUT  std_logic;
         BOT_SC_DC_TX : OUT  std_logic;
         BOT_SC_DC_DOUT : OUT  std_logic;
         TX_BUSY : OUT  std_logic;
         TRIGGER : OUT  std_logic;
         mgttxfault : IN  std_logic;
         mgtmod0 : IN  std_logic;
         mgtlos : IN  std_logic;
         mgttxdis : OUT  std_logic;
         mgtmod2 : OUT  std_logic;
         mgtmod1 : OUT  std_logic;
         mgtrxp : IN  std_logic;
         mgtrxn : IN  std_logic;
         mgttxp : OUT  std_logic;
         mgttxn : OUT  std_logic;
         mgtclk1p : IN  std_logic;
         mgtclk1n : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal DATA_CLK : std_logic := '0';
   signal PC_SEND : std_logic := '0';
   signal FIFO_RESET : std_logic := '0';
   signal TOP_DC_SC_RX : std_logic := '0';
   signal TOP_DC_SC_DIN : std_logic := '0';
   signal BOT_DC_SC_RX : std_logic := '0';
   signal BOT_DC_SC_DIN : std_logic := '0';
   signal mgttxfault : std_logic := '0';
   signal mgtmod0 : std_logic := '0';
   signal mgtlos : std_logic := '0';
   signal mgtrxp : std_logic := '0';
   signal mgtrxn : std_logic := '0';
   signal mgtclk1p : std_logic := '0';
   signal mgtclk1n : std_logic := '0';

 	--Outputs
   signal TOP_SC_DC_TX : std_logic;
   signal TOP_SC_DC_DOUT : std_logic;
   signal BOT_SC_DC_TX : std_logic;
   signal BOT_SC_DC_DOUT : std_logic;
   signal TX_BUSY : std_logic;
   signal TRIGGER : std_logic;
   signal mgttxdis : std_logic;
   signal mgtmod2 : std_logic;
   signal mgtmod1 : std_logic;
   signal mgttxp : std_logic;
   signal mgttxn : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 8 ns;
   constant DATA_CLK_period : time := 50 ns;
	
	signal send_top     : std_logic := '0';
	signal trig_top          : std_logic := '0';
	signal internal_data_top : std_logic := '0';
	signal internal_tx_top   : std_logic := '0';
	signal i_top             : integer := 31;
	signal j_top             : integer := 9;
	
	signal send_bot     : std_logic := '0';
	signal trig_bot          : std_logic := '0';
	signal internal_data_bot : std_logic := '0';
	signal internal_tx_bot   : std_logic := '0';
	signal i_bot             : integer := 31;
	signal j_bot             : integer := 9;


   type sending_state is (idle, send_trig, load_data, send_data, next_reg, wait_st);
	signal top_tx_state : sending_state := idle;
	
   type sending_state_bot is (idle_bot, send_trig_bot, load_data_bot, send_data_bot, next_reg_bot, wait_st_bot);
	signal bot_tx_state : sending_state_bot := idle_bot;

	signal dc_trig : std_logic_vector(31 downto 0) := x"000000CD";

	type data_array is array(9 downto 0) of std_logic_vector(31 downto 0);
	signal fake_data : data_array;  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SCROD_DC_COMM PORT MAP (
          CLK => CLK,
          DATA_CLK => DATA_CLK,
          PC_SEND => PC_SEND,
          FIFO_RESET => FIFO_RESET,
          TOP_DC_SC_RX => TOP_DC_SC_RX,
          TOP_DC_SC_DIN => TOP_DC_SC_DIN,
          BOT_DC_SC_RX => BOT_DC_SC_RX,
          BOT_DC_SC_DIN => BOT_DC_SC_DIN,
          TOP_SC_DC_TX => TOP_SC_DC_TX,
          TOP_SC_DC_DOUT => TOP_SC_DC_DOUT,
          BOT_SC_DC_TX => BOT_SC_DC_TX,
          BOT_SC_DC_DOUT => BOT_SC_DC_DOUT,
          TX_BUSY => TX_BUSY,
          TRIGGER => TRIGGER,
          mgttxfault => mgttxfault,
          mgtmod0 => mgtmod0,
          mgtlos => mgtlos,
          mgttxdis => mgttxdis,
          mgtmod2 => mgtmod2,
          mgtmod1 => mgtmod1,
          mgtrxp => mgtrxp,
          mgtrxn => mgtrxn,
          mgttxp => mgttxp,
          mgttxn => mgttxn,
          mgtclk1p => mgtclk1p,
          mgtclk1n => mgtclk1n
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   DATA_CLK_process :process
   begin
		DATA_CLK <= '0';
		wait for DATA_CLK_period/2;
		DATA_CLK <= '1';
		wait for DATA_CLK_period/2;
   end process;
 
fake_data <= (	
	x"1A123456",
	x"1B123456",
	x"1C123456",
	x"2D123456",
	x"2E123456",
	x"3A123456",
	x"3B123456",
	x"3C123456",
	x"4D123456",
	x"4E123456");
	

stim_proc: process
begin		
	wait for 100 ns;	
	PC_SEND    <= '0';
	FIFO_RESET <= '0';
	trig_top   <= '0';
	trig_bot   <= '0';
	send_top   <= '0';
	send_bot   <= '0';
	wait for DATA_CLK_period*100;	
	trig_top  <= '1';
	wait for DATA_CLK_period*1;
	trig_top  <= '0';
	wait for DATA_CLK_period*5;
	trig_bot  <= '0';
	wait for DATA_CLK_period*1;
	trig_bot  <= '0';
	wait for DATA_CLK_period*50;	
	FIFO_RESET <= '0';
	wait for DATA_CLK_period;	
	FIFO_RESET <= '0';
	wait for DATA_CLK_period*5;
	send_top  <= '0';
	wait for DATA_CLK_period*1;
	send_top  <= '0';
	wait for DATA_CLK_period*50;
	send_bot  <= '0';
	wait for DATA_CLK_period*1;
	send_bot  <= '0';
	wait for DATA_CLK_period*400;	
	PC_SEND   <= '0';
	wait for DATA_CLK_period*1;
	PC_SEND   <= '0';
	wait;
end process;


dc_trig  <= x"1000FFFF";

top_fake_send : process(DATA_CLK) begin
if rising_edge(DATA_CLK) then
	TOP_DC_SC_RX  <= internal_tx_top;
	TOP_DC_SC_DIN <= internal_data_top;
end if;

if falling_edge(DATA_CLK) then
	case top_tx_state is
		when idle =>--waits for either send signal or a trigger
			i_top              <= 31;
			j_top              <= 9;
			internal_tx_top    <= '0';
			internal_data_top  <= '0';
			if trig_top = '1' then
				internal_data_top <= dc_trig(i_top);
				top_tx_state <= send_trig;
			elsif send_top = '1' then
				top_tx_state <= load_data;
			else
				top_tx_state <= idle;
			end if;
						
		when send_trig =>--send trigger signal up to scrod
			internal_tx_top   <= '1';
			internal_data_top <= dc_trig(i_top);
			if i_top /=0 then
				i_top    <= i_top - 1;
				top_tx_state <= send_trig;
			else
				i_top    <= 31;
				top_tx_state <= idle;
			end if;

		when load_data =>--load data to send up to scrod
			internal_tx_top   <= '0';
			internal_data_top <= fake_data(j_top)(i_top);
			top_tx_state          <= send_data;
			
		when send_data =>--send data to scrod
			internal_tx_top   <= '1';
			internal_data_top <= fake_data(j_top)(i_top);
			if i_top /=0 then
				i_top <= i_top - 1;
				top_tx_state <= send_data;
			else
				top_tx_state <= next_reg;
				i_top <= 31;
			end if;

		when next_reg =>--load next register to send to scrod
			internal_tx_top <= '0';
			internal_data_top <= fake_data(j_top)(i_top);
			if j_top /= 0 then
				top_tx_state <= wait_st;
				j_top <= j_top - 1;
			else 
				j_top <= 9;
				top_tx_state <= idle;
			end if;
			
		when wait_st =>--waits one clk cycle
			top_tx_state <= send_data;
		
		when others =>
			i_top              <= 31;
			j_top              <= 9;
			internal_tx_top    <= '0';
			internal_data_top  <= '0';
			top_tx_state           <= idle;
			
	end case;
end if;
end process;

bot_fake_send : process(DATA_CLK) begin
if rising_edge(DATA_CLK) then
	BOT_DC_SC_RX  <= internal_tx_bot;
	BOT_DC_SC_DIN <= internal_data_bot;
end if;

if falling_edge(DATA_CLK) then
	case bot_tx_state is
		when idle_bot =>--waits for either send signal or a trigger
			i_bot              <= 31;
			j_bot              <= 9;
			internal_tx_bot    <= '0';
			internal_data_bot  <= '0';
			if trig_bot = '1' then
				internal_data_bot <= dc_trig(i_bot);
				bot_tx_state <= send_trig_bot;
			elsif send_bot = '1' then
				bot_tx_state <= load_data_bot;
			else
				bot_tx_state <= idle_bot;
			end if;
						
		when send_trig_bot =>--send trigger signal up to scrod
			internal_tx_bot   <= '1';
			internal_data_bot <= dc_trig(i_bot);
			if i_bot /=0 then
				i_bot    <= i_bot - 1;
				bot_tx_state <= send_trig_bot;
			else
				i_bot    <= 31;
				bot_tx_state <= idle_bot;
			end if;

		when load_data_bot =>--load data to send up to scrod
			internal_tx_bot   <= '0';
			internal_data_bot <= fake_data(j_bot)(i_bot);
			bot_tx_state          <= send_data_bot;
			
		when send_data_bot =>--send data to scrod
			internal_tx_bot   <= '1';
			internal_data_bot <= fake_data(j_bot)(i_bot);
			if i_bot /=0 then
				i_bot <= i_bot - 1;
				bot_tx_state <= send_data_bot;
			else
				bot_tx_state <= next_reg_bot;
				i_bot <= 31;
			end if;

		when next_reg_bot =>--load next register to send to scrod
			internal_tx_bot <= '0';
			internal_data_bot <= fake_data(j_bot)(i_bot);
			if j_bot /= 0 then
				bot_tx_state <= wait_st_bot;
				j_bot <= j_bot - 1;
			else 
				j_bot <= 9;
				bot_tx_state <= idle_bot;
			end if;
			
		when wait_st_bot =>--waits one clk cycle
			bot_tx_state <= send_data_bot;
		
		when others =>
			i_bot              <= 31;
			j_bot              <= 9;
			internal_tx_bot    <= '0';
			internal_data_bot  <= '0';
			bot_tx_state       <= idle_bot;
			
	end case;
end if;
end process;


END;
