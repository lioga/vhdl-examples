library ieee;
use ieee.std_logic_1164.all;

entity tb_binary_counter is
end tb_binary_counter;

architecture arch_tb_binary_counter of tb_binary_counter is
constant N: integer:=8; 
constant T: time:= 20 ns;
signal clk, reset, load: std_logic;
signal en: std_logic;
signal d: std_logic_vector(N-1 downto 0);
signal q: std_logic_vector(N-1 downto 0);

begin
    uut: entity work.binary_counter(arch_binary_counter)
    generic map(N => N)
    port map(clk=>clk, reset=>reset, en=>en, d=>d, q => q, load => load);
    
    process
    begin
    clk <= '0' ;
    wait for T/2 ;
    clk <= '1' ;
    wait for T/2 ;
    end process;
    
    process
    begin
        en <= '0';
        reset <= '1';
        load <= '1';
        d <= ( others => '0');
        wait for 10 ns;
        reset <= '0';
        en <= '1';
        load <= '0';
        wait for 10000 ns;
    end process;
end arch_tb_binary_counter;