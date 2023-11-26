library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity binary_counter is
    generic(N: integer:= 8);
    port(
        clk,reset: in std_logic;
        en: in std_logic;
        d: in std_logic_vector(N-1 downto 0);
        q: out std_logic_vector(N-1 downto 0);
        load: in std_logic
    );
end binary_counter;

architecture arch_binary_counter of binary_counter is
    signal r_next, r_reg: unsigned(N-1 downto 0);
    begin
        process(clk, reset)
        begin
        if (reset = '1') then
            r_reg <= (others => '0');
        elsif (clk'event and clk='1') then
            r_reg <= r_next;
        end if;
        end process;
        ---next state
            
            r_next <= unsigned(d) when load='1' else
                      r_reg + 1 when en = '1' else
                      r_reg;
            q <= std_logic_vector(r_reg);
end arch_binary_counter;
