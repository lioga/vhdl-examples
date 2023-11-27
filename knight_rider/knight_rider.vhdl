library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity knight_rider is
    generic(N: integer:= 8);
    port(
        clk, go: in std_logic;
        reset: in std_logic;
        led: out std_logic_vector(N-1 downto 0)
    );
end knight_rider;

architecture arch of knight_rider is
    constant DVSR: integer:= 5;
    signal count_reg, count_next: unsigned(22 downto 0);
    signal count_max, lr: std_logic;
    signal shifted_vector_reg: std_logic_vector(7 downto 0):="00000001";
    signal shifted_vector_next: std_logic_vector(7 downto 0);

begin
    process(clk)
    begin
        if reset = '1' then
            count_reg <= (others => '0');
        elsif (clk'event and clk='1') then
            count_reg <= count_next;
            if count_max = '1' then 
                shifted_vector_reg <= shifted_vector_next;
            end if;
        end if;
    end process;

    count_next <= (others => '0') when count_reg=DVSR and (go = '1') else
                  count_reg + 1 when go = '1' else
                  count_reg;
    count_max <= '1' when count_reg = DVSR else '0';

    lr <= '0' when shifted_vector_reg(0) = '1' else -- right rotate
          '1' when shifted_vector_reg(N-1) = '1' else -- left rotate
           lr;
    
    shifted_vector_next <= 
        shifted_vector_reg(N-2 downto 0) & shifted_vector_reg(N-1) when lr = '0' and count_max = '1' else
        shifted_vector_reg(0) & shifted_vector_reg(N-1 downto 1) when lr = '1' and count_max = '1' else
        shifted_vector_reg;
    led <= shifted_vector_reg;
             

end arch ; -- arch