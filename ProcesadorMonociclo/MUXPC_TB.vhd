library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.STD_LOGIC_ARITH.ALL;
 
ENTITY MUXPC_TB IS
END MUXPC_TB;
 
ARCHITECTURE behavior OF MUXPC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUXPC
    PORT(
         callPc : IN  std_logic_vector(31 downto 0);
         branch : IN  std_logic_vector(31 downto 0);
         nextPc : IN  std_logic_vector(31 downto 0);
         jumpL : IN  std_logic_vector(31 downto 0);
         pcSc : IN  std_logic_vector(1 downto 0);
         newPc : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal callPc : std_logic_vector(31 downto 0) := (others => '0');
   signal branch : std_logic_vector(31 downto 0) := (others => '0');
   signal nextPc : std_logic_vector(31 downto 0) := (others => '0');
   signal jumpL : std_logic_vector(31 downto 0) := (others => '0');
   signal pcSc : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal newPc : std_logic_vector(31 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUXPC PORT MAP (
          callPc => callPc,
          branch => branch,
          nextPc => nextPc,
          jumpL => jumpL,
          pcSc => pcSc,
          newPc => newPc
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		callPc <= x"00000000";
		branch <= x"00000000";
		nextPc <= x"00000000";
		jumpL <= x"00000000";
		pcSc <= "00";
      wait for 100 ns;	
		
		callPc <= x"000000F0";
		branch <= x"000A00B0";
		nextPc <= x"00000001" + newPc;
		jumpL <= x"0F0B00A0";
		pcSc <= "00";--ProgramCounter
      wait for 20 ns;

		callPc <= x"90B0A000";
		branch <= x"0A0C0D00";
		nextPc <= x"00000001" + newPc;
		jumpL <= x"0000B0A0";
		pcSc <= "01";--CALL
      wait for 20 ns;
		
		callPc <= x"2A304050";
		branch <= x"0A0C0D00";
		nextPc <= x"00000001" + newPc;
		jumpL <= x"002A3090";
		pcSc <= "10";--BRANCH
      wait for 20 ns;
		
		callPc <= x"2070B0A0";
		branch <= x"0F02090A";
		nextPc <= x"00000001" + newPc;
		jumpL <= x"00A040AF";
		pcSc <= "11";--JUMPL
      wait for 20 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
