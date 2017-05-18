
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX6B is
	Port ( 
		rd : in  STD_LOGIC_VECTOR (5 downto 0);
		O7 : in  STD_LOGIC_VECTOR (5 downto 0);
		rfDest : in  STD_LOGIC;
		nRd : out  STD_LOGIC_VECTOR (5 downto 0)
	);
end MUX6B;

architecture arq_MUX6B of MUX6B is
signal nRd_Aux : std_logic_vector(5 downto 0) := "000000";

begin

	process(rd, O7, rfDest) begin
		if(rfDest='1') then
			nRd_Aux <= O7;
		else
			nRd_Aux <= rd;
		end if;
	end process;
	
nRd <= nRd_Aux;

end arq_MUX6B;

