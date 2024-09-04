----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    SUM - Behavioral 
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

entity SUM_BLOCK is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end SUM_BLOCK;

architecture Behavioral of SUM_BLOCK is

signal c: STD_LOGIC_VECTOR (3 downto 0);

component BIT_SUM 
	 Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

begin

S0: BIT_SUM port map(A(0), B(0), Cin, sum(0), c(0));
S1: BIT_SUM port map(A(1), B(1), c(0), sum(1), c(1));
S2: BIT_SUM port map(A(2), B(2), c(1), sum(2), c(2));
S3: BIT_SUM port map(A(3), B(3), c(2), sum(3), Cout);

end Behavioral;
