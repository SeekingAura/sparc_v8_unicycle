library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

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
	process(clk, reset, data) begin
			if(reset='1') then
				dataSalida <= (others => '0');
			elsif(rising_edge(clk))then
				if(data<102) then
					dataSalida<=Data;
				end if;
			end if;
	end process;
	dataOut <= dataSalida;
end arq_ProgramCounter;

