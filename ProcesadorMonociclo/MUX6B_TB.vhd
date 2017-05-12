LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUX6B_TB IS
END MUX6B_TB;
 
ARCHITECTURE behavior OF MUX6B_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX6B
    PORT(
         rd : IN  std_logic_vector(5 downto 0);
         O7 : IN  std_logic_vector(5 downto 0);
         rfDest : IN  std_logic;
         nRd : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic_vector(5 downto 0) := (others => '0');
   signal O7 : std_logic_vector(5 downto 0) := (others => '0');
   signal rfDest : std_logic := '0';

 	--Outputs
   signal nRd : std_logic_vector(5 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX6B PORT MAP (
          rd => rd,
          O7 => O7,
          rfDest => rfDest,
          nRd => nRd
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rd <= "000000";
		O7 <= "000000";
		rfDest <= '0';
      wait for 100 ns;	
		
		rd <= "000101";
		O7 <= "010000";
		rfDest <= '0';
		wait for 20 ns;
		
		rfDest <= '1';
		rd <= "010101";
		O7 <= "100000";
		
		wait for 20 ns;
		
		rd <= "011101";
		O7 <= "010000";
		rfDest <= '0';
		wait for 20 ns;
		
		rd <= "111101";
		O7 <= "100000";
		rfDest <= '1';
		wait for 20 ns;
      

      -- insert stimulus here 

      wait;
   end process;

END;
