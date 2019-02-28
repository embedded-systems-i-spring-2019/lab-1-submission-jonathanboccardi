library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fancy_counter is
    port (
        clk     : in std_logic;
        clk_en  : in std_logic;
        dir     : in std_logic;
        en      : in std_logic;
        ld      : in std_logic;
        rst     : in std_logic;
        updn    : in std_logic;
        val     : in std_logic_vector(3 downto 0);
        cnt     : out std_logic_vector(3 downto 0)
    );
end fancy_counter;

architecture Behavioral of fancy_counter is
    signal count    : std_logic_vector(3 downto 0) := (others => '0');
    signal value    : std_logic_vector(3 downto 0) := (others => '0');
    signal direction: std_logic := '0';
begin

    process(clk, clk_en) begin
        if (en = '1') then
            if (rst = '1') then
                count <= (others => '0');
            elsif (rising_edge(clk)) then
                if (rst = '1') then
                    count <= (others => '0');
                elsif (ld = '1') then
                    value <= val;
                elsif (updn = '1') then
                    direction <= dir;
                    if (dir = '1') then
                        count <= std_logic_vector(unsigned(count) + 1);
                        cnt <= count;
                        if (unsigned(count) = unsigned(value)) then
                            count <= (others => '0');
                            cnt <= count;
                        end if;
                    else
                        count <= std_logic_vector(unsigned(count) - 1);
                        cnt <= count;
                        if (unsigned(count) = "0000") then
                            count <= value;
                            cnt <= count;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
