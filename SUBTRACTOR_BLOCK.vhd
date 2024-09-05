----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name:    SUBTRACTOR - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- 
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

entity SUBTRACTOR_BLOCK is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           result : out  STD_LOGIC_VECTOR (3 downto 0);
--           negative : out  STD_LOGIC;
           overflow: out STD_LOGIC);
end SUBTRACTOR_BLOCK;

architecture Behavioral of SUBTRACTOR_BLOCK is

component TWOsCOMPLEMENT is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           neg_A : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component SUM_BLOCK is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component;

	signal C2B, subtraction : STD_LOGIC_VECTOR (3 downto 0);
	signal carryOut: STD_LOGIC;

begin

	complementing_B: TWOsCOMPLEMENT port map (B, C2B);

	resposta: SUM_BLOCK port map (A, C2B, '0', subtraction, carryOut);

	P2: process (A, C2B, subtraction)
	
	begin

	if (A(3) = C2B(3) and subtraction(3) /= C2B(3)) then
		overflow <= '1';
	
	else
		overflow <= '0';
	
	end if;
-- See this part:
--  if (A(3) = '1' and C2B(3) = '1') then
--    negative <= '1';

--  elsif (overflo) then

--  elsif (overflow /= '0' and subtraction(3) = '1') then
--
	end process;

	result <= subtraction;

end Behavioral;
