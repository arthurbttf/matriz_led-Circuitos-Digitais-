library ieee;
use ieee.std_logic_1164.all;

entity shifter is
  port (
    SHR, SHL : in std_logic;
    I : in std_logic_vector(7 downto 0);
    O : out std_logic_vector(7 downto 0)
  );
end shifter;

architecture logic of shifter is
  signal shift_r, shift_l : std_logic;
begin
  shift_r <= SHR and not SHL;
  shift_l <= SHL and not SHR;
  O(0) <= (shift_r and I(1)) or (I(0) and not shift_l and not shift_r) or (I(7) and shift_l);
  O(1) <= (shift_r and I(2)) or (I(1) and not shift_l and not shift_r) or (I(0) and shift_l);
  O(2) <= (shift_r and I(3)) or (I(2) and not shift_l and not shift_r) or (I(1) and shift_l);
  O(3) <= (shift_r and I(4)) or (I(3) and not shift_l and not shift_r) or (I(2) and shift_l);
  O(4) <= (shift_r and I(5)) or (I(4) and not shift_l and not shift_r) or (I(3) and shift_l);
  O(5) <= (shift_r and I(6)) or (I(5) and not shift_l and not shift_r) or (I(4) and shift_l);
  O(6) <= (shift_r and I(7)) or (I(6) and not shift_l and not shift_r) or (I(5) and shift_l);
  O(7) <= (shift_r and I(0)) or (I(7) and not shift_l and not shift_r) or (I(6) and shift_l);
end logic;