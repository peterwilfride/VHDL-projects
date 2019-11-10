library ieee;
use ieee.std_logic_1164.all;

entity down_counter4b is
	port(load_t, cnt_t, clk_t, clr_t: in std_logic;
			M: in std_logic_vector(3 downto 0);
			Q: out std_logic;
			Z: out std_logic_vector(3 downto 0));
end down_counter4b;

architecture behavior of down_counter4b is
	--components
	component mux is
		port(ent1, ent2: in std_logic_vector (3 downto 0);
				s: out std_logic_vector (3 downto 0);
				sel: in std_logic);
	end component;

	component registrador_4b is
		port (n : in std_logic_vector (3 downto 0);
				s : out std_logic_vector (3 downto 0);
				load, clk, clr: in std_logic);
	end component;

	component decrementer is
		generic(b: in std_logic_vector(3 downto 0):="0001";
					win : in std_logic:='0');
		port(a : in std_logic_vector(3 downto 0);
				s : out std_logic_vector(3 downto 0);
				wout : out std_logic);
	end component;
	
	--signals
	signal orToReg: std_logic;
	signal outOfReg: std_logic_vector(3 downto 0);
	signal decTomux: std_logic_vector(3 downto 0);
	signal muxToReg: std_logic_vector(3 downto 0);
	
	begin
		orToReg <= load_t or cnt_t; 
		
		--port maps
		a1: mux port map(M, decTomux, muxToReg, load_t);
		a2: registrador_4b port map(muxToReg,outOfReg,orToReg,clk_t,clr_t);
		a3: decrementer port map(outOfReg,decTomux);
		
		Z <= outOfReg;
		process(outOfReg)
			begin
			if outOfReg = "0000" then
				Q <= '1';
			else
				Q <= '0';
			end if;
		end process;
end behavior;
