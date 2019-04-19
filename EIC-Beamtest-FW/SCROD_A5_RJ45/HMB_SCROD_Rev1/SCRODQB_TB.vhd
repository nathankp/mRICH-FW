--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:33:18 12/02/2018
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_QBLinkProto/SCRODQB_TB.vhd
-- Project Name:  SCROD_QBLinkProto
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SCRODQB_Top
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
use ieee.std_logic_arith.all;
Library UNISIM;
use UNISIM.vcomponents.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SCRODQB_TB IS
END SCRODQB_TB;
 
ARCHITECTURE behavior OF SCRODQB_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SCRODQB_Top
    PORT(
			MASTER_CLK_P    : IN STD_LOGIC; --input clock either 127MHz form osc or remote clock form, (try supply with VIO or function gen) 
			MASTER_CLK_N 	 : IN STD_LOGIC; --(try supply with VIO or function gen)
			RX_DC_P			 : IN STD_LOGIC; --SERIAL INPUT FROM DC
			RX_DC_N			 : IN STD_LOGIC; --SERIAL INPUT FROM DC
			CLK_DC_P			 : OUT STD_LOGIC; --25MHz clock to DC (fact check)--> {confirmed}
			CLK_DC_N			 : OUT STD_LOGIC;
			TX_DC_N         : OUT STD_LOGIC; --Serial output to DC
			TX_DC_P			 : OUT STD_LOGIC; --Serial output to DC 
			SYNC_P			 : OUT STD_LOGIC; -- when '0' DC listens only, '1' DC reads back command
			SYNC_N			 : OUT STD_LOGIC;
			TRGLINK_SYNC	 : OUT STD_LOGIC; --Not the same as SYNC
		   SERIAL_CLK_LCK  : OUT STD_LOGIC --QBLink Status bit
			);
    END COMPONENT;
    
	COMPONENT HMB_DC_QBTOP
	PORT(
		  SYSCLK_P : IN  STD_LOGIC;
        SYSCLK_N : IN  STD_LOGIC;
        TX_P : IN STD_LOGIC;
        TX_N : IN  STD_LOGIC;
		  SYNC_P  : IN STD_LOGIC; -- will use after QBLink comm test.
		  SYNC_N	 : IN STD_LOGIC;
        RX_P : OUT  STD_LOGIC;
        RX_N : OUT  STD_LOGIC);
	END COMPONENT;

   --SCROD Inputs
   signal MASTER_CLK_P : std_logic := '0';
   signal MASTER_CLK_N : std_logic := '0';
   signal RX_DC_P : std_logic := '0';
   signal RX_DC_N : std_logic := '0';
 	--SCROD Outputs
   signal CLK_DC_P : std_logic;
   signal CLK_DC_N : std_logic;
   signal TX_DC_N : std_logic;
   signal TX_DC_P : std_logic;
	signal syncP   : std_logic;
	signal syncN   : std_logic;
   signal TRGLINK_SYNC : std_logic;
   signal SERIAL_CLK_LCK : std_logic;
   -- Clock period definitions
   constant MASTER_CLK_period : time := 7.8740 ns; 
BEGIN
-----------Will use Daughtercard Module as tranining partner-------
--RX_DC_IBUF_inst : IBUFDS
--generic map (
--	     DIFF_TERM    => FALSE, -- Differential Termination is already on board
--	     IOSTANDARD => "LVDS_25" --(!)check compatability 
--	     )
--port map (
--	O => TX_DC,
--	I => TX_DC_P,
--	IB => TX_DC_N);
--	
	-- Instantiate the Unit Under Test (UUT)
   uut: SCRODQB_Top PORT MAP (
          MASTER_CLK_P => MASTER_CLK_P,
          MASTER_CLK_N => MASTER_CLK_N,
          RX_DC_P => RX_DC_P,
          RX_DC_N => RX_DC_N,
          CLK_DC_P => CLK_DC_P,
          CLK_DC_N => CLK_DC_N,
          TX_DC_N => TX_DC_N,
          TX_DC_P => TX_DC_P,
			 SYNC_P => syncP,
			 SYNC_N => syncN,
          TRGLINK_SYNC => TRGLINK_SYNC,
          SERIAL_CLK_LCK => SERIAL_CLK_LCK
        );
	training_DC: HMB_DC_QBTOP PORT MAP (
			 SYSCLK_P => CLK_DC_P,
			 SYSCLK_N => CLK_DC_N,
			 TX_P => TX_DC_P,
			 TX_N => TX_DC_N,
			 SYNC_P => syncP,
			 SYNC_N => syncN,
			 RX_P => RX_DC_P,
			 RX_N => RX_DC_N
			 );

   -- Clock process definitions
   MASTER_CLK_P_process :process
   begin
		MASTER_CLK_P <= '0';
		wait for MASTER_CLK_period/2;
		MASTER_CLK_P <= '1';
		wait for MASTER_CLK_period/2;
   end process;
 
   MASTER_CLK_N_process :process
   begin
		MASTER_CLK_N <= '1';
		wait for MASTER_CLK_period/2;
		MASTER_CLK_N<= '0';
		wait for MASTER_CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for MASTER_CLK_period*10;
--		wait until SERIAL_CLK_LCK = '1';
--		wait until TRGLINK_SYNC = '1';
--      START_SEND <= '1';
--		wait for MASTER_CLK_period*10;
--		START_SEND <= '0';
--		wait for MASTER_CLK_period;
--		START_RD <= '1';
--		wait for MASTER_CLK_period*10;
--		START_RD <= '0';
--      wait;
   end process;

END;
