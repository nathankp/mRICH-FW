--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:33:18 10/03/2018
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/mRICH_hodo_DC_V1/mRICH_hodo_DC_V1/hodo_dc_v1/nat_TARXCTRL_TB.vhd
-- Project Name:  hodo_dc_v1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TARGETX_DAC_CONTROL
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
 
ENTITY nat_TARXCTRL_TB IS
END nat_TARXCTRL_TB;
 
ARCHITECTURE behavior OF nat_TARXCTRL_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TARGETX_DAC_CONTROL
    PORT(
         CLK : IN  std_logic;
         LOAD_PERIOD : IN  std_logic_vector(15 downto 0);
         LATCH_PERIOD : IN  std_logic_vector(15 downto 0);
         UPDATE : IN  std_logic;
         REG_DATA : IN  std_logic_vector(18 downto 0); --dc_reg = "FABCDABC"+"FF000000"+"FF050000"+"FF060000"+"FF07000"+asicMask+"FF0D0000"+\
																			--hex(int('FF090000',16) | offset_dir*(2**15) | win_Offset ).split('x')[1]+\
																			--hex(int('FF0C0000',16) | FixedWin*(2**15) | FixedWin*winStart).split('x')[1]

         OOPS_RESET : IN  std_logic;
         busy : OUT  std_logic;
         SIN : OUT  std_logic;
         SCLK : OUT  std_logic;
         PCLK : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal LOAD_PERIOD : std_logic_vector(15 downto 0) := (others => '0');
   signal LATCH_PERIOD : std_logic_vector(15 downto 0) := (others => '0');
   signal UPDATE : std_logic := '0';
   signal REG_DATA : std_logic_vector(18 downto 0) := (others => '0');
   signal OOPS_RESET : std_logic := '0';

 	--Outputs
   signal busy : std_logic;
   signal SIN : std_logic;
   signal SCLK : std_logic;
   signal PCLK : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
   constant SCLK_period : time := 10 ns;
   constant PCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TARGETX_DAC_CONTROL PORT MAP (
          CLK => CLK,
          LOAD_PERIOD => LOAD_PERIOD,
          LATCH_PERIOD => LATCH_PERIOD,
          UPDATE => UPDATE,
          REG_DATA => REG_DATA,
          OOPS_RESET => OOPS_RESET,
          busy => busy,
          SIN => SIN,
          SCLK => SCLK,
          PCLK => PCLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   SCLK_process :process
   begin
		SCLK <= '0';
		wait for SCLK_period/2;
		SCLK <= '1';
		wait for SCLK_period/2;
   end process;
 
   PCLK_process :process
   begin
		PCLK <= '0';
		wait for PCLK_period/2;
		PCLK <= '1';
		wait for PCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
