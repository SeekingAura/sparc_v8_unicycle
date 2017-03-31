library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

entity RegisterFile is
	Port(
		rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
		rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
		rd : in  STD_LOGIC_VECTOR (4 downto 0);
		rst : in  STD_LOGIC;
		dwr : in  STD_LOGIC_VECTOR (31 downto 0);
		crS1 : out  STD_LOGIC_VECTOR (31 downto 0);
		crS2 : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end RegisterFile;

architecture arq_RegisterFile of RegisterFile is
--rs1, rs2 son instrucciones
type array32 is array (0 to 31) of std_logic_vector (31 downto 0);
 

 
 
signal valueArray32 : array32 := (others => x"00000000");


begin
	process(rs1, rs2, rd, rst, dwr) begin
		if(rst='1') then
			crS1 <= (others => '0');
			crS2 <= (others => '0');
		else --inicializaciones
			if(rd/="00000") then--caso que sea g0
				valueArray32(conv_integer(rd)) <= dwr; 
			end if;
			crS1 <= valueArray32(conv_integer(rs1));
			crS2 <= valueArray32(conv_integer(rs2));
		end if;
	end process;
end arq_RegisterFile;

