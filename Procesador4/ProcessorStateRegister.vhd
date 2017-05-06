library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProcessorStateRegister is
	Port ( 
		clk : in  STD_LOGIC;
		reset : in  STD_LOGIC;
		nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
		nCwp : in  STD_LOGIC_VECTOR (4 downto 0);
		carry : out  STD_LOGIC;
		cwp : out  STD_LOGIC_VECTOR (4 downto 0)
	);
end ProcessorStateRegister;

architecture arq_ProcessorStateRegister of ProcessorStateRegister is

signal carry_Aux : std_logic := '0';
signal cwp_Aux : STD_LOGIC_VECTOR (4 downto 0) := "00000";
begin
	process(reset,clk,nzvc, ncwp) begin
		cwp_Aux<=nCwp;
		if reset='1' then
			carry_Aux <= '0';
			cwp_Aux<="00000";
		else
			if rising_edge(clk) then
				carry<=nzvc(0);
				
				cwp<=nCwp;
			end if;
		end if;
	end process;
end arq_ProcessorStateRegister;

