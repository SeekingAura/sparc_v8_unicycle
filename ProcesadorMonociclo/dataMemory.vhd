
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity dataMemory is
    Port ( cRD : in  STD_LOGIC_VECTOR (31 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           WMemory : in  STD_LOGIC_VECTOR (4 downto 0);
           rdMemory : in  STD_LOGIC_VECTOR (5 downto 0);
           dataMem : out  STD_LOGIC_VECTOR (31 downto 0));
end dataMemory;

architecture arq_dataMemory of dataMemory is

begin


end arq_dataMemory;

