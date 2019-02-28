library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounce_tb is
end debounce_tb;

architecture tb of debounce_tb is
    component debounce
        port (
            clk : in std_logic;
            btn : in std_logic;
            dbnc: out std_logic
            );
    end component;
    
    signal clk  : std_logic := '0';
    signal btn  : std_logic := '0';
    signal dbnc : std_logic := '0';
begin

assign: debounce port map(clk => clk, btn => btn, dbnc => dbnc);

clock: process begin
    clk <= '1';
    wait for 4 ns;
    clk <= '0';
    wait for 4 ns;
end process;

button: process begin
    --test 1
    btn <= '0';
    wait for 5ms;
    
    --bounce
    btn <= '1';
    wait for 2ms;
    btn <= '0';
    wait for 3ms;
    btn <= '1';
    wait for 19ms;
    btn <= '0';
    wait for 1ms;
    btn <= '1';
    wait for 4ms;
    btn <= '0';
    wait for 6ms;        
    
    --40ms passed
    
    --test 2
    btn <= '0';
    wait for 5ms;
    
    --bounce
    btn <= '1';
    wait for 2ms;
    btn <= '0';
    wait for 3ms;
    btn <= '1';
    wait for 19ms;
    btn <= '0';
    wait for 1ms;
    btn <= '1';
    wait for 25ms; --on at 90ms
    
    --95ms passed
    
    --test 3
    btn <= '0';
    wait for 5ms;
    
    --bounce
    btn <= '1';
    wait for 1ms;
    btn <= '0';
    wait for 1ms;
    btn <= '1';
    wait for 5ms;
    btn <= '0';
    wait for 3ms;
    btn <= '1';
    wait for 40ms; --on at 130ms
    
    btn <= '0';
    wait;
end process;
end tb;
