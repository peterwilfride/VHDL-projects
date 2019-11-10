library ieee;
use ieee.std_logic_1164.all;

entity subtrador_1b is
	port(a, b, win : in std_logic;
			s, wout : out std_logic);
end subtrador_1b;

architecture behavior of subtrador_1b is
	begin
	s <= (not(a) and (b xor win)) or (a and (b xnor win));
	wout <= (not(a) and (b xor win)) or (b and win);
end behavior;