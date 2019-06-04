--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:53:21 05/15/2019
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/mRICH_hodo_DC_V1/HMB_QBLink_proto/TriggerPack2TB.vhd
-- Project Name:  HODO_QBLink_proto
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TriggerPack2
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
use work.BMD_definitions.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TriggerPack2TB IS
END TriggerPack2TB;
 
ARCHITECTURE behavior OF TriggerPack2TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TriggerPack2
    PORT(
         CLK : IN  std_logic;
         trgLinkSynced : IN  std_logic;
         SerialClkLocked : IN  std_logic;
         TriggerBits : IN  std_logic_vector(4 downto 0);
         Timestamp : IN  std_logic_vector(23 downto 0);
         QBL_WrEn : OUT  std_logic;
			TriggerFlag : out STD_LOGIC;
         TriggerData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal trgLinkSynced : std_logic;
   signal SerialClkLocked : std_logic;
   signal TriggerBits : std_logic_vector(4 downto 0) := (others => '0');
   signal Timestamp : std_logic_vector(23 downto 0) := (others => '0');
   signal reset : std_logic := '0';
	
   signal SSTin : std_logic :='0';
	signal sync_TS : std_logic := '1';
 	--Outputs
	signal trigFlag : std_logic;
   signal QBL_WrEn : std_logic;
   signal TriggerData : std_logic_vector(31 downto 0);
	
	--QBLink Signals
signal tx : std_logic := '0';
signal rx : std_logic := '0';
signal wordin_S : std_logic_vector(31 DOWNTO 0) := (others => '0');
signal wordout_S : std_logic_vector(31 DOWNTO 0) := (others => '0');
signal wordout_H : std_logic_vector(31 DOWNTO 0) := (others => '0');
signal wordin_valid_S :std_logic := '0';
signal wordout_valid_S : std_logic := '0';
signal wordout_valid_H : std_logic:= '0';
signal wordout_req_S : std_logic := '0';
signal wordout_req_H : std_logic := '0';
signal QBreset : std_logic := '1';
signal trgLinkSynced_S : std_logic := '0';
signal serialCLKLocked_S : std_logic := '0';

signal eventFlag : std_logic := '0';
signal reset_eventWatch : std_logic := '0';
   -- Clock period definitions
   constant CLK_period : time := 40 ns;
	constant SSTin_period : time := 32 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TriggerPack2 PORT MAP (
          CLK => CLK,
          trgLinkSynced => trgLinkSynced,
          SerialClkLocked => SerialClkLocked,
          TriggerBits => TriggerBits,
          Timestamp => Timestamp,
          QBL_WrEn => QBL_WrEn,
			 TriggerFlag => trigFlag, 
          TriggerData => TriggerData
        );
	Timestamp_counter : entity work.Timestamper
  PORT MAP (
    clk => SSTin, 
    ce => '1',
    sinit => sync_TS,
    q => timeStamp
  );
  
  comm_process : entity work.QBLink                                                     
PORT MAP( 
			 sstClk => CLK,
			 rst => QBreset,
			 rawSerialOut => rx,
			 rawSerialIn => tx,
			 localWordIn => TriggerData,
			 localWordInValid => QBL_WrEn,
			 localWordOut => wordout_H, --'H' HODOSCOPE side
			 localWordOutValid => wordout_valid_H,
			 localWordOutReq => wordout_req_H,
			 trgLinkSynced => trgLinkSynced, 
			 serialClkLocked => serialClkLocked 
			 ); 
	QBPartner : entity work.QBLink                                                     
	PORT MAP( 
			 sstClk => CLK,
			 rst => QBreset,
			 rawSerialOut => tx,
			 rawSerialIn => rx,
			 localWordIn => wordin_S,
			 localWordInValid => wordin_valid_S,
			 localWordOut => wordout_S,
			 localWordOutValid => wordout_valid_S,
			 localWordOutReq => wordout_req_S,
			 trgLinkSynced => trgLinkSynced_S, --'S' SCROD side
			 serialClkLocked => serialClkLocked_S
			 ); 
	--Event watcher 
	Event_Watch : process(wordout_valid_S, wordout_S, reset_eventWatch)
	begin
		IF reset_eventWatch = '1' THEN
			wordout_req_S <= '1';
		ELSE 
			IF (wordout_valid_S = '1') and (wordout_S(7 downto 5) = "111")  THEN
				eventFlag <= '1';
				wordout_req_S <= '0';
			ELSE
				eventFlag <= '0';
			END IF;
		END IF;
	end process;
   -- Clock process definitions
   CLK_process : process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
 -- SSTin clock process
	SSTin_proc : process
	begin
		SSTin <= '0';
		wait for SSTin_period/2;
		SSTin <= '1';
		wait for SSTin_period/2;
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		sync_TS <= '0';
		wait for CLK_period*10;
		QBreset <= '0';
		wait until trgLinkSynced = '1';
		reset_eventWatch <= '1';
      wait for CLK_period;
		reset_eventWatch <= '0';
		wait for CLK_period;
      TriggerBits <= "00001"; -- TargetX datasheet pg 7. Can have trigger latency upto 16 us. (500 SSTin clk cycles, 400 DataClk cycles)
										--so we do not have to worry about losing triggerBits.
--		wait until eventFlag = '1';
--		TriggerBits <= "00000";
--		wait for CLK_period;
--		reset_eventWatch <= '1';
--		wait for CLK_period;
--		reset_eventWatch <= '0';
		wait;
   end process;

END;
