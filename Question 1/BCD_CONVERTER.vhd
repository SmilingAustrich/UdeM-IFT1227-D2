library ieee;
use ieee.std_logic_1164.all;

entity BCD_CONVERTER is
    port(
        b: in STD_LOGIC_VECTOR(3 downto 0);
        c: out STD_LOGIC_VECTOR(7 downto 0);
        affS: out STD_LOGIC_VECTOR(6 downto 0);
        affCh: out STD_LOGIC_VECTOR(6 downto 0)
    );
end BCD_CONVERTER;

architecture struct of BCD_CONVERTER is
    component BCD
        port(
            b: in STD_LOGIC_VECTOR(3 downto 0);
            c: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component Afficheur_BCD
        port(
            c: in STD_LOGIC_VECTOR(7 downto 0);
            affS: out STD_LOGIC_VECTOR(6 downto 0); -- Sign Display
            affCh: out STD_LOGIC_VECTOR(6 downto 0) -- Digit Display
        );
    end component;

    -- Internal signal to connect BCD and Afficheur_BCD components

    signal internal_c : STD_LOGIC_VECTOR(7 downto 0);
begin

    bcd_c_a_2: BCD port map(
        b => b,
        c => internal_c
    );
  
    afficheur_bcd_1: Afficheur_BCD port map(
        c => internal_c,
        affS => affS,
        affCh => affCh
    );
end struct;