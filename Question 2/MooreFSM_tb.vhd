library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MooreFSM_tb is
end entity;

architecture tb_architecture of MooreFSM_tb is
    component MooreFSM
        port(clk, reset: in STD_LOGIC;
             x: in STD_LOGIC;
             y: out STD_LOGIC);
    end component;

    signal clk, reset, x, y: STD_LOGIC;

begin
    -- Instantiating the MooreFSM component along with its inputs and outputs
    dut: MooreFSM port map (
        clk => clk,
        reset => reset,
        x => x,
        y => y
    );

    -- Clock generation for the FSM
    process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- Test process
    process
    begin
        -- Initial reset
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;

        -- Sequence to check for 0110
        x <= '0'; wait for 10 ns; -- Bit 1 s0 to s1
        x <= '1'; wait for 10 ns; -- Bit 2 s1 to s2
        x <= '1'; wait for 10 ns; -- Bit 3 s2 to s3
        x <= '0'; wait for 10 ns; -- Bit 4,s3 to s4: it should match 0110
        assert y = '1' report "Test for sequence 0110 failed";

        -- Reset
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;

        -- Sequence to check for 0111
        x <= '0'; wait for 10 ns; -- Bit 1 s0 to s1
        x <= '1'; wait for 10 ns; -- Bit 2 s1 to s2
        x <= '1'; wait for 10 ns; -- Bit 3 s2 to s3
        x <= '1'; wait for 10 ns; -- Bit 4,s3 to s5: should match 0111
        assert y = '1' report "Test for sequence 0111 failed";

        -- Reset back to s0
        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        report "All tests passed";
        wait;
    end process;
end tb_architecture;
