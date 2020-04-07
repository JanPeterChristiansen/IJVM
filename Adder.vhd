----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:23:49 03/25/2020 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    Port ( A 		: in  STD_LOGIC_VECTOR (7 downto 0);
           B 		: in  STD_LOGIC_VECTOR (7 downto 0);
           INC 	: in  STD_LOGIC;
           SUM 	: out STD_LOGIC_VECTOR (7 downto 0);
			  CARRY 	: out STD_LOGIC);
end Adder;

architecture Behavioral of Adder is

	signal tempSUM : STD_LOGIC_VECTOR (8 downto 0);
	signal tempA 	: STD_LOGIC_VECTOR (8 downto 0) := "000000000";
	signal tempB 	: STD_LOGIC_VECTOR (8 downto 0) := "000000000";
	signal tempINC : STD_LOGIC_VECTOR (8 downto 0) := "000000000";

begin

	tempA(7 downto 0) <= A;
	tempB(7 downto 0) <= B;
	tempINC(0) <= INC;
	
	tempSUM <= tempA + tempB + tempINC;
	SUM <= tempSUM(7 downto 0);
	CARRY <= tempSUM(8);

end Behavioral;

