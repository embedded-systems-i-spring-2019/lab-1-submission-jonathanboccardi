library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity clock_div is
    port (
        clk  : in std_logic;
        div  : out std_logic
    );
end clock_div;

architecture new_clock of clock_div is
    signal count : std_logic_vector(25 downto 0) := (others => '0'); --only needs 26 bits to store 62500000
begin
    divider: process(clk) begin
        if (rising_edge(clk)) then   --rising edge means 1 clock cycle
            count <= std_logic_vector(unsigned(count) + 1 );    --add a clock cycle
            if (unsigned(count) = 62500000) then             -- pulse when half of clock cycle reached
                div <= '1';
                count <= std_logic_vector(to_unsigned(0,26));
            else                    --stay low
                div <= '0';
            end if;
        end if;
    end process divider;
end new_clock;

