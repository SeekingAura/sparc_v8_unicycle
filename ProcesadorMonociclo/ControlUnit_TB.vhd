LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ControlUnit_TB IS
END ControlUnit_TB;
 
ARCHITECTURE behavior OF ControlUnit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         op3 : IN  std_logic_vector(5 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         cond : IN  std_logic_vector(3 downto 0);
         rfRd : OUT  std_logic;
         rfSource : OUT  std_logic_vector(1 downto 0);
         WriteMemoryEnable : OUT  std_logic;
         pcSc : OUT  std_logic_vector(1 downto 0);
         WriteEnable : OUT  std_logic;
         aluOp : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');
   signal cond : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal rfRd : std_logic;
   signal rfSource : std_logic_vector(1 downto 0);
   signal WriteMemoryEnable : std_logic;
   signal pcSc : std_logic_vector(1 downto 0);
   signal WriteEnable : std_logic;
   signal aluOp : std_logic_vector(5 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          op3 => op3,
          op => op,
          icc => icc,
          cond => cond,
          rfRd => rfRd,
          rfSource => rfSource,
          WriteMemoryEnable => WriteMemoryEnable,
          pcSc => pcSc,
          WriteEnable => WriteEnable,
          aluOp => aluOp
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		op3 <="000000";
		op <= "00";
		icc <= "0000";
		cond <= "0000";
      wait for 100 ns;
		
		op <= "10";
		op3 <= "001000";--ADDx
		icc <= "0001";
		cond <= "0010";
		wait for 10 ns;
		
		op <= "10";
		op3 <= "111000";--JUMPL
		icc <= "0010";
		cond <= "0001";
		wait for 10 ns;
		
		op <= "10";
		op3 <= "011100";--SUBxcc
		icc <= "0100";
		cond <= "1001";
		wait for 10 ns;
		
		op <= "00";
		op3 <= "010000";--BRANCH
		icc <= "1010";--False
		cond <= "0001";--BE
		wait for 10 ns;
		
		op <= "00";
		op3 <= "010000";--BRANCH
		icc <= "0000";--True
		cond <= "1010";--BG
		wait for 10 ns;
		
		op <= "00";
		op3 <= "010000";--BRANCH
		icc <= "1000";--False
		cond <= "1010";--BG
		wait for 10 ns;
		
		op <= "00";
		op3 <= "010000";--BRANCH
		icc <= "0000";--False
		cond <= "0011";--BL
		wait for 10 ns;
		
		op <= "00";
		op3 <= "010000";--BRANCH
		icc <= "1000";--True
		cond <= "0011";--BL
		wait for 10 ns;
		
		op <= "01";--CALL
		op3 <= "000000";
		icc <= "1100";
		cond <= "0100";
		wait for 10 ns;
		
		op <= "11";
		op3 <= "000100";--STORE
		icc <= "1010";
		cond <= "1001";
		wait for 10 ns;
		
		op <= "11";
		op3 <= "000000";--LOAD
		icc <= "0100";
		cond <= "1110";
		wait for 10 ns;
			
		op <= "10";
		op3 <= "011000";--Addxcc
		icc <= "0011";
		cond <= "1100";
		wait for 10 ns;
      

      -- insert stimulus here 

      wait;
   end process;

END;
