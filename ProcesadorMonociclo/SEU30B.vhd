library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SEU30B is
    Port ( imm30 : in  STD_LOGIC_VECTOR (29 downto 0);
           imm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU30B;

architecture arq_SEU30B of SEU30B is
signal imm32Result : std_logic_vector(31 downto 0) := x"00000000";
begin
	process(imm30) begin
		if(imm30(29)='1') then
			imm32Result <= x"FFFFFFFF";
		else
			imm32Result <= x"00000000";
		end if;
		imm32Result(29 downto 0) <=imm13;
	end process;
imm32 <= imm32Result;


end arq_SEU30B;

