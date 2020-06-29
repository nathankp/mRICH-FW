--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:08:40 06/24/2020
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB-FW/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1/CommandInterpreterPing_TB.vhd
-- Project Name:  HMB_SCROD
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CommandInterpreter
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
use work.BMD_definitions.all; --need to include BMD_definitions in addition to work.all 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CommandInterpreterPing_TB IS
END CommandInterpreterPing_TB;
 
ARCHITECTURE behavior OF CommandInterpreterPing_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CommandInterpreter
    PORT(
         usrClk : IN  std_logic;
         dataClk : IN  std_logic;
         usrRst : IN  std_logic;
         rxData : IN  std_logic_vector(31 downto 0);
         rxDataValid : IN  std_logic;
         rxDataLast : IN  std_logic;
         rxDataReady : OUT  std_logic;
         txData : OUT  std_logic_vector(31 downto 0);
         txDataValid : OUT  std_logic;
         txDataLast : OUT  std_logic;
         txDataReady : IN  std_logic;
         serialClkLck : IN  std_logic_vector(3 downto 0);
         trigLinkSync : IN  std_logic_vector(3 downto 0);
         DC_CMD : OUT  std_logic_vector(31 downto 0);
         QB_WrEn : OUT  std_logic_vector(3 downto 0);
         QB_RdEn : OUT  std_logic_vector(3 downto 0);
         DC_RESP : IN  std_logic_vector(31 downto 0);
         DC_RESP_VALID : IN  std_logic_vector(3 downto 0);
         EVNT_FLAG : IN  std_logic;
         regAddr : OUT  std_logic_vector(15 downto 0);
         regWrData : OUT  std_logic_vector(15 downto 0);
         regRdData : IN  std_logic_vector(15 downto 0);
         regReq : OUT  std_logic;
         regOp : OUT  std_logic;
         regAck : IN  std_logic;
         cmd_int_state : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    
	constant WORD_HEADER_C    : std_logic_vector(31 downto 0) := x"00BE11E2";
   constant WORD_COMMAND_C   : std_logic_vector(31 downto 0) := x"646F6974";
   constant WORD_PING_C      : std_logic_vector(31 downto 0) := x"70696E67";
	constant WORD_PACKET_SIZE_C : std_logic_vector(31 downto 0) := x"00000006"; -- 6 words
	constant wordDC_01				: std_logic_vector(31 downto 0) := x"0000DC01"; --command target is one or more DC 
	constant WORD_COMMAND_ID_C  : std_logic_vector(31 downto 0) := x"00000012";
	constant PACKET_CHECKSUM	: std_logic_vector(31 downto 0) := x"4543226D";
   --Inputs
   signal usrClk : std_logic := '0';
   signal dataClk : std_logic := '0';
   signal usrRst : std_logic := '0';
   signal rxData : std_logic_vector(31 downto 0) := (others => '0');
   signal rxDataValid : std_logic := '0';
   signal rxDataLast : std_logic := '0';
   signal txDataReady : std_logic := '0';
   signal serialClkLck : std_logic_vector(3 downto 0) := (others => '0');
   signal trigLinkSync : std_logic_vector(3 downto 0) := (others => '0');
   signal DC_RESP : std_logic_vector(31 downto 0) := (others => '0');
   signal DC_RESP_VALID : std_logic_vector(3 downto 0) := (others => '0');
   signal EVNT_FLAG : std_logic := '0';
   signal regRdData : std_logic_vector(15 downto 0) := (others => '0');
   signal regAck : std_logic := '0';

 	--Outputs
   signal rxDataReady : std_logic;
   signal txData : std_logic_vector(31 downto 0);
   signal txDataValid : std_logic;
   signal txDataLast : std_logic;
   signal DC_CMD : std_logic_vector(31 downto 0);
   signal QB_WrEn : std_logic_vector(3 downto 0);
   signal QB_RdEn : std_logic_vector(3 downto 0);
   signal regAddr : std_logic_vector(15 downto 0);
   signal regWrData : std_logic_vector(15 downto 0);
   signal regReq : std_logic;
   signal regOp : std_logic;
   signal cmd_int_state : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant usrClk_period : time := 8 ns;
   constant dataClk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CommandInterpreter PORT MAP (
          usrClk => usrClk,
          dataClk => dataClk,
          usrRst => usrRst,
          rxData => rxData,
          rxDataValid => rxDataValid,
          rxDataLast => rxDataLast,
          rxDataReady => rxDataReady,
          txData => txData,
          txDataValid => txDataValid,
          txDataLast => txDataLast,
          txDataReady => txDataReady,
          serialClkLck => serialClkLck,
          trigLinkSync => trigLinkSync,
          DC_CMD => DC_CMD,
          QB_WrEn => QB_WrEn,
          QB_RdEn => QB_RdEn,
          DC_RESP => DC_RESP,
          DC_RESP_VALID => DC_RESP_VALID,
          EVNT_FLAG => EVNT_FLAG,
          regAddr => regAddr,
          regWrData => regWrData,
          regRdData => regRdData,
          regReq => regReq,
          regOp => regOp,
          regAck => regAck,
          cmd_int_state => cmd_int_state
        );

   -- Clock process definitions
   usrClk_process :process
   begin
		usrClk <= '0';
		wait for usrClk_period/2;
		usrClk <= '1';
		wait for usrClk_period/2;
   end process;
 
   dataClk_process :process
   begin
		dataClk <= '0';
		wait for dataClk_period/2;
		dataClk <= '1';
		wait for dataClk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	variable checksum : std_logic_vector(31 downto 0) := (others => '0');
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for usrClk_period*10;
		rxDataValid <= '1';
		rxDataLast <= '0';
		rxData <= WORD_HEADER_C;  
		
      wait until rxDataReady = '1';
		wait for usrClk_period;

		rxData <= WORD_PACKET_SIZE_C;

		wait for usrClk_period;

		rxData <= WORD_COMMAND_C;
		wait for usrClk_period;

		rxData <= wordDC_01;
		
		wait for usrClk_period;
		
		rxData <= WORD_COMMAND_ID_C;
		wait for usrClk_period;
		
		rxData <= WORD_PING_C;
		wait for usrClk_period;
		rxData <= x"70696e79";
		txDataReady <= '1';
		wait for usrClk_period;
		rxData <= PACKET_CHECKSUM;
      wait;
   end process;

END;
