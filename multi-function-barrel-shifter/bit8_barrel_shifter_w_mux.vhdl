library ieee;
use ieee.std_logic_1164.all;

entity basic_barrel_shifter is
    generic(N: integer:=8); --default 8bit
    port(
        in0: in std_logic_vector(N-1 downto 0);
        lr: in std_logic; --if 1 shift right, else left
        out0: out std_logic_vector(N-1 downto 0)
    );
end basic_barrel_shifter;

architecture arch_basic_barrel_shifter of basic_barrel_shifter is
begin
    process(in0,lr)
    begin
        if (lr = '1') then
            out0 <= in0(0) & in0(N-1 downto 1);
        else
            out0 <= in0(N-2 downto 0) & in0(N-1);
        end if;
    end process;
end arch_basic_barrel_shifter;