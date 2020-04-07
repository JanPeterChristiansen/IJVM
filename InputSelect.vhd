----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:30 03/25/2020 
-- Design Name: 
-- Module Name:    InputSelect - Behavioral 
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

entity InputSelect is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           ENA : in  STD_LOGIC;
           INVA : in  STD_LOGIC;
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           ENB : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end InputSelect;

architecture Behavioral of InputSelect is

	signal ASEL : STD_LOGIC_VECTOR (1 downto 0);
	signal BSEL : STD_LOGIC;

begin

-- INPUT SELECTER

ASEL(0) <= ENA;
ASEL(1) <= INVA;

BSEL <= ENB;


with ASEL select
	QA <= 	x"00" 	when "00",
				A 			when "01",
				x"ff" 	when "10",
				not A 	when "11",
				x"00" 	when others;

with BSEL select
	QB <= 	x"00" 	when '0',
				B 			when '1',
				x"00" 	when others;




end Behavioral;

