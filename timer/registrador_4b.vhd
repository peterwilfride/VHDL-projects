library ieee;
use ieee.std_logic_1164.all;

entity registrador_4b is
	port (n : in std_logic_vector (3 downto 0);
			s : out std_logic_vector (3 downto 0);
			load, clk, clr: in std_logic);
end registrador_4b;

architecture behavior of registrador_4b is
	begin
	process(clk, load)
		begin
			if clk'event and clk = '1' and load = '1' then
				s <= n;
			end if;
			if clr = '1' then
				s <= "0000";
			end if;
	end process;
end behavior;