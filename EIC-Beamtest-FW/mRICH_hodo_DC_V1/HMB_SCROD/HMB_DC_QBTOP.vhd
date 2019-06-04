----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:59:21 12/04/2018 
-- Design Name: 
-- Module Name:    HMB_DC_QBTOP - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity HMB_DC_QBTOP is
    Port ( SYSCLK_P : in  STD_LOGIC;
           SYSCLK_N : in  STD_LOGIC;
           TX_P : in  STD_LOGIC;
           TX_N : in  STD_LOGIC;
			  DC_RESET : IN STD_LOGIC;
           RX_P : out  STD_LOGIC;
           RX_N : out  STD_LOGIC);
end HMB_DC_QBTOP;

architecture Behavioral of HMB_DC_QBTOP is
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

--state machine
TYPE  STATETYPE IS (SYNC_LINK, LISTEN, RD_BACK);
signal state : STATETYPE := SYNC_LINK;
signal nxtState :STATETYPE := SYNC_LINK;
begin

RX_OBUFDS_inst : OBUFDS 
generic map (IOSTANDARD => "LVDS_25")
port map ( 
O => RX_P,
OB => RX_N,
I => rx);

SYSCLK_IBUFDS : IBUFDS 
generic map ( 
					DIFF_TERM => FALSE,
					IOSTANDARD => "LVDES_25")
port map (
	O => internal_sysclk,
	I => SYSCLK_P,
	IB => SYSCLK_N);
	
TX_IBUFDS : IBUFDS
generic map ( 
					DIFF_TERM => FALSE,
					IOSTANDARD => "LVDES_25")
port map (
	O => tx,
	I => TX_P,
	IB => TX_N);
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
COMM_clk : PROCESS(internal_sysclk,dc_reset)
BEGIN
		IF(DC_RESET = '1') THEN
			reset <= '1'; --RESET QBLink
		ELSIF(rising_edge(internal_sysclk)) THEN
			reset <= '0'; 
			state <= nxtState;
		END IF;
END PROCESS;

comm_sm: PROCESS(STATE, trgLinkSynced, serialClkLocked, wordout_valid) 
BEGIN
case STATE IS
		WHEN SYNC_LINK =>
			wordin_valid <= '0';
			IF (trgLinkSynced = '1' and serialClkLocked = '1') THEN
				nxtState <= LISTEN;
			ELSE
				nxtState <= SYNC_LINK;
			END IF;
			
		WHEN LISTEN =>
			wordin <= (others => '0');
			wordin_valid <= '0';
			wordout_req <= '1';
			IF(wordout_valid = '1') THEN 
				internal_reg  <= wordout;
				nxtState <= RD_BACK;
			ELSE
				internal_reg <= (others => '1'); --flag incomplete write
				nxtState <= LISTEN;
			END IF;
		
		WHEN RD_BACK =>
			wordin <= internal_reg;
			wordin_valid <= '1';
			IF(DC_RESET = '1') THEN --to stop reading back master SCROD will reset DC 
				nxtState <= SYNC_LINK;
			ELSE
				nxtState <= RD_BACK;
			END IF;
		END CASE;
END PROCESS;
end Behavioral;

