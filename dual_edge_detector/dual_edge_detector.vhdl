library ieee;
use ieee.std_logic_1164.all;

entity dual_edge_detector is
    port(
        clk, reset: in std_logic;
        level: in std_logic;
        rising_edge_level, falling_edge_level: out std_logic
    );
end dual_edge_detector;

architecture arch_dual_edge of dual_edge_detector is
    type state_type is (zero, edge_rise, edge_fall, one); 
    signal state_reg, state_next:  state_type;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state_reg <= zero;
        elsif (clk'event and clk = '1') then
            state_reg <= state_next;
        end if;
    end process;
    
    process(state_reg, level)
    begin
        state_next <= state_reg;
        rising_edge_level <= '0';
        falling_edge_level <= '0';
        case state_reg is 
            when zero => 
                if level = '1' then
                    state_next <= edge_rise;
                end if;
            when edge_rise =>
                rising_edge_level <= '1';
                if level = '1' then
                    state_next <= one;
                elsif level = '0' then
                    state_next <= edge_fall;
                end if;
            when one => 
                if level = '0' then
                    state_next <= edge_fall;
                end if;
            when edge_fall =>
                falling_edge_level <= '1'; 
                if level = '1' then 
                    state_next <= edge_rise;
                elsif level = '0' then
                    state_next <= zero;
                end if; 
        end case;
    end process;
end arch_dual_edge; 






