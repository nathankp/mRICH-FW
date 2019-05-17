----------------------------------------------------------------------------------
-- Company: University of Hawaii Instrumentation Development Lab
-- Engineer: Nathan Park
-- 
-- Create Date:    06:33:03 05/16/2019 
-- Design Name: 
-- Module Name:    IO_Buffers - Behavioral 
-- Project Name:  HODOSCOPE/Hawaii Muon Beamline
-- Target Devices: Spartan6 xc6slx150
-- Tool versions: ISE 14.7
-- Description: Buffers for differential IO signals. For 
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
library UNISIM;
use UNISIM.VComponents.all;

entity IO_Buffers is
	generic (
		num_DC : integer := 3 --highest index in DC signal vectors: (# of DCs) - 1  
		);
    Port ( RX_P : in  STD_LOGIC_VECTOR (num_DC downto 0);
           RX_N : in  STD_LOGIC_VECTOR (num_DC downto 0);
           TX : in  STD_LOGIC_VECTOR (num_DC downto 0);
           --DC_CLK : in  STD_LOGIC; --Universal DC_CLK
           SYNC : in  STD_LOGIC; --Universal sync signal
           TX_P : out  STD_LOGIC_VECTOR (num_DC downto 0);
           TX_N : out  STD_LOGIC_VECTOR (num_DC downto 0);
        --   DC_CLK_P : out  STD_LOGIC_VECTOR (num_DC downto 0);
         --  DC_CLK_N : out  STD_LOGIC_VECTOR (num_DC downto 0);
           RX : out  STD_LOGIC_VECTOR (num_DC downto 0);
           SYNC_P : out  STD_LOGIC_VECTOR (num_DC downto 0);
           SYNC_N : out  STD_LOGIC_VECTOR (num_DC downto 0));
end IO_Buffers;

architecture Behavioral of IO_Buffers is

begin
Gen_buffers : for I in num_DC downto 0 generate
	RX_IBUF_inst : IBUFDS -- input buffer: serial data from DCs
	generic map (
	     DIFF_TERM    => FALSE, -- Differential Termination is already on board
	     IOSTANDARD => "LVDS_25" 
	     )
	port map (
		O => RX(I),
		I => RX_P(I),
		IB => RX_N(I));
	
--	DC1_CLK_OBUFDS : OBUFDS --ODDR2 generated dc_clk buffered OBUFDS to drive output Clocks to DCs.
--	generic map (IOSTANDARD => "LVDS_25")
--	port map (
--		O => DC_CLK_P(I),
--		OB => DC_CLK_N(I),
--		I => DC_CLK); 
--	
	TX_OBUFDS_inst : OBUFDS --output buffer: serial data to DCs
	generic map (IOSTANDARD => "LVDS_25")
	port map (
		O  => TX_P(I),    
		OB => TX_N(I),  
		I  => TX(I)); 
		
	SYNC1_OBUFDS_inst : OBUFDS -- sync to DC 1
	generic map ( IOSTANDARD => "LVDS_25")
	port map (
		O => SYNC_P(I),
		OB => SYNC_N(I),
		I => SYNC);
end generate Gen_buffers;

end Behavioral;

