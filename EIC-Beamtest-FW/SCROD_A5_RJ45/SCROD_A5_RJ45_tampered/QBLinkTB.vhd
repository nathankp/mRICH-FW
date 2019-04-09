-- TestBench Template 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.UtilityPkg.all;
library UNISIM;
use UNISIM.VComponents.all;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT QBLink
          PORT(
              -- master clock
					sstClk              : in  sl; --sl is shorthand for std_logic 
				  -- Async reset signal (synced in module)
					rst                 : in  sl;
			
				  -- Serial link - outgoing
					rawSerialOut        : out sl;
				  -- Serial link - incoming
					rawSerialIn         : in  sl;

				  -- Word-wise data in
					localWordIn         : in  slv(31 downto 0) := (others => '0'); -- slv is shorthand for std_logic_vector
				   localWordInValid    : in  sl;
				  -- Word-wise data out
					localWordOut        : out slv(31 downto 0);
					localWordOutValid   : out sl;
					localWordOutReq     : in sl;  -- Word Read Enable
		
				  -- Status bits out
					trgLinkSynced     : out sl;
					serialClkLocked   : out sl
                  );
          END COMPONENT;

          SIGNAL sstClk :  std_logic;
          SIGNAL rst    :  std_logic;
			 SIGNAL rawSerialIn : std_logic;
			 SIGNAL rawSerialOut : std_logic;
			 SIGNAL localWordIn : std_logic_vector(31 downto 0); 
			 SIGNAL localWordInValid : std_logic;
			 SIGNAL localWordOut	: std_logic_vector(31 downto 0); 
			 SIGNAL localWordOutValid : std_logic;
			 SIGNAL localWordOutReq : std_logic;
			 SIGNAL trgLinkSynced : std_logic;
			 SIGNAL serialClkLocked : std_logic;
			 
         
  BEGIN

  -- Component Instantiation
          uut: QBLink PORT MAP(
                  sstClk => sstClk,
                  rst => rst,
						rawSerialOut => rawSerialOut,
						rawSerialIn => rawSerialIn,
						localWordIn => localWordIn,
						localWordOut => localWordOut,
						localWordOutValid => localWordOutValid,
						localWordOutReq => localWordOutReq,
						trgLinkSynced => trgLinkSynced,
						serialClkLocked => serialClkLocked
						);


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
