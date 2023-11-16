library ieee;
use ieee.std_logic_1164.all;

entity two_bit_greater_than is
    port(
        a, b: in std_logic_vector(1 downto 0);
        agreaterb: out std_logic
    );
    end two_bit_greater_than;
architecture arch_two_bit_greater_than of two_bit_greater_than is
    signal e0,e1,e2: std_logic;
begin
    --result
    agreaterb <= e0 or e1 or e2;
    --terms
    e0 <= a(1) and (not b(1));
    e1 <= a(0) and (not b(1)) and (not b(0));
    e2 <= a(1) and a(0) and (not b(0));
end arch_two_bit_greater_than;



