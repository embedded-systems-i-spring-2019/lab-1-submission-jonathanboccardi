library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_top is
    port (
        btn : in std_logic_vector(3 downto 0);
        clk : in std_logic;
        sw  : in std_logic_vector(3 downto 0);
        led : out std_logic_vector(3 downto 0)
    );
end counter_top;

architecture ct of counter_top is
    component debounce
        port(
            clk : in std_logic;
            btn : in std_logic;
            dbnc: out std_logic
        );
    end component;
    
    component clock_div
        port (
            clk  : in std_logic;
            div  : out std_logic
        );
    end component;
    
    component fancy_counter
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
    end component;
    
    signal db1      : std_logic := '0';
    signal db2      : std_logic := '0';
    signal db3      : std_logic := '0';
    signal db4      : std_logic := '0';
    signal slw_clk  : std_logic := '0';
    
begin
    
    u1: debounce port map( btn => btn(0), clk => clk, dbnc => db1);
    u2: debounce port map( btn => btn(1), clk => clk, dbnc => db2);
    u3: debounce port map( btn => btn(2), clk => clk, dbnc => db3);
    u4: debounce port map( btn => btn(3), clk => clk, dbnc => db4);
    
    u5: clock_div port map( clk => clk, div => slw_clk);
    
    u6: fancy_counter port map  (   clk     => clk,
                                    clk_en  => slw_clk,
                                    dir     => sw(0),
                                    en      => db2,
                                    ld      => db4,
                                    rst     => db1,
                                    updn    => db3,
                                    val     => sw,
                                    cnt     => led
                                );
end ct;