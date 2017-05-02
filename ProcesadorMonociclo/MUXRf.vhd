
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MUXRf is
	Port ( 
		dataMem : in  STD_LOGIC_VECTOR (31 downto 0);
		aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
		Pc : in  STD_LOGIC_VECTOR (31 downto 0);
		rfSource : in  STD_LOGIC_VECTOR (1 downto 0);
		dataRf : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end MUXRf;

architecture arq_MUXRf of MUXRf is

begin


end arq_MUXRf;

