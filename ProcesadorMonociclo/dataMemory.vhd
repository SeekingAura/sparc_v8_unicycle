
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity dataMemory is
    Port ( cRD : in  STD_LOGIC_VECTOR (31 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           WriteMemoryEnable : in  STD_LOGIC;
           dataMem : out  STD_LOGIC_VECTOR (31 downto 0));
end dataMemory;

architecture arq_dataMemory of dataMemory is

begin


end arq_dataMemory;

