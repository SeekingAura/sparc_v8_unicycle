library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ProcessorStateRegister_Modifier is
    Port ( aluOp : in  STD_LOGIC_VECTOR (5 downto 0);
           crS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end ProcessorStateRegister_Modifier;

architecture arq_ProcessorStateRegister_Modifier of ProcessorStateRegister_Modifier is
signal nzvc_Aux : STD_LOGIC_VECTOR (3 downto 0) := "0000";


begin
	process(aluOp, crS1, crS2, aluResult) begin
		nzvc_Aux <= "0000";
		if(aluOp="001111") or (aluOp="001110") then
			if(aluResult=x"00000000") then
				nzvc_Aux(2) <= '1';
			else
				nzvc_Aux(2) <= '0';
			end if;
			if(aluResult<x"00000000") then
				nzvc_Aux(3) <= '1';
			else
				nzvc_Aux(3) <= '0';
			end if;
		end if;
		if(aluOp="010001") or (aluOp="010000") then
			nzvc_Aux(0) <= '1';
		else
			nzvc_Aux(0) <= '0';
		end if;
		
	end process;
	nzvc <= nzvc_Aux;
end arq_ProcessorStateRegister_Modifier;

