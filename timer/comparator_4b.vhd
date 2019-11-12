library ieee;
use ieee.std_logic_1164.all;

entity comparator_4b is
	generic(in_gt: in std_logic:='1';
				in_lt: in std_logic:='0');
	port(a: in std_logic_vector(3 downto 0);
			b: in std_logic_vector(3 downto 0);
			AgtB, AltB: out std_logic);
end comparator_4b;

architecture behavior of comparator_4b is
	signal out_gt1: std_logic;
	signal out_lt1: std_logic;
	signal out_gt2: std_logic;
	signal out_lt2: std_logic;
	signal out_gt3: std_logic;
	signal out_lt3: std_logic;
	
	begin
		out_gt1 <= in_gt or (in_gt and a(3) and not(b(3)));
		out_lt1 <= in_lt or (in_lt and not(a(3)) and b(3));
		out_gt2 <= out_gt1 or (out_gt1 and a(2) and not(b(2)));
		out_lt2 <= out_lt1 or (out_lt1 and not(a(2)) and b(2));
		out_gt3 <= out_gt2 or (out_gt2 and a(1) and not(b(1)));
		out_lt3 <= out_lt2 or (out_lt2 and not(a(1)) and b(1));
		AgtB <= out_gt3 or (out_gt3 and a(0) and not(b(0)));
		AltB <= out_lt3 or (out_lt3 and not(a(0)) and b(0));
end behavior;
