library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity main is
  port (
    clk, KEY : in std_logic;
    SW : in std_logic_vector(3 downto 0);
    displayV, displayH : out std_logic_vector(7 downto 0)
  );
end entity;

architecture logic of main is
  component CLK_Div is
    port (
      clk_in : in std_logic;
      clk_out : out std_logic
    );
  end component CLK_Div;
  component ffd is
    port (
      ck, clr, set, d : in std_logic;
      q : out std_logic);
  end component ffd;
  component shifter is
    port (
      SHR, SHL : in std_logic;
      I : in std_logic_vector(7 downto 0);
      O : out std_logic_vector(7 downto 0)
    );
  end component shifter;
  signal ff_q_H, ff_q_V, O_shifter_H, O_shifter_V : std_logic_vector(7 downto 0);
  signal dir, esq, cima, baixo, clk_adjust : std_logic;
begin

  div : CLK_Div port map(clk_in => clk, clk_out => clk_adjust);
  dir <= SW(0);
  baixo <= SW(1);
  cima <= SW(2);
  esq <= SW(3);

  ff1h : ffd port map(ck => clk_adjust, set => KEY, clr => '1', d => O_shifter_H(0), q => ff_q_H(0));
  ff2h : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_H(1), q => ff_q_H(1));
  ff3h : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_H(2), q => ff_q_H(2));
  ff4h : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_H(3), q => ff_q_H(3));
  ff5h : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_H(4), q => ff_q_H(4));
  ff6h : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_H(5), q => ff_q_H(5));
  ff7h : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_H(6), q => ff_q_H(6));
  ff8h : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_H(7), q => ff_q_H(7));

  ff1v : ffd port map(ck => clk_adjust, set => KEY, clr => '1', d => O_shifter_V(0), q => ff_q_V(0));
  ff2v : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_V(1), q => ff_q_V(1));
  ff3v : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_V(2), q => ff_q_V(2));
  ff4v : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_V(3), q => ff_q_V(3));
  ff5v : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_V(4), q => ff_q_V(4));
  ff6v : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_V(5), q => ff_q_V(5));
  ff7v : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_V(6), q => ff_q_V(6));
  ff8v : ffd port map(ck => clk_adjust, set => '1', clr => KEY, d => O_shifter_V(7), q => ff_q_V(7));

  Horizontal : shifter port map(I => ff_q_H, SHR => dir, SHL => esq, O => O_shifter_H);
  Vertical : shifter port map(I => ff_q_V, SHR => cima, SHL => baixo, O => O_shifter_V);
  displayH <= O_shifter_H;
  displayV(7) <= O_shifter_V(0);
  displayV(6) <= O_shifter_V(1);
  displayV(5) <= O_shifter_V(2);
  displayV(4) <= O_shifter_V(3);
  displayV(3) <= O_shifter_V(4);
  displayV(2) <= O_shifter_V(5);
  displayV(1) <= O_shifter_V(6);
  displayV(0) <= O_shifter_V(7);
end architecture;