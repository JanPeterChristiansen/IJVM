----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:56:27 03/25/2020 
-- Design Name: 
-- Module Name:    OutputSelect - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity OutputSelect is
    Port ( A 		: in  STD_LOGIC_VECTOR (7 downto 0);
           B 		: in  STD_LOGIC_VECTOR (7 downto 0);
           F 		: in  STD_LOGIC_VECTOR (1 downto 0);
			  SUM 	: in 	STD_LOGIC_VECTOR (7 downto 0);
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end OutputSelect;

architecture Behavioral of OutputSelect is

begin

-- OUTPUT SELECTER
with F select
	OUTPUT <= 	SUM 			when "11", -- ADDER
					A and B 		when "00", -- AND
					A or B 		when "01", -- OR
					not B 		when "10", -- NOT B
					x"00" 		when others; 

end Behavioral;

