library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main is
	generic(
		TOMULT : integer := 8;
		TESTE  : integer := 16
	);
	port(
		in1 : in std_logic_vector((TOMULT - 1) downto 0);
		in2 : in std_logic_vector((TOMULT - 1) downto 0);
		
		clk : in std_logic;
		res : in std_logic;
		
		sai : out std_logic_vector((TOMULT - 1) downto 0)
	);
end entity main;

architecture behavior of main is

	signal ff_A : std_logic_vector(7 downto 0);
	signal ff_B : std_logic_vector(7 downto 0);

	signal a : std_logic_vector((TESTE - 1) downto 0);
	signal b : std_logic_vector((TESTE - 1) downto 0);
	signal c : std_logic_vector((TESTE - 1) downto 0);
	signal d : std_logic_vector((TOMULT - 1) downto 0);	
	signal e : std_logic_vector((TESTE - 1) downto 0) := "0000000000100000";
	signal f : std_logic_vector((TOMULT - 1) downto 0);	

begin

	a <= std_logic_vector(unsigned(FF_A) * unsigned(FF_A));
	b <= std_logic_vector(unsigned(a(7 downto 0)) * unsigned(FF_B));
	c <= std_logic_vector(unsigned(b(7 downto 0)) + unsigned(e));
	d <= c(6 downto 0) & '0';
	f <= std_logic_vector(unsigned(c(7 downto 0)) + unsigned(d(7 downto 0))); 
	

	
	process(clk, res)
	begin
	
		if(res = '1')then
			ff_A <= (others => '0');
			ff_B <= (others => '0');
			sai  <= (others => '0');
		elsif(rising_edge(clk))then
			ff_A <= in1;
			ff_B <= in2;
			sai  <= f(7 downto 0);
		end if;
	
	end process;
	
end architecture behavior;