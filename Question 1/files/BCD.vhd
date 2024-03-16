library ieee;
use ieee.std_logic_1164.all;

entity BCD is
port(b: in STD_LOGIC_VECTOR(3 downto 0);
     c: out STD_LOGIC_VECTOR(7 downto 0));
end BCD;

architecture synth of BCD is 
begin
  process(b) begin
    case b is
      when "0000" => c <= "10110000";
      when "0001" => c <= "10110001";
      when "0010" => c <= "10110010";
      when "0011" => c <= "10110011";
      when "0100" => c <= "10110100";
      when "0101" => c <= "10110101";
      when "0110" => c <= "10110110";
      when "0111" => c <= "10110111";
      when "1000" => c <= "11011000";
      when "1001" => c <= "11010111";
      when "1010" => c <= "11010110";
      when "1011" => c <= "11010101";
      when "1100" => c <= "11010100";
      when "1101" => c <= "11010011";
      when "1110" => c <= "11010010";
      when "1111" => c <= "11010001";
    end case;
  end process;
end;