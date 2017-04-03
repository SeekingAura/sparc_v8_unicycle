library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Procesador is
	Port( 
		clk : in  STD_LOGIC;
		reset : in  STD_LOGIC;
		AluResult : out  STD_LOGIC_VECTOR (31 downto 0);
		ProgramCounterState : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end Procesador;

architecture arq_Procesador of Procesador is
component ProgramCounter
	Port( 
		clk : in  STD_LOGIC;
		data : in  STD_LOGIC_VECTOR (31 downto 0);
		reset : in  STD_LOGIC;
		dataOut : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;

component Adder
	Port(
		op1 : in  STD_LOGIC_VECTOR (31 downto 0);
		op2 : in  STD_LOGIC_VECTOR (31 downto 0);
		result : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;

component InstructionMemory
	Port(
		adress : in  STD_LOGIC_VECTOR (31 downto 0);
		reset : in  STD_LOGIC;
		dataOut : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;

component RegisterFile
	Port(
		rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
		rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
		rd : in  STD_LOGIC_VECTOR (4 downto 0);
		rst : in  STD_LOGIC;
		dwr : in  STD_LOGIC_VECTOR (31 downto 0);
		crS1 : out  STD_LOGIC_VECTOR (31 downto 0);
		crS2 : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;

component ControlUnit
	Port(
		op3 : in  STD_LOGIC_VECTOR (5 downto 0);
		op : in  STD_LOGIC_VECTOR (1 downto 0);
		aluOp : out  STD_LOGIC_VECTOR (5 downto 0)
	);
end component;

component ALU
	Port(
		crS1 : in  STD_LOGIC_VECTOR (31 downto 0);
		crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
		AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
		AluResult : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;

signal Adder_Out : std_logic_vector (31 downto 0) := (others => '0');
signal NextProgramCounter_Out : std_logic_vector (31 downto 0) := (others => '0');
signal ProgramCounter_Out : std_logic_vector (31 downto 0) := (others => '0');
signal InstructionMemory_Out : std_logic_vector (31 downto 0) := (others => '0');
signal ControlUnit_Out : std_logic_vector(5 downto 0) := (others => '0');
signal ContentRegister1 : std_logic_vector(31 downto 0) := (others => '0');
signal ContentRegister2 : std_logic_vector(31 downto 0) := (others => '0');
signal Alu_Out : std_logic_vector(31 downto 0) := (others => '0');

begin
	NextProgramCounter0 : ProgramCounter 
	port map(
		clk => clk,
		data => Adder_Out,
		reset => reset,
		dataOut => NextProgramCounter_Out
	);
	
	Adder0 : Adder
	Port map(
		op1 => x"00000001",
		op2 => NextProgramCounter_Out,
		result => Adder_Out
	);
	
	ProgramCounter0 : ProgramCounter 
	port map(
		clk => clk,
		data => NextProgramCounter_Out,
		reset => reset,
		dataOut => ProgramCounter_Out
	);
	
	
	
	InstructionMemory0 : InstructionMemory
	Port map(
		adress => ProgramCounter_Out,
		reset => reset,
		dataOut => InstructionMemory_Out
	);
	
	ControlUnit0 : ControlUnit
	Port map(
		op3 => InstructionMemory_Out(24 downto 19),
		op => InstructionMemory_Out(31 downto 30),
		aluOp => ControlUnit_Out
	);
	
	RegisterFile0 : RegisterFile
	Port map(
		rs1 => InstructionMemory_Out(18 downto 14),
		rs2 => InstructionMemory_Out(4 downto 0),
		rd => InstructionMemory_Out(29 downto 25),
		rst => reset,
		dwr => Alu_Out,
		crS1 => ContentRegister1,
		crS2 => ContentRegister2
	);
	
	ALU0 : ALU
	Port map(
		crS1 => ContentRegister1,
		crS2 => ContentRegister2,
		AluOp => ControlUnit_Out,
		AluResult => Alu_Out
	);

AluResult <= Alu_Out;
ProgramCounterState <=ProgramCounter_Out;
end arq_Procesador;

