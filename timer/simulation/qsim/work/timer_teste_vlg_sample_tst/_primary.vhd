library verilog;
use verilog.vl_types.all;
entity timer_teste_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        enable          : in     vl_logic;
        load            : in     vl_logic;
        M               : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end timer_teste_vlg_sample_tst;
