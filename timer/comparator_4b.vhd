library ieee;
use ieee.std_logic_1164.all;

entity comparator_4b is
	generic(in_eq: in std_logic:='1';
				b: in std_logic_vector(3 downto 0):="0000");
	port(a: in std_logic_vector(3 downto 0);
			aeqb: out std_logic);
end comparator_4b;

architecture behavior of comparator_4b is
	signal out_eq1: std_logic;
	signal out_eq2: std_logic;
	signal out_eq3: std_logic;
	
	begin
	out_eq1 <= in_eq and (a(0) xnor b(0));
	out_eq2 <= out_eq1 and (a(1) xnor b(1));
	out_eq3 <= out_eq2 and (a(2) xnor b(2));
	aeqb <= out_eq3 and (a(3) xnor b(3));
end behavior;
