library ieee;
use ieee.std_logic_1164.all;

entity sumador1bit_tb is
end sumador1bit_tb;

architecture Behavioral of sumador1bit_tb is
    component sumador1bit is
        port (
            A, B, Cin : in  std_logic;
            Sum, Cout : out std_logic
        );
    end component;

    signal A_tb, B_tb, Cin_tb : std_logic;
    signal Sum_tb, Cout_tb    : std_logic;
begin
    UUT: sumador1bit port map (A_tb, B_tb, Cin_tb, Sum_tb, Cout_tb);

    stimulus: process
    begin
        A_tb <= '0'; B_tb <= '0'; Cin_tb <= '0';
        wait for 40 ns;

        A_tb <= '1'; B_tb <= '0'; Cin_tb <= '0';
        wait for 40 ns;
		  
		  A_tb <= '0'; B_tb <= '1'; Cin_tb <= '0';
        wait for 40 ns;
		  
		  A_tb <= '1'; B_tb <= '1'; Cin_tb <= '0';
        wait for 40 ns;

        wait;
    end process;
end Behavioral;