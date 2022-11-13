vsim registrador

add wave *


force enable 0 0ps, 1 5ps
force clk 0 0ps, 1 1ps, 0 2ps, 1 3ps, 0 4ps, 1 5ps
force clr 0 0ps
force entrada(0) 1 0ps, 1 10ps
force entrada(1) 1 0ps, 1 10ps
force entrada(2) 1 0ps, 0 10ps
force entrada(3) 1 0ps, 0 10ps
force entrada(4) 1 0ps, 0 10ps
force entrada(5) 1 0ps, 0 10ps

run 10ps