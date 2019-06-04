--
--  Package File Template
--
--  Purpose: This package defines supplemental types, subtypes, 
--     constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ck_package is

    subtype slv4 is std_logic_vector(3 downto 0);
    type arr_slv4 is array(natural range <>) of slv4;

    constant MAX_OCCUPANCY : integer :=3;
    subtype ASIC_hit_map is arr_slv4(0 to MAX_OCCUPANCY - 1);
    subtype ch_hit_map is arr_slv4(0 to MAX_OCCUPANCY - 1);
    type hit_record is
        record
            asic        : ASIC_hit_map; --hit_record.asic(i) returns slv(3 downto 0)
            ch          : ch_hit_map; --hit_record.ch(i) returns slv(3 downto 0)
            win_start   : std_logic_vector(8 downto 0);
            hit_count   : integer;
        end record;
    constant NULL_ASIC_HIT_MAP : ASIC_hit_map := (others => "1111");
    constant NULL_CH_HIT_MAP : ch_hit_map := (others => "1111");
    constant NULL_HIT_RECORD : hit_record := (NULL_ASIC_HIT_MAP, NULL_CH_HIT_MAP, (others => '0'), 0);

    type motherboard_trigger_bits is array (0 to 9) of std_logic_vector(4 downto 0);
    constant NULL_MB_TRIGGER_BITS : motherboard_trigger_bits := (others => "00000");

    subtype t_arr15slv4 is arr_slv4(0 to 14);
    type arr2d15slv4 is array(natural range <>) of t_arr15slv4;
    constant NULL_ASIC_CH_HIT : t_arr15slv4 := (others => "1111");

    subtype t_arr2d10by15slv4 is arr2d15slv4(0 to 9);
    constant NULL_ARR_OF_ASIC_CH_HIT : t_arr2d10by15slv4 := (others => NULL_ASIC_CH_HIT);

     -- array of 15 slv(3 downto 0)
    --subtype slv4 is std_logic_vector(3 downto 0);
    --type t_15slv4 is array (0 to 14) of slv4;

     -- array 10 arrays of 15 slv(3 downto 0)
    --subtype by15slv4 is t_15slv4(9 downto 0);
    --type array2d_10by15slv4 is array (0 to 9) of by15slv4;

    type hitCountByASIC is array (0 to 9) of integer;
    -- Declare functions and procedure
    --
    type tx_data_arr is array (0 to MAX_OCCUPANCY - 1) of std_logic_vector(11 downto 0);
    constant NULL_DATA_ARR: tx_data_arr := (others => "000000000000");


    -- procedure <procedure_name> (<type_declaration> <constant_name>  : in <type_declaration>);
    --


   
    function indexed_sum(signal inputArray : in hitCountByASIC; start_index : integer; end_index : integer) return integer;
 
end ck_package;

package body ck_package is

    function indexed_sum(signal inputArray : in hitCountByASIC; start_index : integer; end_index : integer) return integer is
        variable sum : integer := 0;
        begin
            for i in start_index to end_index loop
                 sum := sum + inputArray(i);
            end loop;
            return sum;
        end;

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end ck_package;
