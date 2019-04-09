--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:05:34 03/05/2019
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_QBLinkProto/ETH_TB.vhd
-- Project Name:  SCROD_QBLinkProto
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: eth_top
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
 
ENTITY ETH_TB IS
END ETH_TB;
 
ARCHITECTURE behavior OF ETH_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT eth_top
    PORT(
         ext_user_clk : IN  std_logic;
         tx_udp_data : IN  std_logic_vector(7 downto 0);
         tx_udp_valid : IN  std_logic;
         rx_udp_ready : IN  std_logic;
         trx_udp_clock : OUT  std_logic;
         tx_udp_ready : OUT  std_logic;
         rx_udp_data : OUT  std_logic_vector(7 downto 0);
         rx_udp_valid : OUT  std_logic;
         mgtclk1p : IN  std_logic;
         mgtclk1n : IN  std_logic;
         mgttxfault : IN  std_logic;
         mgtmod0 : IN  std_logic;
         mgtlos : IN  std_logic;
         mgtrxp : IN  std_logic;
         mgtrxn : IN  std_logic;
         mgttxdis : OUT  std_logic;
         mgtmod2 : OUT  std_logic;
         mgtmod1 : OUT  std_logic;
         mgttxp : OUT  std_logic;
         mgttxn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ext_user_clk : std_logic := '0';
   signal tx_udp_data : std_logic_vector(7 downto 0) := (others => '0');
   signal tx_udp_valid : std_logic := '0';
   signal rx_udp_ready : std_logic := '0';
   signal mgtclk1p : std_logic := '0';
   signal mgtclk1n : std_logic := '0';
   signal mgttxfault : std_logic := '0';
   signal mgtmod0 : std_logic := '0';
   signal mgtlos : std_logic := '0';
   signal mgtrxp : std_logic := '0';
   signal mgtrxn : std_logic := '0';

 	--Outputs
   signal trx_udp_clock : std_logic;
   signal tx_udp_ready : std_logic;
   signal rx_udp_data : std_logic_vector(7 downto 0);
   signal rx_udp_valid : std_logic;
   signal mgttxdis : std_logic;
   signal mgtmod2 : std_logic;
   signal mgtmod1 : std_logic;
   signal mgttxp : std_logic;
   signal mgttxn : std_logic;

   -- Clock period definitions
   constant ext_user_clk_period : time := 8 ns;
--   constant trx_udp_clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: eth_top PORT MAP (
          ext_user_clk => ext_user_clk,
          tx_udp_data => tx_udp_data,
          tx_udp_valid => tx_udp_valid,
          rx_udp_ready => rx_udp_ready,
          trx_udp_clock => trx_udp_clock,
          tx_udp_ready => tx_udp_ready,
          rx_udp_data => rx_udp_data,
          rx_udp_valid => rx_udp_valid,
          mgtclk1p => mgtclk1p,
          mgtclk1n => mgtclk1n,
          mgttxfault => mgttxfault,
          mgtmod0 => mgtmod0,
          mgtlos => mgtlos,
          mgtrxp => mgtrxp,
          mgtrxn => mgtrxn,
          mgttxdis => mgttxdis,
          mgtmod2 => mgtmod2,
          mgtmod1 => mgtmod1,
          mgttxp => mgttxp,
          mgttxn => mgttxn
        );

   -- Clock process definitions
   ext_user_clk_process :process
   begin
		ext_user_clk <= '0';
		wait for ext_user_clk_period/2;
		ext_user_clk <= '1';
		wait for ext_user_clk_period/2;
   end process;
 
--   trx_udp_clock_process :process
--   begin
--		trx_udp_clock <= '0';
--		wait for trx_udp_clock_period/2;
--		trx_udp_clock <= '1';
--		wait for trx_udp_clock_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for ext_user_clk_period*10;

      mgttxn <= '1';
		mgttxp <= '0';

      wait;
   end process;

END;
