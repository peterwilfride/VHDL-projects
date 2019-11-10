library ieee;
use ieee.std_logic_1164.all;
 
entity wait_statement is
	port(clk_in: in std_logic;
			clk_out: buffer std_logic);
end wait_statement;

architecture behave of wait_statement is
	signal aux: std_logic;
	signal contador: integer range 0 to 10;
  begin
		process (clk_in)
		begin
		if (clk_in'event and clk_in = '1') then
			contador <= contador + 1;
		
			if (contador = 10 and clk_out = '0') then
				clk_out <= '1';
				contador <= 0;
			end if;
			if (contador = 10 and clk_out = '1') then
				clk_out <= '0';
				contador <= 0;
			end if;
		end if;
	end process;

end behave;