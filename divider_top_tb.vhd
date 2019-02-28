library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_top_tb is
end divider_top_tb;

architecture tb of divider_top_tb is

    component divider_top
        port (
            clk   : in std_logic;
            led0  : out std_logic
        );
    end component;
    
    signal tb_clk : std_logic := '0';
    signal tb_led : std_logic := '0';  

begin

    assign: divider_top port map (clk => tb_clk, led0 => tb_led);
    clock: process begin        --one full clock cycle in 125MHz is 8ns
            tb_clk <= '0';
            wait for 4 ns;
            tb_clk <= '1';
            wait for 4 ns;
    end process;

end tb;
