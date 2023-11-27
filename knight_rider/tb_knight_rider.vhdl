library ieee;
use ieee.std_logic_1164.all;

entity tb_knight_rider is
end tb_knight_rider;

architecture tb_arch of  tb_knight_rider is
    constant N: integer:=8;
    constant T: time:= 20 ns;
    signal go,clk,reset: std_logic;
    signal led: std_logic_vector(N-1 downto 0);
begin
    uut: entity work.knight_rider(arch)
    generic map(N=>N)
    port map(clk=>clk, go=>go, led=>led, reset=>reset);
    process
    begin
    clk <= '0' ;
    wait for T/2 ;
    clk <= '1' ;
    wait for T/2 ;
    end process;

    process
    begin
        ----init
        reset<='1';
        wait for T;
        reset<='0';
        go<='1';
        wait for 10000 ns;
    end process;
end tb_arch ;
