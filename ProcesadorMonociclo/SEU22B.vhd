
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SEU22B is
	Port ( 
		imm22 : in  STD_LOGIC_VECTOR (21 downto 0);
		imm32 : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end SEU22B;

architecture arq_SEU22B of SEU22B is

signal imm32Result : std_logic_vector(31 downto 0) := x"00000000";
begin
	process(imm22) begin
		if(imm22(21)='1') then
			imm32Result <= x"FFFFFFFF";
		else
			imm32Result <= x"00000000";
		end if;
		imm32Result(21 downto 0) <=imm22;
	end process;
imm32 <= imm32Result;


end arq_SEU22B;

