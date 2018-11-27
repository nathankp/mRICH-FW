----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:11 11/21/2018 
-- Design Name: 
-- Module Name:    SCRODQB_Top - Behavioral 
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

entity SCRODQB_Top is
	Port(
			START_SEND		 : IN STD_LOGIC; -- Chipscope VIO
			START_RD			 : IN STD_LOGIC; -- Chipscope VIO
			RESET				 : IN STD_LOGIC; --VIO
			MASTER_CLK_P    : IN STD_LOGIC; --input clock either 127MHz form osc or remote clock form, (try supply with VIO or function gen) 
			MASTER_CLK_N 	 : IN STD_LOGIC; --(try supply with VIO or function gen)
			RX_DC_P			 : IN STD_LOGIC; --SERIAL INPUT FROM DC
			RX_DC_N			 : IN STD_LOGIC; --SERIAL INPUT FROM DC
			CLK_DC_P			 : OUT STD_LOGIC; --25MHz clock to DC (fact check)
			CLK_DC_N			 : OUT STD_LOGIC;
			DC_RD_VALID		 : OUT STD_LOGIC; -- QBLink successfully read DC
			TX_DC_N         : OUT STD_LOGIC; --Serial output to DC
			TX_DC_P			 : OUT STD_LOGIC; --Serial output to DC
			TRGLINK_SYNC_P	 : OUT STD_LOGIC; --SYNC???
		   SERIAL_CLK_LCK  : OUT STD_LOGIC --QBLink Status bit
	);
end SCRODQB_Top;

architecture Behavioral of SCRODQB_Top is
signal internal_fpga_clk : STD_LOGIC;
signal internal_data_clk : STD_LOGIC;
signal cmd_valid			 : STD_LOGIC;
signal dc_cmd			    : STD_LOGIC_VECTOR(31 downto 0);
signal tx_dc				 : STD_LOGIC_VECTOR;
signal trglink_synced    : STD_LOGIC; 
signal rx_dc				 : STD_LOGIC;

begin
CLK_FANOUT_1TO2 : entity work.CLK_FANOUT
  port map
   (-- Clock in ports
    CLK_IN1_P => MASTER_CLK_P,
    CLK_IN1_N => MASTER_CLK_N,
    -- Clock out ports
    CLK_OUT1 => internal_fpga_clk,--125MHz
    CLK_OUT2 => internal_data_clk
	 );--25MHz
	 
clk_sync: process(internal_fpga_clk) begin
if rising_edge(internal_fpga_clk) then
	data_clk <= internal_data_clk; --NATHAN: Keep data_clk
end if;

TX_OBUFDS_inst : OBUFDS --(Nathan)instantiation of OBUFDS buffer
generic map (IOSTANDARD => "LVDS_25")
port map (
	O  => TX_N,    
	OB => TX_P,  
	I  => tx_dc); 

DC_CLK_OBUFDS_inst: OBUFDS 
generic map (IOSTANDARD => "LVDS_25")
port map (
	O => CLK_DC_N,
	OB => CLK_DC_P,
	I  => data_clk);

SYNC_OBUFDS_inst : OBUFDS
generic map (IOSTANDARD => "LVDS_25")
port map (
	O => SYNC_N,
	OB => SYNC_P,
	I => trglink_synced);

RX_DC_IBUF_inst : IBUFDS
generic map (IOSTANDARD => "LVDS_25"
		DIFF_TERM    => FALSE -- Differential Termination is already on board
		)
port map (
	O => RX_DC,
	I => RX_DC_P,
	IB => RX_DC-N);
	
end process;	 
	 

end Behavioral;

