entity dispsimp0 is
port (s4, s3, s2, s1: in bit;
H7, H6, H5, H4, H3, H2, H1: out bit);
end dispsimp0;
architecture comportamento of dispsimp0 is
begin
H1<=(((not s3) and (not s2) and (not s1)) or ((not s4) and (s2)) or ((s3) and (s2)) or ((not s4) and (s3) and (s1)) or ((s4) and (not s2) and (not s1)) or ((s4) and (not s3) and (not s2)) or ((s4) and (s2) and (not s1)));
H2<=(((not s4) and (not s2) and (not s1)) or ((not s4) and (s2) and (s1)) or ((not s4) and (not s3) and (s2)) or ((not s3) and (s2) and (not s1)) or ((s4) and (not s2) and (s1)) or ((s4) and (not s3) and (not s2)));
H3<=(((not s4) and (not s2) and (not s1)) or ((not s4) and (s3)) or ((s4) and (not s2) and (s1)) or ((s4) and (not s3)));
H4<=(((not s4) and (not s3) and (not s1)) or ((not s4) and (not s3) and (s2)) or ((s3) and (not s2) and (s1)) or ((s3) and (s2) and (not s1)) or ((s4) and (not s2)) or ((s4) and (not s3) and (s1)));
H5<=(((not s4) and (not s3) and (not s2)) or ((s2) and (not s1)) or ((s4) and (s3) and (not s2)) or ((s4) and (not s1)) or ((s4) and (s2)));
H6<=(((not s4) and (not s2)) or ((s3) and (not s1)) or ((s4) and (not s3)) or ((s4) and (s2)));
H7<=(((not s3) and (s2)) or ((s2) and (not s1)) or ((s3) and (not s2)) or (s4));
end comportamento;