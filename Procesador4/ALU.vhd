library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.STD_LOGIC_ARITH.ALL;

entity ALU is
	Port ( 
		aluOp : in  STD_LOGIC_VECTOR (5 downto 0);
		crS1 : in  STD_LOGIC_VECTOR (31 downto 0);
		crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
		carry : in  STD_LOGIC;
		aluResult : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end ALU;

architecture arq_ALU of ALU is
--aluOpResult<="000000";--ADD
--aluOpResult<="000001";--SUB
--aluOpResult<="000010";--OR
--aluOpResult<="000011";--XOR
--aluOpResult<="000100";--XNOR

--aluOpResult<="000101";--SLL
--aluOpResult<="000110";--SRL
--aluOpResult<="000111";--SRA

--aluOpResult<="001000";--CALL
--aluOpResult<="001001";--JUMP

--aluOpResult<="001010";--BRANCH
--aluOpResult<="001011";--SETHI

--aluOpResult<="001100";--ORN
--aluOpResult<="001101";--ANDN

--aluOpResult<="001110";--ADDcc
--aluOpResult<="001111";--SUBcc
--aluOpResult<="010000";--ANDcc
--aluOpResult<="010001";--ORcc
--aluOpResult<="010010";--ANDNcc
--aluOpResult<="010011";--ORNcc
--aluOpResult<="010100";--XORcc
--aluOpResult<="010101";--XNORcc

--aluOpResult<="010110";--ADDx
--aluOpResult<="010111";--SUBx

--aluOpResult<="011000";--ADDxcc
--aluOpResult<="011001";--SUBxcc

--aluOpResult<="011010";--SAVE
--aluOpResult<="011011";--RESTORE

--aluOpResult<="011100";--AND

signal AluResultOut : std_logic_vector(31 downto 0) := x"00000000";
begin
	process(crS1, crS2, AluOp, carry) begin
		case(AluOp) is
			when "000000" =>--ADD
				AluResultOut <= crS1+crS2;
			when "001111" =>--ADDcc
				AluResultOut <= crS1+crS2;
			when "010110" =>--ADDx
				AluResultOut <= crS1+crS2+carry;
			when "011000" =>--ADDxcc	
				AluResultOut <= crS1+crS2+carry;
			
			when "000001" =>--SUB
				AluResultOut <= crS1-crS2;
			when "001110" =>--SUBcc
				AluResultOut <= crS1-crS2;
			when "010111" =>--SUBx
				AluResultOut <= crS1-crS2-carry;
			when "011001" =>--SUBxcc
				AluResultOut <= crS1-crS2-carry;


			
			when "000010" =>--OR
				AluResultOut <= crS1 or crS2;
			when "010001" =>--ORcc
				AluResultOut <= crS1 or crS2;
			
			
			when "011100" =>--AND
				AluResultOut <= crS1 and crS2;
			when "010000" =>--ANDcc
				AluResultOut <= crS1 and crS2;
			
			when "000011" =>--XOR
				AluResultOut <= crS1 xor crS2;
			when "010100" =>--XORcc
				AluResultOut <= crS1 xor crS2;
			
			when "000100" =>--XNOR
				AluResultOut <= crS1 xnor crS2;
			when "010101"=>--XNORcc
				AluResultOut <= crS1 xnor crS2;
				
			when "000101" =>--SLL
				AluResultOut <= to_stdlogicvector(to_bitvector(crS1) sll conv_integer(crS2));
			when "000110" =>--SRL
				AluResultOut <= to_stdlogicvector(to_bitvector(crS1) srl conv_integer(crS2));
			when "000111" =>--SRA
				AluResultOut <= to_stdlogicvector(to_bitvector(crS1) sra conv_integer(crS2));
				
			when "001100" =>--ORN
				AluResultOut <= crS1 or not(crS2);
			when "010011" =>--ORNcc
				AluResultOut <= crS1 or not(crS2);
				
			when "001101" =>--ANDN
				AluResultOut <= crS1 and not(crS2);
			when "010010" =>--ANDNcc
				AluResultOut <= crS1 and not(crS2);
			
			when "011010" =>--SAVE
				AluResultOut <= crS1 + crS2;
			when "011011" =>--RESTORE
				AluResultOut <= crS1 + crS2;
			when others => AluResultOut<= x"00000000";
		end case;
	end process;
	AluResult <= AluResultOut;

end arq_ALU;

