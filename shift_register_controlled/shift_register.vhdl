library ieee;
use ieee.std_logic_1164.all;
entity shift_register is
    generic(N: integer:= 8);
    port(
    load,lr,clk,en,reset: in std_logic;
    q: out std_logic_vector(N-1 downto 0);
    d: in std_logic_vector(N-1 downto 0)
);
end shift_register;

architecture arch of shift_register is 
    signal r_reg, r_next: std_logic_vector(N-1 downto 0);
begin
    process(clk,reset)
    begin
    if (reset = '1') then
        r_reg <= (others => '0');
    elsif (rising_edge(clk)) then
        r_reg <= r_next;
    end if;
    end process;
    --next state logic
    r_next <= d when load = '1' else
              r_reg(0) & r_reg(N-1 downto 1) when (en='1') and (lr='1') else 
              r_reg(N-2 downto 0) & r_reg(N-1) when (en='1') and (lr='0') else
              r_reg;
    q <= r_reg;
    
end arch;