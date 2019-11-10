library verilog;
use verilog.vl_types.all;
entity timer_teste is
    port(
        load            : in     vl_logic;
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        M               : in     vl_logic_vector(3 downto 0);
        Q               : out    vl_logic;
        Z               : out    vl_logic_vector(3 downto 0)
    );
end timer_teste;
