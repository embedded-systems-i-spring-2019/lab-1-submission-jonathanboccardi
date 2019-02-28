library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_top is
    port(
        clk : in std_logic;
        led0: out std_logic
    );
end divider_top;

architecture beh of divider_top is

    component clock_div
        port (
            clk  : in std_logic;
            div  : out std_logic
        );
    end component;
    
    signal led  : std_logic := '0';
    signal div  : std_logic;
begin

    assign: clock_div port map(clk => clk, div => div);

    led_reg: process(clk) begin
        if (rising_edge(clk)) then
            if (div = '1') then
                led <= not led;
            end if;
       end if;
       led0 <= led;
    end process;
   
end beh;