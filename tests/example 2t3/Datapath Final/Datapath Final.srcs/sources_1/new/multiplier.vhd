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

entity multiplier is
    Port ( op1 : in STD_LOGIC_VECTOR (31 downto 0);
           op2 : in STD_LOGIC_VECTOR (31 downto 0);
           add_op : in STD_LOGIC_VECTOR (31 downto 0);
           opcode : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (31 downto 0));
end multiplier;

architecture Behavioral of multiplier is

signal outtemp:std_logic_vector(31 downto 0);
begin


outtemp <= std_logic_vector(unsigned(op1(31 downto 0)) * unsigned(op2(31 downto 0)));


with opcode  select
output <= outtemp when '0',
          std_logic_vector(unsigned(outtemp(31 downto 0)) + unsigned(add_op(31 downto 0))) when others;



end Behavioral;
