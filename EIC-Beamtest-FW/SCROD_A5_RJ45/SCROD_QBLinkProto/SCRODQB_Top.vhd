----------------------------------------------------------------------------------
-- Company: University of Hawaii HEPG Instrumentation Development Lab
-- Engineer: Nathan Park
-- 
-- Create Date:    17:50:11 11/21/2018 
-- Design Name: 
-- Module Name:    SCRODQB_Top - Behavioral 
-- Project Name:   Hawaii Muon Beamline 
-- Target Devices: Spartan6 
-- Tool versions: 
-- Description:    Barebones SCROD FW implementing QBLink to allow communcation 
--                 communication with DC. This module is meant to test functionality of QBLink 
--                 between SCROD and a single DC
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.all;
use work.UtilityPkg.all;

-- excluded libraries used in Khanh's original project: 
--use work.BMD_definitions.all;

entity SCRODQB_Top is
	Port(
			--START_SEND		 : IN STD_LOGIC; -- Chipscope VIO
			--START_RD			 : IN STD_LOGIC; -- Chipscope VIO
			--RESET				 : IN STD_LOGIC; --VIO
			MASTER_CLK_P    : IN STD_LOGIC; --input clock either 127MHz form osc or remote clock form, (try supply with VIO or function gen) 
			MASTER_CLK_N 	 : IN STD_LOGIC; --(try supply with VIO or function gen)
			RX_DC_P			 : IN STD_LOGIC; --SERIAL INPUT FROM DC
			RX_DC_N			 : IN STD_LOGIC; --SERIAL INPUT FROM DC
			DC_status		 : IN STD_LOGIC; -- Write successful = '1', otherwise = '0';
			CLK_DC_P			 : OUT STD_LOGIC; --25MHz clock to DC (fact check)--> {confirmed}
			CLK_DC_N			 : OUT STD_LOGIC;
			TX_DC_N         : OUT STD_LOGIC; --Serial output to DC
			TX_DC_P			 : OUT STD_LOGIC; --Serial output to DC
			DC_mod			 : OUT STD_LOGIC; --dc in listening mode or readback mode (temp for comm test)
			DC_RESET 		 : OUT STD_LOGIC; 
		--	SYNC		: OUT STD_LOGIC; -- will use after QBLink comm test.
			TRGLINK_SYNC	 : OUT STD_LOGIC; --Not the same as SYNC
		   SERIAL_CLK_LCK  : OUT STD_LOGIC --QBLink Status bit
	);
end SCRODQB_Top;

architecture Behavioral of SCRODQB_Top is
signal start_send : STD_LOGIC;
signal start_rd : STD_LOGIC;
signal reset : STD_LOGIC;
signal internal_fpga_clk : STD_LOGIC;
signal internal_data_clk : STD_LOGIC;
signal trgLinkSync : STD_LOGIC;
signal serialClkLck : STD_LOGIC;
signal dcstat : STD_LOGIC := '0';
--signal data_clk		 : STD_LOGIC; --TB shows internal_data_clk is synced with fpga_clk
signal dc_cmd		 : STD_LOGIC_VECTOR(31 downto 0);
signal dc_cmd_valid : STD_LOGIC;
signal qb_rst		 : STD_LOGIC := '0';
signal rd_req		 : STD_LOGIC;
signal dc_data     : STD_LOGIC_VECTOR(31 downto 0);
signal dc_dataValid : STD_LOGIC;
signal tx_dc		 : STD_LOGIC;
--signal sync		 : STD_LOGIC; --sync signal not yet implemented
signal rx_dc		 : STD_LOGIC;
TYPE CommStateType IS (IDLE, START_WRITE, START_READ);
signal CommState : CommStateType := IDLE;
signal nxtState : CommStateType := IDLE;
signal CtrlState : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
begin
TRGLINK_SYNC <= trgLinkSync;
SERIAL_CLK_LCK <= serialClkLck;
-- dcstat <= DC_status; --ERROR: Line 44: Formal <dc_status> has no actual or default value.
CLK_FANOUT_1TO2 : entity work.CLK_FANOUT
  port map
   (-- Clock in ports
	-- differntial external clk inputs 
    CLK_IN1_P => MASTER_CLK_P, 
    CLK_IN1_N => MASTER_CLK_N,
    -- Clock out ports
    CLK_OUT1 => internal_fpga_clk,--125MHz
    CLK_OUT2 => internal_data_clk --25 MHz
	 );	 
---!Issue: sync process creates asymmetrical data_clk duty cycle. ! ?Is syncing neccesary? 	 
--clk_sync: process(internal_fpga_clk) begin
--if (rising_edge(internal_fpga_clk)) then
--	data_clk <= internal_data_clk; --sync data clk with fgpa clk
--end if;
--end process;

-----------------------------------------------------------------
----------------I/O Buffers-----------------------------------
-----------------------------------------------------------------
TX_OBUFDS_inst : OBUFDS --(Nathan)instantiation of OBUFDS buffer
generic map (IOSTANDARD => "LVDS_25")
port map (
	O  => TX_DC_P,    
	OB => TX_DC_N,  
	I  => tx_dc); 

DC_CLK_OBUFDS_inst: OBUFDS 
generic map (IOSTANDARD => "LVDS_25")
port map (
	O => CLK_DC_P,
	OB => CLK_DC_N,
	I  => internal_data_clk);

--SYNC_OBUFDS_inst : OBUFDS --sync signal not yet implemented
--generic map (IOSTANDARD => "LVDS_25")
--port map (
--	O => SYNC_N,
--	OB => SYNC_P,
--	I => sync);

RX_DC_IBUF_inst : IBUFDS
generic map (
	     DIFF_TERM    => FALSE, -- Differential Termination is already on board
	     IOSTANDARD => "LVDS_25" --(!)check compatability 
	     )
port map (
	O => rx_dc,
	I => RX_DC_P,
	IB => RX_DC_N);	
-----------------------------------------------------------------------------
-----------QBLink Module----------------------------------------------
-------------------------------------------------------------------------

comm_process : entity QBLink.QBLink                                                     
PORT MAP( 
			 sstClk => internal_data_clk,
			 rst => QB_rst,
			 rawSerialOut => tx_dc,
			 rawSerialIn => rx_dc,
			 localWordIn => dc_cmd,
			 localWordInValid => dc_cmd_valid,
			 localWordOut => dc_data,
			 localWordOutValid => dc_dataValid,
			 localWordOutReq => rd_req,
			 trgLinkSynced => trgLinkSync,
			 serialClkLocked => serialClkLck
			 );
COMM_clk : PROCESS(RESET, internal_data_clk)
BEGIN
	IF (RESET = '1') THEN 
		qb_rst <= '1';
		Commstate <= IDLE;
	ELSIF (rising_edge(internal_data_clk)) THEN
		CommState <= nxtState;
	END IF;
END PROCESS;
	
COMM_SM : PROCESS(START_SEND, START_RD, CommState)
BEGIN
 CASE CommState IS
	WHEN IDLE =>
		DC_RESET <= '1';
		dc_cmd_valid <= '0';
		rd_req <= '0';
		dc_cmd <= (others => '0');
		IF (START_SEND = '1') THEN
		   DC_RESET <= '0'; 
			DC_mod <= '0'; --put DC in listening mode
			nxtState <= START_WRITE;
			dc_cmd <= x"DEADBEEF";
		ELSIF (START_RD = '1') THEN
			DC_RESET <= '0';
			DC_mod <= '1'; --put DC in listening mode
			nxtState <= START_READ;
		END IF;
	WHEN START_WRITE =>
		dc_cmd_valid <= '1'; --START WRITE
		nxtState <= IDLE; --go to wait state
	
	WHEN START_READ =>
		rd_req <= '1';
		IF(dc_data = x"DEADBEEF") THEN
				nxtState <= IDLE;
		ELSE
				nxtState <= START_READ;
		END IF;
	END CASE;
END PROCESS;

CTRL_SM : PROCESS(CtrlState)
BEGIN
	CASE CtrlState IS
		WHEN "00" =>
			start_send <= '0';
			start_rd <= '0';
			IF(trgLinkSync = '1') THEN 
				CTRLState <= "01";
		   END IF;
		WHEN "01" =>
			start_send <= '1';
			start_rd <= '0';
			IF(DC_STATUS = '1') THEN
				CtrlState <= "01";
			END IF;
		WHEN "10" => 
			start_send <= '0';
			start_rd <= '1';
			IF (dc_data = x"DEADBEEF") THEN
				CtrlState <= "11";
			END IF;
		WHEN Others =>
			start_send <= '0';
			start_rd <= '0';
	END CASE;
END PROCESS;

END Behavioral;

