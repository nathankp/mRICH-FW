-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : UtilityPkg.vhd
-- Author     : Kurtis Nishimura 
-------------------------------------------------------------------------------
-- Description: A set of common useful definitions.  Some of these ideas
--              originate from Ben Reese @ SLAC and his StdRtlPkg.
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package UtilityPkg is
   
   -- Shorthand names for common types
   subtype sl is std_logic;
   subtype slv is std_logic_vector;
   -- Useful array types
   type Word8Array  is array (natural range <>) of slv( 7 downto 0);
   type Word13Array is array (natural range <>) of slv(12 downto 0);
   type Word16Array is array (natural range <>) of slv(15 downto 0);
   type Word32Array is array (natural range <>) of slv(31 downto 0);

   -----------------------
   -- Function prototypes
   -----------------------
   -- Grab 1 byte of an input SLV
   function getByte (byteNum : integer; input : slv) return slv;
   -- Conditional selection of constants
   function sel (conditional : boolean; if_true : natural; if_false : natural) return natural;
   
end UtilityPkg;

package body UtilityPkg is

   function getByte (byteNum : integer; input : slv) return slv is 
      variable retVar : slv(7 downto 0) := (others => '0');
   begin
      -- Make sure that we're not looking out of range of the input
      assert(byteNum*8 <= input'length and byteNum >= 0) report "Byte number is out of range!" severity failure;
      -- Calculate the byte we want
      retVar := input(8*byteNum+7 downto 8*byteNum);
      return retVar;      
   end function;

   function sel (conditional : boolean; if_true : natural; if_false : natural) return natural is
   begin
      if (conditional = true) then 
         return(if_true);
      else 
         return(if_false);
      end if;
   end function;
   
end package body UtilityPkg;
