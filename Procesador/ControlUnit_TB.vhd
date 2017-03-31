LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ControlUnit_TB IS
END ControlUnit_TB;
 
ARCHITECTURE behavior OF ControlUnit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         op3 : IN  std_logic_vector(5 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         aluOp : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal aluOp : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          op3 => op3,
          op => op,
          aluOp => aluOp
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		--ADD--aluOp<="000000";
		op <= "10";
		op3 <= "000000";
		wait for 20 ns;
		
		--SUB--aluOp<="000001";
		op <= "10";
		op3 <= "000100";
		wait for 20 ns;
		
		--OR--aluOp<="000010";
		op <= "10";
		op3 <= "000010";
		wait for 20 ns;
		
		--SLL--aluOp<="000101";
		op <= "10";
		op3 <= "100101";
		wait for 20 ns;
		
		--BRANCH--aluOp<="001010";
		op <= "00";
		op3 <= "010000";
		wait for 20 ns;
		
		--sethi--aluOp<="001011";
		op <= "00";
		op3 <= "100010";
		wait for 20 ns;
		
		
		
		
		
		
		
		
      -- insert stimulus here 

      wait;
   end process;

END;
