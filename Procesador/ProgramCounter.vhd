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
signal dataSalida : std_logic_vector(31 downto 0) := (others => '0');
begin
	process(clk, reset) begin
			if(reset='1') then
				dataSalida <= (others => '0');
			elsif(rising_edge(clk))then
				dataSalida<=Data;
			end if;
	end process;
	dataOut <= dataSalida;
end arq_ProgramCounter;

