----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:37:49 09/21/2018 
-- Design Name: 
-- Module Name:    CombinePackets - Behavioral 
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

entity CombinePackets is
        Port ( 
            clk       : in   STD_LOGIC;
            enable    : in   STD_LOGIC;
            busy      : out  STD_LOGIC;
            done      : out  STD_LOGIC;
            DataOut   : out  STD_LOGIC_VECTOR (15 downto 0)
        );
end CombinePackets;

architecture Behavioral of CombinePackets is

begin


end Behavioral;

