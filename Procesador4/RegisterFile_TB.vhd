LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RegisterFile_TB IS
END RegisterFile_TB;
 
ARCHITECTURE behavior OF RegisterFile_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         rs1 : IN  std_logic_vector(5 downto 0);
         rs2 : IN  std_logic_vector(5 downto 0);
         rd : IN  std_logic_vector(5 downto 0);
         rst : IN  std_logic;
         dwr : IN  std_logic_vector(31 downto 0);
         crS1 : OUT  std_logic_vector(31 downto 0);
         crS2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal rd : std_logic_vector(5 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal crS1 : std_logic_vector(31 downto 0);
   signal crS2 : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          rst => rst,
          dwr => dwr,
          crS1 => crS1,
          crS2 => crS2
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here
		rs1 <="000000";
		rs2 <="000001";
		rd <="000000";
		rst <='0';
		dwr <=x"0000000A";
		wait for 20 ns;

		rs1 <="000000";
		rs2 <="000010";
		rd <="000001";
		rst <='0';
		dwr <=x"0000000F";
		wait for 20 ns;
		
		rs1 <="000001";
		rs2 <="000010";
		rd <="000011";
		rst <='0';
		dwr <=x"0000000F";
		wait for 20 ns;
		
		rs1 <="000001";
		rs2 <="000011";
		rd <="000010";
		rst <='0';
		dwr <=x"0000000B";
		wait for 5 ns;
		rst <='1';
		wait for 5 ns;
		rst <= '0';
		wait for 10 ns;
      wait;
   end process;

END;
