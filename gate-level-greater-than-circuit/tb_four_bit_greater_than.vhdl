library ieee;
use ieee.std_logic_1164.all;

entity tb_four_bit_greater_than is
end tb_four_bit_greater_than;

architecture arch_tb_four_bit_greater_than of tb_four_bit_greater_than is
    signal test_in0, test_in1: std_logic_vector(3 downto 0);
    signal test_out: std_logic; 
begin
    uut: entity work.four_bit_greater_than(arch_four_bit_greater_than)
        port map(a_four=>test_in0, b_four=>test_in1, agreaterb_four=>test_out);
process
begin
        --test vector 1 --1
        test_in0 <= "0001";
        test_in1 <= "0000";
        wait for 200 ns;
        --test vector 2 --1
        test_in0 <= "0100";
        test_in1 <= "0011";
        wait for 200 ns;
        --test vector 3 --0
        test_in0 <= "0100";
        test_in1 <= "1100";
        wait for 200 ns;
        --test vector 4 --0
        test_in0 <= "0000";
        test_in1 <= "0001";
        wait for 200 ns;
        --test vector 5 --1
        test_in0 <= "1000";
        test_in1 <= "0101";
        wait for 200 ns;
        end process;
end arch_tb_four_bit_greater_than ; -- tb_four_bit_greater_than
