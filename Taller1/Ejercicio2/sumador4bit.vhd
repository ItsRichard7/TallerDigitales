library ieee;
use ieee.std_logic_1164.all;

entity sumador4bit is
    port (
        A, B : in  std_logic_vector(3 downto 0);
        Cin  : in  std_logic;
        Sum  : buffer std_logic_vector(3 downto 0);
        Cout : out std_logic;
		  primerSumando : out std_logic_vector(6 downto 0);
		  segundoSumando : out std_logic_vector(6 downto 0);
		  resultadoSuma : out std_logic_vector(6 downto 0)
    );
end sumador4bit;

architecture Behavioral of sumador4bit is
    component sumador1bit is
        port (
            A, B, Cin : in  std_logic;
            Sum, Cout : out std_logic
        );
    end component;
	 
	 component decoder is
    Port (
        input : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(6 downto 0)
    );
end component decoder;

    signal Cout_temp : std_logic_vector(3 downto 0);
begin
	 D0: decoder port map (A, primerSumando);
	 D1: decoder port map (B, segundoSumando);
    S0: sumador1bit port map (A(0), B(0), Cin, Sum(0), Cout_temp(0));
    S1: sumador1bit port map (A(1), B(1), Cout_temp(0), Sum(1), Cout_temp(1));
    S2: sumador1bit port map (A(2), B(2), Cout_temp(1), Sum(2), Cout_temp(2));
    S3: sumador1bit port map (A(3), B(3), Cout_temp(2), Sum(3), Cout);
	 D2: decoder port map (Sum, resultadoSuma);
	
	 end Behavioral;