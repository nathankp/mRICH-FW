----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:58 05/14/2019 
-- Design Name: 
-- Module Name:    TriggerPack - Behavioral 
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
use work.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TriggerPack2 is
    Port ( CLK : in  STD_LOGIC;
           trgLinkSynced : in  STD_LOGIC;
           SerialClkLocked : in  STD_LOGIC;
			  TriggerBits : in  STD_LOGIC_VECTOR (4 downto 0);
			  Timestamp : in STD_LOGIC_VECTOR(23 downto 0);
           QBL_WrEn : out  STD_LOGIC;
			  TriggerFlag : out STD_LOGIC;
           TriggerData : out  STD_LOGIC_VECTOR (31 downto 0)
           );
end TriggerPack2;

architecture Behavioral of TriggerPack2 is
signal TrigData : STD_LOGIC_VECTOR(31 downto 0):= x"00000000";
signal wr_en : STD_LOGIC := '0';
signal rd_en : STD_LOGIC := '0';
signal full  : STD_LOGIC := '0';
signal almost_full : STD_LOGIC := '0';
signal empty : STD_LOGIC := '0';

begin

	LoadQBL : Process(TrigData, CLK)
	begin
		IF(TriggerBits > "00000") THEN --OR trigger bits from TargetX
			TrigData <= Timestamp & "111" & TriggerBits; --If at least one of the bits are 1, latch Timestamp and bits into trigger data word
			TriggerFlag <= '1';
			IF rising_edge(CLK) THEN
				TriggerData <= TrigData;
				QBL_WrEn <= '1';
			END IF;
		ELSE
			TriggerFlag <= '0';
			QBL_WrEn <= '0'; 
			TriggerData <= (others => '0');
		END IF;
	end process;
	
	
			
		
end Behavioral;

