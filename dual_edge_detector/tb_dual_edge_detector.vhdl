library ieee;
use ieee.std_logic_1164.all;

entity tb_dual_edge_detector is
end tb_dual_edge_detector;

architecture tb_dual_edge of tb_dual_edge_detector is
    constant T: time:= 20 ns;
    signal clk, reset, level: std_logic;
    signal rising_edge_level, falling_edge_level: std_logic; 
    begin
        uut: entity work.dual_edge_det_mealy(arch_dual_edge_det_mealy)
        port map(clk=>clk, reset=>reset, rising_edge_level=>rising_edge_level,
        falling_edge_level=>falling_edge_level, level=>level);
    process
        begin
        clk <= '0' ;
        wait for T/2 ;
        clk <= '1' ;
        wait for T/2 ;
    end process;

    process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        level <= '0';
        wait for 20 ns;
        level <= '1';
        wait for 35 ns;
        level <= '0';
        wait for 15 ns;
        level <= '1';
        wait for 20 ns;
        level <= '0';
        wait for 20 ns;
        level <= '0';
    end process;
end tb_dual_edge;