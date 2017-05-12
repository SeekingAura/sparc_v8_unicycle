LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUXRf_TB IS
END MUXRf_TB;
 
ARCHITECTURE behavior OF MUXRf_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUXRf
    PORT(
         dataMem : IN  std_logic_vector(31 downto 0);
         aluResult : IN  std_logic_vector(31 downto 0);
         Pc : IN  std_logic_vector(31 downto 0);
         rfSource : IN  std_logic_vector(1 downto 0);
         dataRf : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dataMem : std_logic_vector(31 downto 0) := (others => '0');
   signal aluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal Pc : std_logic_vector(31 downto 0) := (others => '0');
   signal rfSource : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal dataRf : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUXRf PORT MAP (
          dataMem => dataMem,
          aluResult => aluResult,
          Pc => Pc,
          rfSource => rfSource,
          dataRf => dataRf
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		dataMem <= x"00000000";
		aluResult <= x"00000000";
		Pc <= x"00000000";
		rfSource <= "00";
      wait for 100 ns;	

		dataMem <= x"0000000A";
		aluResult <= x"00020300";
		Pc <= x"00000001";
		rfSource <= "00";--Aluresult
		wait for 20 ns;
		
		dataMem <= x"00CB000A";
		aluResult <= x"000203F0";
		Pc <= x"00000002";
		rfSource <= "01";--PC
		wait for 20 ns;
		
		dataMem <= x"00007005";
		aluResult <= x"0B020D0A";
		Pc <= x"00000003";
		rfSource <= "10";--dataMemory
		wait for 20 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
