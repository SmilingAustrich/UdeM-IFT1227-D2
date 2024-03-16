library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MooreFSM is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           x : in STD_LOGIC;
           y : out STD_LOGIC);
end MooreFSM;

architecture synth of MooreFSM is
    type state_type is (s0, s1, s2, s3, s4, s5);
    signal current_state, next_state : state_type;
begin

    process(clk,reset) begin
        if reset = '1' then current_state <= s0;
        elsif clk'event and clk = '1' then current_state <= next_state;
            end if;
    end process;


    process(current_state, x)
    begin
        case current_state is
            when s0 =>
                if x = '0' then
                    next_state <= s1;
                else
                    next_state <= s0;
                end if;
            when s1 =>
                if x = '0' then
                    next_state <= s1;
                else
                    next_state <= s2;
                end if;
            when s2 =>
                if x = '0' then
                    next_state <= s1;
                else
                    next_state <= s3;
                end if;
            when s3 =>
                if x = '1' then
                    next_state <= s4;
                else
                    next_state <= s5;
                end if;
            when s4 =>
                if x = '0' then
                    next_state <= s1;
                else
                    next_state <= s0;
                end if;
            when s5 =>
                if x = '0' then
                    next_state <= s1;
                else
                    next_state <= s2;
                end if;
            when others =>
                next_state <= s0;
        end case;
    end process;


    y <= '1' when (current_state = s4 or current_state = s5) else '0';



end synth;