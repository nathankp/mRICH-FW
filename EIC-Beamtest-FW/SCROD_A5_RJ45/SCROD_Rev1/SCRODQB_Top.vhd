----------------------------------------------------------------------------------
-- Company: University of Hawaii HEPG Instrumentation Development Lab
-- Engineer: Nathan Park
-- 
-- Create Date:    17:50:11 11/21/2018 
-- Design Name:    HMB SCROD with QBLink (stage 1)
-- Module Name:    SCRODQB_Top - Behavioral 
-- Project Name:   HMB Tracking Plane Readout SCROD
-- Target Devices: Spartan6 
-- Tool versions:  14.1

-- Description:    Barebones SCROD FW implementing QBLink to allow communcation with DC. 
--                 Tests QBLink communcation between SCROD and a HODOSCOPE DC: 
--						    SCROD writes to an internal register on the DC through QBLink. That internal register is readback
--  					    to the SCROD. If the data recieved by the SCROD matches the intended register value, then the SCROD and DC 
--                    are communicating properly.
--                 If this test is successful, a fuller version of the SCROD will be built upon this FW

-- Dependencies: HODOSCOPE DC with QBLink (HMB_DC_QBTOP) 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
-- Last Update on 12/31/2018
----------------------------------------------------------------------------------
Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
Library UNISIM;
use UNISIM.vcomponents.all;
use work.all;
use work.Eth1000BaseXPkg.all;
use work.GigabitEthPkg.all;
use work.BMD_definitions.all; --need to include BMD_definitions in addition to work.all
use work.UtilityPkg.all;

entity SCRODQB_Top is
	generic (
		REG_ADDR_BITS_G : integer := 16;
		REG_DATA_BITS_G : integer := 16;
		NUM_IP_G : integer := 2;
		GATE_DELAY_G : time := 1 ns --gate delay from ExampleProject
		);
	Port(		
			--Will use 125 MHz clock output from s6 Ethernet module as system clock
--			MASTER_CLK_P    : IN STD_LOGIC; --input clock either 127MHz form osc or remote clock form, (try supply with VIO or function gen) 
--			MASTER_CLK_N 	 : IN STD_LOGIC; 
			--fiber signals
			 -- Direct GT connections
			gtTxP        	 : OUT sl;
			gtTxN        	 : OUT sl;
			gtRxP        	 :  IN sl;
			gtRxN        	 :  IN sl;
			gtClkP       	 :  IN sl;
			gtClkN       	 :  IN sl;
			--SFP transceiver disable pin
			txDisable    	 : out sl;
			--DC communication
			RX_DC_P			 : IN STD_LOGIC; --SERIAL INPUT FROM DC
			RX_DC_N			 : IN STD_LOGIC; --SERIAL INPUT FROM DC
			CLK_DC_P			 : OUT STD_LOGIC; --25MHz clock to DC (fact check)--> {confirmed}
			CLK_DC_N			 : OUT STD_LOGIC;
			TX_DC_N         : OUT STD_LOGIC; --Serial output to DC
			TX_DC_P			 : OUT STD_LOGIC; --Serial output to DC 
			SYNC_P			 : OUT STD_LOGIC; -- when '0' DC listens only, '1' DC reads back command
			SYNC_N			 : OUT STD_LOGIC
	);
end SCRODQB_Top;

architecture Behavioral of SCRODQB_Top is
--PC communcation signals---
signal ethSync      : sl;
	signal ethReady     : sl;
	signal led          : slv(15 downto 0);

   signal fabClk       : sl := '0';
   signal ethClk62     : sl;
   signal ethClk125    : sl; 

   signal userRst     : sl;

   signal ethRxLinkSync  : sl;
   signal ethAutoNegDone : sl;

	signal ethCoreMacAddr : MacAddrType := MAC_ADDR_DEFAULT_C;
   signal ethCoreIpAddr  : IpAddrType  := IP_ADDR_DEFAULT_C;
   signal ethCoreIpAddr1 : IpAddrType  := (3 => x"C0", 2 => x"A8", 1 => x"01", 0 => x"21");
--User data interfaces ---
	signal userTxDataChannels : Word32Array(NUM_IP_G-1 downto 0);
   signal userTxDataValids   : slv(NUM_IP_G-1 downto 0);
   signal userTxDataLasts    : slv(NUM_IP_G-1 downto 0);
   signal userTxDataReadys   : slv(NUM_IP_G-1 downto 0);
   signal userRxDataChannels : Word32Array(NUM_IP_G-1 downto 0);
   signal userRxDataValids   : slv(NUM_IP_G-1 downto 0);
   signal userRxDataLasts    : slv(NUM_IP_G-1 downto 0);
   signal userRxDataReadys   : slv(NUM_IP_G-1 downto 0);

   -- Register control interfaces
   signal regAddr     : slv(REG_ADDR_BITS_G-1 downto 0);
   signal regWrData   : slv(REG_DATA_BITS_G-1 downto 0);
   signal regRdData   : slv(REG_DATA_BITS_G-1 downto 0);
   signal regReq      : sl;
   signal regOp       : sl;
   signal regAck      : sl;
	signal CtrlRegister : GPR;
	

---QBLink signals----
	signal dc_clk : sl; --outgoing Daughtercard clock
	signal QBstart_wr : sl; --internal flag to start transmission
	signal QBstart_rd : sl; --internal flag to prepare for readback
	signal reset : sl; -- SCROD reset (not yet implemented)
	signal trigLinkSynced : sl; --QBLink status flag: trigger link synced between SCROD and DC 
	signal serialClkLocked : sl; --QBlink status flag: SCROD and DC data clocks are synced (established before trigger link)
	signal dc_cmd		 : slv(31 downto 0); --DC register command, input data to QBLink write-operation input FIFO
	signal dc_cmd_valid : sl; --enable write to write-op input FIFO
	signal QBrst		 : sl := '0'; --QBLink reset 
	signal rd_req		 : sl; --QBLink readout-op enable 
	signal dc_cmdResp  : slv(31 downto 0);
	signal dc_RespValid : sl; -- QBLink output: readout valid flag 
	signal tx_dc		 : sl; --transmitted serial data bit 
	signal rx_dc		 : sl; --recieved serial data bit
	TYPE CommStateType IS (IDLE, START_WRITE, START_READ); --Communcation statetype
	signal CommState : CommStateType := IDLE; --communcation statemachine(SM) current state
	signal nxtState : CommStateType := IDLE; --communication SM next state
	signal CtrlState : slv(1 DOWNTO 0) := "00"; -- (temporary) communication control SM current state 
	signal nxt_CTRLState : slv(1 DOWNTO 0) := "00"; --(temp) communcation control SM next state
--DCM clock stuff
signal clkfx180 : sl;
signal dcm_locked : sl;
signal progdone : sl;
signal dcm_status : slv(7 downto 0);
signal dcm_rst : sl := '0';
signal internal_fpga_clk : sl; --fast clk 
signal internal_data_clk : sl; -- QBLink timing clock
--HW testing signals--
constant correctData : slv(31 downto 0) := x"DEADBEEF"; --USER: set to register value you want to write to DC 
signal sync : sl := '0'; -- Data capture trigger, real function to be determined
attribute keep_hierarchy: boolean;
attribute keep_hierarchy of Behavioral: architecture is TRUE;

component clk_Div
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic;
  CLK_OUT2          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic;
  LOCKED            : out    std_logic
 );
end component;

begin


--
-----------------------------------------------------------------
----------------I/O Buffers--------------------------------------
-----------------------------------------------------------------

CLK_DIV_inst : clk_Div
PORT MAP( 
CLK_IN1 => ethClk125,
CLK_OUT1 => internal_fpga_clk,
CLK_OUT2 => internal_data_clk,
RESET => dcm_rst,
LOCKED => dcm_locked
);

TX_OBUFDS_inst : OBUFDS --instantiation of OBUFDS buffer: tx_dc is converted to differential output
generic map (IOSTANDARD => "LVDS_25")
port map (
	O  => TX_DC_P,    
	OB => TX_DC_N,  
	I  => tx_dc); 
	
SYNC_OBUFDS_inst : OBUFDS -- sync is converted to differential ouput
generic map ( IOSTANDARD => "LVDS_25")
port map (
	O => SYNC_P,
	OB => SYNC_N,
	I => sync);

DC_CLK_ODDR2 : ODDR2  --use ODDR2 with internal data clk to generate dc_clk
   generic map(
      DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1" 
      INIT => '0', -- Sets initial state of the Q output to '0' or '1'
      SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
   port map (
      Q => dc_clk, -- 1-bit output data
      C0 => internal_data_clk, -- 1-bit clock input
      C1 => not internal_data_clk, -- 1-bit clock input
      CE => '1',  -- 1-bit clock enable input
      D0 => '1',   -- 1-bit data input (associated with C0)
      D1 => '0',   -- 1-bit data input (associated with C1)
      R => '0',    -- 1-bit reset input
      S => '0'     -- 1-bit set input
   );
	
DC_CLK_OBUFDS : OBUFDS --dc_clk buffered with OBUFDS to drive output DC diff pair clk. 
	generic map (IOSTANDARD => "LVDS_25")
	port map (
		O => CLK_DC_P,
		OB => CLK_DC_N,
		I => dc_clk);


RX_DC_IBUF_inst : IBUFDS --differential to single-ended conversion of serial input data
generic map (
	     DIFF_TERM    => FALSE, -- Differential Termination is already on board
	     IOSTANDARD => "LVDS_25" 
	     )
port map (
	O => rx_dc,
	I => RX_DC_P,
	IB => RX_DC_N);	


U_S6EthTop : entity work.S6EthTop
      generic map (
         NUM_IP_G     => 2
      )
      port map (
         -- Direct GT connections
         gtTxP           => gtTxP,
         gtTxN           => gtTxN,
         gtRxP           => gtRxP,
         gtRxN           => gtRxN,
         gtClkP          => gtClkP,
         gtClkN          => gtClkN,
         -- Alternative clock input from fabric
         fabClkIn        => fabClk,
         -- SFP transceiver disable pin
         txDisable       => txDisable,
         -- Clocks out from Ethernet core
         ethUsrClk62     => ethClk62,
         ethUsrClk125    => ethClk125,
         -- Status and diagnostics out
         ethSync         => ethRxLinkSync,
         ethReady        => ethAutoNegDone,
         led             => led,
         -- Core settings in 
         macAddr         => ethCoreMacAddr,
         ipAddrs         => (0 => ethCoreIpAddr, 1 => ethCoreIpAddr1),
         udpPorts        => (0 => x"07D0",       1 => x"07D1"), --x7D0 = 2000,
         -- User clock inputs
         userClk         => ethClk125,
         userRstIn       => '0',
         userRstOut      => userRst,
         -- User data interfaces
         userTxData      => userTxDataChannels,
         userTxDataValid => userTxDataValids,
         userTxDataLast  => userTxDataLasts,
         userTxDataReady => userTxDataReadys,
         userRxData      => userRxDataChannels,
         userRxDataValid => userRxDataValids,
         userRxDataLast  => userRxDataLasts,
         userRxDataReady => userRxDataReadys
      );
		
	U_CommandInterpreter : entity work.CommandInterpreter
      generic map (
         REG_ADDR_BITS_G => 16,
         REG_DATA_BITS_G => 16,
         GATE_DELAY_G    => GATE_DELAY_G
      )
      port map ( 
         -- User clock and reset
         usrClk      => ethClk125,
			dataClk     => internal_data_clk,
         usrRst      => userRst,
         -- Incoming data
         rxData      => userRxDataChannels(1),
         rxDataValid => userRxDataValids(1),
         rxDataLast  => userRxDataLasts(1),
         rxDataReady => userRxDataReadys(1),
         -- Outgoing response
         txData      => userTxDataChannels(1),
         txDataValid => userTxDataValids(1),
         txDataLast  => userTxDataLasts(1),
         txDataReady => userTxDataReadys(1),
         -- This board ID
         myId        => x"0000",
			--DC Comm signals
				--WILL ADD: QB_rst
			serialClkLck => serialClkLocked,
			trigLinkSync => trigLinkSynced,
			DC_CMD 		 => dc_cmd,
			QB_WrEn      => QBstart_wr,
			QB_RdEn      => QBstart_rd,
			DC_RESP		 => dc_cmdResp,
			DC_RESP_VALID => dc_RespValid,
         -- Register interfaces
         regAddr     => regAddr,
         regWrData   => regWrData,
         regRdData   => regRdData,
         regReq      => regReq,
         regOp       => regOp,
         regAck      => regAck
      );


-----------------------------------------------------------------------------
------------------QBLink Module----------------------------------------------
--------------------------------- -------------------------------------------
DC_communication : entity work.DC_Comm
port map (
	DATA_CLK => internal_data_clk,
   RX => rx_dc,
	TX => tx_dc,
	SYNC => sync,
	DC_CMD => dc_cmd,
	CMD_VALID => QBstart_wr,
	RESP_REQ => QBstart_rd,
	DC_RESPONSE => dc_cmdResp,
	--to be added: WAVE_WD : out STD_LOGIC_VECTOR(31 downto 0);
	--             and WaveValid
	--to be added: TRIG : STD_LOGIC_VECTOR(31 downto 0);
	--            and TrigValid
	RESP_VALID => dc_RespValid, 
	QB_RST => QBrst,
	SERIAL_CLK_LCK => serialClkLocked,
	TRIG_LINK_SYNC => trigLinkSynced
	);

  QBRst_process: process(internal_data_clk, trigLinkSynced) 
  variable counter : integer range 0 to 20 :=0;
  begin
	If trigLinkSynced = '0' and counter < 20 then
	   QBrst <= '0';
		If rising_edge(internal_data_clk) then
			counter := counter + 1;
		end if;
	elsif trigLinkSynced = '0' and counter = 20 then
		counter := 0;
		QBrst <= '1';
	elsif QBrst = '1' and counter < 20 then
		counter := counter + 1;
		QBrst <= '1';
	else
		QBrst <= '0';
		counter := 0;
	end if;
	end process;

  SCROD_Ctrl_Reg: process(internal_fpga_clk) begin
      if rising_edge(internal_fpga_clk) then
         if userRst = '1' then
            regAck    <= '0';
            regRdData <= (others => '0');
         elsif regReq = '1' then
            regAck <= regReq;
				if regOp = '1' then
					CtrlRegister(to_integer(unsigned(regAddr))) <= regWrData;
				else 
					regRdData <= CtrlRegister(to_integer(unsigned(regAddr)));
				 end if;
         else
            regAck <= '0';
         end if;
      end if;
   end process;
END Behavioral;  

--signal tx_udp_data : slv(7 downto 0) :=(others => '0');
--signal tx_udp_valid : STD_LOGIC := '0';
--signal tx_udp_ready : STD_LOGIC := '0';
--signal rx_udp_data : slv(7 downto 0);
--signal rx_udp_valid : STD_LOGIC := '0';
--CLK_FANOUT_1TO2 : entity work.CLK_FANOUT --generates fpga fast clcok and slow data clock (single-ended clocks)
--  port map
--   (-- Clock in ports: differntial external clk inputs 
--    CLK_IN1_P => MASTER_CLK_P, 
--    CLK_IN1_N => MASTER_CLK_N,
--    -- Clock out ports
--    CLK_OUT1 => internal_fpga_clk,--125MHz
--    CLK_OUT2 => internal_data_clk --25 MHz
--	 );	 
	 

----------------------------------------------------------------------------	
------------------Ethernet Module-------------------------------------------
----------------------------------------------------------------------------
--ETH_MODULE: entity work.eth_top PORT MAP(
--      ext_user_clk   => internal_fpga_clk,
--		--data to be sent to PC--
--	   tx_udp_data    => tx_udp_data,  
--		tx_udp_valid   => tx_udp_valid, 
--		tx_udp_ready   => tx_udp_ready,
--		--data from PC--
--	   rx_udp_data    => rx_udp_data,   
--		rx_udp_valid   => rx_udp_valid,
--		rx_udp_ready   => '1',
--		trx_udp_clock	=> udp_usr_clk,
--		--fiber transceiver signals--
--		MGTTXFAULT 		=> MGTTXFAULT,  
--		MGTMOD0 			=> MGTMOD0,
--		MGTLOS 			=> MGTLOS,
--		MGTTXDIS  		=> MGTTXDIS,
--		MGTMOD2 			=> MGTMOD2,
--		MGTMOD1 			=> MGTMOD1,
--		MGTRXP 			=> MGTRXP,
--		MGTRXN 			=> MGTRXN,
--		MGTTXP 			=> MGTTXP,
--		MGTTXN 			=> MGTTXN,
--		MGTCLK1P 		=> MGTCLK1P,
--		MGTCLK1N 		=> MGTCLK1N   );
----------------------------------------------------------------------------
----------------OLD PC command Processing center--------------------------------
----------------------------------------------------------------------------
--cmd_interpreter : entity work.cmd_center
--PORT MAP(
--			RX_UDP_DATA => rx_udp_data,
--			RX_UDP_VALID => rx_udp_valid,
--			UDP_CLK => udp_usr_clk,
--			TX_UDP_READY => tx_udp_ready,
--			DATA_CLK => internal_data_clk,
--			CLK => internal_fpga_clk,
--			TOP_BOT => OUTPUT_REGISTER(1)(0),
--			CONTROL_REG => OUTPUT_REGISTER,
--			COMMAND => dc_cmd,
--			QB_RDOUT => QBstart_rd,
--			QB_SEND => QBstart_wr,
--			TX_UDP_VALID => tx_udp_valid,
--			TX_UDP_DATA => tx_udp_data
--			);
			
--COMM_SM : PROCESS(internal_data_clk, CommState, QBstart_wr, QBstart_rd, dc_data) --Communication statemachine that controls QBLink 
--BEGIN
-- --Sequential Process
-- IF (rising_edge(internal_data_clk)) THEN		
--	CommState <= nxtState;
-- END IF;
-- --Combinatorial Process
-- CASE CommState IS
--	WHEN IDLE =>
--		dc_cmd_valid <= '0'; --disable write to write-op FIFO
--		rd_req <= '0'; --disable readout 
--		IF (QBstart_wr = '1') THEN 
--			sync <= '0'; -- put DC in listening mode (DC recieves data, does not readback)
--			nxtState <= START_WRITE; 
--		ELSIF (QBstart_rd = '1') THEN
--			sync <= '1'; --trigger DC to readback register: Once DC register is written to, DC will start readingback
--			nxtState <= START_READ;
--		END IF;
--	WHEN START_WRITE =>
--		dc_cmd_valid <= '1'; --latch in DC command 
--		nxtState <= IDLE; --go to wait state
--	WHEN START_READ =>
--		rd_req <= '1'; --request readout of recieved data
--		IF(dc_data = correctData) THEN --wait until dc_data is same as register value that was sent
--				nxtState <= IDLE; --go to IDLE after successful readout
--		ELSE
--				nxtState <= START_READ; 
--		END IF;
--	END CASE;
--END PROCESS;

----- SCROD CONTROL STATE MACHINE: (12/27/2018) Replaces async inputs by automatically sequencing through control signaling-----
--CTRL_SM : PROCESS(CtrlState, internal_data_clk, trgLinkSync, dc_data)
--BEGIN 
--   IF (rising_edge(internal_data_clk)) THEN
--		CTRLState <= nxt_CTRLState;
--	END IF;
--	
--	CASE CtrlState IS
--		WHEN "00" => -- SCROD-DC communication on hold during QBLink training
--			QBstart_wr <= '0';
--			QBstart_rd <= '0';
--			IF(trgLinkSync = '1') THEN --after DC trigger link (and clock) are synced are synced with SCROD
--				nxt_CTRLState <= "01"; 
--		   END IF;
--		WHEN "01" =>  -- initiate command send
--			QBstart_wr <= '1'; --SCROD in transmission mode  
--			QBstart_rd <= '0'; --SCROD readback mode off
--		   nxt_CTRLState <= "10";
--		
--		WHEN "10" => 	--initiate readback
--			QBstart_wr <= '0'; --SCROD transmission mode off
--			QBstart_rd <= '1'; --SCROD in readback mode
--			IF (dc_data = correctData) THEN --Until dc_data equals original command, stay in read state.
--				nxt_CtrlState <= "11";
--			END IF;
--		WHEN Others => --permanent IDLE state, requires reset of the board to leave (temperary)
--			QBstart_wr <= '0';
--			QBstart_rd <= '0';
--			--Suggestion: add a reset input later to allow reset of the sequence w/o having to reprogram. 
--	END CASE;
--END PROCESS;
