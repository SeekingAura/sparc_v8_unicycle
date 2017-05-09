library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX13B is
	Port ( 
		crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
		imm13 : in  STD_LOGIC_VECTOR (31 downto 0);
		iSc : in  STD_LOGIC;
		value : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end MUX13B;

architecture arq_MUX13B of MUX13B is
signal output : std_logic_vector (31 downto 0):= x"00000000";
begin
	process(crS2, imm13, iSc) begin
		if(isc='0') then
			value <= crS2;
		elsif(isc='1') then
			value <= imm13;
		end if;
	end process;
--value <= output;
end arq_MUX13B;

