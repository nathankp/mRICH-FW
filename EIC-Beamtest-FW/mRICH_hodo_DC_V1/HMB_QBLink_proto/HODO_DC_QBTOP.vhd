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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.ALL;

entity HMB_DC_QBTOP is
    Port ( SYSCLK_P : IN  STD_LOGIC;
           SYSCLK_N : IN STD_LOGIC;
           TX_P : IN  STD_LOGIC;
           TX_N : IN  STD_LOGIC;
			  SYNC_P  : IN STD_LOGIC;
			  SYNC_N  : IN STD_LOGIC;
           RX_P : OUT  STD_LOGIC;
           RX_N : OUT  STD_LOGIC);
end HMB_DC_QBTOP;

architecture Behavioral of HMB_DC_QBTOP is
signal sync 	: STD_LOGIC;
signal internal_sysclk :  STD_LOGIC;
signal internal_reg : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal tx : STD_LOGIC;
signal rx : STD_LOGIC := '0';
signal wordin : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal wordout : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal wordin_valid :STD_LOGIC := '0';
signal wordout_valid : STD_LOGIC := '0';
signal wordout_req : STD_LOGIC := '0';
signal reset : STD_LOGIC := '0';
signal trgLinkSynced : STD_LOGIC := '0';
signal serialCLKLocked : STD_LOGIC := '0';
constant correctAnsw : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"DEADBEEF"; --USER: Change this to word you are sending from SCROD
--state machine
TYPE  STATETYPE IS (IDLE, SYNC_LINK, LISTEN, RD_BACK);
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
	
--SYNC_OBUFDS_inst : OBUFDS -- sync is converted to differential ouput
--generic map ( IOSTANDARD => "LVDS_25")
--port map (
--	O => SYNC_P,
--	OB => SYNC_N,
--	I => sync);

 --Temporary: training debug
--sync_proccess : PROCESS(internal_sysclk)
--BEGIN
--	IF(rising_edge(internal_sysclk)) THEN
--		sync <= not sync;
--	END IF;
--END PROCESS;
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
			IF (sync = '0') THEN
					nxtState <= LISTEN;
			ELSIF (sync = '1') THEN 
					nxtState <= RD_BACK;
			ELSE 
				nxtState <= IDLE;
			END IF;

		WHEN LISTEN =>
			wordout_req <= '1';
			IF(wordout = correctAnsw) THEN 
				internal_reg  <= wordout;
				nxtState <= IDLE;
			ELSE
				internal_reg <= (others => '0'); --flag incomplete write
				nxtState <= LISTEN;
			END IF;

		WHEN RD_BACK =>
			wordin <= internal_reg; -- load dc cmd into QBLink input FIFO
			wordin_valid <= '1'; --enable FIFO writing
			IF(sync = '0') THEN --Go back to IDLE when sync flag goes low, otherwise keeping sending back data to SCROD
				nxtState <= IDLE;
			ELSE
				nxtState <= RD_BACK;
			END IF;
	END CASE;
END PROCESS;
end Behavioral;

