library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

entity RegisterFile is
	Port(
		WriteEnable : in std_logic;
		rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
		rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
		rd : in  STD_LOGIC_VECTOR (5 downto 0);
		rst : in  STD_LOGIC;
		dwr : in  STD_LOGIC_VECTOR (31 downto 0);
		cRD : out std_logic_vector (31 downto 0);
		crS1 : out  STD_LOGIC_VECTOR (31 downto 0);
		crS2 : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end RegisterFile;

architecture arq_RegisterFile of RegisterFile is
--rs1, rs2 son instrucciones
type array32 is array (0 to 519) of std_logic_vector (31 downto 0);

signal valueArray32 : array32 := (others => x"00000000");--caso procesador 2
signal crS1Out : std_logic_vector (31 downto 0) := x"00000000";
signal crS2Out : std_logic_vector (31 downto 0) := x"00000000";

begin
	process(rs1, rs2, rd, rst, dwr) begin
		if(rst='1') then
			crS1Out <= (others => '0');
			crS2Out <= (others => '0');
			valueArray32 <= (others => x"00000000");
			--valueArray32 <= (others => x"00000000");
		else --inicializaciones
			if(rd/="00000") then--caso que no sea g0
				valueArray32(conv_integer(rd)) <= dwr; 
			end if;
			crS1Out <= valueArray32(conv_integer(rs1));
			crS2Out <= valueArray32(conv_integer(rs2));
		end if;
	end process;
	
	crS1 <= crS1Out;
	crS2 <= crS2Out;
	
end arq_RegisterFile;

