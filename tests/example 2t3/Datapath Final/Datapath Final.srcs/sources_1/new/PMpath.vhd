
----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/22/2018 03:28:29 PM
-- Design Name:
-- Module Name: PMpath - Behavioral
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

entity PMpath is
    Port ( data_processor : in STD_LOGIC_VECTOR (31 downto 0);
           data_memory : in STD_LOGIC_VECTOR (31 downto 0);
           typeDT : in STD_LOGIC;
           byteOffset : in STD_LOGIC_VECTOR (2 downto 0);
           out_processor : in STD_LOGIC_VECTOR (31 downto 0);
           out_memory : in STD_LOGIC_VECTOR (31 downto 0));
end PMpath;

architecture Behavioral of PMpath is

begin


end Behavioral;
