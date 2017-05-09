LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY ProcessorStateRegister_Modifier_TB IS
END ProcessorStateRegister_Modifier_TB;
 
ARCHITECTURE behavior OF ProcessorStateRegister_Modifier_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProcessorStateRegister_Modifier
    PORT(
         aluOp : IN  std_logic_vector(5 downto 0);
         crS1 : IN  STD_LOGIC_VECTOR (31 downto 0);
         crS2 : IN  STD_LOGIC_VECTOR (31 downto 0);
         aluResult : IN  std_logic_vector(31 downto 0);
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal aluOp : std_logic_vector(5 downto 0) := (others => '0');
   signal crS1 : STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
   signal crS2 : STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
   signal aluResult : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcessorStateRegister_Modifier PORT MAP (
          aluOp => aluOp,
          crS1 => crS1,
          crS2 => crS2,
          aluResult => aluResult,
          nzvc => nzvc
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		
      wait for 100 ns;	
		aluOp <= "001110";--ADDcc
		crS1 <=x"00000000";
		crS2 <= x"00000000";
		aluResult <= x"00000000";
      
		wait for 20 ns;
		aluOp <= "011000";--ADDxcc
		crS1 <=x"F0000000";
		crS2 <= x"00000000";
		aluResult <= x"00000000";
		
		wait for 20 ns;
		aluOp <= "001110";--ADDcc
		crS1 <=x"00000000";
		crS2 <= x"E0000000";
		aluResult <= x"00000000";
		
		wait for 20 ns;
		aluOp <= "011000";--ADDxcc
		crS1 <=x"00000000";
		crS2 <= x"00000000";
		aluResult <= x"D0000000";
		
		wait for 20 ns;
		aluOp <= "011000";--ADDxcc
		crS1 <=x"C0000000";
		crS2 <= x"B0000000";
		aluResult <= x"00000000";
		
		wait for 20 ns;
		aluOp <= "011000";--ADDxcc
		crS1 <=x"A0000000";
		crS2 <= x"00000000";
		aluResult <= x"F0000000";
		wait for 20 ns;
		--
		
		aluOp <= "001111";--SUBcc
		crS1 <=x"00000000";
		crS2 <= x"00000000";
		aluResult <= x"00000000";
      
		wait for 20 ns;
		aluOp <= "011001";--SUBxcc
		crS1 <=x"F0000000";
		crS2 <= x"00000000";
		aluResult <= x"00000000";
		
		wait for 20 ns;
		aluOp <= "001111";--SUBcc
		crS1 <=x"00000000";
		crS2 <= x"E0000000";
		aluResult <= x"00000000";
		
		wait for 20 ns;
		aluOp <= "011001";--SUBxcc
		crS1 <=x"00000000";
		crS2 <= x"00000000";
		aluResult <= x"D0000000";
		
		wait for 20 ns;
		aluOp <= "011001";--SUBxcc
		crS1 <=x"C0000000";
		crS2 <= x"B0000000";
		aluResult <= x"00000000";
		
		wait for 20 ns;
		aluOp <= "011001";--SUBxcc
		crS1 <=x"A0000000";
		crS2 <= x"00000000";
		aluResult <= x"F0000000";
		wait for 20 ns;
		--logical
		
		aluOp <= "010000";--ANDcc
		crS1 <=x"00000000";
		crS2 <= x"00000000";
		aluResult <= x"00000000";
      
		wait for 20 ns;
		aluOp <= "010010";--ANDNcc
		crS1 <=x"F0000000";
		crS2 <= x"00000000";
		aluResult <= x"00000000";
		
		wait for 20 ns;
		aluOp <= "010001";--ORcc
		crS1 <=x"00000000";
		crS2 <= x"E0000000";
		aluResult <= x"00000000";
		
		wait for 20 ns;
		aluOp <= "010011";--ORNcc
		crS1 <=x"00000000";
		crS2 <= x"00000000";
		aluResult <= x"D0000000";
		
		wait for 20 ns;
		aluOp <= "010100";--XORcc
		crS1 <=x"C0000000";
		crS2 <= x"B0000000";
		aluResult <= x"00000000";
		
		wait for 20 ns;
		aluOp <= "010101";--XNORcc
		crS1 <=x"A0000000";
		crS2 <= x"00000000";
		aluResult <= x"F0000000";
		wait for 20 ns;
		
		wait;
		
		
   end process;

END;
