library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATOR_BIT is
  Port (A : in STD_LOGIC;
        B : in STD_LOGIC;
        equal : out STD_LOGIC;
        greater_than : out STD_LOGIC;
        less_than : out STD_LOGIC);
  end COMPARATOR_BIT;

  architecture Behavioral of COMPARATOR_BIT is

  begin
    equal <= not(A xor B);
    -- A > B
    greater_than <= A and not(B);
    -- A < B
    less_than <= not(A) and B;
  end Behavioral;
