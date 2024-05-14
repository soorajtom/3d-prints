$fa = 1;
$fs = 0.2;

base_padding = 2;
padding = 2;

depth_increment = 0.6;
width = 5;

num_increments = 3;
rows = 10;

module test_trough() {
    for (i=[0:num_increments-1]){
        translate(v = [width*i, 0, 0])
            cube(size=[width, width, depth_increment*(i+1)]); 
    }
}

difference() {
    cube(size = [2*padding+num_increments*width,
                 padding*(rows+1)+width*rows,
                 num_increments*depth_increment+base_padding]);
    for (i=[0:rows-1]){
        translate(v = [padding, padding*(i+1)+width*i, 0])
            test_trough(); 
    }
}
