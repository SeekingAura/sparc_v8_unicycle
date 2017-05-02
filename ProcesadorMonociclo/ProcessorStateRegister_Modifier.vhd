library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity ProcessorStateRegister_Modifier is
    Port ( 
		aluOp : in  STD_LOGIC_VECTOR (5 downto 0);
		crS1 : in  STD_LOGIC_VECTOR (31 downto 0);
		crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
		aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
		nzvc : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end ProcessorStateRegister_Modifier;

architecture arq_ProcessorStateRegister_Modifier of ProcessorStateRegister_Modifier is
signal nzvc_Aux : STD_LOGIC_VECTOR (3 downto 0) := "0000";

--aluOpResult<="001110";--ADDcc
--aluOpResult<="001111";--SUBcc
--aluOpResult<="010000";--ANDcc
--aluOpResult<="010001";--ORcc
--aluOpResult<="010010";--ANDNcc
--aluOpResult<="010011";--ORNcc
--aluOpResult<="010100";--XORcc
--aluOpResult<="010101";--XNORcc

--aluOpResult<="011000";--ADDxcc
--aluOpResult<="011001";--SUBxcc

begin
	process(aluOp, crS1, crS2, aluResult) begin
		
		if(aluOp="001110" or aluOp="011000") then--ADDcc - ADDxcc
			nzvc_Aux <= "0000";
			if(aluResult(31)='1') then
				nzvc_Aux(3) <= '1';
			end if;
			
			if(aluResult=x"00000000") then
				nzvc_Aux(2) <= '1';
			end if;
			
			if((crS1(31)='1' and crS2(31)='1' and aluResult(31)='0') or (crS1(31)='0' and crS2(31)='0' and aluResult(31)='1')) then
				nzvc_Aux(1) <= '1';
			end if;
			
			if((crS1(31)='1' and crS2(31)='1') or (aluResult(31)='0' and (crS1(31)='1' or crS2(31)='1'))) then
				nzvc_Aux(0) <= '1';
			end if;
			
		end if;
		
		
		if(aluOp="001110" or aluOp="011001") then--SUBcc - SUBxcc
			nzvc_Aux <= "0000";
			if(aluResult(31)='1') then
				nzvc_Aux(3) <= '1';
			end if;
			
			if(aluResult=x"00000000") then
				nzvc_Aux(2) <= '1';
			end if;
			
			if((crS1(31)='1' and crS2(31)='0' and aluResult(31)='0') or (crS1(31)='0' and crS2(31)='1' and aluResult(31)='1')) then
				nzvc_Aux(1) <= '1';
			end if;
			
			if((crS1(31)='0' and crS2(31)='1') or (aluResult(31)='1' and (crS1(31)='0' or crS2(31)='1'))) then
				nzvc_Aux(0) <= '1';
			end if;
			
		end if;

		if(aluOp="010000" or aluOp="010010" or aluOp="010001" or aluOp="010011" or aluOp="010100" or aluOp="010101") then--ANDcc - ANDNcc - ORcc - ORNcc - XORcc - XNORcc
			nzvc_Aux <= "0000";
			if(aluResult(31)='1') then
				nzvc_Aux(3) <= '1';
			end if;
			
			if(aluResult=x"00000000") then
				nzvc_Aux(2) <= '1';
			end if;
			
		end if;
		
	end process;
	nzvc <= nzvc_Aux;
end arq_ProcessorStateRegister_Modifier;

