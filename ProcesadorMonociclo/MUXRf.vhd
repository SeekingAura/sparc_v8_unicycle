
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
signal dataRf_Aux : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";	
begin
	process(dataMem, aluResult, Pc, rfSource) begin
		case(rfSource) is
			when "00" =>
				dataRf_Aux <= aluResult;
			when "01" =>
				dataRf_Aux <= Pc;
			when "10" =>
				dataRf_Aux <= dataMem;
			when others =>
				dataRf_Aux <= Pc;
		end case;
	end process;

dataRf <= dataRf_Aux;

end arq_MUXRf;

