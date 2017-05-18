library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUXPC is
	Port ( 
		callPc : in  STD_LOGIC_VECTOR (31 downto 0);
		branch : in  STD_LOGIC_VECTOR (31 downto 0);
		nextPc : in  STD_LOGIC_VECTOR (31 downto 0);
		jumpL : in  STD_LOGIC_VECTOR (31 downto 0);
		pcSc : in  STD_LOGIC_VECTOR (1 downto 0);
		newPc : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end MUXPC;

architecture arq_MUXPC of MUXPC is
signal newPc_Aux : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
begin
	process(callPc, branch, nextPc, jumpL, pcSc) begin
		case(pcSc) is
			when "01" =>
				newPc <= callPc;
			when "10" =>
				newPc <= branch;
			when "00" =>
				newPc <= nextPc;
			when "11" =>
				newPc <= jumpL;
			when others =>
				newPc <= nextPc;
		end case;
	
	
	end process;

	--newPc <= newPc_Aux;
end arq_MUXPC;

