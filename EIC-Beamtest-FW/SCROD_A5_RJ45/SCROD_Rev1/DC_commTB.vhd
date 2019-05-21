--------------------------------------------------------------------------------
-- Company: University of Hawaii Instrumentation Development Lab
-- Engineer: Nathan Park
--
-- Create Date:   16:54:47 05/20/2019
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1/DC_commTB.vhd
-- Project Name:  HMB_SCROD
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DC_Comm
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.all;
use work.Eth1000BaseXPkg.all;
use work.GigabitEthPkg.all;
use work.BMD_definitions.all; --need to include BMD_definitions in addition to work.all
use work.UtilityPkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DC_commTB IS
END DC_commTB;
 
ARCHITECTURE behavior OF DC_commTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DC_Comm
    PORT(
         DATA_CLK : IN  std_logic;
         RX : IN  std_logic_vector(3 downto 0);
         TX : OUT  std_logic_vector(3 downto 0);
         DC_CMD : IN  std_logic_vector(31 downto 0);
         CMD_VALID : IN  std_logic_vector(3 downto 0);
         RESP_REQ : IN  std_logic_vector(3 downto 0);
         DC_RESPONSE : OUT  std_logic_vector(31 downto 0);
         RESP_VALID : OUT  std_logic_vector(3 downto 0);
         QB_RST : IN  std_logic_vector(3 downto 0);
         TrigLogicRst : IN  std_logic;
         SERIAL_CLK_LCK : OUT  std_logic_vector(3 downto 0);
         TRIG_LINK_SYNC : OUT  std_logic_vector(3 downto 0);
         Event_Trig : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal DATA_CLK : std_logic := '0';
   signal RX : std_logic_vector(3 downto 0) := (others => '0');
   signal DC_CMD : std_logic_vector(31 downto 0) := (others => '0');
   signal CMD_VALID : std_logic_vector(3 downto 0) := (others => '0');
   signal RESP_REQ : std_logic_vector(3 downto 0) := (others => '0');
   signal QB_RST : std_logic_vector(3 downto 0) := (others => '0');
   signal TrigLogicRst : std_logic := '0';

 	--Outputs
   signal TX : std_logic_vector(3 downto 0);
   signal DC_RESPONSE : std_logic_vector(31 downto 0);
   signal RESP_VALID : std_logic_vector(3 downto 0);
   signal SERIAL_CLK_LCK : std_logic_vector(3 downto 0);
   signal TRIG_LINK_SYNC : std_logic_vector(3 downto 0);
   signal Event_Trig : std_logic;
	
	--dc QBlink signals
	signal rd_req : slv(3 downto 0) := (others =>'0');
	signal SCROD_data : Word32Array(3 downto 0) := (others => (others => '0'));
	signal SCROD_data_valid : slv(3 downto 0) := "0000";
	signal DC_DATA : slv(31 downto 0) := (others => '0');
	signal DC_data_valid : slv(3 downto 0) := "0000";
   signal trgLinkSync1 : slv( 3 downto 0);
	signal serialClkLck1 : slv(3 downto 0);
	-- Clock period definitions
   constant DATA_CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DC_Comm PORT MAP (
          DATA_CLK => DATA_CLK,
          RX => RX,
          TX => TX,
          DC_CMD => DC_CMD,
          CMD_VALID => CMD_VALID,
          RESP_REQ => RESP_REQ,
          DC_RESPONSE => DC_RESPONSE,
          RESP_VALID => RESP_VALID,
          QB_RST => QB_RST,
          TrigLogicRst => TrigLogicRst,
          SERIAL_CLK_LCK => SERIAL_CLK_LCK,
          TRIG_LINK_SYNC => TRIG_LINK_SYNC,
          Event_Trig => Event_Trig
        );
Gen_QBLink : FOR I in 3 downto 0 GENERATE 
DC_Interface : entity work.QBLink                                                     
PORT MAP( 
			 sstClk => DATA_CLK,
			 rst => QB_RST(I),
			 rawSerialOut => TX(I),
			 rawSerialIn => RX(I),
			 localWordIn => DC_DATA, 
			 localWordInValid => DC_DATA_VALID(I),
			 localWordOut => SCROD_data(I),
			 localWordOutValid => SCROD_data_Valid(I),
			 localWordOutReq => rd_req(I),
			 trgLinkSynced => trgLinkSync1(I),
			 serialClkLocked => serialClkLck1(I)
			 );
end GENERATE Gen_QBLink;

   -- Clock process definitions
   DATA_CLK_process :process
   begin
		DATA_CLK <= '0';
		wait for DATA_CLK_period/2;
		DATA_CLK <= '1';
		wait for DATA_CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for DATA_CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
