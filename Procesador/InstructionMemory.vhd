library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

entity InstructionMemory is
	Port(
		adress : in  STD_LOGIC_VECTOR (31 downto 0);
		reset : in  STD_LOGIC;
		dataOut : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end InstructionMemory;

architecture arq_InstructionMemory of InstructionMemory is
--arreglo de 64

type array64 is array (0 to 63) of std_logic_vector (31 downto 0);
signal valueArray64 : array64 := (others => x"00000000");--generar el arreglo de 64 posiciones en 0 sus filas de 32
--Falta llenar el arreay con algun fichero
begin
	process(adress, reset) begin
		if(reset='1') then
			dataOut <= (others => '0');--entregar data out en todo 0
		end if;
		dataOut<=valueArray64(conv_integer(adress));
	end process;
end arq_InstructionMemory;

