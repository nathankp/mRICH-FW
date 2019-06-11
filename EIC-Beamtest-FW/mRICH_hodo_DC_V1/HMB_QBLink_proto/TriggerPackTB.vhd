--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:35:32 05/14/2019
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/mRICH_hodo_DC_V1/HMB_QBLink_proto/TriggerPackTB.vhd
-- Project Name:  HODO_QBLink_proto
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TriggerPack
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
USE work.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TriggerPackTB IS
END TriggerPackTB;
 
ARCHITECTURE behavior OF TriggerPackTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TriggerPack
    PORT(
         SSTinCLK : IN  std_logic;
         trgLinkSynced : IN  std_logic;
         SerialClkLocked : IN  std_logic;
         TriggerBits : IN  std_logic_vector(4 downto 0);
         Timestamp : IN  std_logic_vector(23 downto 0);
         reset : IN  std_logic;
         QBL_WrEn : OUT  std_logic;
         TriggerData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SSTinCLK : std_logic := '0';
   signal SYS_CLK : std_logic := '0';
   signal trgLinkSynced : std_logic := '0';
   signal SerialClkLocked : std_logic := '0';
   signal TriggerBits : std_logic_vector(4 downto 0) := (others => '0');
   signal timestamp : std_logic_vector(23 downto 0) := (others => '0');
   signal reset : std_logic := '0';
	signal sync_TS : std_logic := '0';
 	--Outputs
   signal QBL_WrEn : std_logic;
   signal TriggerData : std_logic_vector(31 downto 0);
	
   -- Clock period definitions
   constant SSTinCLK_period : time := 16 ns;
   constant SYS_CLK_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TriggerPack PORT MAP (
          SSTinCLK => SSTinCLK,
          trgLinkSynced => trgLinkSynced,
          SerialClkLocked => SerialClkLocked,
          TriggerBits => TriggerBits,
          Timestamp => timeStamp,
          reset => reset,
          QBL_WrEn => QBL_WrEn,
          TriggerData => TriggerData
        );
	ts : entity work.Timestamper
	PORT MAP (
	 clk => SSTinCLK, 
    ce => '1',
    sinit => sync_TS,
    q => timeStamp
  );
   -- Clock process definitions
   SSTinCLK_process : process
   begin
		SSTinCLK <= '0';
		wait for SSTinCLK_period/2;
		SSTinCLK <= '1';
		wait for SSTinCLK_period/2;
   end process;
 
   SYS_CLK_process :process
   begin
		SYS_CLK <= '0';
		wait for SYS_CLK_period/2;
		SYS_CLK <= '1';
		wait for SYS_CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		sync_TS <= '1';
      wait for 100 ns;	
		trgLinkSynced <= '1';
		SerialClkLocked <= '1';
		sync_TS <= '0';
      wait for SSTinCLK_period*10;
      TriggerBits <= "00001";
		--wait for SSTinCLK_period*2; --after some delay trigger clears (?)
		--TriggerBits <= "00000";
      wait;
   end process;

END;
