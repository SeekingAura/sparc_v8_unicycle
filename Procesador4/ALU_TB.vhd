LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         aluOp : IN  std_logic_vector(5 downto 0);
         crS1 : IN  std_logic_vector(31 downto 0);
         crS2 : IN  std_logic_vector(31 downto 0);
         carry : IN  std_logic;
         aluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal aluOp : std_logic_vector(5 downto 0) := (others => '0');
   signal crS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal crS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal carry : std_logic := '0';

 	--Outputs
   signal aluResult : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          aluOp => aluOp,
          crS1 => crS1,
          crS2 => crS2,
          carry => carry,
          aluResult => aluResult
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		aluOp <= "010110";--ADDx
		crS1 <= x"00000001";
		crS2 <= x"00000009";
		carry <= '0';
		
		wait for 20 ns;
		aluOp <= "011000";--ADDxcc
		crS1 <= x"00000009";
		crS2 <= x"00000001";
		carry <= '0';
		
		wait for 20 ns;
		aluOp <= "010110";--ADDx
		crS1 <= x"00000001";
		crS2 <= x"00000009";
		carry <= '1';
		
		wait for 20 ns;
		aluOp <= "011000";--ADDxcc
		crS1 <= x"00000009";
		crS2 <= x"00000001";
		carry <= '1';
		
		wait for 20 ns;
		aluOp <= "000101";--SLL
		crS1 <= x"00000009";
		crS2 <= x"00000002";
		carry <= '1';
		
		wait for 20 ns;
		aluOp <= "000110";--SLR
		crS1 <= x"00000009";
		crS2 <= x"00000003";
		carry <= '1';
		
		wait for 20 ns;
		aluOp <= "000111";--SRA
		crS1 <= x"00000009";
		crS2 <= x"00000001";
		carry <= '1';
		

      -- insert stimulus here 

      wait;
   end process;

END;
