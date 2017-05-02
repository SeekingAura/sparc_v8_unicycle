
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ProcesadorMonociclo is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           aluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ProcesadorMonociclo;

architecture arq_ProcesadorMonociclo of ProcesadorMonociclo is

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

component SEU30B
	Port ( 
		imm30 : in  STD_LOGIC_VECTOR (29 downto 0);
		imm32 : out  STD_LOGIC_VECTOR (31 downto 0)
	);
			  
end component;

component SEU22B
	Port ( 
		imm22 : in  STD_LOGIC_VECTOR (21 downto 0);
		imm32 : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;

component WindowsManager
	Port (
		rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
		rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
		rd : in  STD_LOGIC_VECTOR (4 downto 0);
		op : in  STD_LOGIC_VECTOR (1 downto 0);
		op3 : in  STD_LOGIC_VECTOR (5 downto 0);
		cwp : in  STD_LOGIC_VECTOR (4 downto 0);
		nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
		nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
		nRd : out  STD_LOGIC_VECTOR (5 downto 0);
		nCwp : out  STD_LOGIC_VECTOR (4 downto 0)
	);
end component;

component MUX6B
	Port ( 
		rd : in  STD_LOGIC_VECTOR (5 downto 0);
		O7 : in  STD_LOGIC_VECTOR (5 downto 0);
		rfDest : in  STD_LOGIC;
		nRd : out  STD_LOGIC_VECTOR (5 downto 0)
	);
end component;

component RegisterFile
	Port(
		rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
		rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
		rd : in  STD_LOGIC_VECTOR (5 downto 0);
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
		icc : in  STD_LOGIC_VECTOR (3 downto 0);
		cond : in  STD_LOGIC_VECTOR (3 downto 0);
		aluOp : out  STD_LOGIC_VECTOR (5 downto 0);
		rfRd : out  STD_LOGIC;
		rfSource : out  STD_LOGIC_VECTOR (1 downto 0);
		WMemory : out  STD_LOGIC_VECTOR (4 downto 0);
		rdMemory : out  STD_LOGIC_VECTOR (5 downto 0);
		aluOp : out  STD_LOGIC_VECTOR (5 downto 0)
	);
end component;

component SEU13B
	Port (
		imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
		imm32 : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;

component ProcessorStateRegister
	Port ( 
		clk : in  STD_LOGIC;
		reset : in  STD_LOGIC;
		nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
		nCwp : in  STD_LOGIC_VECTOR (4 downto 0);
		carry : out  STD_LOGIC;
		cwp : out  STD_LOGIC_VECTOR (4 downto 0)
	);
end component;

component MUXB
	Port ( 
		crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
		imm13 : in  STD_LOGIC_VECTOR (31 downto 0);
		iSc : in  STD_LOGIC;
		value : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;


component ALU
	Port(
		aluOp : in  STD_LOGIC_VECTOR (5 downto 0);
		crS1 : in  STD_LOGIC_VECTOR (31 downto 0);
		crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
		carry : in  STD_LOGIC;
		aluResult : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;

component ProcessorStateRegister_Modifier
	Port (
		aluOp : in  STD_LOGIC_VECTOR (5 downto 0);
		crS1 : in  STD_LOGIC_VECTOR (31 downto 0);
		crS2 : in  STD_LOGIC_VECTOR (31 downto 0);
		aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
		nzvc : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end component;

component MUXPC
	Port ( 
		call : in  STD_LOGIC_VECTOR (32 downto 0);
		branch : in  STD_LOGIC_VECTOR (32 downto 0);
		nextPc : in  STD_LOGIC_VECTOR (32 downto 0);
		jumpL : in  STD_LOGIC_VECTOR (32 downto 0);
		pcSc : in  STD_LOGIC_VECTOR (1 downto 0);
		newPc : out  STD_LOGIC_VECTOR (32 downto 0)
	);
end component;

component dataMemory
	Port ( 
		cRD : in  STD_LOGIC_VECTOR (31 downto 0);
		aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
		WMemory : in  STD_LOGIC_VECTOR (4 downto 0);
		rdMemory : in  STD_LOGIC_VECTOR (5 downto 0);
		dataMem : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end component;

component MUXRf
	Port ( 
		dataMem : in  STD_LOGIC_VECTOR (31 downto 0);
		aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
		Pc : in  STD_LOGIC_VECTOR (31 downto 0);
		rfSource : in  STD_LOGIC_VECTOR (1 downto 0);
		dataRf : out  STD_LOGIC_VECTOR (31 downto 0)
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
signal SEU_Out : std_logic_vector(31 downto 0) := (others => '0');
signal ContentRegister2_MUXOut : std_logic_vector(31 downto 0) := (others => '0');
signal nzvc_Aux : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal nCwp_Aux : STD_LOGIC_VECTOR (4 downto 0) := "00000";
signal carry_Aux : STD_LOGIC := '0';
signal cwp_Aux : STD_LOGIC_VECTOR (4 downto 0) := "00000";
signal nRs1_Aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nRs2_Aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nRd_Aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";

signal disp30_Aux : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal disp22_Aux : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";


begin
	NextProgramCounter0 : ProgramCounter 
	port map(
		clk => clk,
		data => Adder_Out,
		reset => reset,
		dataOut => NextProgramCounter_Out
	);
	
	AdderNextPc : Adder
	Port map(
		op1 => x"00000001",
		op2 => NextProgramCounter_Out,
		result => Adder_Out
	);
	
	SEU30B0 : SEU30B
	Port Map( 
		imm30 => InstructionMemory_Out(29 downto 0),
		imm32 => disp30_Aux
	);
			  

	SEU22B0 : SEU22B
	Port map( 
		imm22 => InstructionMemory_Out(21 downto 0),
		imm32 => disp22_Aux
	);
	
	
	
	AdderCall : Adder
	Port map(
		op1 => x"00000001",
		op2 => NextProgramCounter_Out,
		result => disp30_Aux
	);
	
	AdderBranch : Adder
	Port map(
		op1 => x"00000001",
		op2 => NextProgramCounter_Out,
		result => disp22_Aux
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
		rs1 => nRs1_Aux,
		rs2 => nRs2_Aux,
		rd => nRd_Aux,
		rst => reset,
		dwr => Alu_Out,
		crS1 => ContentRegister1,
		crS2 => ContentRegister2
	);
	
	WindowsManager0 : WindowsManager
	Port map(
		rs1 => InstructionMemory_Out(18 downto 14),
		rs2 => InstructionMemory_Out(4 downto 0),
		rd => InstructionMemory_Out(29 downto 25),
		op => InstructionMemory_Out(31 downto 30),
		op3 => InstructionMemory_Out(24 downto 19),
		cwp => cwp_Aux,
		nRs1 => nRs1_Aux,
		nRs2 => nRs2_Aux,
		nRd => nRd_Aux,
		nCwp => nCwp_Aux
	);
	
	SEU13B0 : SEU13B
	Port map(
		imm13 => InstructionMemory_Out(12 downto 0),
		imm32 => SEU_Out
	);
	
	ProcessorStateRegister0 : ProcessorStateRegister
	Port map(
		clk =>clk,
		reset => reset,
		nzvc => nzvc_Aux,
		nCwp => nCwp_Aux,
		carry => carry_Aux,
		cwp => cwp_Aux
	);
	
	MUXB0 : MUXB
	Port map( 
		crS2 => ContentRegister2,
		imm13 => SEU_Out,
		iSc => InstructionMemory_Out(13),
		value => ContentRegister2_MUXOut
	);
	
	ProcessorStateRegister_Modifier0 : ProcessorStateRegister_Modifier
	Port map(
		aluOp => ControlUnit_Out,
		crS1 => ContentRegister1,
		crS2 => ContentRegister2_MUXOut,
		aluResult => Alu_Out,
		nzvc => nzvc_Aux
	);
	
	ALU0 : ALU
	Port map(
		crS1 => ContentRegister1,
		crS2 => ContentRegister2_MUXOut,
		carry => carry_Aux,
		AluOp => ControlUnit_Out,
		AluResult => Alu_Out
	);

	
	
	

AluResult <= Alu_Out;


end arq_ProcesadorMonociclo;

