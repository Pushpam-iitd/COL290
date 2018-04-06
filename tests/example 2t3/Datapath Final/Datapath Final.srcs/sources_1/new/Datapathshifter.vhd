----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/15/2018 02:33:27 PM
-- Design Name:
-- Module Name: DatapathShifter - Behavioral
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

entity DatapathShifter is
    Port ( op1 : in STD_LOGIC_VECTOR (31 downto 0);
           Shift_amount : in STD_LOGIC_VECTOR (31 downto 0);
           Shift_type : in STD_LOGIC_VECTOR (1 downto 0);
           Shifted_op : out STD_LOGIC_VECTOR (31 downto 0);
           shifter_carry : out STD_LOGIC);
end DatapathShifter;

architecture Behavioral of DatapathShifter is
--lsl,lsr,asr,ror   00,01,10,11

component forone
    Port ( typep : in STD_LOGIC_VECTOR (1 downto 0);
           inp : in STD_LOGIC_VECTOR (31 downto 0);
           outp : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal temp : std_logic_vector(31 downto 0);


type slv_array is array (1 to 32) of std_logic_vector(31 downto 0);
signal t: slv_array;

signal n : integer := 0;


begin

n<= to_integer(unsigned(Shift_amount(4 downto 0)));

gen:for I in 0 to 5 generate
x:if I=0 generate
x: forone port map (Shift_type,op1,t(1));
end generate x;
y:if I>0 generate
y:forone port map (Shift_type,t(I),t(I+1));
end generate y;
end generate gen;

Shifted_op <= t(5);
Shifter_carry <= op1(31);
end Behavioral;