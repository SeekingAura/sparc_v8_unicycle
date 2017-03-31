library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU is
	Port(
		crS1 : in  STD_LOGIC_VECTOR (31 downto 0);
		crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
		AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
		AluResult : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end ALU;

architecture arq_ALU of ALU is

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


begin
	process(crS1, crS2, AluOp) begin
		case(AluOp) is
			when "000000" =>--ADD
				AluResult <= crS1+crS2;
			when "000001" =>--SUB
				AluResult <= crS1-crS2;
			
			when "000010" =>--OR
				AluResult <= crS1 or crS2;
			when "000011" =>--XOR
				AluResult <= crS1 xor crS2;
			when "000100" =>
				AluResult <= crS1 xnor crS2;
			
			when "000101" =>--SLL
				AluResult <= crS1 sll crS2;
			when "000110" =>--SRL
				AluResult <= crS1 srl crS2;
			when "000111" =>--SRA
				AluResult <= crS1 sra crS2;
			--when "001001"	 =>
			--	AluResult <= crS1 srl crS2;
			when "001100" =>--ORN
				AluResult <= crS1 or not(crS2);
			when "001101" =>--ANDN
				AluResult <= crS1 and not(crS2);
				
			when others => null;
		end case;
	end process;

end arq_ALU;

