----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/01/2018 02:16:40 PM
-- Design Name:
-- Module Name: assignment4 - Behavioral
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
--use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datapathALU is
  Port (op1:in std_logic_vector(31 downto 0);
        op2:in std_logic_vector(31 downto 0);
        opcode: in Std_logic_vector(3 downto 0);
        carry: in std_logic_vector;
        result: out std_logic_vector(31 downto 0);
        flags: out std_logic_vector(3 downto 0)                      --flag order is (N,Z,C,V)
   );
end datapathALU;


architecture Behavioral of datapathALU is

signal opc: std_logic_vector(3 downto 0);
signal car: std_logic_vector(31 downto 0);
signal resultt: std_logic_vector(31 downto 0);
signal c31 : std_logic;
signal c32 : std_logic;

begin

car<="0000000000000000000000000000000"&carry;
opc <= opcode;

c31 <= op1(31) xor op2(31) xor resultt(31);
c32 <= (op1(31)and op2(31)) or (op2(31)and c31) or (c31 and op1(31));

with opc select
resultt <=  std_logic_vector(unsigned(op1(31 downto 0)) + unsigned(op2(31 downto 0))) when "0100",                       -- add
            std_logic_vector(unsigned(op1) - unsigned(op2)) when "0010",                                                 -- sub
            std_logic_vector(unsigned(op2) - unsigned(op1)) when "0011",                                                 -- rev sub
            std_logic_vector(unsigned(op2) + unsigned(op1) + unsigned(car))   when "0101",                                            -- add with carry
            std_logic_vector(unsigned(op1) - unsigned(op2) + unsigned(car)- "00000000000000000000000000000001") when "0110",          --sub with carry
            std_logic_vector(unsigned(op2) - unsigned(op1) + unsigned(car)- "00000000000000000000000000000001") when "0111",          --rev sub with carry
            op1 and op2 when "0000",
            op1 xor op2 when "0001",
            op1 or op2 when "1100",
            op1 and (not op2) when "1110",
            op2 when "1111",
            "00000000000000000000000000000000" when others;

flags(0) <= c31 xor c32;
flags(1) <= c32;
flags(2) <= '0' when to_integer(unsigned(resultt))= 0 else '1';
flags(3) <= resultt(31);

result <= resultt;

end Behavioral;