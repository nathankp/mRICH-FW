----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:23:18 04/12/2019 
-- Design Name: 
-- Module Name:    DC_Comm - Behaviorial 
-- Project Name: HMB Tracking Plane Readout SCROD
-- Target Devices: Spartan6 
-- Tool versions: 
-- Description: For now contains QBLink module for DC register communication. Once register programming on DC is established, 
--					will add localWordOut path split between trigger data, waveform data, dc register/response data. 
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
use work.all;
use work.BMD_definitions.all; 
use work.UtilityPkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DC_Comm is
    Port ( DATA_CLK : in  sl;
           RX : in  sl;
           TX : out  sl;
           SYNC : OUT  sl;
           DC_CMD : in  slv (31 downto 0);
           CMD_VALID : in  sl;
           RESP_REQ : in sl;
			  DC_RESPONSE : out  slv (31 downto 0);
			 	--to be added: WAVE_WD : out slv(31 downto 0);
				--             and WaveValid
				--to be added: TRIG : slv(31 downto 0);
				--            and TrigValid
           RESP_VALID : out  sl;
			  QB_RST : in sl;
			  SERIAL_CLK_LCK : out sl;
			  TRIG_LINK_SYNC : out sl
			  );
end DC_Comm;

architecture Behaviorial of DC_Comm is
signal tx_dc : sl;
signal rx_dc : sl;
signal dc_dataValid : sl;
signal rd_req : sl;
signal dc_data : slv(31 downto 0);
signal trgLinkSync : sl;
signal serialClkLck : sl;
signal dc_sync : sl := '0'; --will implement sync with trigger feature
begin
TX <= tx_dc;
rx_dc <= RX;
DC_RESPONSE <= dc_data; --after register program feature, if statement will read HEADER word: dc_data will either feed DC_RESPONSE or WAVE_WD OR TRIG
RESP_VALID <= dc_dataValid; 
rd_req <= RESP_REQ;
TRIG_LINK_SYNC <= trgLinkSync;
SERIAL_CLK_LCK <= serialClkLck;
SYNC <= dc_sync;
comm_process : entity work.QBLink                                                     
PORT MAP( 
			 sstClk => DATA_CLK,
			 rst => QB_RST,
			 rawSerialOut => tx_dc,
			 rawSerialIn => rx_dc,
			 localWordIn => DC_CMD, 
			 localWordInValid => CMD_VALID,
			 localWordOut => dc_data,
			 localWordOutValid => dc_dataValid,
			 localWordOutReq => rd_req,
			 trgLinkSynced => trgLinkSync,
			 serialClkLocked => serialClkLck
			 );

end Behaviorial;

