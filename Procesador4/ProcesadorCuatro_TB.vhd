LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ProcesadorCuatro_TB IS
END ProcesadorCuatro_TB;
 
ARCHITECTURE behavior OF ProcesadorCuatro_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProcesadorCuatro
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         aluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal aluResult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcesadorCuatro PORT MAP (
          clk => clk,
          reset => reset,
          aluResult => aluResult
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
		reset<='1';
      wait for 100 ns;	
		reset<='0';
      

      -- insert stimulus here 

      wait;
   end process;

END;
