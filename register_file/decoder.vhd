library ieee;
use ieee.std_logic_1164.all;

ENTITY decoder IS
	PORT (A, B: IN STD_LOGIC;
			s0, s1, s2, s3: out STD_LOGIC);
END decoder;

architecture comportamento of decoder is
begin
	s0 <= A and B;
	s1 <= A and (not B);
	s2 <= (not A) and B;
	s3 <= (not A) and (not B);
end comportamento;

