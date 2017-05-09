
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY InstructionMemory_TB IS
END InstructionMemory_TB;
 
ARCHITECTURE behavior OF InstructionMemory_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionMemory
    PORT(
         adress : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal adress : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory PORT MAP (
          adress => adress,
          reset => reset,
          dataOut => dataOut
        );
 

   -- Stimulus process
   stim_proc: process
   begin	
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
		reset <= '0';
		adress <=x"00000000";
		wait for 20 ns;
		adress <=x"00000001";
		wait for 20 ns;
		adress <=x"00000002";
		wait for 20 ns;
		adress <=x"00000003";
		wait for 20 ns;
		adress <=x"00000004";
		wait for 20 ns;
		adress <=x"00000005";
		wait for 20 ns;
		adress <=x"00000006";
		wait for 20 ns;
		adress <=x"00000007";
		wait for 20 ns;
		adress <=x"00000008";
		wait for 20 ns;
		adress <=x"00000009";

      wait;
   end process;

END;
