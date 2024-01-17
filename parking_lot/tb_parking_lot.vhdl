library ieee;
use ieee.std_logic_1164.all;

entity tb_parking_lot is
end tb_parking_lot;

architecture tb_arch_parking_lot of tb_parking_lot is
    constant T: time:= 20 ns;
    signal clk, reset, a, b: std_logic;
    signal enters, exits: std_logic; 
    begin
        uut: entity work.parking_lot(arch_parking_lot)
        port map(clk=>clk, reset=>reset, enters=>enters,
        exits=>exits, a=>a, b=>b);
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
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;
        -- car enters --enters = 1
        a <= '1';
        b <= '1';
        wait for 60 ns;
        -- car exits --exits = 1
        a <= '0'; 
        b <= '0';
        wait for 60 ns;
        --- padestrian passes
        a <= '1';
        wait for 30 ns;
        a <= '0';
        wait for 30 ns;
        --- another padestrian passes
        b <= '1';
        wait for 30 ns;
        b <= '0';
        wait for 30 ns;

    end process;
end tb_arch_parking_lot;