library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity one_digit_bcd_incrementor is
    port(
        reset: in std_logic;
        add: in std_logic;
        count: out std_logic_vector(3 downto 0);
        max_tick: out std_logic
    );
end one_digit_bcd_incrementor;

architecture arch_incrementor of one_digit_bcd_incrementor is
    signal sig_sum: std_logic_vector(3 downto 0);
begin
    process(reset, add)
    begin
        if reset = '1' then
            sig_sum <= "0000";
        elsif add = '1' then
            sig_sum <= std_logic_vector(unsigned(sig_sum) + 1);
            if (sig_sum = "1001") then
                sig_sum <= "0000";
            end if; 
        end if;
    end process;
    count <= sig_sum;
    max_tick <= '1' when sig_sum="1001" else '0';

end arch_incrementor;
