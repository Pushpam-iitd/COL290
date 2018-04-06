----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/15/2018 02:51:22 PM
-- Design Name:
-- Module Name: forone - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity forone is
    Port ( typep : in STD_LOGIC_VECTOR (1 downto 0);
           inp : in STD_LOGIC_VECTOR (31 downto 0);
           outp : out STD_LOGIC_VECTOR (31 downto 0));
end forone;

architecture Behavioral of forone is






begin
with typep select
outp <=  inp(30 downto 0)&'0' when "00",
        '0'&inp(31 downto 1) when "01",
        inp(31)&inp(31 downto 1) when "10",
        inp(0)&inp(31 downto 1) when others;











end Behavioral;






