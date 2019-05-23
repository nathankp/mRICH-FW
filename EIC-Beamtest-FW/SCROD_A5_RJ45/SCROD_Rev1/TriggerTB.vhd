--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:56:54 05/22/2019
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1/TriggerTB.vhd
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

--The purpose of this testbench is to see if triggerpackets from all four DCs can be collected by the DC_Comm module and sent to the Ethernet module for 
--for transmission to th PC. (Verified).
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.all;
use work.Eth1000BaseXPkg.all;
use work.GigabitEthPkg.all;
use work.BMD_definitions.all; --need to include BMD_definitions in addition to work.all
use work.UtilityPkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TriggerTB IS
END TriggerTB;
 
ARCHITECTURE behavior OF TriggerTB IS 

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
	signal RX : std_logic_vector(3 downto 0);
 	--Outputs
   signal rxDataReady : std_logic;
   signal txData : std_logic_vector(31 downto 0);
   signal txDataValid : std_logic;
   signal txDataLast : std_logic;
   signal DC_CMD : std_logic_vector(31 downto 0);
   signal QB_WrEn : std_logic_vector(3 downto 0);
   signal QB_RdEn : std_logic_vector(3 downto 0);
	signal QB_RST : std_logic_vector(3 downto 0);
   signal triglogicrst : std_logic := '0';	
   signal regAddr : std_logic_vector(15 downto 0);
   signal regWrData : std_logic_vector(15 downto 0);
   signal regReq : std_logic;
   signal regOp : std_logic;
	signal SERIAL_CLK_LCK : std_logic_vector(3 downto 0);
   signal TRIG_LINK_SYNC : std_logic_vector(3 downto 0);
	signal TX : std_logic_vector (3 downto 0);
	
		--dc QBlink signals
	signal rd_req : slv(3 downto 0) := (others =>'0');
	signal SCROD_data : Word32Array(3 downto 0) := (others => (others => '0'));
	signal SCROD_data_valid : slv(3 downto 0) := "0000";
	signal DCsent : Word32Array(3 downto 0) := (others => x"00000000");
	signal DCsent_valid : slv(3 downto 0) := "0000";
   signal trgLinkSync1 : slv( 3 downto 0);
	signal serialClkLck1 : slv(3 downto 0);
	
	
	
   -- Clock period definitions
	constant usrClk_period : time := 8 ns;
   constant dataClk_period : time := 40 ns;
	constant TS_arb: slv(23 downto 0) := x"003876";
	constant trigBits_arb1 : slv(4 downto 0) := "01011"; --make 4 different arbitrary tigger bits. 
	constant trigBits_arb2 : slv(4 downto 0) := "00110";
	constant trigBits_arb3 : slv(4 downto 0) := "01110";
	constant trigBits_arb4 : slv(4 downto 0) := "01100";
	constant TrigEvent : slv(2 downto 0) := "111";
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut1: entity work.CommandInterpreter 
	PORT MAP (
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
          regAck => regAck
        );

	   uut2: entity work.DC_Comm 
		generic map(num_DC =>3)
		PORT MAP (
          DATA_CLK => dataClk,
          RX => RX,
          TX => TX,
          DC_CMD => DC_CMD,
          CMD_VALID => QB_WrEn,
          RESP_REQ => QB_RdEn,
          DC_RESPONSE => DC_RESP,
          RESP_VALID => DC_RESP_VALID,
          QB_RST => QB_RST,
          TrigLogicRst => TrigLogicRst,
          SERIAL_CLK_LCK => SERIAL_CLK_LCK,
          TRIG_LINK_SYNC => TRIG_LINK_SYNC,
          Event_Trig => EVNT_FLAG
        );
	Gen_QBLink : FOR I in 3 downto 0 GENERATE 
	DC_QBLink : entity work.QBLink                                                     
	PORT MAP( 
			 sstClk => dataClk,
			 rst => QB_RST(I),
			 rawSerialOut => RX(I),
			 rawSerialIn => TX(I),
			 localWordIn => DCsent(I), 
			 localWordInValid => DCSENT_VALID(I),
			 localWordOut => SCROD_data(I),
			 localWordOutValid => SCROD_data_Valid(I),
			 localWordOutReq => rd_req(I),
			 trgLinkSynced => trgLinkSync1(I),
			 serialClkLocked => serialClkLck1(I)
			 );
		end GENERATE Gen_QBLink;

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
   begin		
      QB_RST <= (others=>'1');
      wait for 100 ns;	
      wait for dataClk_period*10;
		QB_RST <= (others=>'0');
      wait until TRIG_LINK_SYNC = "1111";
      DCsent(0) <= TS_arb & TrigEvent & trigBits_arb1;
		DCsent(1) <= TS_arb & TrigEvent & trigBits_arb2;
	   DCsent(2) <= TS_arb & TrigEvent & trigBits_arb3;
      DCsent(3) <= TS_arb & TrigEvent & trigBits_arb4;      
		DCsent_valid <= "1111"; 
		txDataReady <= '1';
		--trigger logic works.
		wait;
   end process;

END;
