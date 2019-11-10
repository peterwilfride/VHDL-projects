library verilog;
use verilog.vl_types.all;
entity timer_teste_vlg_check_tst is
    port(
        Q               : in     vl_logic;
        Z               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end timer_teste_vlg_check_tst;
