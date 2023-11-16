library ieee;
use ieee.std_logic_1164.all;

entity four_bit_greater_than is
    port(
        a_four,b_four: in std_logic_vector(3 downto 0);
        agreaterb_four: out std_logic
    );
    end four_bit_greater_than;
architecture arch_four_bit_greater_than of four_bit_greater_than is
    signal e1,g0,g1: std_logic;
begin
    agrb_0: entity work.two_bit_greater_than(arch_two_bit_greater_than)
        port map(a => a_four(3 downto 2), b => b_four(3 downto 2), agreaterb=>g1);
    agrb_1: entity work.two_bit_greater_than(arch_two_bit_greater_than)
        port map(a => a_four(1 downto 0), b => b_four(1 downto 0), agreaterb=>g0);
    aeqb_1: entity work.eq2(arch_eq2)
        port map(a => a_four(3 downto 2), b => b_four(3 downto 2), aeqb=>e1);

    agreaterb_four <= g1 or (g0 and e1);
end arch_four_bit_greater_than;