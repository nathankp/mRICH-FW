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
--use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
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

   --Inputs of cmd_interpreter (STIM)
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
 	--Outputs of cmd_interpreter
   signal rxDataReady : std_logic := '0';
   signal txData : std_logic_vector(31 downto 0);
   signal txDataValid : std_logic := '0';
   signal txDataLast : std_logic := '0';
   signal DC_CMD : std_logic_vector(31 downto 0) := (others => '0');
   signal QB_WrEn : std_logic_vector(3 downto 0):= (others => '0');
   signal QB_RdEn : std_logic_vector(3 downto 0):= (others => '0');
	signal QB_RST : std_logic_vector(3 downto 0):= (others => '0');
   signal triglogicrst : std_logic := '0';	
   signal regAddr : std_logic_vector(15 downto 0):= (others => '0');
   signal regWrData : std_logic_vector(15 downto 0):= (others => '0');
   signal regReq : std_logic:= '0';
   signal regOp : std_logic:= '0';
	
	

	
	--Other SCROD signals ---
	signal SERIAL_CLK_LCK : std_logic_vector(3 downto 0):= (others => '0');
   signal TRIG_LINK_SYNC : std_logic_vector(3 downto 0):= (others => '0');
	signal TX : std_logic_vector (3 downto 0):= (others => '0');
	signal global_event : slv(3 downto 0) := (others => '0');
	signal GLOBAL_EVENT_P : slv(3 downto 0) := (others => '0');
	signal GLOBAL_EVENT_N : slv(3 downto 0) := (others => '1');
	signal CtrlRegister : GPR := (others => (others => '0'));
		--dc QBlink signals
	signal rd_req : slv(3 downto 0) := (others =>'0');
	signal SCROD_data : Word32Array(3 downto 0) := (others => (others => '0')); --incoming word from SCROD
	signal SCROD_data_valid : slv(3 downto 0) := "0000"; -- valid incoming word from scrod 
	signal wordin : word32Array(3 downto 0) := (others => (others => '0')); --QBLink input register, fed outgoing word to SCROD
	signal wordin_valid : slv(3 downto 0) := (others => '0'); --send word to scrod
   signal trgLinkSync1 : slv( 3 downto 0):= (others => '0'); --dc QBLink status flags
	signal serialClkLck1 : slv(3 downto 0):= (others => '0');
	signal dataclk_P : slv(3 downto 0):= (others => '0');
	signal dataclk_N : slv(3 downto 0):= (others => '0');
	signal DCsent : Word32Array(3 downto 0) := (others => x"00000000"); --Register command response
	signal DCsent_valid : slv(3 downto 0) := "0000";
	signal RX_P : slv(3 downto 0):= (others => '0');
	signal RX_N : slv(3 downto 0):= (others => '1');
	signal TX_P : slv(3 downto 0):= (others => '0');
	signal TX_N : slv(3 downto 0):= (others => '1');
	--dc timestamp signals
	 signal SSTin : sl:= '0';
	 signal SSTin_P : slv(3 downto 0):= (others => '0');
	 signal SSTin_N : slv(3 downto 0):= (others => '1');
	 signal sync : sl := '0';
	 signal sync_n : slv(3 downto 0) := (others => '1');
	 signal sync_P : slv(3 downto 0) := (others => '0');
	 signal sync_TS : sl := '0';
	 signal timeStamp : word24Array(3 downto 0):= (others => (others=>'0'));
	 
	--dc trigger logic signals
	 signal trigFlag : slv(3 downto 0):= (others => '0');
	 signal sendTrigger : slv(3 downto 0):= (others => '0');
	 signal TriggerData : word32Array(3 downto 0) := (others => (others => '1'));
 	 signal TX_TRIG : word5Array(3 downto 0) := (others => "00000");
	 signal SHOUT :  slv(3 downto 0) := (others => '0');
	 signal SIN :  slv(3 downto 0):= (others => '0');
	 signal PCLK :  slv(3 downto 0):= (others => '0');
	 signal SCLK :  slv(3 downto 0):= (others => '0');
	 
	-- signal asic_clk : s1;
	

   -- Clock period definitions
	--constant asic_clk_period : time := 16 ns;;
	constant SSTin_period : time := 32 ns;
	constant usrClk_period : time := 8 ns;
   constant dataClk_period : time := 40 ns;
	
	--other constants
	constant TS_arb: slv(23 downto 0) := x"003876";
	constant trigBits_arb1 : slv(4 downto 0) := "01011"; --make 4 different arbitrary tigger bits. 
	constant trigBits_arb2 : slv(4 downto 0) := "00110";
	constant trigBits_arb3 : slv(4 downto 0) := "01110";
	constant trigBits_arb4 : slv(4 downto 0) := "01100";
	constant TrigEvent : slv(2 downto 0) := "111";
BEGIN
-- sync_process: process(SSTIN)
--BEGIN
--IF rising_edge(SSTIN) Then --sync "sync" signal to SSTIN so all DC timestamp counters are reset on the same clock edge.
--	sync_ts <= sync;
--END IF;
--END process;
	-- Instantiate the Unit Under Test (UUT)
	DC_IO_BUFF : entity work.IO_Buffers
	generic map (num_DC => 3)
	PORT MAP(
		RX_P => RX_P,
		RX_N => RX_N,
		TX => TX,
		GLOB_EVNT => global_event,
		SYNC => sync,
		TX_P => TX_P,
		TX_N => TX_N,
		DC_CLK_P => dataclk_P,
		DC_CLK_N => dataclk_N,
		DATA_CLK => dataclk,
		GLOB_EVNT_P => GLOBAL_EVENT_P,
		GLOB_EVNT_N => GLOBAL_EVENT_N,
		RX => RX,
		SYNC_P => sync_P,
		SYNC_N => sync_N
	);
	
   uut1: entity work.CommandInterpreter 
	PORT MAP (
          usrClk => usrClk,
          dataClk => dataClk,
          usrRst => usrRst,
          rxData => rxData, --input stim
          rxDataValid => rxDataValid, --input stim
          rxDataLast => rxDataLast, --input stimm
          rxDataReady => rxDataReady, --output stim
          txData => txData, --output stim
          txDataValid => txDataValid, --output stim
          txDataLast => txDataLast, --output isim
          txDataReady => txDataReady, --input stim
          serialClkLck => SERIAL_CLK_LCK, --output isim
          trigLinkSync => TRIG_LINK_SYNC,
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
	SCROD_Ctrl_Reg: process(usrClk,regReq,usrRst,regOp) begin
      if rising_edge(usrClk) then
         if usrRst = '1' then
            regAck    <= '0';
            regRdData <= (others => '0');
         elsif regReq = '1' then
            regAck <= regReq;
				if regOp = '1' then
					CtrlRegister(conv_integer(unsigned(regAddr))) <= regWrData;
				else 
					regRdData <= CtrlRegister(conv_integer(unsigned(regAddr)));
				 end if;
         else
            regAck <= '0';
         end if;
      end if;
   end process;

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
	--TX_n <= not TX;
	--RX_n <= not RX;
	
	Gen_DC : FOR I in 3 downto 0 GENERATE 
	DC : entity work.HMB_DC_QBTOP 
	PORT MAP(
		SYSCLK_P => dataClk_P(I),
		SYSCLK_n =>  dataClk_N(I),
		TX_P => TX_P(I),
		TX_N => TX_N(I),
		RX_P => RX_P(I),
		RX_N => RX_N(I),
		SYNC_P => sync_P(I),
		SYNC_N => sync_n(I),
		TX_TRIG => TX_TRIG(I),
		SSTin_P => SSTin_P(I),
		SSTin_n => SSTin_N(I),
		SHOUT => SHOUT(I),
		SIN => SIN(I),
		PCLK => PCLK(I),
		SCLK => SCLK(I)
		);  		
end GENERATE Gen_DC;		
--	DC_QBLink : entity work.QBLink                                                     
--	PORT MAP( 
--			 sstClk => dataClk,
--			 rst => QB_RST(I),
--			 rawSerialOut => RX(I),
--			 rawSerialIn => TX(I),
--			 localWordIn => wordin(I), 
--			 localWordInValid => wordin_valid(I),
--			 localWordOut => SCROD_data(I),
--			 localWordOutValid => SCROD_data_Valid(I),
--			 localWordOutReq => rd_req(I),
--			 trgLinkSynced => trgLinkSync1(I),
--			 serialClkLocked => serialClkLck1(I)
--			 );
--	DC_Timestamp : entity work.Timestamper
--		PORT MAP(
--			clk => SSTin,
--			ce => '1',
--			sinit => sync_TS,
--			q => timeStamp(I)
--			);
--	 TriggerLogic: entity work.TriggerPack2 
--  PORT MAP (
--          CLK => dataclk,
--          trgLinkSynced => trgLinkSync1(I),
--          SerialClkLocked => SerialClkLck(I),
--          TriggerBits => TX_TRIG(I),
--          Timestamp => timeStamp(I),
--          QBL_WrEn => sendTrigger(I),
--			 TriggerFlag => trigFlag(I), 
--          TriggerData => TriggerData(I)
--			 );
	
		--end GENERATE Gen_DC;
--QBMux : process(trigFlag, TriggerData,DCsent, sendTrigger,DCsent_valid) 
--begin
--	FOR J in 3 downto 0 LOOP	
--		IF trigFlag(J) = '1' THEN
--			wordin(J) <= TriggerData(J);
--			wordin_valid(J) <= sendTrigger(J);
--		ELSE
--			wordin(J) <= DCsent(J);
--			wordin_valid(J) <= DCsent_valid(J);
--		END IF;
--	END LOOP;
--end process;

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
--   
--	SSTin_process : process
--	begin
--		SSTin <= '0';
--		wait for SSTin_period/2;
--		SSTin <= '1';
--		wait for SSTin_period /2;
--	end process;

   -- Stimulus process
   stim_proc: process
	variable checksum : slv(31 downto 0) := (others => '0');
   begin		
		wait until rising_edge(dataClk);
		QB_RST <= (others=>'1');
		sync <= '1';
      wait for dataClk_period*3;
		sync <= '0';
		QB_RST <= (others=>'0');
      wait until TRIG_LINK_SYNC = "1111"; --takes 53.66 us to sync      
		wait;
   end process;

END;
--
		--rxDataValid <= '1';
		--rxDatalast <= '0';
--		wait until rxDataready = '1';
--		rxDatalast <= '0';
--		rxData <= x"00BE11E2";
--		wait for usrClk_period;
--		rxDatalast <= '0';
--		rxData <= x"00000006";
--		wait for usrClk_period;
--		rxDatalast <= '0';
--		rxData <= x"646f6974";
--		wait for usrClk_period;
--		rxDatalast <= '0';
--		rxData <= x"0000A500";
--		wait for usrClk_period;
--		rxDatalast <= '0';
--		rxData <= x"00000001";
--		checksum := rxData;
--		wait for usrClk_period;
--		rxDatalast <= '0';
--		rxData <= x"72697465";
--		checksum := checksum + rxData;
--		wait for usrClk_period;
--		rxDatalast <= '0';
--		rxData <= x"0004020F";
--		checksum := checksum + rxData;
--		wait for usrClk_period;
--		rxDatalast <= '0';
--		rxData <= x"726D7675";
--		wait for usrClk_period;
--		rxDatalast <= '0';
--		checksum := (others => '0');
--		wait until regAck = '1';
--		txDataReady <= '0';
---Trigger event test
	--	TX_TRIG <= (others => trigBits_arb1);
--		DCsent <= (others => (others =>'1'));
----      DCsent(0) <= TS_arb & TrigEvent & trigBits_arb1;
----		DCsent(1) <= TS_arb & TrigEvent & trigBits_arb2;
----	   DCsent(2) <= TS_arb & TrigEvent & trigBits_arb3;
----      DCsent(3) <= TS_arb & TrigEvent & trigBits_arb4;      
--	--	DCsent_valid <= "1111"; 
--		txDataReady <= '1';
--		--trigger logic works.
		