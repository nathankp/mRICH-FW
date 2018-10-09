----------------------------------------------------------------------------------
-- Company        : UH Manoa- Department of Physics
-- Engineer       : Khanh le
-- Updated        : 
-- Create Date    : 10:53:30 08/19/2015 
-- Design Name    : KLM-Scintillator readout using ethernet
-- Module Name    : ethernet_readout_interface - Behavioral 
-- Project Name   : originaly for KLM but now using for BMD
-- Target Devices : SPARTAN 6 XC6SLX4-2TQG144
-- Tool versions  : ISE 14.7
-- Description    : Module sends readout data from targetx up to master 
-- DC = daughter card
-- MAS = master
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.02: reused state machine to parse commands for BMD daughter cards
----------------------------------------------------------------------------------
library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use UNISIM.VComponents.all;
use work.BMD_definitions.all;

entity DC_COMM_PARSER is
Port ( 	 
	  CLK  					 : IN  STD_LOGIC;
	  DC_ADDR             : IN  STD_LOGIC_VECTOR (3 downto 0);
	  SEND                : IN  STD_LOGIC;
	  TRIGGER             : IN  STD_LOGIC;
	  OOPS_RESET          : IN  STD_LOGIC;
	  ------master to DC signals----------
	  MAS_DC_DATA_CLK     : IN  STD_LOGIC;
	  MAS_DC_RX           : IN  STD_LOGIC;
 	  MAS_DC_DATA_IN      : IN  STD_LOGIC; -- vhdl header file
	  DC_MAS_TX           : OUT STD_LOGIC;
	  DC_MAS_DATA_OUT  	 : OUT STD_LOGIC;
	  ------DC to DC signals--------------
	  DC_DC_DATA_CLK      : OUT STD_LOGIC;
	  DC_DC_RX            : IN  STD_LOGIC;
	  DC_DC_DATA_IN       : IN  STD_LOGIC;
	  DC_DC_TX            : OUT STD_LOGIC;
	  DC_DC_DATA_OUT      : OUT STD_LOGIC;
	  --output registers for DC drivers--
	  RB_REG_VALUE			 : IN  STD_LOGIC_VECTOR (15 downto 0);
	  RB_REG_NUM          : OUT STD_LOGIC_VECTOR (7 downto 0);
	  TX_BUSY             : OUT STD_LOGIC;
	  TX_UPDATE  			 : OUT STD_LOGIC;
	  DAC_UPDATE			 : OUT STD_LOGIC;
	  OUTPUT_REGISTERS    : OUT GPR;
	  -----busy signals from drivers-----
	  READOUT_BUSY        : IN STD_LOGIC;
	  ASIC_BUSY    		 : IN STD_LOGIC;
	  DUMP_BUSY 			 : IN STD_LOGIC;
	  MPPC_DAC_BUSY		 : IN STD_LOGIC;
	  -----data from pedestal drvier-----  
	  wave_fifo_full      : OUT STD_LOGIC;
	  wave_fifo_clk		 : IN  STD_LOGIC;
	  wave_fifo_wr_en   	 : IN  STD_LOGIC;
	  wave_fifo_data 		 : IN  STD_LOGIC_VECTOR (31 downto 0);
	  wave_fifo_reset 	 : IN  STD_LOGIC);
end DC_COMM_PARSER;

architecture Behavioral of DC_COMM_PARSER is
------------------RX internal signals---------------------------------
signal internal_setup_d   : std_logic := '0';
signal internal_data_clk  : std_logic := '0';
signal internal_data_in   : std_logic := '0';
signal internal_rx        : std_logic := '0';
signal internal_rb_reg_en : std_logic := '0';
signal internal_rb_reg_num: std_logic_vector(7 downto 0)  := (others => '0');
------------------TX internal signals---------------------------------- 
signal internal_tx        : std_logic := '0';
signal internal_data_out  : std_logic := '0';
signal internal_xfer_busy : std_logic := '0';
signal internal_tx_busy   : std_logic := '0';
signal internal_dc_rx     : std_logic := '0';
signal internal_dc_din    : std_logic := '0';

signal internal_dc_dc_tx  : std_logic := '0';
signal internal_dc_dc_dout: std_logic := '0';
 

--attribute keep: boolean;
--attribute keep of internal_data_clk: signal is true;

--------------------------------beginning Behavioral of DC_COMM_PARSER------------------------------------------
begin

--rx_syncing_process : process(CLK) begin
--if rising_edge(CLK) then
--	syncing incoming signals to fpga clk
	internal_data_clk <= MAS_DC_DATA_CLK;
	internal_data_in  <= MAS_DC_DATA_IN;
	internal_rx       <= MAS_DC_RX;
	
	internal_dc_rx    <= DC_DC_RX;
	internal_dc_din   <= DC_DC_DATA_IN;
	
--end if;
--end process;
		
DC_DC_DATA_CLK  <= internal_data_clk;

tx_syncing_process : process(internal_data_clk) begin

if falling_edge(internal_data_clk) then
	--syncing incoming data from master with data clock
	internal_dc_dc_tx   <= internal_rx;
	internal_dc_dc_dout <= internal_data_in;	
end if;

if rising_edge(internal_data_clk) then
	if internal_tx_busy = '1' then
		--sending dc data to master
		DC_MAS_TX       <= internal_tx;
		DC_MAS_DATA_OUT <= internal_data_out;
		
		--sending transmission line is busy signal
		DC_DC_TX        <= '0'; 
		DC_DC_DATA_OUT  <= '1';
	else
		--sending down stream dc data to master
		DC_MAS_TX       <= internal_dc_rx;   
		DC_MAS_DATA_OUT <= internal_dc_din;  
		
		--sending master data to down stream dc
		DC_DC_TX        <= internal_dc_dc_tx; 
		DC_DC_DATA_OUT  <= internal_dc_dc_dout;
		
	end if;
end if;
end process;

TX_BUSY    <= internal_tx_busy;
RB_REG_NUM <= internal_rb_reg_num;


--when dc is transmitting set dc_dc_tx = '0' and dc_dc_data_out = '1' to let downstream dc know that transmission line is busy
internal_xfer_busy <= '1' when internal_data_in = '1' and internal_rx = '0' else '0';
--							 '1' when MAS_DC_RX = '1' else '0';

--recieving stuff--
RX_ADDR_CHECK : entity work.RX_ADDR_CHECKER
Port Map(
	-------INPUTS------------
	CLK        => CLK,
	DATA_CLK   => internal_data_clk,
	DATA_IN    => internal_data_in,
	UPDATE     => internal_rx,
	DC_ADDR    => DC_ADDR,
	TX_BUSY    => ASIC_BUSY,
	SENDER_BUSY=> internal_tx_busy,  
	DAC_BUSY   => MPPC_DAC_BUSY,
	READOUT_BUSY => READOUT_BUSY,
   OOPS_RESET => OOPS_RESET, 	
	-------OUTPUTS-----------
	OUTPUT_REG => OUTPUT_REGISTERS,
	TX_UPDATE  => TX_UPDATE,  
	DAC_UPDATE => DAC_UPDATE,
	RB_EN      => internal_rb_reg_en,
	RB_REG_NUM => internal_rb_reg_num);

--transmitting stuff--
TX_Sender : entity work.TX_DATA_SENDER
Port Map(
	---------------INPUTS-----------------------
	CLK     		 		  => CLK,
   DATA_CLK 			  => internal_data_clk,
	DC_DC_RX 			  => internal_dc_rx,
	DC_ADDR             => DC_ADDR,
	SEND                => SEND,
	XFER_BUSY           => internal_xfer_busy,
	DUMP_BUSY     	     => DUMP_BUSY,
	TRIGGER             => TRIGGER,
	RB_EN               => internal_rb_reg_en,
	RB_REG_NUM          => internal_rb_reg_num,
	RB_REG_VALUE        => RB_REG_VALUE,
	wave_fifo_clk       => wave_fifo_clk,
   wave_fifo_wr_en 	  => wave_fifo_wr_en,
	wave_fifo_data  	  => wave_fifo_data,
	wave_fifo_reset 	  => wave_fifo_reset,
	OOPS_RESET          => OOPS_RESET,
	--------------OUTPUTS-----------------------
	wave_fifo_full      => wave_fifo_full,
	TX_SENDER_BUSY 	  => internal_tx_busy,
	DATA_OUT 			  => internal_data_out,
	TX       			  => internal_tx);

end Behavioral;

