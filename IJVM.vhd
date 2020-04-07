----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:20:10 04/07/2020 
-- Design Name: 
-- Module Name:    IJVM - Behavioral 
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

entity IJVM is
    Port (
		CLK : in  STD_LOGIC;
		LED : out STD_LOGIC_VECTOR(7 downto 0)
	 );
	 
end IJVM;

architecture Behavioral of IJVM is

	-- sub-clocks
	signal dCLK : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	
	-- counters for sub processes
	signal i : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');

	-- ROM type and initialization
	type rom_type is array (0 to 511) of STD_LOGIC_VECTOR (35 downto 0);
	signal ROM : rom_type := (	x"000000000", x"000000000", x"000000000", x"000000000", 
										others => (others => '0'));

	-- Busses
	signal A, B, C : STD_LOGIC_VECTOR (31 downto 0);

	-- control signals
	signal ADDR 			: STD_LOGIC_VECTOR (8 downto 0);
	signal JAM_Control	: STD_LOGIC_VECTOR (1 downto 0);
	signal ALU_Control 	: STD_LOGIC_VECTOR (5 downto 0);
	signal C_Bus_WE		: STD_LOGIC_VECTOR (8 downto 0);
	signal B_Bus_RE 		: STD_LOGIC_VECTOR (3 downto 0);
	signal MEM_control 	: STD_LOGIC_VECTOR (2 downto 0);
	
	-- cmd signal
	signal cmd : STD_LOGIC_VECTOR (35 downto 0) := (others => '0');
	
	-- Registers
	type reg_type is array (0 to 15) of STD_LOGIC_VECTOR (31 downto 0);
	signal REG : reg_type := (others => (others => '0'));

	-- 0 MDR
	-- 1 PC
	-- 2 MBR
	-- 3 MBRU
	-- 4 SP
	-- 5 LV
	-- 6 CPP
	-- 7 TOS
	-- 8 OPC
	-- 9-15 none

	-- holding register
	signal H : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
	
	--micro programm counter
	signal MPC : STD_LOGIC_VECTOR (8 downto 0);
	
	
begin

-- count the sub-clocks
process (clk)
begin
	if rising_edge(clk) then
		dCLK <= dCLK + 1;
	end if;
end process;


-- This process runs "sub" processes in a loop. This is to ensure Sequential execution
process(clk)
begin
	if rising_edge(clk) then
		case i is
			when "00" =>
				-- set up control signals
			when "01" => 
				-- load registers onto B bus
				B <= REG(conv_integer(B_Bus_RE));				
				-- load H onto A bus
				A <= H;
			when "10" =>
				-- operate ALU and ALU output shifter
				-- disable A and B bus
				A <= (others => 'Z');
				B <= (others => 'Z');
			when "11" => 
				-- write C bus into registers
				for N in 0 to 8 loop
					if (C_Bus_WE(N) = '1') then
						REG(N) <= C;
					end if;
				end loop;
			when others => 
		end case;
		
		i <= i + 1;
		
	end if;
end process;


end Behavioral;

