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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TriggerPack is
    Port ( CLK : in  STD_LOGIC;
           trgLinkSynced : in  STD_LOGIC;
           SerialClkLocked : in  STD_LOGIC;
			  TriggerBits : in  STD_LOGIC_VECTOR (4 downto 0);
			  Timestamp : in STD_LOGIC_VECTOR(23 downto 0);
			  reset    : in STD_LOGIC;
           QBL_WrEn : out  STD_LOGIC;
           TriggerData : out  STD_LOGIC_VECTOR (31 downto 0)
           );
end TriggerPack;

architecture Behavioral of TriggerPack is
signal TrigData : STD_LOGIC_VECTOR(31 downto 0):= x"0000";
signal wr_en : STD_LOGIC := '0';
signal rd_en : STD_LOGIC := '0';
signal full  : STD_LOGIC := '0';
signal almost_full : STD_LOGIC := '0';
signal empty : STD_LOGIC := '0';

begin

TrigData <= "111" & Timestamp & TriggerBits; 
TrigFifo: entity work.waveform_fifo_wr32_rd32
  PORT MAP (
    rst => reset,
    wr_clk => CLK,
    rd_clk => CLK,
    din => TrigData,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => TriggerData,
    full => full,
    almost_full => almost_full,
    empty => empty
  );
	
	FIFO_process : PROCESS(CLK, full, trgLinkSynced, SerialClkLocked)
	begin
		wait until 
end Behavioral;

