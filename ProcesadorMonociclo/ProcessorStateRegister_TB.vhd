LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ProcessorStateRegister_TB IS
END ProcessorStateRegister_TB;
 
ARCHITECTURE behavior OF ProcessorStateRegister_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProcessorStateRegister
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         nzvc : IN  std_logic_vector(3 downto 0);
         nCwp : IN  std_logic_vector(4 downto 0);
         carry : OUT  std_logic;
         cwp : OUT  std_logic_vector(4 downto 0);
         icc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   signal nCwp : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal carry : std_logic;
   signal cwp : std_logic_vector(4 downto 0);
   signal icc : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcessorStateRegister PORT MAP (
          clk => clk,
          reset => reset,
          nzvc => nzvc,
          nCwp => nCwp,
          carry => carry,
          cwp => cwp,
          icc => icc
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      reset <= '1';
      wait for 100 ns;
		reset <= '0';
		
		nzvc <="0000";
		nCwp <= "00000";
		
		wait for 20 ns;
		nzvc <="1000";
		nCwp <= "00001";
		
		wait for 20 ns;
		nzvc <="1100";
		nCwp <= "00000";
		
		wait for 20 ns;
		nzvc <="1110";
		nCwp <= "00001";
		
		wait for 20 ns;
		nzvc <="1111";
		nCwp <= "00000";
		
		wait for 20 ns;
		nzvc <="1101";
		nCwp <= "00001";
		
		wait for 20 ns;
		nzvc <="1001";
		nCwp <= "00000";
		
		wait for 20 ns;
		nzvc <="0001";
		nCwp <= "00001";
		
		wait for 20 ns;

      wait;
   end process;

END;
