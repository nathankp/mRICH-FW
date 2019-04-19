--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:35:06 04/16/2019
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1/cmdInerpreter_TB.vhd
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
use work.BMD_definitions.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
Library UNISIM;
use UNISIM.vcomponents.all;

 
ENTITY cmdInerpreter_TB IS
END cmdInerpreter_TB;
 
ARCHITECTURE behavior OF cmdInerpreter_TB IS 
 
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
         myId : IN  std_logic_vector(15 downto 0);
         serialClkLck : IN  std_logic;
         trigLinkSync : IN  std_logic;
         DC_CMD : OUT  std_logic_vector(31 downto 0);
         QB_WrEn : OUT  std_logic;
         QB_RdEn : OUT  std_logic;
         DC_RESP : IN  std_logic_vector(31 downto 0);
         DC_RESP_VALID : IN  std_logic;
         regAddr : OUT  std_logic_vector(15 downto 0);
         regWrData : OUT  std_logic_vector(15 downto 0);
         regRdData : IN  std_logic_vector(15 downto 0);
         regReq : OUT  std_logic;
         regOp : OUT  std_logic;
         regAck : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal usrClk : std_logic := '0';
   signal dataClk : std_logic := '0';
   signal usrRst : std_logic := '0';
   signal rxData : std_logic_vector(31 downto 0) := (others => '0');
   signal rxDataValid : std_logic := '0';
   signal rxDataLast : std_logic := '0';
   signal txDataReady : std_logic := '0';
   signal myId : std_logic_vector(15 downto 0) := (others => '0');
   signal serialClkLck : std_logic := '0';
   signal trigLinkSync : std_logic := '0';
   signal DC_RESP : std_logic_vector(31 downto 0) := (others => '0');
   signal DC_RESP_VALID : std_logic := '0';
   signal regRdData : std_logic_vector(15 downto 0) := (others => '0');
   signal regAck : std_logic := '0';

 	--Outputs
   signal rxDataReady : std_logic;
   signal txData : std_logic_vector(31 downto 0);
   signal txDataValid : std_logic;
   signal txDataLast : std_logic;
   signal DC_CMD : std_logic_vector(31 downto 0);
   signal QB_WrEn : std_logic;
   signal QB_RdEn : std_logic;
   signal regAddr : std_logic_vector(15 downto 0);
   signal regWrData : std_logic_vector(15 downto 0);
   signal regReq : std_logic;
   signal regOp : std_logic;

	signal CtrlRegister : GPR;
   -- Clock period definitions
   constant usrClk_period : time := 8 ns;
   constant dataClk_period : time := 40 ns;
	
	------------QBLINK SIGNALS----------------
	
   --Inputs
	
   signal RX : std_logic := '0';
   signal CMD_VALID : std_logic := '0';
   signal RESP_REQ : std_logic := '0';
   signal QB_RST : std_logic := '0';

 	--Outputs
   signal TX : std_logic;
   signal SYNC : std_logic;
   signal DC_RESPONSE : std_logic_vector(31 downto 0);
   signal RESP_VALID : std_logic;
   signal SERIAL_CLK_LCK : std_logic;
   signal TRIG_LINK_SYNC : std_logic;
	
	--training partner signals
	signal sendBackWd : std_logic_vector(31 downto 0);
	signal respond : std_logic := '0';
	signal cmd_incoming : std_logic;
	signal ImListening : std_logic := '0';
	signal trgLinkSync1 : std_logic;
	signal serialClkLck1 : std_logic;
 
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
          myId => myId,
          serialClkLck => serialClkLck,
          trigLinkSync => trigLinkSync,
          DC_CMD => DC_CMD,
          QB_WrEn => QB_WrEn,
          QB_RdEn => QB_RdEn,
          DC_RESP => DC_RESP,
          DC_RESP_VALID => DC_RESP_VALID,
          regAddr => regAddr,
          regWrData => regWrData,
          regRdData => regRdData,
          regReq => regReq,
          regOp => regOp,
          regAck => regAck
        );
		   SCROD_QB: entity work.DC_Comm PORT MAP (
          DATA_CLK => dataClk,
          RX => RX,
          TX => TX,
          SYNC => SYNC,
          DC_CMD => DC_CMD,
          CMD_VALID => QB_WrEn,
          RESP_REQ => QB_RdEn,
          DC_RESPONSE => DC_RESP,
          RESP_VALID => DC_RESP_VALID,
          QB_RST => QB_RST,
          SERIAL_CLK_LCK => SERIAL_CLK_LCK,
          TRIG_LINK_SYNC => TRIG_LINK_SYNC
        );
	--QBLink Training Partner
	QBL_trainer: entity work.QBLink
	PORT MAP (
			 sstClk => dataClk,
			 rst => QB_RST,
			 rawSerialOut => RX,
			 rawSerialIn => TX,
			 localWordIn => sendBackWd, 
			 localWordInValid => respond,
			 localWordOut => sendBackWd,
			 localWordOutValid => cmd_incoming,
			 localWordOutReq => ImListening,
			 trgLinkSynced => trgLinkSync1,
			 serialClkLocked => serialClkLck1
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
   begin		
      -- hold reset state for 100 ns.
		QB_RST <= '1';
      wait for 100 ns;	
		wait for dataClk_period*10;
		QB_RST <= '0';
		wait until TRIG_LINK_SYNC ='1' and SERIAL_CLK_LCK = '1';
	   rxData <= x"00BE11E2"; --HEADER (IDLE STATE)
		rxDataValid <= '1';
		wait for usrClk_period; 
		rxData <= x"00000007"; --PACKET SIZE
		rxDataValid <= '1';
		wait for usrClk_period;  
		rxData <= x"646F6974"; --PACKET_TYPE: WORD_COMMAND_C
		rxDataValid <= '1';
		wait for usrClk_period;
		rxData <= x"00DC0001"; --COMMAND_TARGET: SCROD
		rxDataValid <= '1';
		wait for usrClk_period;
		rxData <= x"00000012"; --Command ID
		rxDataValid <= '1';
		wait for usrClk_period;
		rxData <= x"72697465"; --Command Type: WORD_WRITE_C
		rxDataValid <= '1';
		wait for usrClk_period;
		rxData <= x"00010001"; --Command Data: Write 1 to register 1
		rxDataValid <= '1';
		wait for usrClk_period;
		rxData <= x"726A7478"; --command 1 Checksum
		rxDataValid <= '1';
		txDataReady <= '1';
		wait for usrClk_period; --goes to write state
		wait until cmd_incoming = '1';
		ImListening <= '1';
		respond <= '1';
		wait for dataClk_period;
		rxDataValid <= '1';
		rxDataLast <= '1';
		rxData <= x"00000000"; --packet checksum: doesn't check (empty state) so this is an arbitrary value
		rxDataValid <= '1';
      wait;
   end process; 
	
	
  SCROD_Ctrl_Reg: process(usrClk) begin
      if rising_edge(usrClk) then
         if usrRst = '1' then
            regAck    <= '0';
            regRdData <= (others => '0');
         elsif regReq = '1' then
            regAck <= regReq;
				if regOp = '1' then
					CtrlRegister(to_integer(unsigned(regAddr))) <= regWrData;
				else 
					regRdData <= CtrlRegister(to_integer(unsigned(regAddr)));
				 end if;
         else
            regAck <= '0';
         end if;
      end if;
   end process;

END;
--     wait for usrClk_period*10;
--      rxData <= x"00BE11E2"; --HEADER (IDLE STATE)
--		rxDataValid <= '1';
--		wait for usrClk_period; 
--		rxData <= x"0000000B"; --PACKET SIZE
--	   rxDataValid <= '1';
--		wait for usrClk_period;  
--		rxData <= x"646F6974"; --PACKET_TYPE: WORD_COMMAND_C
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"00A20000"; --COMMAND_TARGET: SCROD
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"00000012"; --Command ID
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"72697465"; --Command Type: WORD_WRITE_C
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"00010001"; --Command Data: Write 1 to register 1
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"726A7478"; --command 1 Checksum
--		rxDataValid <= '1';
--		txDataReady <='1';
--		wait for usrClk_period;
--		wait until rxDataReady ='1';
--		rxData <= x"00000013"; --NEXT COMMAND ID
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"72656164"; --Command Type: READ
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"00000001"; --Command Data: read register 1
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"72656178"; --command 2 checksum
--		rxDataValid <= '1';
--		wait until txDataLast = '1';
--		rxDataLast <= '1';
--		rxData <= x"00000000"; --packet checksum: doesn't check (empty state) so this is an arbitrary value
--		rxDataValid <= '1';
--		wait for usrClk_period;
