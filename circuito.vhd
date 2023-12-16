library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuito is
	port(
		input1 : in std_logic_vector(7 downto 0);
		input2 : in std_logic_vector(7 downto 0);
		
		clk 	 : in std_logic;
		res 	 : in std_logic;
		
		sai    : out std_logic_vector(7 downto 0)
	);
end entity circuito;

architecture behavior of circuito is

signal FF_A  : std_logic_vector(7 downto 0);
signal FF_B  : std_logic_vector(7 downto 0);
signal FF_Bp : std_logic_vector(7 downto 0);
signal FF_C  : std_logic_vector(7 downto 0);
signal FF_D  : std_logic_vector(7 downto 0);
signal FF_E  : std_logic_vector(7 downto 0);

signal aux1  : std_logic_vector(7 downto 0) := "01000000";

signal mult1 : std_logic_vector(15 downto 0);
signal mult2 : std_logic_vector(15 downto 0);
signal soma1 : std_logic_vector(7 downto 0);
signal soma2 : std_logic_vector(7 downto 0);

begin

	mult1 <= std_logic_vector(unsigned(FF_A) * unsigned(FF_A));
	mult2 <= std_logic_vector(unsigned(FF_C) * unsigned(FF_B));
	soma1 <= std_logic_vector(unsigned(FF_D) + unsigned(aux1));
	soma2 <= std_logic_vector(unsigned(FF_D(6 downto 0) & '0') + unsigned(FF_E));

	process(clk, res)
	begin
		
		if(res = '1')then
			sai	 <= (others => '0');
		elsif(rising_edge(clk))then
			FF_A  <= input1;
			FF_B  <= input2;
			FF_Bp <= FF_B;
			FF_C  <= mult1(7 downto 0);
			FF_D  <= mult2(7 downto 0);
			FF_E  <= soma1;
			sai   <= soma2;
		end if;
		
	end process;


end architecture behavior;