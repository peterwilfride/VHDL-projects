library ieee;
use ieee.std_logic_1164.all;

entity registrador4b is
	port (n : in std_logic_vector (3 downto 0);
			s : out std_logic_vector (3 downto 0);
			clk: in std_logic);
end registrador4b;

architecture behavior of registrador4b is
	begin
	process (clk)
		begin
			if clk'event and clk = '1' then
				s <= n;
			end if;
	end process;
end behavior;
library ieee;
use ieee.std_logic_1164.all;

entity timer_teste is
	port(clk_1, t: in std_logic;
			z: out std_logic);
end timer_teste;

architecture behave of timer_teste is
	
end behave;