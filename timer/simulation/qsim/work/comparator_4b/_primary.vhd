library verilog;
use verilog.vl_types.all;
entity comparator_4b is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        aeqb            : out    vl_logic
    );
end comparator_4b;
