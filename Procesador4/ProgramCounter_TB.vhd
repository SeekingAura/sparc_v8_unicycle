LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ProgramCounter_TB IS
END ProgramCounter_TB;
 
ARCHITECTURE behavior OF ProgramCounter_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProgramCounter
    PORT(
         clk : IN  std_logic;
         data : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal data : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          clk => clk,
          data => data,
          reset => reset,
          dataOut => dataOut
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
      wait for 100 ns;	
		data <= x"00000000";
		wait for 20 ns;
      
		data <= x"00000001";
		wait for 20 ns;
		
		data <= x"00000002";
		wait for 20 ns;
		
		data <= x"00000003";
		wait for 1 ns;
		reset <= '1';
		wait for 1 ns;
		reset <= '0';
		wait for 18 ns;
		data <= x"00000002";
		
		
      wait;
   end process;

END;
