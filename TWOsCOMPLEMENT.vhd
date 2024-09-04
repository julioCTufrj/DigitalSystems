----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name:    TWOsCOMPLEMENT - Behavioral 
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

entity TWOsCOMPLEMENT is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           neg_A : out  STD_LOGIC_VECTOR (3 downto 0));
end TWOsCOMPLEMENT;

architecture Behavioral of TWOsCOMPLEMENT is
  
component SUM_BLOCK is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component;


  signal negated_vector : STD_LOGIC_VECTOR (3 downto 0);
  signal carry_out : STD_LOGIC;
  
begin

negated_vector <= not A;

complementing: SUM_BLOCK port map (negated_vector, "0001", '0', neg_A, carry_out);

end Behavioral;
