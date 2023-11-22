library ieee;
use ieee.std_logic_1164.all;

entity prio_encode is
    port(
        r: in std_logic_vector(3 downto 0);
        pcode: out std_logic_vector(2 downto 0)
        );
end prio_encode;

--architecture arch_prio_encode of prio_encode is
--begin
--    pcode <= "100" when (r(4) = '1') else
--             "011" when (r(3) = '1') else
--             "010" when (r(2) = '1') else
--             "001" when (r(1) = '1') else
--             "000";
--end arch_prio_encode;
-----------------------------------------------------------
--architecture arch_prio_encode of prio_encode is
--begin
--    with r select
--        pcode <= "100" when "1000" | "1001" | "1010" | "1011"
--                            | "1100" | "1101" | "1110" | "1111",
--                 "011" when "0100" | "0101" | "0110" | "0111", 
--                 "010" when "0010" | "0011",
--                 "001" when "0001",
--                 "000" when others; 
--end arch_prio_encode;
-----------------------------------------------------------
-- architecture arch_prio_encode of prio_encode is
-- begin
--     process(r)
--     begin
--         if (r(4) = '1') then
--             pcode <= "100";
--         elsif (r(3) = '1') then
--             pcode <= "011";
--         elsif (r(2) = '1') then
--             pcode <= "010";
--         elsif (r(1) = '1') then
--             pcode <= "001";
--         else
--             pcode <= "000";
--         end if;
--     end process;
-- end arch_prio_encode;   
-----------------------------------------------------------
architecture arch_prio_encode of prio_encode is
begin
    process(r)
    begin
        case r is
            when "1000" | "1001" | "1010" | "1011" | "1100" | "1101" | "1110" | "1111" =>
                pcode <= "100";
            when "0100" | "0101" | "0110" | "0111" =>
                pcode <= "011";
            when "0010" | "0011" =>
                pcode <= "010";
            when "0001" => 
                pcode <= "001";
            when others =>
                pcode <= "000";   
        end case;
    end process;
end arch_prio_encode;
    