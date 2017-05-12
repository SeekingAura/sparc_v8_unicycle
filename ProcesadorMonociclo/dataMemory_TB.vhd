LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY dataMemory_TB IS
END dataMemory_TB;
 
ARCHITECTURE behavior OF dataMemory_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dataMemory
    PORT(
         cRD : IN  std_logic_vector(31 downto 0);
         aluResult : IN  std_logic_vector(31 downto 0);
         WriteMemoryEnable : IN  std_logic;
         reset : IN  std_logic;
         dataMem : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal cRD : std_logic_vector(31 downto 0) := (others => '0');
   signal aluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteMemoryEnable : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal dataMem : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dataMemory PORT MAP (
          cRD => cRD,
          aluResult => aluResult,
          WriteMemoryEnable => WriteMemoryEnable,
          reset => reset,
          dataMem => dataMem
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		cRD <= x"00000000";
		aluResult <= x"00000000";
		WriteMemoryEnable <= x"00000000";
		reset <='1';
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
