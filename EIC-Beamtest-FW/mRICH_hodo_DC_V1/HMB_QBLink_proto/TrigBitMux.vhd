--! Create Date:    09:12:56 11/27/2018 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_misc.all;
--use ieee.std_logic_arith.all;
use work.ck_package.all;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

--! TargetX trigger-bit multiplexer. 
--! 
--! Chris Ketter. 11/30/2018.
--!
--! Input is 5 TargetX trigger bits, output is array of 4-bit logic vectors
--! fifteen entries deep---one for every channel just in case---wherein each 
--! entry is the 4-bit address of the channel hit. Note well, while the TargetX
--! counts its channels starting from one, the 4-bit address output here corresponds
--! to a counting system beginning with zero, i.e. [ch1:ch15] ==> [ch0:ch14].
--! Also note that the output array is filled from bottom up regardless of channel
--! number. This is done so that the other output, the number of channels hit, 
--! can be used to index how deep the output array is.  
--! The case where the fifth trigger bit is high is handled by explicitly specifing
--! every possibility. When it is low, the TargetX channel address is simply 
--! converted to the "from-zero" counting scheme.
--! 
entity TrigBitMux is
    Port ( 
        sel           : in  STD_LOGIC_VECTOR (4 downto 0);
        chs_hit       : out arr_slv4(14 downto 0); --nathan:changed type from slv4 -->arr_slv4
        num_chs_hit   : out integer range 0 to 3
    );
end TrigBitMux;

architecture Behavioral of TrigBitMux is
    
    signal X : arr_slv4(15 downto 0) := (others=>"0000");
    
begin
    
    chs_hit <= X(14 downto 0);
    num_chs_hit <= to_integer(unsigned(X(15)));
    
with sel select
    X <= (15=>"0000",                                                                                                                                                                           others=>"1111") when "00000",  --! null case 
         (15=>"0011",                                                                                                                                          2=>"1110", 1=>"1101", 0=>"1100", others=>"1111") when "11000",         
         (15=>"0100",                                                                                                                               3=>"0011", 2=>"0010", 1=>"0001", 0=>"0000", others=>"1111") when "10001",
         (15=>"0100",                                                                                                                               3=>"0111", 2=>"0110", 1=>"0101", 0=>"0100", others=>"1111") when "10010",
         (15=>"0100",                                                                                                                               3=>"1011", 2=>"1010", 1=>"1001", 0=>"1000", others=>"1111") when "10100",
         (15=>"0111",                                                                                              6=>"1110", 5=>"1101", 4=>"1100", 3=>"0011", 2=>"0010", 1=>"0001", 0=>"0000", others=>"1111") when "11001",
         (15=>"0111",                                                                                              6=>"1110", 5=>"1101", 4=>"1100", 3=>"0111", 2=>"0110", 1=>"0101", 0=>"0100", others=>"1111") when "11010",
         (15=>"0111",                                                                                              6=>"1110", 5=>"1101", 4=>"1100", 3=>"1011", 2=>"1010", 1=>"1001", 0=>"1000", others=>"1111") when "11100",
         (15=>"1000",                                                                                   7=>"0111", 6=>"0110", 5=>"0101", 4=>"0100", 3=>"0011", 2=>"0010", 1=>"0001", 0=>"0000", others=>"1111") when "10011",
         (15=>"1000",                                                                                   7=>"1011", 6=>"1010", 5=>"1001", 4=>"1000", 3=>"0011", 2=>"0010", 1=>"0001", 0=>"0000", others=>"1111") when "10101",
         (15=>"1000",                                                                                   7=>"1011", 6=>"1010", 5=>"1001", 4=>"1000", 3=>"0111", 2=>"0110", 1=>"0101", 0=>"0100", others=>"1111") when "10110",
         (15=>"1011",                                                 10=>"1110", 9=>"1101", 8=>"1100", 7=>"0111", 6=>"0110", 5=>"0101", 4=>"0100", 3=>"0011", 2=>"0010", 1=>"0001", 0=>"0000", others=>"1111") when "11011",
         (15=>"1011",                                                 10=>"1110", 9=>"1101", 8=>"1100", 7=>"1011", 6=>"1010", 5=>"1001", 4=>"1000", 3=>"0011", 2=>"0010", 1=>"0001", 0=>"0000", others=>"1111") when "11101",
         (15=>"1011",                                                 10=>"1110", 9=>"1101", 8=>"1100", 7=>"1011", 6=>"1010", 5=>"1001", 4=>"1000", 3=>"0111", 2=>"0110", 1=>"0101", 0=>"0100", others=>"1111") when "11110",
         (15=>"1100",                                     11=>"1011", 10=>"1010", 9=>"1001", 8=>"1000", 7=>"0111", 6=>"0110", 5=>"0101", 4=>"0100", 3=>"0011", 2=>"0010", 1=>"0001", 0=>"0000", others=>"1111") when "10111",
         (15=>"1111", 14=>"1110", 13=>"1101", 12=>"1100", 11=>"1011", 10=>"1010", 9=>"1001", 8=>"1000", 7=>"0111", 6=>"0110", 5=>"0101", 4=>"0100", 3=>"0011", 2=>"0010", 1=>"0001", 0=>"0000")                 when "11111", --! all 15 channels
         (15=>"0001", 0=>std_logic_vector(unsigned(sel(3 downto 0)) - to_unsigned(1,4)), others=>"1111") when others; -- one channel
end Behavioral;
