----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:17 04/07/2020 
-- Design Name: 
-- Module Name:    Interpreter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Interpreter is
    Port ( FUNC : in  STD_LOGIC_VECTOR (7 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (5 downto 0));
end Interpreter;

architecture Behavioral of Interpreter is

begin

with FUNC select
	OUTPUT <= 	"000000" when x"00", -- NOP
					"011000" when x"01", -- A
					"010100" when x"02", -- B
					"011010" when x"03", -- not A
					"101100" when x"04", -- not B
					"111100" when x"05", -- A + B
					"111101" when x"06", -- A + B + 1
					"111001" when x"07", -- A + 1
					"110101" when x"08", -- B + 1
					"111111" when x"09", -- B - A
					"110110" when x"0a", -- B - 1
					"111011" when x"0b", -- -A
					"001100" when x"0c", -- A and B
					"011100" when x"0d", -- A or B
					"010000" when x"0e", -- 0
					"110001" when x"0f", -- 1
					"110010" when x"10", -- -1
					"000000" when others;


end Behavioral;

