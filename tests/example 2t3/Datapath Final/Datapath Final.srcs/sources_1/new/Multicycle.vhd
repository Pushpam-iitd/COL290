----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 06.03.2018 15:25:02
-- Design Name:
-- Module Name: MulticycleDatapath - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MulticycleDatapath is
    Port ( PW : in STD_LOGIC;
           IorD : in STD_LOGIC;
           MR : in STD_LOGIC;
           MW : in STD_LOGIC_VECTOR(3 downto 0);
           IW : in STD_LOGIC;
           DW : in STD_LOGIC;
           Rsrc : in STD_LOGIC;
           M2R : in STD_LOGIC;
           RW : in STD_LOGIC;
           AW : in STD_LOGIC;
           BW : in STD_LOGIC;
           Asrc1 : in STD_LOGIC;
           Asrc2 : in STD_LOGIC_VECTOR (1 downto 0);
           Fset : in STD_LOGIC;
           opALU : in STD_LOGIC_VECTOR (3 downto 0);
           ReW : in STD_LOGIC;
           CLK : in STD_LOGIC;
           MemRst: in STD_LOGIC;
           typeDT_PMpath : in std_logic_vector(2 downto 0);
           ins : out STD_LOGIC_VECTOR (31 downto 0);
          -- Shift_amount_select : in STD_LOGIC_VECTOR (31 downto 0);
           Shift_amount_mul : in STD_LOGIC;
           Shift_type_shifter : in STD_LOGIC_VECTOR (1 downto 0) );
end MulticycleDatapath;

architecture Behavioral of MulticycleDatapath is

signal PC1: std_logic_vector(31 downto 0);
signal PC2: std_logic_vector(31 downto 0);

signal IR1: std_logic_vector(31 downto 0);
signal IR2: std_logic_vector(31 downto 0);

signal DR1: std_logic_vector(31 downto 0);
signal DR2: std_logic_vector(31 downto 0);

signal A1: std_logic_vector(31 downto 0);
signal A2: std_logic_vector(31 downto 0);

signal B1: std_logic_vector(31 downto 0);
signal B2: std_logic_vector(31 downto 0);

signal RES1: std_logic_vector(31 downto 0);
signal RES2: std_logic_vector(31 downto 0);

signal F : std_logic_vector(3 downto 0);

signal Shift_amount_select :  STD_LOGIC_VECTOR (31 downto 0);

type slv_array is array (1 to 256) of std_logic_vector(31 downto 0); -- 1 to 128 instruction memory and rest data memory
signal mem: slv_array;
signal rad2select: std_logic_vector(3 downto 0);
signal wdselect: std_logic_vector(31 downto 0);
signal out_pc1: std_logic_vector(31 downto 0);
signal op1_signal: std_logic_vector(31 downto 0);
signal op2_signal: std_logic_vector(31 downto 0);
signal IR1_signal: std_logic_vector(31 downto 0);
signal DR1_signal: std_logic_vector(31 downto 0);
signal data_memory_signal: std_logic_vector(31 downto 0);
signal out_memory_signal: std_logic_vector(31 downto 0);
signal op1_shifter_signal: std_logic_vector(31 downto 0);
signal shifter_carry_signal: std_logic;
signal bram_ad: std_logic_vector(31 downto 0);
signal bram_din: std_logic_vector(31 downto 0);
signal bram_dout: std_logic_vector(31 downto 0);
signal bram_en: std_logic;
signal bram_we: std_logic_vector(3 downto 0);
signal bram_rst: std_logic;


component bram_wrapper 
  port (
    BRAM_PORTA_0_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTA_0_clk : in STD_LOGIC;
    BRAM_PORTA_0_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTA_0_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    BRAM_PORTA_0_en : in STD_LOGIC;
    BRAM_PORTA_0_rst : in STD_LOGIC;
    BRAM_PORTA_0_we : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end component;

component register_file
    Port ( writedata : in STD_LOGIC_VECTOR (31 downto 0);
           readadd1 : in STD_LOGIC_VECTOR (3 downto 0);
           readadd2 : in STD_LOGIC_VECTOR (3 downto 0);
           writeadd : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           writeenable : in STD_LOGIC;
           out1 : out STD_LOGIC_VECTOR (31 downto 0);
           out2 : out STD_LOGIC_VECTOR (31 downto 0);
           out_pc : out STD_LOGIC_VECTOR (31 downto 0));
end component;


component datapathALU
  Port (op1:in std_logic_vector(31 downto 0);
        op2:in std_logic_vector(31 downto 0);
        opcode: in Std_logic_vector(3 downto 0);
        carry: in std_logic;
        result: out std_logic_vector(31 downto 0);
        flags: out std_logic_vector(3 downto 0)                      --flag order is (N,Z,C,V)
   );
end component;

component PMpath
    Port ( data_processor : in STD_LOGIC_VECTOR (31 downto 0);
           data_memory : in STD_LOGIC_VECTOR (31 downto 0);
           typeDT : in STD_LOGIC_VECTOR(2 downto 0);
           byteOffset : in STD_LOGIC_VECTOR (1 downto 0);
           out_processor : out STD_LOGIC_VECTOR (31 downto 0);
           out_memory : out STD_LOGIC_VECTOR (31 downto 0)

           );

end component;

component DatapathShifter
    Port ( op1 : in STD_LOGIC_VECTOR (31 downto 0);
           Shift_amount : in STD_LOGIC_VECTOR (31 downto 0);
           Shift_type : in STD_LOGIC_VECTOR (1 downto 0);
           Shifted_op : out STD_LOGIC_VECTOR (31 downto 0);
           shifter_carry : out STD_LOGIC);
end component;


begin


with Rsrc select
rad2select <=   IR2(3 downto 0) when '0',
                IR2(15 downto 12) when '1',
                "0000" when others;

with M2R select
  wdselect <= RES2 when '0',
            DR2 when others;

x :register_file  port map (wdselect,IR2(19 downto 16),rad2select,IR2(15 downto 12),clk,'0','1',A1,op1_shifter_signal,out_pc1);

with Asrc1 select
  op1_signal <= PC2 when '0',
               A2 when others;

with Asrc2 select
  op2_signal <= B2 when "00",
   "00000000000000000000000000000100" when "01",
   "00000000000000000000"&IR2(11 downto 0) when "10",
   IR2(31)&IR2(31)&IR2(31)&IR2(31)&IR2(31)&IR2(31)&IR2&"00" when others;


with Shift_amount_mul select
  Shift_amount_select <= A1 when '0',
                          "00000000000000000000"&IR2(11 downto 0) when others;

with IorD select 
bram_ad <= PC2 when '0',
            RES2 when others;

t: bram_wrapper port map (bram_ad,CLK,bram_din,bram_dout,MR,MemRst,MW);

y :datapathALU  port map (op1_signal,op2_signal,opALU,'0',RES1,F);

z :PMpath port map (B2,IR1_signal,typeDT_PMpath,"00",IR1,out_memory_signal);

a :DatapathShifter port map (op1_shifter_signal,Shift_amount_select,Shift_type_shifter,B1,shifter_carry_signal);



Process(CLK)
begin
if(CLK = '1' and CLK'event) then

if ((IorD = '0') and (MR = '1')) then  IR1_signal <= bram_dout;
elsif (IorD = '1') and (MR = '1') then DR1_signal <= bram_dout;end if;end if;
if IW='1' then IR2<=IR1; else if DW='1' then DR2<=DR1;end if;
if AW='1' and BW ='1' then A2<=A1; B2<=B1; else if
AW='1' and BW ='0' then A2<=A1; else if
AW='0' and BW ='1' then B2<=B1;end if;end if;end if;
bram_din <= out_memory_signal;
if ReW ='1' then RES2<= RES1; end if;
if PW ='1' then PC2<= RES1; end if;

end if;
end Process;

-- M2R KA KRNA BAKI HAI

end Behavioral;
