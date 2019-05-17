--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:23:15 05/16/2019
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1/IO_BUFTB.vhd
-- Project Name:  HMB_SCROD
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IO_Buffers
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
 
ENTITY IO_BUFTB IS
END IO_BUFTB;
 
ARCHITECTURE behavior OF IO_BUFTB IS 
    

   --Inputs
   signal RX_P : std_logic_vector(3 downto 0) := (others => '0');
   signal RX_N : std_logic_vector(3 downto 0) := (others => '0');
   signal TX : std_logic_vector(3 downto 0) := (others => '0');
   signal DC_CLK : std_logic := '0';
   signal SYNC : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal TX_P : std_logic_vector(3 downto 0);
   signal TX_N : std_logic_vector(3 downto 0);
   signal DC_CLK_P : std_logic_vector(3 downto 0);
   signal DC_CLK_N : std_logic_vector(3 downto 0);
   signal RX : std_logic_vector(3 downto 0);
   signal SYNC_P : std_logic_vector(3 downto 0);
   signal SYNC_N : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant DC_CLK_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.IO_Buffers 
	GENERIC MAP (num_DC => 3)
	PORT MAP (
          RX_P => RX_P,
          RX_N => RX_N,
          TX => TX,
          DC_CLK => DC_CLK,
          SYNC => SYNC,
          TX_P => TX_P,
          TX_N => TX_N,
          DC_CLK_P => DC_CLK_P,
          DC_CLK_N => DC_CLK_N,
          RX => RX,
          SYNC_P => SYNC_P,
          SYNC_N => SYNC_N
        );

   -- Clock process definitions
   DC_CLK_process :process
   begin
		DC_CLK <= '0';
		wait for DC_CLK_period/2;
		DC_CLK <= '1';
		wait for DC_CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for DC_CLK_period*10;
		RX_P <= "1010";
		RX_N <= "0101";
		TX <= "1100";

      wait;
   end process;

END;
