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
         START_SEND : IN  std_logic;
         START_RD : IN  std_logic;
         RESET : IN  std_logic;
         MASTER_CLK_P : IN  std_logic;
         MASTER_CLK_N : IN  std_logic;
         RX_DC_P : IN  std_logic;
         RX_DC_N : IN  std_logic;
         CLK_DC_P : OUT  std_logic;
         CLK_DC_N : OUT  std_logic;
         DC_RD_VALID : OUT  std_logic;
         TX_DC_N : OUT  std_logic;
         TX_DC_P : OUT  std_logic;
         DC_ACK : IN  std_logic;
         TRGLINK_SYNC : OUT  std_logic;
         SERIAL_CLK_LCK : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal START_SEND : std_logic := '0';
   signal START_RD : std_logic := '0';
   signal RESET : std_logic := '0';
   signal MASTER_CLK_P : std_logic := '0';
   signal MASTER_CLK_N : std_logic := '0';
   signal RX_DC_P : std_logic := '0';
   signal RX_DC_N : std_logic := '0';
   signal DC_ACK : std_logic := '0';

 	--Outputs
   signal CLK_DC_P : std_logic;
   signal CLK_DC_N : std_logic;
   signal DC_RD_VALID : std_logic;
   signal TX_DC_N : std_logic;
   signal TX_DC_P : std_logic;
   signal TRGLINK_SYNC : std_logic;
   signal SERIAL_CLK_LCK : std_logic;
	
	signal TX_DC : std_logic;
	signal DC_REG :std_logic_vector(31 downto 0) := (others => '0');
	signal count : integer range 0 to 31; 

   -- Clock period definitions
   constant MASTER_CLK_period : time := 7.8740 ns;

 
BEGIN
RX_DC_IBUF_inst : IBUFDS
generic map (
	     DIFF_TERM    => FALSE, -- Differential Termination is already on board
	     IOSTANDARD => "LVDS_25" --(!)check compatability 
	     )
port map (
	O => TX_DC,
	I => TX_DC_P,
	IB => TX_DC_N);
	
	-- Instantiate the Unit Under Test (UUT)
   uut: SCRODQB_Top PORT MAP (
          START_SEND => START_SEND,
          START_RD => START_RD,
          RESET => RESET,
          MASTER_CLK_P => MASTER_CLK_P,
          MASTER_CLK_N => MASTER_CLK_N,
          RX_DC_P => RX_DC_P,
          RX_DC_N => RX_DC_N,
          CLK_DC_P => CLK_DC_P,
          CLK_DC_N => CLK_DC_N,
          DC_RD_VALID => DC_RD_VALID,
          TX_DC_N => TX_DC_N,
          TX_DC_P => TX_DC_P,
          DC_ACK => DC_ACK,
          TRGLINK_SYNC => TRGLINK_SYNC,
          SERIAL_CLK_LCK => SERIAL_CLK_LCK
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

      wait for MASTER_CLK_period*10;

      START_SEND <= '1';
	--	WHILE(count < 32)
	--	IF(DC_REG = X"DEADBEEF") THEN
		--	DC_ACK <= ACK <= '1';
		-- DC

      wait;
   end process;

END;
