library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
	Port(
		clk : in  STD_LOGIC;
		data : in  STD_LOGIC_VECTOR (31 downto 0);
		reset : in  STD_LOGIC;
		dataOut : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end ProgramCounter;

architecture arq_ProgramCounter of ProgramCounter is

begin
	process(clk, reset) begin
			if(reset='1') then
				dataOut <= (others => '0');
			elsif(rising_edge(clk))then
				dataOut<=Data;
			end if;
	end process;
end arq_ProgramCounter;

