library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity clock_div_tb is
end clock_div_tb;

architecture tb of clock_div_tb is

    component clock_div
        port (
            clk  : in std_logic;
            div  : out std_logic
        );
    end component;
    
    signal tb_clk : std_logic := '0';
    signal tb_div : std_logic := '0';  

begin

    assign: clock_div port map (clk => tb_clk, div => tb_div);
    testbench: process begin        --one full clock cycle in 125MHz is 8ns
            tb_clk <= '0';
            wait for 4 ns;
            tb_clk <= '1';
            wait for 4 ns;
    end process;

end tb;
