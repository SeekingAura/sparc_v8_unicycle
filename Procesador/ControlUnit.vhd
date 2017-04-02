library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity ControlUnit is
	Port(
		op3 : in  STD_LOGIC_VECTOR (5 downto 0);
		op : in  STD_LOGIC_VECTOR (1 downto 0);
		aluOp : out  STD_LOGIC_VECTOR (5 downto 0)
	);
end ControlUnit;
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

architecture arq_ControlUnit of ControlUnit is
signal op2 : std_logic_vector(2 downto 0) := "000";
signal aluOpResult : std_logic_vector(5 downto 0) := "000000";
begin
	process(op3, op) begin
		op2 <= op3(5 downto 3);
		case(op) is
			when "00" =>
				if(op2="010") then--BRANCH
					aluOpResult<="001010";
				end if;
				if(op2="100") then--SETHI
					aluOpResult<="001011";
				end if;
			when "01" =>
				aluOpResult<="001000";--CALL
			when "10" =>
				if(op3="000000") then--ADD
					aluOpResult<="000000";
				end if;
				if(op3="000100") then--SUB
					aluOpResult<="000001";
				end if;
				if(op3="000010") then--OR
					aluOpResult<="000010";
				end if;
				if(op3="000011") then--XOR
					aluOpResult<="000011";
				end if;
				if(op3="000111") then--XNOR
					aluOpResult<="000100";
				end if;
				if(op3="000110") then--ORN
					aluOpResult<="001100";
				end if;
				if(op3="000101") then--ANDN
					aluOpResult<="001101";
				end if;
				
				
				
				if(op3="100101") then--SLL
					aluOpResult<="000101";
				end if;
				if(op3="100110") then--SRL
					aluOpResult<="000110";
				end if;
				if(op3="100111") then--SRA
					aluOpResult<="000111";
				end if;
				
				--jump instruction
				if(op3="111000") then--JMPL
					aluOpResult<="001001";
				end if;
				
				--cc instructions
				if(op3="010001") then--ANDcc
					aluOpResult<="001100";
				end if;
				if(op3="010010") then--ORcc
					aluOpResult<="001101";
				end if;
				
				
			--when "11" => null
			
			when others => 
			aluOpResult <= "111111";
		end case;
	end process;
aluOp <= aluOpResult;

end arq_ControlUnit;

