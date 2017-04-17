LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SEU_TB IS
END SEU_TB;
 
ARCHITECTURE behavior OF SEU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         imm13 : IN  std_logic_vector(12 downto 0);
         imm32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal imm32 : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          imm13 => imm13,
          imm32 => imm32
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      imm13 <="0000000000000";
		wait for 20 ns;

		imm13 <="0000000001000";
		wait for 20 ns;
		
		imm13 <="0100000000000";
		wait for 20 ns;
		
		imm13 <="1000000000000";
		wait for 20 ns;
		
		
		imm13 <="0010000000000";
		wait for 20 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
