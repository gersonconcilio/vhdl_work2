library ieee;
use ieee.std_logic_1164.all;

entity tb_main is 
	 generic(
        ADDR_WIDTH_ex : natural := 8;
        DATA_WIDTH_ex : natural := 16
    );
end entity tb_main;

architecture behavior of tb_main is

component main is
	generic(
		TOMULT : natural;
		TESTE  : natural
	);
	port(
		in1 : in std_logic_vector((TOMULT - 1) downto 0);
		in2 : in std_logic_vector((TOMULT - 1) downto 0);
		
		clk : in std_logic;
		res : in std_logic;
		
		sai : out std_logic_vector((TOMULT - 1) downto 0)
	);
end component main;

signal in1_sg : std_logic_vector((ADDR_WIDTH_ex - 1) downto 0) := "0000_0010";
signal in2_sg : std_logic_vector((ADDR_WIDTH_ex - 1) downto 0) := "0000_0011";
signal clk_sg : std_logic := '1';
signal res_sg : std_logic := '1';
signal sai_sg : std_logic_vector((ADDR_WIDTH_ex - 1) downto 0);

begin

	inst_main : main 
		generic map(
			TOMULT => ADDR_WIDTH_ex,
			TESTE  => DATA_WIDTH_ex
		)
		port map(
			in1 => in1_sg, 
			in2 => in2_sg,			
			clk => clk_sg,
			res => res_sg,			
			sai => sai_sg
		);
		
		clk_sg <= not clk_sg after 10 ns;
		
		process
		begin
		
			wait for 5 ns;
				rst_sg <= '0';
			wait for 10 ns;
				in1_sg <= "0000_0001";
				in2_sg <= "0000_0101";
			wait for 10 ns;
				in1_sg <= "0001_0001";
				in2_sg <= "0001_0101";
			wait for 10 ns;
				in1_sg <= "0000_1001";
				in2_sg <= "0000_0111";
			wait for 10 ns;
				in1_sg <= "0010_0001";
				in2_sg <= "0000_1111";
			wait for 10 ns;
				in1_sg <= "0000_0001";
				in2_sg <= "0000_0101";
			wait for 10 ns;
				in1_sg <= "0000_1001";
				in2_sg <= "0010_0101";
			wait for 10 ns;
				in1_sg <= "0011_0101";
				in2_sg <= "0100_0111";
			wait for 10 ns;
				in1_sg <= "0010_0001";
				in2_sg <= "0000_1101";
			wait for 10 ns;
				in1_sg <= "0010_0001";
				in2_sg <= "0001_0111";
			wait;
		
		end process;

end architecture behavior;