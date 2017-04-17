library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALUProccesor_4 is
    Port ( aluOp : in  STD_LOGIC_VECTOR (5 downto 0);
           crS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           csS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           carry : in  STD_LOGIC_VECTOR (31 downto 0);
           aluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALUProccesor_4;

architecture arq_ALUProccesor_4 of ALUProccesor_4 is
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
--aluOp<="001100";--ORN
signal AluResultOut : std_logic_vector(31 downto 0) := x"00000000";
begin
	process(crS1, crS2, AluOp) begin
		case(AluOp) is
			when "000000" =>--ADD
				AluResultOut <= crS1+crS2;
			when "001111" =>--ADDcc
				AluResultOut <= crS1+crS2;
			
			when "000001" =>--SUB
				AluResultOut <= crS1-crS2;
			when "001110" =>--SUBcc
				AluResultOut <= crS1-crS2;
			when "000010" =>--OR
				AluResultOut <= crS1 or crS2;
			when "000011" =>--XOR
				AluResultOut <= crS1 xor crS2;
			when "000100" =>
				AluResultOut <= crS1 xnor crS2;
			
			--when "000101" =>--SLL
			--	AluResultOut <= crS1 sll crS2;
			--when "000110" =>--SRL
			--	AluResultOut <= crS1 srl crS2;
			--when "000111" =>--SRA
			--	AluResultOut <= crS1 sra crS2;
			--when "001001"	 =>
			--	AluResultOut <= crS1 srl crS2;
			when "001100" =>--ORN
				AluResultOut <= crS1 or not(crS2);
			when "001101" =>--ANDN
				AluResultOut <= crS1 and not(crS2);
				
			when others => AluResultOut<= x"00000000";
		end case;
	end process;
	AluResult <= AluResultOut;

end arq_ALUProccesor_4;

