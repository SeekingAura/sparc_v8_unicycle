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

--aluOp<="000101";--SLL
--aluOp<="000110";--SRL
--aluOp<="000111";--SRA

--aluOp<="001000";--CALL
--aluOp<="001001";--JUMP

--aluOp<="001010";--BRANCH
--aluOp<="001011";--SETHI

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
			
			when "000101" =>
				AluResult <= crS1 sll crS2;
			when "000110" =>
				AluResult <= crS1 srl crS2;
			when "000111" =>
				AluResult <= crS1 sra crS2;
			--when "001001"	 =>
			--	AluResult <= crS1 srl crS2;
				
			when others => null;
		end case;
	end process;

end arq_ALU;

