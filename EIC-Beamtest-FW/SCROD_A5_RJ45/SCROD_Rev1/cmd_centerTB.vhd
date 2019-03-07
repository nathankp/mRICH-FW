--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:51:46 03/05/2019
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_QBLinkProto/cmd_centerTB.vhd
-- Project Name:  SCROD_QBLinkProto
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cmd_center
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
 
ENTITY cmd_centerTB IS
END cmd_centerTB;
 
ARCHITECTURE behavior OF cmd_centerTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cmd_center
    PORT(
         RX_UDP_DATA : IN  std_logic_vector(7 downto 0);
         RX_UDP_VALID : IN  std_logic;
         UDP_CLK : IN  std_logic;
         TX_UDP_READY : IN  std_logic;
         DATA_CLK : IN  std_logic;
         TOP_BOT : IN  std_logic;
         COMMAND : OUT  std_logic_vector(31 downto 0);
         QB_RDOUT : OUT  std_logic;
         QB_SEND : OUT  std_logic;
         TX_UDP_VALID : OUT  std_logic;
         TX_UPD_DATA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RX_UDP_DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal RX_UDP_VALID : std_logic := '0';
   signal UDP_CLK : std_logic := '0';
   signal TX_UDP_READY : std_logic := '0';
   signal DATA_CLK : std_logic := '0';
   signal TOP_BOT : std_logic := '0';
	signal PC_cmd : std_logic_vector(31 downto 0) := x"0F0A29AB";

 	--Outputs
   signal COMMAND : std_logic_vector(31 downto 0);
   signal QB_RDOUT : std_logic;
   signal QB_SEND : std_logic;
   signal TX_UDP_VALID : std_logic;
   signal TX_UPD_DATA : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant UDP_CLK_period : time := 8 ns;
   constant DATA_CLK_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cmd_center PORT MAP (
          RX_UDP_DATA => RX_UDP_DATA,
          RX_UDP_VALID => RX_UDP_VALID,
          UDP_CLK => UDP_CLK,
          TX_UDP_READY => TX_UDP_READY,
          DATA_CLK => DATA_CLK,
          TOP_BOT => TOP_BOT,
          COMMAND => COMMAND,
          QB_RDOUT => QB_RDOUT,
          QB_SEND => QB_SEND,
          TX_UDP_VALID => TX_UDP_VALID,
          TX_UPD_DATA => TX_UPD_DATA
        );

   -- Clock process definitions
   UDP_CLK_process :process
   begin
		UDP_CLK <= '0';
		wait for UDP_CLK_period/2;
		UDP_CLK <= '1';
		wait for UDP_CLK_period/2;
   end process;
 
   DATA_CLK_process :process
   begin
		DATA_CLK <= '0';
		wait for DATA_CLK_period/2;
		DATA_CLK <= '1';
		wait for DATA_CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for UDP_CLK_period*10;
		rx_udp_valid <= '1';
		wait until rising_edge(UDP_CLK);
		rx_udp_data <= PC_cmd(31 downto 24);
		wait until rising_edge(UDP_CLK);
		rx_udp_data <= PC_cmd(23 downto 16);
		wait until rising_edge(UDP_CLK);
		rx_udp_data <= PC_cmd(15 downto 8);
		wait until rising_edge(UDP_CLK);
		rx_udp_data <= PC_cmd(7 downto 0);
		rx_udp_valid <= '0';
		wait for DATA_CLK_PERIOD*19;
		wait until rising_edge(UDP_CLK);
		PC_cmd <= x"0D0A29AB";
		tx_udp_ready <= '1';
		rx_udp_valid <= '1';
		wait until rising_edge(UDP_CLK);
		rx_udp_data <= PC_cmd(31 downto 24);
		wait until rising_edge(UDP_CLK);
		rx_udp_data <= PC_cmd(23 downto 16);
		wait until rising_edge(UDP_CLK);
		rx_udp_data <= PC_cmd(15 downto 8);
		wait until rising_edge(UDP_CLK);
		rx_udp_data <= PC_cmd(7 downto 0);
		wait until rising_edge(UDP_CLK);
      wait;
   end process;

END;
