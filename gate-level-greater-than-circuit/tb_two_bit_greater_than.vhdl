library ieee;
use ieee.std_logic_1164.all;

entity tb_two_bit_greater_than is
end tb_two_bit_greater_than;

architecture arch_tb_two_bit_greater_than of tb_two_bit_greater_than is
    signal test_in0, test_in1: std_logic_vector(1 downto 0);
    signal test_out: std_logic;
begin
    uut: entity work.two_bit_greater_than(arch_two_bit_greater_than)
        port map(a=>test_in0, b=>test_in1, agreaterb => test_out);
process
begin
        --test vector 1 --0
        test_in0 <= "00";
        test_in1 <= "00";
        wait for 200 ns;
        --test vector 2 --1
        test_in0 <= "01";
        test_in1 <= "00";
        wait for 200 ns;
        --test vector 3 --0
        test_in0 <= "01";
        test_in1 <= "11";
        wait for 200 ns;
        --test vector 4 --0
        test_in0 <= "10";
        test_in1 <= "10";
        wait for 200 ns;
        --test vector 5 --1
        test_in0 <= "10";
        test_in1 <= "01";
        wait for 200 ns;
        end process;
end arch_tb_two_bit_greater_than;
