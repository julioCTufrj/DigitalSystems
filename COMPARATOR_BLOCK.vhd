library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATOR_BLOCK is
  Port (A: in STD_LOGIC_VECTOR (3 downto 0);
        B: in STD_LOGIC_VECTOR (3 downto 0);
        greater: out STD_LOGIC;
        less: out STD_LOGIC;
        equal: out STD_LOGIC;
  );
end COMPARATOR_BLOCK;

architecture of COMPARATOR_BLOCK is

component COMPARATOR_BIT is
    Port (bit1: in STD_LOGIC;
          bit2: in STD_LOGIC;
          equal: out STD_LOGIC;
          bit1_greater: out STD_LOGIC;
          bit1_less: out STD_LOGIC);
end component;

signal greater_vector, less_vector, equal_vector: STD_LOGIC_VECTOR (3 downto 0);

begin

  O3: COMPARATOR_BIT port map (A(3), B(3), equal_vector(3), greater_vector(3), less_vector(3));
  O2: COMPARATOR_BIT port map (A(2), B(2), equal_vector(2), greater_vector(2), less_vector(2));
  O1: COMPARATOR_BIT port map (A(1), B(1), equal_vector(1), greater_vector(1), less_vector(1));
  O0: COMPARATOR_BIT port map (A(0), B(0), equal_vector(0), greater_vector(0), less_vector(0));

  P1: process (equal_vector, greater_vector, less_vector)
  begin
  
    if (equal_vector(3) = '0') then
      greater <= greater_vector(3);
      less <= less_vector(3);
      equal <= equal_vector(3);

    elsif (equal_vector(3) = '1' and equal_vector(2) = '0') then 
      greater <= greater_vector(2);
      less <= less_vector(2);
      equal <= equal_vector(2);

    elsif (equal_vector(3) = '1' and equal_vector(2) = '1' and equal_vector(1) = '0') then
      greater <= greater_vector(1);
      less <= less_vector(1);
      equal <= equal_vector(1);

    elsif (equal_vector(3) = '1' and equal_vector(2) = '1' and equal_vector(1) = '1' and equal_vector(0) = '0') then
      greater <= greater_vector(0);
      less <= less_vector(0);
      equal <= equal_vector(0);

    else
      greater <= '0';
      less <= '0';
      equal <= '1';

    end if;
  end Behavior;
