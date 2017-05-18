library IEEE;
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

type array64 is array (0 to 101) of std_logic_vector (31 downto 0);

impure function InitRomFromFile (RomFileName : in string) return array64 is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : array64;
		begin
			for I in array64'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
end function;

signal valueArray64 : array64 := InitRomFromFile("instructions.txt");--generar el arreglo de 64 posiciones en 0 sus filas de 32
begin
	process(adress, reset) begin
		if(reset='1') then
			dataout <= (others => '0');--entregar data out en todo 0
		else
			dataout <=valueArray64(conv_integer(adress));
		end if;
	end process;
	
end arq_InstructionMemory;

