LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUX13B_TB IS
END MUX13B_TB;
 
ARCHITECTURE behavior OF MUX13B_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX13B
    PORT(
         crS2 : IN  std_logic_vector(31 downto 0);
         imm13 : IN  std_logic_vector(31 downto 0);
         iSc : IN  std_logic;
         value : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal crS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal imm13 : std_logic_vector(31 downto 0) := (others => '0');
   signal iSc : std_logic := '0';

 	--Outputs
   signal value : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX13B PORT MAP (
          crS2 => crS2,
          imm13 => imm13,
          iSc => iSc,
          value => value
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		crS2 <= x"00000001";
		imm13 <= x"0000000F";
		iSc <= '0';
		wait for 20 ns;
		
		crS2 <= x"00000001";
		imm13 <= x"0000000F";
		iSc <= '1';
		wait for 20 ns;


      wait;
   end process;

END;
