library ieee;
use ieee.std_logic_1164.all;

entity Afficheur_BCD is
port(
    c: in STD_LOGIC_VECTOR(7 downto 0);
    affS: out STD_LOGIC_VECTOR(6 downto 0); -- Sign Display
    affCh: out STD_LOGIC_VECTOR(6 downto 0) -- Digit Display
);
end Afficheur_BCD;

architecture synth of Afficheur_BCD is
begin
    process(c)
    begin
        -- Determiner le signe selon les 4 premiers bits les plus significatifs
        if c(7 downto 4) = "1101" then 
            affS <= "0111111"; -- indicateur de Signe = negatif
        else
            affS <= "1111111"; -- indicateur de Signe = positif (OFF)
        end if;
        
        -- Decodage du DCB
        case c(3 downto 0) is
            when "0000" => affCh <= "1000000"; -- 0
            when "0001" => affCh <= "1111001"; -- 1
            when "0010" => affCh <= "0100100"; -- 2
            when "0011" => affCh <= "0110000"; -- 3
            when "0100" => affCh <= "0011001"; -- 4
            when "0101" => affCh <= "0010010"; -- 5
            when "0110" => affCh <= "0000010"; -- 6
            when "0111" => affCh <= "1111000"; -- 7
            when "1000" => affCh <= "0000000"; -- 8
            when "1001" => affCh <= "0011000"; -- 9
            when others => affCh <= "1111111"; -- etat invalide 
        end case;
    end process;
end synth;
