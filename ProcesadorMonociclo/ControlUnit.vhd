library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity ControlUnit is
	Port(
		op3 : in  STD_LOGIC_VECTOR (5 downto 0);
		op : in  STD_LOGIC_VECTOR (1 downto 0);
		icc : in  STD_LOGIC_VECTOR (3 downto 0);
		cond : in  STD_LOGIC_VECTOR (3 downto 0);
		rfRd : out  STD_LOGIC;
		rfSource : out  STD_LOGIC_VECTOR (1 downto 0);
		WriteMemoryEnable  : out  STD_LOGIC;
		pcSc : out  STD_LOGIC_VECTOR (1 downto 0);
		WriteEnable : out std_logic;
		aluOp : out  STD_LOGIC_VECTOR (5 downto 0)
	);
end ControlUnit;
--aluOpResult<="000000";--ADD
--aluOpResult<="000001";--SUB
--aluOpResult<="000010";--OR
--aluOpResult<="000011";--XOR
--aluOpResult<="000100";--XNOR
--i can rape
--aluOpResult<="000101";--SLL
--aluOpResult<="000110";--SRL
--aluOpResult<="000111";--SRA

--aluOpResult<="001000";--CALL
--aluOpResult<="001001";--JUMP

--aluOpResult<="001010";--BRANCH
--aluOpResult<="001011";--SETHI

--aluOpResult<="001100";--ORN
--aluOpResult<="001101";--ANDN

--aluOpResult<="001110";--ADDcc
--aluOpResult<="001111";--SUBcc
--aluOpResult<="010000";--ANDcc
--aluOpResult<="010001";--ORcc
--aluOpResult<="010010";--ANDNcc
--aluOpResult<="010011";--ORNcc
--aluOpResult<="010100";--XORcc
--aluOpResult<="010101";--XNORcc

--aluOpResult<="010110";--ADDx
--aluOpResult<="010111";--SUBx
--aluOpResult<="011000";--ADDxcc
--aluOpResult<="011001";--SUBxcc

--aluOpResult<="011010";--SAVE
--aluOpResult<="011011";--RESTORE

--aluOpResult<="011100";--AND

--aluOpResult<="011101";--STORE
--aluOpResult<="011110";--LOAD

architecture arq_ControlUnit of ControlUnit is

signal rfRd_Aux : STD_LOGIC := '0';
signal rfSource_Aux : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal WriteMemoryEnable_Aux : STD_LOGIC := '0';
signal pcSc_Aux : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal WriteEnable_Aux : std_logic := '0';
signal aluOpResult : std_logic_vector(5 downto 0) := "000000";

--Program counter MUX
--pcSc_Aux<="00";--Next Pc
--pcSc_Aux<="01";--CALL Pc
--pcSc_Aux<="10";--Branch pc
--pcSc_Aux<="11";--Jumpl pc

--Mux dwr
--rfSource_Aux<="00"--AluResult
--rfSource_Aux<="01"--Pc
--rfSource_Aux<="10"--DataMemory

begin
	process(op3, op, icc, cond) begin
		case(op) is
			when "00" =>
				pcSc_Aux<="00";
				WriteMemoryEnable_Aux <= '0';
				rfRd_Aux<='0';
				if(op3(5 downto 3)="010") then--BRANCH
					aluOpResult<="001010";
					WriteEnable_Aux <= '0';
					--rfSource_Aux<="01"--Pc
					case(cond) is
						when "1000" => --BA
							pcSc_Aux<="10";
						when "1001" => --BNE
							if(icc(2)='0') then
								pcSc_Aux<="10";
							end if;
						when "0001" => --BE
							if(icc(2)='1') then
								pcSc_Aux<="10";
							end if;
						when "1010" => --BG
							if((icc(2) or (icc(3) xor icc(1)))='0') then
								pcSc_Aux<="10";
							end if;
						when "0010" => --BLE
							if((icc(2) or (icc(3) xor icc(1)))='1') then
								pcSc_Aux<="10";
							end if;
						when "1011" => --BGE
							if((icc(3) xor icc(1))='0') then
								pcSc_Aux<="10";
							end if;
						when "0011" => --BL
							if((icc(3) xor icc(1))='1') then
								pcSc_Aux<="10";
							end if;
						when "1100" => --BGU
							if((icc(0) xor icc(2))='0') then
								pcSc_Aux<="10";
							end if;
						when "0100" => --BLEU
							if((icc(0) xor icc(2))='1') then
								pcSc_Aux<="10";
							end if;
						when "1101" => --BCC
							if(icc(0)='0') then
								pcSc_Aux<="10";
							end if;
						when "0101" => --BCS
							if(icc(0)='1') then
								pcSc_Aux<="10";
							end if;
						when "1110" => --BPOS
							if(icc(3)='0') then
								pcSc_Aux<="10";
							end if;
						when "0110" => --BNEG
							if(icc(3)='1') then
								pcSc_Aux<="10";
							end if;
						when "1111" => --BVC
							if(icc(1)='0') then
								pcSc_Aux<="10";
							end if;
						when "0111" => --BVS
							if(icc(1)='1') then
								pcSc_Aux<="10";
							end if;
						when others =>
							pcSc_Aux<="00";
					end case;
					
				end if;
				if(op3(5 downto 3)="100") then--SETHI-NOP
					aluOpResult<="001011";
					WriteEnable_Aux <= '1';
					rfSource_Aux <= "00";
					
				end if;
			when "01" =>
				WriteMemoryEnable_Aux <= '0';
				aluOpResult<="001000";--CALL
				WriteEnable_Aux <= '1';
				pcSc_Aux<="01";
				rfSource_Aux <= "01";
				rfRd_Aux<='1';
			when "10" =>
				pcSc_Aux<="00";
				rfSource_Aux <= "00";
				WriteEnable_Aux <= '1';
				WriteMemoryEnable_Aux <= '0';
				rfRd_Aux<='0';
				if(op3="000000") then--ADD
					aluOpResult<="000000";
					
				end if;
				if(op3="000100") then--SUB
					aluOpResult<="000001";
				end if;
				if(op3="000010") then--OR
					aluOpResult<="000010";
				end if;
				if(op3="000001") then--AND
					aluOpResult<="011100";
				end if;
				
				
				if(op3="000011") then--XOR
					aluOpResult<="000011";
				end if;
				if(op3="000111") then--XNOR
					aluOpResult<="000100";
				end if;
				if(op3="000110") then--ORN
					aluOpResult<="001100";
				end if;
				if(op3="000101") then--ANDN
					aluOpResult<="001101";
				end if;
				
				
				
				if(op3="100101") then--SLL
					aluOpResult<="000101";
				end if;
				if(op3="100110") then--SRL
					aluOpResult<="000110";
				end if;
				if(op3="100111") then--SRA
					aluOpResult<="000111";
				end if;
				
				--jump instruction
				if(op3="111000") then--JMPL
					aluOpResult<="001001";
					pcSc_Aux<="11";
					rfSource_Aux <= "01";
				end if;
				
				--cc instructions
				if(op3="010000") then--ADDcc
					aluOpResult<="001110";
				end if;
				if(op3="010100") then--SUBcc
					aluOpResult<="001111";
				end if;
				if(op3="010001") then--ANDcc
					aluOpResult<="010000";
				end if;
				if(op3="010010") then--ORcc
					aluOpResult<="010001";
				end if;
				if(op3="010101") then--ANDNcc
					aluOpResult<="010010";
				end if;
				if(op3="010110") then--ORNcc
					aluOpResult<="010011";
				end if;
				if(op3="010011") then--XORcc
					aluOpResult<="010100";
				end if;
				if(op3="010111") then--XNORcc
					aluOpResult<="010101";
				end if;
				
				--x instructions
				if(op3="001000") then--ADDx
					aluOpResult<="010110";
				end if;
				if(op3="001100") then--SUBx
					aluOpResult<="010111";
				end if;
				
				--xcc instructions
				if(op3="011000") then--ADDxcc
					aluOpResult<="011000";
				end if;
				if(op3="011100") then--SUBxcc
					aluOpResult<="011001";
				end if;
				
				
				
				
				--save/restore
				if(op3="111100") then--SAVE
					aluOpResult<="011010";
					
				end if;
				if(op3="111101") then--RESTORE
					aluOpResult<="011011";
				end if;
			when "11" =>
				pcSc_Aux<="00";
				rfSource_Aux <= "10";
				rfRd_Aux<='0';
				WriteEnable_Aux <= '0';
				WriteMemoryEnable_Aux <= '0';
				if(op3="000100") then --STORE
					aluOpResult<="011101";
					WriteEnable_Aux <= '0';
					WriteMemoryEnable_Aux <= '1';
				end if;
				
				if(op3="000000") then --LOAD
					aluOpResult<="011110";
					WriteEnable_Aux <= '1';
					WriteMemoryEnable_Aux <= '0';
				end if;
			
			when others => 
			aluOpResult <= "111111";
			WriteEnable_Aux <= '0';
			WriteMemoryEnable_Aux <= '0';
		end case;
	end process;
	
rfRd <= rfRd_Aux;
rfSource <= rfSource_Aux;
WriteMemoryEnable <= WriteMemoryEnable_Aux;
pcSc <= pcSc_Aux;
WriteEnable <= WriteEnable_Aux;
aluOp <= aluOpResult;

end arq_ControlUnit;

