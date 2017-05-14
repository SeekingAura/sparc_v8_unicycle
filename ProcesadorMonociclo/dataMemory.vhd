library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;



entity dataMemory is
	Port ( 
		cRD : in  STD_LOGIC_VECTOR (31 downto 0);
		aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
		WriteMemoryEnable : in  STD_LOGIC;
		reset : in std_logic;
		dataMem : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end dataMemory;

architecture arq_dataMemory of dataMemory is

type array32 is array (0 to 519) of std_logic_vector (31 downto 0);
signal valueArray32 : array32 := (others => x"00000000");--caso procesador 2
signal dataMem_Aux : std_Logic_Vector (31 downto 0) := x"00000000";
begin
	process(cRD, aluResult, WriteMemoryEnable, reset) begin
		if(reset='1') then
			valueArray32 <= (others => x"00000000");
		end if;
		if(WriteMemoryEnable='1' and reset='0') then
			valueArray32(conv_integer(aluResult))<=cRD;
		end if;
		
		dataMem_Aux<=valueArray32(conv_integer(aluResult));
	end process;

	dataMem<= dataMem_Aux;
end arq_dataMemory;

