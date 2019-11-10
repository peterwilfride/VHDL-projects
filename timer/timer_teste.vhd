library ieee;
use ieee.std_logic_1164.all;

entity timer_teste is
	port(load, enable, clk, clr: in std_logic;
			M: in std_logic_vector(3 downto 0);
			Q: out std_logic;
			Z: out std_logic_vector(3 downto 0));
end timer_teste;

architecture behavior of timer_teste is
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
	
	component down_counter4b is
	port(load_t, cnt_t, clk_t, clr_t: in std_logic;
			M: in std_logic_vector(3 downto 0);
			Q: out std_logic;
			Z: out std_logic_vector(3 downto 0));
	end component;

	
	--signals
	signal decTOreg: std_logic_vector(3 downto 0);
	signal decToMux: std_logic_vector(3 downto 0);
	signal regToMux: std_logic_vector(3 downto 0);
	signal muxToDownCounter: std_logic_vector(3 downto 0);
	signal downCounterToOr: std_logic;
	signal orToReg: std_logic;
	--signal andToCnt: std_logic;
	signal outOfDownCounter: std_logic;
	
	begin
		orToReg <= load or outOfDownCounter;
		--andToCnt <= enable and not(outOfDownCounter);
		
		--port maps
		t1: decrementer port map(M, decTOreg);
		t2: registrador_4b port map(decTOreg, regToMux, load, clk, clr);
		t3: mux port map(decToMux,regToMux, muxToDownCounter,load);
		t4: down_counter4b port map(orToReg, enable, clk, clr, muxToDownCounter, outOfDownCounter, Z);
		
		Q <= outOfDownCounter;
end behavior;
