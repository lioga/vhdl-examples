library ieee;
use ieee.std_logic_1164.all;

entity tb_shift_register is
end tb_shift_register;

architecture arch_tb_shift_register of tb_shift_register is
    constant N: integer:=8;
    constant T: time:= 20 ns;
    signal load,lr,en,reset,clk: std_logic;
    signal q, d: std_logic_vector(N-1 downto 0); 
begin
    uut: entity work.shift_register(arch)
    generic map(N=>N)
    port map(en=>en, load=>load, lr=>lr, reset=>reset, clk=>clk, d=>d, q=>q);
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
        en <= '0';
        reset <= '1';
        lr<='1';
        load <= '1';
        d <= "00000010";
        wait for 10 ns;
        reset <= '0';
        en <= '1';
        load <= '0';
        wait for 100 ns;
        
        lr <= '0';
        wait for 100 ns;
        

        en <= '0';
        load<='1';
        lr <= '1';
        d <= "00001010";
        wait for 10 ns;
        en <= '1';
        wait until rising_edge(clk);
        load<='0';
        wait for 100 ns;

        lr<='0';
        wait for 100 ns;
    end process;
end arch_tb_shift_register ; -- arch_tb_shift_register
