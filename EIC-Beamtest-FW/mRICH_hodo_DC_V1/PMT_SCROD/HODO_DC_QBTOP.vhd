----------------------------------------------------------------------------------
-- Company: University of Hawaii HEPG Instrumentation Development Lab
-- Engineer: Nathan Park
-- 
-- Create Date:    13:59:21 12/04/2018 
-- Design Name:    HMB Hodoscope (BMD_revB) with QBLink (stage 1)
-- Module Name:    HMB_DC_QBTOP - Behavioral 
-- Project Name:   Hawaii Muon Beamline 
-- Target Devices: Spartan6 lx9 FPGA
-- Tool versions:  ISE 14.1

-- Description: Barebones HODOSCOPE DC FW implementing QBLink.
--              Tests QBLink communcation between SCROD and a HODOSCOPE DC: 
--						 SCROD writes to an internal register on the DC through QBLink. That internal register is readback
--  					 to the SCROD. If the data recieved by the SCROD matches the intENDed register value, then the SCROD and DC 
--                 are communicating properly.
--              If this test is successful, a fuller version of the HODOCSCOPE will be built upon this FW
--
-- DepENDencies: SCROD with QBLink (SCRODQB_Top) 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
-- Last Update on 12/31/2018
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use work.ck_package.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.ALL;
use work.all;
use work.BMD_definitions.all;
use work.BMD_autoinit_definitions.all;
use work.UtilityPkg.all;

entity HMB_DC_QBTOP is
    Port ( 
				---SCROD-DC----
			  SYSCLK_P : IN  sl;
           SYSCLK_N : IN sl;
           TX_P : IN  sl;
           TX_N : IN  sl;
			  SYNC_P  : IN sl;
			  SYNC_N  : IN sl;
           RX_P : OUT  sl;
           RX_N : OUT  sl
			);
END HMB_DC_QBTOP;

architecture Behavioral of HMB_DC_QBTOP is

--clock signals
signal SSTin : sl := '0';
signal asic_clk : sl; 
signal sysclk :  sl;
signal sync 	: sl := '0';
signal aux_clk : sl;
signal SSTclk_cntr : slv (1 downto 0) := (others=> '0');
signal timeStamp : slv(23 downto 0) := (others => '0');
signal sync_ts : sl := '0';
--QBLINK signals
signal tx : sl := '0';
signal rx : sl;
signal wordin : slv(31 DOWNTO 0) := (others => '0');
signal wordout : slv(31 DOWNTO 0) := (others => '0');
signal wordin_valid :sl := '0';
signal wordout_valid : sl := '0';
signal wordout_req : sl := '0';
signal trgLinkSynced : sl := '0';
signal serialCLKLocked : sl := '0';
signal cmd_type : slv(31 downto 0) := x"00000000";
--Registers
signal DC_REG : GPR := (others => x"0000");
signal regAddr : slv(15 downto 0) := x"0000";
signal regWrData : slv(15 downto 0) := x"0000";
signal regRdData : slv(15 downto 0) := x"0000"; 
signal internal_reg : slv(31 DOWNTO 0) := (others => '0'); --obsolete? 
signal send_DCresp  : sl := '0';
signal DCresp : slv(31 downto 0) := (others => '0'); 

signal mppc_dac_addr : slv(4 downto 0 ) := "00000";
signal mppc_dac_value : slv(11 downto 0) := (others => '0'); 
--Triggering 
signal trigFlag : sl := '0';
signal sendTrigger : sl := '0';
signal TriggerData : slv(31 downto 0) := (others => '0');
					--signal mppc_chan : arr_slv4(14 downto 0):= (others => "000");
					--	signal num_events : integer range 0 to 3;
					--signal num_events_slv : slv(3 downto 0) := (others => '0');
					--signal rem_addr_bits : integer range 0 to 16;
--TargetX signals
signal tx_dac_reg_data     : slv(18 downto 0) := (others => '0');
signal tx_dac_load_period  : slv(15 downto 0) := (others => '0');
signal tx_dac_latch_period : slv(15 downto 0) := (others => '0');
signal tx_dac_update       : sl := '0';
signal tx_dac_busy : sl := '0';
--signal shout : sl;

--command type constants---
constant read_rg : slv(31 downto 0) := x"72656164"; --write a register command type
constant write_rg : slv(31 downto 0) := x"72697465"; --read a register  

--state machine
TYPE  STATETYPE IS (IDLE, SYNC_LINK, LISTEN, REG_WR_RESPONSE, REG_RD_RESPONSE, TRIG_LATCH, EVENT_WORD1, EVENT_WORD2, EVENT_WORD3);
signal Reg_state : STATETYPE := SYNC_LINK;
signal Reg_nxtState :STATETYPE := SYNC_LINK;
signal event_state : STATETYPE := SYNC_LINK;
signal event_nxtState : STATETYPE := SYNC_LINK;
signal TX_DAC_UPst : slv(1 downto 0) := "00";
signal reset_sm : sl := '0';

constant EVENT_MSG: slv(31 downto 0) := x"65766e74"; --"evnt" in ASCII;
BEGIN

CLOCK_FANOUT : entity work.BMD_DC_CLK_GEN
  port map
   (-- Clock in ports
    CLK_IN1_P => SYSCLK_P,--25MHz
    CLK_IN1_N => SYSCLK_N,
    -- Clock out ports
    CLK_OUT1 => sysclk,--25MHz
    CLK_OUT2 => asic_clk,--62.5MHz
    CLK_OUT3 => aux_clk
	 );--10MHz 

--SSTin Generation
SSTIN_Gen: process(asic_clk) 
BEGIN
IF rising_edge(asic_clk) THEN
	SSTclk_cntr <= std_logic_vector(unsigned(SSTclk_cntr) + 1);
	SSTIN    <= SSTclk_cntr(1);  
END IF;
END process;

sync_process: process(SSTIN)
BEGIN
IF rising_edge(SSTIN) Then --sync "sync" signal to SSTIN so all DC timestamp counters are reset on the same clock edge.
	sync_ts <= sync;
END IF;
END process;

RX_OBUFDS_inst : OBUFDS 
generic map (IOSTANDARD => "LVDS_25")
port map ( 
O => RX_P,
OB => RX_N,
I => rx);


sst_OBUFDS_inst : OBUFDS --(Nathan)instantiation of OBUFDS buffer
generic map (IOSTANDARD => "LVDS_25")

port map (
	O  => SSTIN_P,    
	OB => SSTIN_N,  
	I  => SSTin); 
	
TX_IBUFDS : IBUFDS
generic map ( 
					DIFF_TERM => FALSE,
					IOSTANDARD => "LVDS_25")
port map (
	O => tx,
	I => TX_P,
	IB => TX_N);
	
SYNC_IBUFDS : IBUFDS
generic map ( 
					DIFF_TERM => FALSE,
					IOSTANDARD => "LVDS_25")
port map (
	O => sync,
	I => SYNC_P,
	IB => SYNC_N);
	
	
-----------------------------------------------------------------------------
-----------SCROD Interface-----------------------------------------------------

comm_process : entity work.QBLink                                                     
PORT MAP( 
			 sstClk => sysclk,
			 rst => sync,
			 rawSerialOut => rx,
			 rawSerialIn => tx,
			 localWordIn => wordin,
			 localWordInValid => wordin_valid,
			 localWordOut => wordout,
			 localWordOutValid => wordout_valid,
			 localWordOutReq => wordout_req,
			 trgLinkSynced => trgLinkSynced,
			 serialClkLocked => serialClkLocked
			 );
 
Timestamp_counter : entity work.Timestamper
  PORT MAP (
    clk => SSTin, 
    ce => '1',
    sinit => sync_TS,
    q => timeStamp
  );
			 
--DC FPGA Registers---
mppc_dac_addr       <= DC_REG(16)(4 downto 0);
mppc_dac_value      <= DC_REG(17)(11 downto 0); 
tx_dac_reg_data     <= DC_REG(1)(6 downto 0) & DC_REG(2)(11 downto 0);
tx_dac_load_period  <= DC_REG(3);
tx_dac_latch_period <= DC_REG(4);
reset_sm <= DC_REG(5)(11); --register 5, bit 12 drives reset of state machines

--QBLink_rst : process(reset_sm, sysclk)
-- variable cnt : integer := 0;
--  begin
--   IF(reset_sm = '1') THEN
--		IF (rising_edge(sysclk)) and (cnt <= 5) THEN
--			QBreset <= '1';
--			cnt := cnt + 1;
--		ELSE
--			QBreset <= '0';
--			cnt := 0;
--		END IF;
--	ELSE
--		QBreset <= '0';
--	END IF;
--END process;

DCReg: PROCESS(sysclk, Reg_state, trgLinkSynced, serialClkLocked, wordout_valid, wordout, trigflag, cmd_type) 
BEGIN
   IF trigFlag = '1' or reset_sm = '1' THEN 
		Reg_state <= IDLE;
	ELSIF (trgLinkSynced = '0' OR serialClkLocked = '0') THEN
		Reg_state <= SYNC_LINK;
	ELSE
		IF(rising_edge(sysclk)) THEN
--		QBreset <= '0'; --turn off reset at the beginning of each clock period
		Reg_state <= Reg_nxtState;
		END IF;
	END IF;
	
	case Reg_state IS
		WHEN SYNC_LINK =>
			send_DCresp <= '0';
			IF (trgLinkSynced = '1' and serialClkLocked = '1') THEN
				Reg_nxtState <= IDLE;
			ELSE
				Reg_nxtState <= SYNC_LINK;
			END IF;
		
		WHEN IDLE =>
			DCresp <= (others => '0');
			send_DCresp  <= '0';
    		wordout_req <= '0'; -- turn off readout, prevents overwrite of internal register after successfully being written to.
			IF trigFlag = '1' THEN --disable control register read and write by SCROD when there's an event.
				Reg_nxtState <= IDLE;
			ELSIF wordout_valid = '1' THEN 
				wordout_req <='1';
				IF wordout = write_rg or wordout = read_rg then
					cmd_type <= wordout;
					Reg_nxtState <= LISTEN;
				ELSE
					Reg_nxtState <= IDLE;
				END IF;
			END IF;

		WHEN LISTEN =>
			wordout_req <= '0';
			IF wordout = cmd_type THEN --still is command type;
				Reg_nxtState <= LISTEN;
				wordout_req <= '1';
			ELSIF cmd_type = write_rg or cmd_type = read_rg THEN
				regAddr <= wordout(15 downto 0);
				regWrData <= wordout(31 downto 16);
				IF cmd_type = write_rg then
					DC_REG(to_integer(unsigned(regAddr))) <= regWrData;
					Reg_nxtState <= REG_WR_RESPONSE;
				ELSE
					regRdData <= DC_REG(to_integer(unsigned(regAddr)));
					Reg_nxtState <= REG_RD_RESPONSE;
				END IF;
			END IF;

		WHEN REG_WR_RESPONSE =>
			DCresp <= regWrData &  regAddr; --acknowledge by repeating command back to the SCROD
			send_DCresp <= '1';
			Reg_nxtState <= IDLE;
		
		WHEN REG_RD_RESPONSE =>
			DCresp  <= regRdData & regAddr; --Acknowledge by sENDing back requested data with register address
			send_DCresp  <= '1';
			Reg_nxtState <= IDLE;
		WHEN OTHERS =>
			Reg_nxtState <= IDLE;
			
	END CASE;
END PROCESS;
END Behavioral;


--Trig_Decoder: entity work.TrigBitMux
--PORT MAP(
--	sel <= TX_TRIG,
--	chs_hit <= mppc_chan, --array of MPPC channel addresses, valid addresses are 0 through 14 and correspond to channels with events
--	num_chs_hit <= num_events --upper of channels hit
--	);
	
--Event_handling: PROCESS(sysclk, state, trgLinkSynced, serialClkLocked, wordout_valid, wordout, num_events) 
--  BEGIN 
--  IF (trgLinkSynced = '0' OR serialClkLocked = '0') THEN
--		event_state <= SYNC_LINK;
--  ELSIF reset_sm = '1' THEN
--		event_state <= IDLE;
--  ELSE
--		  IF(rising_edge(sysclk)) THEN
--		    QBreset <= '0'; --turn off reset at the begining of each clock period
--		    event_state <= Reg_nxtState;
--		  END IF;
--	END IF;
--  
--  CASE event_state IS
--	WHEN SYNC_LINK =>
--		wordin_valid <= '0';
--		IF (trgLinkSynced = '1' and serialClkLocked = '1') THEN --Possible Concern: if QBlink drops during Trig_latch, may lose trigger data
--			Reg_nxtState <= IDLE;
--		ELSE
--			Reg_nxtState <= SYNC_LINK;
--		END IF;
--	
--	WHEN IDLE =>
--		wordin_valid <= '0';
--		IF num_events > 0 THEN
--		 event_nxtState <= TRIG_LATCH;
--		ELSE
--		 event_nxtState <= IDLE;
--		END IF;
--	WHEN TRIG_LATCH =>
--		DC_REG(5)(7 downto 0) <= timeStamp(23 downto 16);
--		DC_REG(6)(15 downto 0) <= timeStamp(15 downto 0);
--	--	rem_addr_bits <= num_events*4-1; --index for registers that will latch triggered channel addresses
--		DC_REG(16)(4 downto 0) <= TX_TRIG;
----		FOR i IN 0 to num_events-1 LOOP
----			DC_REG(16)(rem_addr_bits downto rem_addr_bits-4) <= mppc_chan(i); --Can only hold a maximum of 4 addresses, will be errors if more than four channels have an event
----			IF rem_addr_bits > 0 THEN
----				rem_addr_bits  <= rem_addr_bits-1;
----			END IF;
----		END LOOP;
--		event_nxtState <= EVENT_WORD1;
--	
--	WHEN EVENT_WORD1 =>
--	 wordin <= EVENT_MSG;
--	 wordin_valid <= '1';
--	 event_nxtState <= EVENT_WORD2;
--	 
--	WHEN EVENT_WORD2 =>
--	 num_events_slv <= std_logic_vector(num_events);
--	 wordin <= DC_REG(5)(7 downto 0) & DC_REG(6) &  num_events_slv & "00";
--	 wordin_valid <= '1';
--	 event_nxtState <= EVENT_WORD3;
--	 
--	WHEN EVENT_WORD3 =>
--	 wordin <= x"0000" & DC_REG(16);
--	 wordin_valid <= '1';
--	 event_nxtState <= IDLE;
--
--	WHEN OTHERS =>
--	 event_nxtState <= IDLE;
--	
-- END CASE;
-- END PROCESS;
	 


