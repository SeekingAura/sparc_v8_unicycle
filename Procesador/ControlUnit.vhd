library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port ( op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           aluOp : out  STD_LOGIC_VECTOR (5 downto 0));
end ControlUnit;

architecture arq_ControlUnit of ControlUnit is

begin
	process(op3, op) begin
		case(op) is
			--when "00" => null
			
			--when "01" => null
			
			--when "10" => null
			
			--when "11" => null
			
			when others => 
			aluOp <= "111111";
		end case;
	end process;


end arq_ControlUnit;

