library ieee;
use ieee.std_logic_1164.all;

entity sumador4bit_tb is
end sumador4bit_tb;

architecture Behavioral of sumador4bit_tb is
    component sumador4bit is
        port (
            A, B : in  std_logic_vector(3 downto 0);
            Cin  : in  std_logic;
            Sum  : buffer std_logic_vector(3 downto 0);
            Cout : out std_logic;
				primerSumando : out std_logic_vector(6 downto 0);
				segundoSumando : out std_logic_vector(6 downto 0);
				resultadoSuma : out std_logic_vector(6 downto 0)
        );
    end component;

    signal A_tb, B_tb          : std_logic_vector(3 downto 0);
    signal Cin_tb              : std_logic;
    signal Sum_tb              : std_logic_vector(3 downto 0);
    signal Cout_tb 				 : std_logic;
	 signal primerSumando_tb 		 : std_logic_vector(6 downto 0);
	 signal segundoSumando_tb      : std_logic_vector(6 downto 0);
	 signal resultadoSuma_tb       : std_logic_vector(6 downto 0);
	 
begin
    UUT: sumador4bit port map (A_tb, B_tb, Cin_tb, Sum_tb, Cout_tb, primerSumando_tb, segundoSumando_tb, resultadoSuma_tb);

    stimulus: process
    begin
        A_tb <= "0000"; B_tb <= "0000"; Cin_tb <= '0';
        wait for 40 ns;

        A_tb <= "1010"; B_tb <= "0101"; Cin_tb <= '0';
        wait for 40 ns;
		  
		  A_tb <= "1011"; B_tb <= "1101"; Cin_tb <= '0';
        wait for 40 ns;
		  
		  A_tb <= "1000"; B_tb <= "0011"; Cin_tb <= '0';
        wait for 40 ns;
		  
		  A_tb <= "1111"; B_tb <= "1111"; Cin_tb <= '0';
        wait for 40 ns;

        wait;
    end process;
end Behavioral;