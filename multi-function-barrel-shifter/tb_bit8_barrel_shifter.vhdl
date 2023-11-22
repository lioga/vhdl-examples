library ieee;
use ieee.std_logic_1164.all;

entity tb_bit8_barrel_shifter is
end tb_bit8_barrel_shifter;

architecture arch_tb_bit8_barrel_shifter of tb_bit8_barrel_shifter is
    signal test_in0: std_logic_vector(7 downto 0);
    signal lr: std_logic;
begin
    uut: entity work.basic_barrel_shifter(arch_basic_barrel_shifter)
        port map(lr => lr, in0 => test_in0);
process
begin
    test_in0 <= "00000001"; -- 10000000 
    lr <= '1';
    wait for 200 ns;
    test_in0 <= "00000010"; -- 00000100 
    lr <= '0';
    wait for 200 ns;
end process;
end arch_tb_bit8_barrel_shifter;