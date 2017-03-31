LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Adder_TB IS
END Adder_TB;
 
ARCHITECTURE behavior OF Adder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder
    PORT(
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          op1 => op1,
          op2 => op2,
          result => result
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		op1 <= x"00000001";
		op2 <= x"00000000";
		wait for 20 ns;
		op2 <= result;
      wait for 20 ns;
		op2 <= result;
		wait for 20 ns;
		op2 <= result;
		wait for 20 ns;
		op2 <= result;
		wait for 20 ns;
		op2 <= result;
		wait for 20 ns;
		op2 <= result;
		wait for 20 ns;
		op2 <= result;

      wait;
   end process;

END;
