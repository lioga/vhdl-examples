library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sign_magnitude_adder is
    generic(N: integer := 4);
    port(
        in0, in1: in std_logic_vector(N-1 downto 0);
        result: out std_logic_vector(N-1 downto 0)
    );
end sign_magnitude_adder;

architecture arch_sign_magnitude_adder of sign_magnitude_adder is
    signal sign0, sign1, sign_sum: std_logic;
    signal nb0,nb1: unsigned(N-2 downto 0);
    signal nb_sum, nb_max, nb_min: unsigned(N-2 downto 0);

begin
    sign0 <= in0(N-1);
    sign1 <= in1(N-1);
    nb0 <= unsigned(in0(N-2 downto 0));
    nb1 <= unsigned(in0(N-2 downto 0));

    process(in0, in1)
    begin
        if nb0 > nb1 then
            nb_min <= nb1;
            nb_max <= nb0;
            sign_sum <= sign0;
        else
            nb_min <= nb0;  
            nb_max <= nb1;
            sign_sum <= sign1;
        end if;            
    end process;

    nb_sum <= nb_max + nb_min when sign0 = sign1 else
    nb_max - nb_min;

    result <= sign_sum & std_logic_vector(nb_sum);

end arch_sign_magnitude_adder;
