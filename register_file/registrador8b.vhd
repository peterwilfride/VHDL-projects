library ieee;
use ieee.std_logic_1164.all;

ENTITY registrador8b IS
	PORT (DATAIN : IN STD_LOGIC_VECTOR (7 downto 0);
			CLK: IN STD_LOGIC;
			SX, SY, W: IN STD_LOGIC;
			DATAOUT : OUT STD_LOGIC_VECTOR (7 downto 0);
			Q: BUFFER STD_LOGIC_VECTOR (7 downto 0));
END registrador8b;

ARCHITECTURE comp OF registrador8b IS 
	SIGNAL mux_sel_out: STD_LOGIC;
	SIGNAL L: STD_LOGIC;
	BEGIN
	L <= SX AND SY AND W;
	mux_sel_out <= SX AND SY;
	PROCESS (CLK, L)
		BEGIN
			IF CLK'EVENT AND CLK = '1' THEN
				IF L = '1' THEN
					Q <= DATAIN;
				ELSE 
					Q <= Q;
				END IF;
				IF mux_sel_out = '1' THEN
					DATAOUT <= Q;
				ELSE
					DATAOUT <= "00000000";
				END IF;
			END IF;
	END PROCESS;
END comp;