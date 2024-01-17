library ieee;
use ieee.std_logic_1164.all;

entity dual_edge_det_mealy is
    port(
        clk, reset: in std_logic;
        level: in std_logic;
        falling_edge_level, rising_edge_level: out std_logic
    );
end dual_edge_det_mealy;

architecture arch_dual_edge_det_mealy of dual_edge_det_mealy is
    type state_type is (zero, one);
    signal state_reg, state_next: state_type;
begin
    --state register
    process(clk, reset)
    begin
    if reset = '1' then
        state_reg <= zero;
    elsif clk'event and clk = '1' then
        state_reg <= state_next;
    end if;
    end process;

    --fsm logic
    process(level,state_reg)
    begin
        state_next <= state_reg;
        falling_edge_level <= '0';
        rising_edge_level <= '0'; 
        case state_reg is
            when zero =>
                if level = '1' then
                    rising_edge_level <= '1';
                    state_next <= one;
                end if;
            when one => 
                if level = '0' then
                    falling_edge_level <= '1';
                    state_next <= zero;
                end if;
        end case;
    end process;
end arch_dual_edge_det_mealy;
                    
                    
                    




