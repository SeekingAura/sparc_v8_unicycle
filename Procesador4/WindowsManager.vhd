
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;


entity WindowsManager is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC_VECTOR (4 downto 0);
           nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRd : out  STD_LOGIC_VECTOR (5 downto 0);
			  nCwp : out  STD_LOGIC_VECTOR (4 downto 0));
end WindowsManager;

architecture arq_WindowsManager of WindowsManager is

signal nRs1_Aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nRs2_Aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nRd_Aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nCwp_Aux : STD_LOGIC_VECTOR (4 downto 0) := "00000";

begin
	process(rs1, rs2, rd, op, op3, cwp) begin
		
		if(op="10") then
			if(op3="111100") then--SAVE
				nCwp<= cwp-"00001";
			elsif(op3="111100") then--RESTORE
				nCwp<= cwp+"00001";
			end if;
		end if;
		
		if(rs1>=24 and rs1<=31) then
			nRs1_Aux<=rs1-(cwp*"10000");--multiplica por 16
		end if;
		
		if(rs1>=16 and rs1<=23) then
			nRs1_Aux<=rs1+(cwp*"10000");
		end if;
		
		if(rs1>=8 and rs1<=15) then
			nRs1_Aux<=rs1+(cwp*"10000");
		end if;
		
		
		if(rs2>=24 and rs2<=31) then
			nRs2_Aux<=rs1-(cwp*"10000");--multiplica por 16
		end if;
		
		if(rs2>=16 and rs2<=23) then
			nRs2_Aux<=rs1+(cwp*"10000");
		end if;
		
		if(rs2>=8 and rs2<=15) then
			nRs2_Aux<=rs1+(cwp*"10000");
		end if;
		
	end process;
	
	nRs1 <= nRs1_Aux;
	nRs2 <= nRs2_Aux;
	nRd <= nRd_Aux;
	nCwp <= nCwp_Aux;
		

end arq_WindowsManager;

