library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProcessorStateRegister is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
				nCwp : in  STD_LOGIC_VECTOR (4 downto 0);
           carry : out  STD_LOGIC;
			  cwp : out  STD_LOGIC_VECTOR (4 downto 0)
			  );
end ProcessorStateRegister;

architecture arq_ProcessorStateRegister of ProcessorStateRegister is

begin


end arq_ProcessorStateRegister;

