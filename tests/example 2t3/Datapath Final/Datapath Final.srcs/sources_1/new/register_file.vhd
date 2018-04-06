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

entity register_file is
    Port ( writedata : in STD_LOGIC_VECTOR (31 downto 0);
           readadd1 : in STD_LOGIC_VECTOR (3 downto 0);
           readadd2 : in STD_LOGIC_VECTOR (3 downto 0);
           writeadd : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           writeenable : in STD_LOGIC;
           out1 : in STD_LOGIC_VECTOR (31 downto 0);
           out2 : in STD_LOGIC_VECTOR (31 downto 0);
           out_pc : in STD_LOGIC_VECTOR (31 downto 0));
end register_file;



architecture Behavioral of register_file is



type slv_array is array (0 to 15) of std_logic_vector(31 downto 0);
signal r: slv_array;

signal pccopy : std_logic_vector(31 downto 0);
signal out1temp : std_logic_vector(31 downto 0);
signal out2temp : std_logic_vector(31 downto 0);

begin

pccopy <= r(15);

r(15) <= "00000000000000000000000000000000" when reset = '1';

with readadd1 select
out1temp <= r(0) when "0000",
        r(1) when "0001",
        r(2) when "0010",
        r(3) when "0011",
        r(4) when "0100",
        r(5) when "0101",
        r(6) when "0110",
        r(7) when "0111",
        r(8) when "1000",
        r(9) when "1001",
        r(10) when "1010",
        r(11) when "1011",
        r(12) when "1100",
        r(13) when "1101",
        r(14) when "1110",
        r(15) when others;


with readadd2 select
        out2temp <= r(0) when "0000",
                r(1) when "0001",
                r(2) when "0010",
                r(3) when "0011",
                r(4) when "0100",
                r(5) when "0101",
                r(6) when "0110",
                r(7) when "0111",
                r(8) when "1000",
                r(9) when "1001",
                r(10) when "1010",
                r(11) when "1011",
                r(12) when "1100",
                r(13) when "1101",
                r(14) when "1110",
                r(15) when others;



Process(writeenable, clk, writedata)
begin
if (clk = '1' or clk'event) then
if (writeenable = '1') then

r(to_integer(unsigned(writeadd))) <= writedata;

end if;
end if;
end Process;






end Behavioral;
