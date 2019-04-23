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
--  					 to the SCROD. If the data recieved by the SCROD matches the intended register value, then the SCROD and DC 
--                 are communicating properly.
--              If this test is successful, a fuller version of the HODOCSCOPE will be built upon this FW
--
-- Dependencies: SCROD with QBLink (SCRODQB_Top) 
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
use work.BMD_definitions.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.ALL;
use work.all;
use work.BMD_definitions.all;
use work.BMD_autoinit_definitions.all;
use work.UtilityPkg.all;

entity HMB_DC_QBTOP is
    Port ( SYSCLK_P : IN  sl;
           SYSCLK_N : IN sl;
           TX_P : IN  sl;
           TX_N : IN  sl;
			  SYNC_P  : IN sl;
			  SYNC_N  : IN sl;
           RX_P : OUT  sl;
           RX_N : OUT  sl);
end HMB_DC_QBTOP;

architecture Behavioral of HMB_DC_QBTOP is
signal sync 	: sl;
signal internal_sysclk :  sl;
signal internal_reg : slv(31 DOWNTO 0) := (others => '0');
signal tx : sl;
signal rx : sl := '0';
signal wordin : slv(31 DOWNTO 0) := (others => '0');
signal wordout : slv(31 DOWNTO 0) := (others => '0');
signal wordin_valid :sl := '0';
signal wordout_valid : sl := '0';
signal wordout_req : sl := '0';
signal reset : sl := '0';
signal trgLinkSynced : sl := '0';
signal serialCLKLocked : sl := '0';
signal cmd_type : slv(31 downto 0) := x"00000000";
signal DC_REG : GPR;
signal regAddr : slv(15 downto 0) := x"0000";
signal regWrData : slv(15 downto 0) := x"0000";
signal regRdData : slv(15 downto 0) := x"0000"; 

--command type constants---
constant read_rg : slv(31 downto 0) := x"72656164"; --write a register command type
constant write_rg : slv(31 downto 0) := x"72697465"; --read a register  

--state machine
TYPE  STATETYPE IS (IDLE, SYNC_LINK, LISTEN, REG_WR_RESPONSE, REG_RD_RESPONSE);
signal state : STATETYPE := SYNC_LINK;
signal nxtState :STATETYPE := SYNC_LINK;
begin

RX_OBUFDS_inst : OBUFDS 
generic map (IOSTANDARD => "LVDS_25")
port map ( 
O => RX_P,
OB => RX_N,
I => rx);

SYSCLK_IBUFGDS_inst : IBUFGDS
generic map (
					DIFF_TERM => FALSE,
					IOSTANDARD => "LVDS_25")
port map (
O => internal_sysclk, -- Clock buffer output
I => SYSCLK_P, -- Diff_p clock buffer input
IB => SYSCLK_N -- Diff_n clock buffer input
);
	
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
-----------QBLink Module-----------------------------------------------------
-----------------------------------------------------------------------------
comm_process : entity work.QBLink                                                     
PORT MAP( 
			 sstClk => internal_sysclk,
			 rst => reset,
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

comm_sm: PROCESS(internal_sysclk, state, trgLinkSynced, serialClkLocked, wordout_valid, wordout) 
BEGIN
	IF(rising_edge(internal_sysclk)) THEN
		reset <= '0'; --turn off reset at the beginning of each clock period
		state <= nxtState;
	END IF;
	
	case STATE IS
		WHEN SYNC_LINK =>
			wordin_valid <= '0';
			IF (trgLinkSynced = '1' and serialClkLocked = '1') THEN
				nxtState <= IDLE;
			ELSE
				nxtState <= SYNC_LINK;
			END IF;
		
		WHEN IDLE =>
			wordin <= (others => '0');
			wordin_valid <= '0';
    		wordout_req <= '0'; -- turn off readout, prevents overwrite of internal register after successfully being written to.
			IF wordout_valid = '1' THEN 
				wordout_req <='1';
				IF wordout = write_rg or wordout = read_rg then
					cmd_type <= wordout;
					nxtState <= LISTEN;
				ELSE
					nxtState <= IDLE;
				END IF;
			END IF;

		WHEN LISTEN =>
			wordout_req <= '0';
			IF wordout = cmd_type THEN --still is command type;
				nxtState <= LISTEN;
				wordout_req <= '1';
			ELSIF cmd_type = write_rg or cmd_type = read_rg then
				regAddr <= wordout(15 downto 0);
				regWrData <= wordout(31 downto 16);
				IF cmd_type = write_rg then
						DC_REG(to_integer(unsigned(regAddr))) <= regWrData;
						nxtState <= REG_WR_RESPONSE;
				ELSE
					regRdData <= DC_REG(to_integer(unsigned(regAddr)));
					nxtState <= REG_RD_RESPONSE;
				END IF;
			END IF;

		WHEN REG_WR_RESPONSE =>
			wordin <= regWrData &  regAddr; --acknowledge by repeating command back to the SCROD
			wordin_valid <= '1';
			nxtState <= IDLE;
		
		WHEN REG_RD_RESPONSE =>
			wordin <= regRdData & regAddr; --Acknowledge by sending back requested data with register address
			wordin_valid <= '1';
			nxtState <= IDLE;
		WHEN OTHERS =>
			nxtState <= IDLE;
			
	END CASE;
END PROCESS;
end Behavioral;

