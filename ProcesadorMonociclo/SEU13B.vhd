library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU13B is
	Port (
		imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
		imm32 : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end SEU13B;

architecture arq_SEU13B of SEU13B is
signal imm32Result : std_logic_vector(31 downto 0) := x"00000000";
begin
	process(imm13) begin
		if(imm13(12)='1') then
			imm32Result <= x"FFFFFFFF";
		else
			imm32Result <= x"00000000";
		end if;
		imm32Result(12 downto 0) <=imm13;
	end process;
imm32 <= imm32Result;
end arq_SEU13B;

