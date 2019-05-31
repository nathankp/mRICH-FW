--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:35:06 04/16/2019
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1/cmdInerpreter_TB.vhd
-- Project Name:  HMB_SCROD
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CommandInterpreter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
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

 
ENTITY cmdInerpreter_TB IS
END cmdInerpreter_TB;
 
ARCHITECTURE behavior OF cmdInerpreter_TB IS 
   --Inputs
   signal usrClk : std_logic := '0';
   signal dataClk : std_logic := '0';
   signal usrRst : std_logic := '0';
   signal rxData : std_logic_vector(31 downto 0) := (others => '0');
   signal rxDataValid : std_logic := '0';
   signal rxDataLast : std_logic := '0';
   signal txDataReady : std_logic := '0';
   signal serialClkLck : std_logic_vector(3 downto 0):= (others =>'0');
   signal trigLinkSync : std_logic_vector(3 downto 0):= (others =>'0');
   signal DC_RESP : std_logic_vector(31 downto 0) := (others => '0');
   signal DC_RESP_VALID :std_logic_vector(3 downto 0):= (others =>'0');
   signal regRdData : std_logic_vector(15 downto 0) := (others => '0');
   signal regAck : std_logic := '0';
	signal evntFlag : std_logic := '0';
 	--Outputs
   signal rxDataReady : std_logic;
   signal txData : std_logic_vector(31 downto 0);
   signal txDataValid : std_logic;
   signal txDataLast : std_logic;
   signal DC_CMD : std_logic_vector(31 downto 0) := (others => '0');
   signal QB_WrEn : std_logic_vector(3 downto 0) := (others => '0');
   signal QB_RdEn : std_logic_vector(3 downto 0):= (others => '0');
   signal regAddr : std_logic_vector(15 downto 0):=(others => '0');
   signal regWrData : std_logic_vector(15 downto 0):=(others => '0');
   signal regReq : std_logic;
   signal regOp : std_logic;

	signal CtrlRegister : GPR := (others => (others => '0'));
	signal QB_RST : std_logic_vector(3 downto 0):=(others => '0');
   -- Clock period definitions
   constant usrClk_period : time := 8 ns;
   constant dataClk_period : time := 40 ns;
	
	------------DC_COMM SIGNALS----------------
	
   --Inputs
   signal RX : std_logic_vector(3 downto 0) := (others=>'0');
	signal TrigLogicRst : std_logic := '0';
 	--Outputs
   signal TX : std_logic_vector(3 downto 0) := (others => '0');
   signal SYNC : std_logic;

	-----------IO Buff signals---------------
	signal global_event : std_logic_vector(3 downto 0) := (others => '0');
	signal GLOBAL_EVENT_P : std_logic_vector(3 downto 0) := (others => '0');
	signal GLOBAL_EVENT_N : std_logic_vector(3 downto 0) := (others => '1');
	signal TX_P : std_logic_vector(3 downto 0) := (others=>'0');
	signal TX_N : std_logic_vector(3 downto 0) := (others=>'1');
	signal RX_P : std_logic_vector(3 downto 0) := (others=>'0');
	signal RX_N : std_logic_vector(3 downto 0) := (others=>'1');
	signal DC_CLK_P : std_logic_vector(3 downto 0) := (others=>'0');
	signal DC_CLK_N : std_logic_vector(3 downto 0) := (others=>'1');
	signal SYNC_P : std_logic_vector(3 downto 0) := (others=>'0');
	signal SYNC_N : std_logic_vector(3 downto 0) := (others=>'1');
	
	---------------DC signals-----------------------
	signal TX_TRIG : word5Array(3 downto 0) := (others => "00000");
	signal SSTIN_P: std_logic_vector(3 downto 0) := (others=>'0');
	signal SSTIN_N : std_logic_vector(3 downto 0) := (others=>'1');
	signal SIN : std_logic_vector(3 downto 0) := (others=>'0');
	signal PCLK : std_logic_vector(3 downto 0) := (others=>'0');
	signal SCLK : std_logic_vector(3 downto 0) := (others=>'0');
	signal SHOUT : std_logic_vector(3 downto 0) := (others=>'0');
BEGIN
	-- Instantiate the Unit Under Test (UUT)

	
   uut: entity work.CommandInterpreter PORT MAP (
          usrClk => usrClk,
          dataClk => dataClk,
          usrRst => usrRst,
          rxData => rxData,
          rxDataValid => rxDataValid,
          rxDataLast => rxDataLast,
          rxDataReady => rxDataReady,
          txData => txData,
          txDataValid => txDataValid,
          txDataLast => txDataLast,
          txDataReady => txDataReady,
          serialClkLck => serialClkLck,
          trigLinkSync => trigLinkSync,
          DC_CMD => DC_CMD,
          QB_WrEn => QB_WrEn,
          QB_RdEn => QB_RdEn,
          DC_RESP => DC_RESP,
			 EVNT_FLAG => evntFlag,
          DC_RESP_VALID => DC_RESP_VALID,
          regAddr => regAddr,
          regWrData => regWrData,
          regRdData => regRdData,
          regReq => regReq,
          regOp => regOp,
          regAck => regAck
        );
		  
		SCROD_QB: entity work.DC_Comm PORT MAP ( --need to update signal types
          DATA_CLK => dataClk,
          RX => RX,
          TX => TX,
          DC_CMD => DC_CMD,
          CMD_VALID => QB_WrEn,
          RESP_REQ => QB_RdEn,
          DC_RESPONSE => DC_RESP,
          RESP_VALID => DC_RESP_VALID,
          Event_Trig => evntFlag,
          QB_RST => QB_RST,
			 TrigLogicRst => TrigLogicRst,
          SERIAL_CLK_LCK => serialClkLck,
          TRIG_LINK_SYNC => trigLinkSync
        );
		  
		  	DC_IO_BUFF : entity work.IO_Buffers
			generic map (num_DC => 3)
			PORT MAP(
				RX_P => RX_P,
				RX_N => RX_N,
				TX => TX,
				GLOB_EVNT => global_event,
				SYNC => SYNC,
				TX_P => TX_P,
				TX_N => TX_N,
				DC_CLK_P => DC_CLK_P,
				DC_CLK_N => DC_CLK_N,
				DATA_CLK => dataClk,
				GLOB_EVNT_P => GLOBAL_EVENT_P,
				GLOB_EVNT_N => GLOBAL_EVENT_N,
				RX => RX,
				SYNC_P => SYNC_P,
				SYNC_N => SYNC_N
			);
		  
		  DC_gen : For I in 3 downto 0 Generate
			DC : entity work.HMB_DC_QBTop
				PORT MAP(
					SYSCLK_P => DC_CLK_P(I),
					SYSCLK_N => DC_CLK_N(I),
					TX_P => TX_P(I),
					TX_N => TX_N(I),
					SYNC_P => SYNC_P(I),
					SYNC_N => SYNC_N(I),
					RX_P => RX_P(I),
					RX_N => RX_N(I),
					TX_TRIG => TX_TRIG(I),
					SSTin_P => SSTin_P(I),
					SSTin_N => SSTin_N(I),
					SHOUT => SHOUT(I),
					SIN => SIN(I),
					PCLK => PCLK(I),
					SCLK => SCLK(I)
					);
					
			end GENERATE DC_gen;	
--	DC_reset : process(dataClk) --uncomment to test DC_reset via SCROD register programming.
--begin 
--	IF rising_edge(dataClk) THEN
--	SYNC  <= CtrlRegister(2)(8);
--		QB_RST <= CtrlRegister(2)(3 downto 0);
--	END IF;
--end process;
   -- Clock process definitions
   usrClk_process :process
   begin
		usrClk <= '0';
		wait for usrClk_period/2;
		usrClk <= '1';
		wait for usrClk_period/2;
   end process;
 
   dataClk_process :process
   begin
		dataClk <= '0';
		wait for dataClk_period/2;
		dataClk <= '1';
		wait for dataClk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait until rising_edge(dataClk);
		QB_RST <= (others=>'1'); --not working, this does not effectively reset the QBLink modules, 
		sync <= '1';
      wait for dataClk_period*3;
		sync <= '0';
		QB_RST <= (others=>'0');
		wait until trigLinkSync= "1111"; --takes 53.66 us to sync  
	---SCROD Register programming simulation
--    rxDataValid <= '1';

--		wait until rxDataready = '1';
--	   rxData <= x"00BE11E2"; --HEADER (IDLE STATE)
--		rxDataValid <= '1';
--		wait for usrClk_period; 
--		rxData <= x"00000007"; --PACKET SIZE
--		rxDataValid <= '1';
--		wait for usrClk_period;  
--		rxData <= x"646F6974"; --PACKET_TYPE: WORD_COMMAND_C
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"0000A500"; --COMMAND_TARGET: DC
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"00000012"; --Command ID
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"72697465"; --Command Type: WORD_WRITE_C
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"00000002"; --Command Data: keep register 2 cleared, replace with x"010F0002" to reset DCs
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"73787479"; --command 1 Checksum
--		rxDataValid <= '1';
--		txDataReady <= '1';
--		wait for usrClk_period*10;
--		rxDatalast <= '1';
--		wait for usrClk_period*6;
--		wait until rising_edge(usrClk);
--		rxDataLast <= '0';
--		txDataReady <= '0';     

		--Trigger simulation		
		TX_TRIG <= (others => "00001");
      wait;
   end process; 
	
	
  SCROD_Ctrl_Reg: process(usrClk) begin
      if rising_edge(usrClk) then
         if usrRst = '1' then
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
END;
--     wait for usrClk_period*10;
--      rxData <= x"00BE11E2"; --HEADER (IDLE STATE)
--		rxDataValid <= '1';
--		wait for usrClk_period; 
--		rxData <= x"0000000B"; --PACKET SIZE
--	   rxDataValid <= '1';
--		wait for usrClk_period;  
--		rxData <= x"646F6974"; --PACKET_TYPE: WORD_COMMAND_C
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"00A20000"; --COMMAND_TARGET: SCROD
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"00000012"; --Command ID
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"72697465"; --Command Type: WORD_WRITE_C
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"00010001"; --Command Data: Write 1 to register 1
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"726A7478"; --command 1 Checksum
--		rxDataValid <= '1';
--		txDataReady <='1';
--		wait for usrClk_period;
--		wait until rxDataReady ='1';
--		rxData <= x"00000013"; --NEXT COMMAND ID
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"72656164"; --Command Type: READ
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"00000001"; --Command Data: read register 1
--		rxDataValid <= '1';
--		wait for usrClk_period;
--		rxData <= x"72656178"; --command 2 checksum
--		rxDataValid <= '1';
--		wait until txDataLast = '1';
--		rxDataLast <= '1';
--		rxData <= x"00000000"; --packet checksum: doesn't check (empty state) so this is an arbitrary value
--		rxDataValid <= '1';
--		wait for usrClk_period;