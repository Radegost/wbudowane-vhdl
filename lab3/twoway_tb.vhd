LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY twoway_tb IS
END twoway_tb;

ARCHITECTURE behavior OF twoway_tb IS

    -- UUT (Unit Under Test)
    COMPONENT twoway
    PORT(
         clk : IN  std_logic;
         q : OUT  STD_LOGIC_VECTOR (7 downto 0)
        );
    END COMPONENT;

   -- input signals
   signal clk : std_logic := '0';

   -- input/output signal
   signal qq : STD_LOGIC_VECTOR (7 downto 0);

   -- set clock period
  -- constant clk_period : time := 20 ns;

BEGIN
	-- instantiate UUT
   uut: twoway PORT MAP (
          clk => clk,
          q   => qq
        );

   -- clock management process
   -- no sensitivity list, but uses 'wait'
   clk_process :PROCESS
   BEGIN
		clk <= '0';
		WAIT FOR clk_period/2;
		clk <= '1';
		WAIT FOR clk_period/2;
   END PROCESS;
END;
