library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_one_digit_bcd_incrementor is
end tb_one_digit_bcd_incrementor;

architecture tb_arch_one_digit_incrementor of tb_one_digit_bcd_incrementor is
    signal reset,add: std_logic;
    signal count: std_logic_vector(3 downto 0);
    begin
        incrementer: entity work.one_digit_bcd_incrementor(arch_incrementor)
        port map(reset=>reset,add=>add,count=>count); 
        process
        begin
            reset <= '1';
            wait for 100 ns;
            reset <= '0';

            for i in 0 to 12 loop
                add <= '1';
                wait for 20 ns;
                add <= '0';
                wait for 100 ns;
            end loop;
            
            reset <= '1';
            wait for 100 ns;
            reset <= '0';

            for i in 0 to 4 loop
                add <= '1';
                wait for 20 ns;
                add <= '0';
                wait for 100 ns;
            end loop;

        end process;
end tb_arch_one_digit_incrementor;