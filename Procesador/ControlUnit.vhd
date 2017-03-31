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

--aluOp<="001100";--ORN
--aluOp<="001101";--ANDN

architecture arq_ControlUnit of ControlUnit is
signal op2 : std_logic_vector(2 downto 0) := "000";

begin
	process(op3, op) begin
		op2 <= op3(5 downto 3);
		case(op) is
			when "00" =>
				if(op2="010") then--BRANCH
					aluOp<="001010";
				end if;
				if(op2="100") then--SETHI
					aluOp<="001011";
				end if;
			when "01" =>
				aluOp<="001000";--CALL
			when "10" =>
				if(op3="000000") then--ADD
					aluOp<="000000";
				end if;
				if(op3="000100") then--SUB
					aluOp<="000001";
				end if;
				if(op3="000010") then--OR
					aluOp<="000010";
				end if;
				if(op3="000011") then--XOR
					aluOp<="000011";
				end if;
				if(op3="000111") then--XNOR
					aluOp<="000100";
				end if;
				if(op3="000110") then--ORN
					aluOp<="001100";
				end if;
				if(op3="000101") then--ANDN
					aluOp<="001101";
				end if;
				
				
				
				if(op3="100101") then--SLL
					aluOp<="000101";
				end if;
				if(op3="100110") then--SRL
					aluOp<="000110";
				end if;
				if(op3="100111") then--SRA
					aluOp<="000111";
				end if;
				
				--jump instruction
				if(op3="111000") then--JMPL
					aluOp<="001001";
				end if;
				
				--cc instructions
				if(op3="010001") then--ANDcc
					aluOp<="001100";
				end if;
				if(op3="010010") then--ORcc
					aluOp<="001101";
				end if;
				
				
			--when "11" => null
			
			when others => 
			aluOp <= "111111";
		end case;
	end process;


end arq_ControlUnit;

