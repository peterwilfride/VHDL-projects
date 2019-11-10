library ieee;
use ieee.std_logic_1164.all;

ENTITY memory is
	PORT(AX, BX, AY, BY, escrever, clock: IN std_LOGIC;
		  entdados, ler: IN STD_LOGIC_VECTOR (7 downto 0);
		  saidadados: OUT STD_LOGIC_VECTOR (7 downto 0));
END memory;

architecture comportamento of memory is
	component decoder is
	PORT(A, B: IN STD_LOGIC;
		  s0, s1, s2, s3: OUT STD_LOGIC);
	END component;

	component registrador8b IS
	PORT (DATAIN : IN STD_LOGIC_VECTOR (7 downto 0);
			CLK: IN STD_LOGIC;
			SX, SY, W: IN STD_LOGIC;
			DATAOUT : OUT STD_LOGIC_VECTOR (7 downto 0);
			Q: BUFFER STD_LOGIC_VECTOR (7 downto 0));
	END component;

	SIGNAL s0x, s1x, s2x, s3x: std_LOGIC;
	SIGNAL s0y, s1y, s2y, s3y: std_LOGIC;
	--SIGNAL clock: STD_LOGIC;
	SIGNAL sx, sy: STD_LOGIC;
	SIGNAL dado: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados1: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados2: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados3: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados4: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados5: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados6: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados7: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados8: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados9: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados10: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados11: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados12: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados13: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados14: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados15: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saidados16: STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL saida1, saida2, saida3, saida4, saidaFinal: STD_LOGIC_VECTOR (7 downto 0);
	begin
		u1: decoder port map(A=>AX, B=>BX, s0=>s0x, s1=>s1x, s2=>s2x, s3=>s3x);
		u2: decoder port map(A=>AY, B=>BY, s0=>s0y, s1=>s1y, s2=>s2y, s3=>s3y);
		r1: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s0x, SY=>s0y, W=>escrever, DATAOUT=>saidados1, Q=>dado);
		r2: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s0x, SY=>s1y, W=>escrever, DATAOUT=>saidados2, Q=>dado);
		r3: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s0x, SY=>s2y, W=>escrever, DATAOUT=>saidados3, Q=>dado);
		r4: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s0x, SY=>s3y, W=>escrever, DATAOUT=>saidados4, Q=>dado);
		r5: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s1x, SY=>s0y, W=>escrever, DATAOUT=>saidados5, Q=>dado);
		r6: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s1x, SY=>s1y, W=>escrever, DATAOUT=>saidados6, Q=>dado);
		r7: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s1x, SY=>s2y, W=>escrever, DATAOUT=>saidados7, Q=>dado);
		r8: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s1x, SY=>s3y, W=>escrever, DATAOUT=>saidados8, Q=>dado);
		r9: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s2x, SY=>s0y, W=>escrever, DATAOUT=>saidados9, Q=>dado);
		r10: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s2x, SY=>s1y, W=>escrever, DATAOUT=>saidados10, Q=>dado);
		r11: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s2x, SY=>s2y, W=>escrever, DATAOUT=>saidados11, Q=>dado);
		r12: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s2x, SY=>s3y, W=>escrever, DATAOUT=>saidados12, Q=>dado);
		r13: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s3x, SY=>s0y, W=>escrever, DATAOUT=>saidados13, Q=>dado);
		r14: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s3x, SY=>s1y, W=>escrever, DATAOUT=>saidados14, Q=>dado);
		r15: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s3x, SY=>s2y, W=>escrever, DATAOUT=>saidados15, Q=>dado);
		r16: registrador8b port map(DATAIN=>entdados, CLK=>clock, SX=>s3x, SY=>s3y, W=>escrever, DATAOUT=>saidados16, Q=>dado);
		
		saida1 <= saidados1 or saidados2 or saidados3 or saidados4;
		saida2 <= saidados5 or saidados6 or saidados7 or saidados8;
		saida3 <= saidados9 or saidados10 or saidados11 or saidados12;
		saida4 <= saidados13 or saidados14 or saidados15 or saidados16;
		saidaFinal <= saida1 or saida2 or saida3 or saida4;
		
		saidadados <= saidaFinal and ler;
end comportamento;