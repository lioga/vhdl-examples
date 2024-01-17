library ieee;
use ieee.std_logic_1164.all;

entity parking_lot is
    port(
        clk, reset: in std_logic;
        a,b : in std_logic;
        enters,exits : out std_logic
    );
end parking_lot;

architecture arch_parking_lot of parking_lot is
    type state_type is (empty, occupied);
    signal state_reg, state_next: state_type;
begin
    --state reg
    process(clk, reset)
    begin
        if reset = '1' then
            state_reg <= empty;
        elsif clk'event and clk = '1' then
            state_reg <= state_next;
        end if;
    end process;

    process(state_reg,a,b)
    begin
        state_next <= state_reg; --if I am not changing it below continue with same state
        enters <= '0';
        exits <= '0';
        case state_reg is
            when empty =>
                if (a and b) = '1' then
                    enters <= '1';
                    state_next <= occupied;
                end if;
            when occupied =>
                if ( not (a and b) = '1') then
                    exits <= '1';
                    state_next <= empty;
                end if;
        end case; 
    end process ; 
end arch_parking_lot ; -- arch_parking_lot
