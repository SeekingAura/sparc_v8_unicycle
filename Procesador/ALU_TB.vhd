LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         crS1 : IN  std_logic_vector(31 downto 0);
         crS2 : IN  std_logic_vector(31 downto 0);
         AluOp : IN  std_logic_vector(5 downto 0);
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal crS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal crS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal AluOp : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          crS1 => crS1,
          crS2 => crS2,
          AluOp => AluOp,
          AluResult => AluResult
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      --aluOp<="000000";--ADD
		--aluOp<="000001";--SUB

		--aluOp<="000010";--OR
		--aluOp<="000011";--XOR
		--aluOp<="000100";--XNOR

		---aluOp<="000101";--SLL--Esta no es de la entrega
		--aluOp<="000110";--SRL--Esta no es de la entrega
		--aluOp<="000111";--SRA--Esta no es de la entrega

		--aluOp<="001000";--CALL--Esta no es de la entrega
		--aluOp<="001001";--JUMP--Esta no es de la entrega

		--aluOp<="001010";--BRANCH--Esta no es de la entrega
		--aluOp<="001011";--SETHI--Esta no es de la entrega

		--aluOp<="001100";--ORN
		--aluOp<="001101";--ANDN
      wait for 100 ns;	
		crS1 <= x"00000003";
		crS2 <= x"00000005";
		AluOp <= "000000";--ADD
		wait for 20 ns;

		crS1 <= x"00000004";
		crS2 <= x"00000003";
		AluOp <= "000001";--SUB
		wait for 20 ns;
		
		crS1 <= x"00000003";
		crS2 <= x"00000007";
		AluOp <= "000001";--SUB
		wait for 20 ns;
		
		crS1 <= x"00000000";
		crS2 <= x"00000000";
		AluOp <= "000010";--OR
		wait for 20 ns;
		
		crS1 <= x"00000000";
		crS2 <= x"00000000";
		AluOp <= "000011";--XOR
		wait for 20 ns;
		
		crS1 <= x"00000000";
		crS2 <= x"00000000";
		AluOp <= "000100";--XNOR
		wait for 20 ns;
		
		crS1 <= x"00000000";
		crS2 <= x"00000000";
		AluOp <= "001100";--ORN
		wait for 20 ns;
		
		crS1 <= x"00000000";
		crS2 <= x"00000000";
		AluOp <= "001101";--ANDN
		wait for 20 ns;
		
      wait;
   end process;

END;
