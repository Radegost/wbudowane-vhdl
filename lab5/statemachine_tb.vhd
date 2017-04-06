LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- include also the local library for 'str' call
USE work.txt_util.ALL;


ENTITY statemachine_tb IS
END statemachine_tb;

ARCHITECTURE behavior OF statemachine_tb IS
    COMPONENT statemachine
    PORT(
         clk : IN  std_logic;
         pusher : IN  std_logic;
         reset : IN std_logic;
         driver : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';
   signal pusher : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal driver : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: statemachine PORT MAP (
          clk => clk,
          pusher => pusher,
          reset => reset,
          driver => driver
        );

   -- Clock process definitions
   clk_process :process
   begin

		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 10 ns;
      -- print(str(driver));
    assert driver = "00"			-- test what we've got
      report "1.expected state '00' got '" & str(driver) & "'";

    pusher <= '1';
		wait for clk_period * 1;
    assert driver = "10"
		  report "2.expected state '10' got '" & str(driver) & "'";
    wait for clk_period * 1;
    assert driver = "11"
  		report "3.expected state '11' got '" & str(driver) & "'";
    wait for clk_period * 1;
    assert driver = "01"
      report "4.expected state '01' got '" & str(driver) & "'";
    wait for clk_period * 1;
    assert driver = "10"
      report "5.expected state '10' got '" & str(driver) & "'";
    wait for clk_period * 1;
    assert driver = "11"
      report "6.expected state '11' got '" & str(driver) & "'";
    -- zerujemy
    pusher <= '0';
    wait for clk_period * 1;
    assert driver = "00"
      report "7.expected state '00' got '" & str(driver) & "'";
    pusher <= '1';
    wait for clk_period * 1;
    assert driver = "10"
      report "8.expected state '10' got '" & str(driver) & "'";
		wait;
   end process;
END;
