----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:42 04/07/2020 
-- Design Name: 
-- Module Name:    Registers - Behavioral 
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

entity Registers is
    Port ( clk 		: in  STD_LOGIC;
           addrA 		: in  STD_LOGIC;
           addrB 		: in  STD_LOGIC;
           input 		: in  STD_LOGIC;
           RE 			: in  STD_LOGIC_VECTOR (1 downto 0);
           WE 			: in  STD_LOGIC_VECTOR (1 downto 0);
           busA 		: out  STD_LOGIC;
           busB 		: out  STD_LOGIC);
end Registers;

architecture Behavioral of Registers is

	type reg_type is array (0 to 3) of STD_LOGIC_VECTOR(7 downto 0);
	signal REG : reg_type := (x"00", x"00", x"00", x"00");

begin

	process(clk,addrA,addrB,RE,WE,input)
	begin
	
		-- write data to register
		if falling_edge(clk) then
			if WE(0) = '1' then
				REG(conv_integer(addrA)) <= intput;
			end if;
			
			if WE(1) = '1' then
				REG(conv_integer(addrB)) <= intput;
			end if;
		end if;
	
	
		-- read from registers to busses
		if RE(0) = '1' then
			busA <= REG(conv_integer(addrA));
		else
			busA <= "ZZZZZZZZ";
		end if;
		
		if RE(1) = '1' then
			busB <= REG(conv_integer(addrB));
		else
			busB <= "ZZZZZZZZ";
		end if;
	

	end process;













end Behavioral;

