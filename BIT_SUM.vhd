----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name:    BIT_SUM - Behavioral 
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

entity BIT_SUM is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end BIT_SUM;

architecture Behavioral of BIT_SUM is

begin

sum <= (A xor B) xor Cin;
Cout <= (A and B) or (Cin and (A xor B)); 

end Behavioral;
