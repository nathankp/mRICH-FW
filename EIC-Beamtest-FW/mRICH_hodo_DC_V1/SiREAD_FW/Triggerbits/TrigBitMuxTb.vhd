--! TrigBitMuxTb Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  use work.ck_package.all;

  ENTITY TrigBitMuxTb IS
  END TrigBitMuxTb;

  ARCHITECTURE behavior OF TrigBitMuxTb IS 

component TrigBitMux
port (
    sel         : in  STD_LOGIC_VECTOR (4 downto 0);
    chs_hit     : out arr_slv4(14 downto 0);
    num_chs_hit : out integer
);
end component TrigBitMux;

          SIGNAL clk :  std_logic := '0';          
          constant clk_period :  time := 7.87 ns;
          
          signal internal_sel         : STD_LOGIC_VECTOR (4 downto 0) := "00000";
          signal internal_chs_hit     : arr_slv4(14 downto 0) := (others => "1111");
          signal internal_num_chs_hit : integer := 0;


BEGIN

TrigBitMux_i : TrigBitMux
port map (
    sel         => internal_sel,
    chs_hit     => internal_chs_hit,
    num_chs_hit => internal_num_chs_hit
);


  --!  Test Bench Statements
    clk_process : process 
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process clk_process;

    stimProcess : PROCESS
    BEGIN
        wait for 100 ns; --! wait until global set/reset completes
        wait for clk_period;
        internal_sel <= "00001";--00011
        wait for clk_period;
        internal_sel <= "00000";
        wait for clk_period;
        internal_sel <= "00010";--10011
        wait for clk_period;
        internal_sel <= "00000";
        wait for clk_period;
        internal_sel <= "00011";--11100
        wait for clk_period;
        internal_sel <= "00000";
        wait for clk_period;
        internal_sel <= "00100";--11011
		  wait for clk_period;
        internal_sel <= "00000";
		  wait for clk_period;
        internal_sel <= "10000";
		  wait for clk_period;
        internal_sel <= "00000";
        wait for clk_period;
        internal_sel <= "10001";
		  wait for clk_period;
        internal_sel <= "00000";
        wait; --! will wait forever
    END PROCESS stimProcess;
  --!  End Test Bench 

  END;
