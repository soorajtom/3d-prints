$fa = 4.0;
$fs = 0.2;
trace = 0;

height = 12;
width = 33.8;

slit_width = 2.4;
slit_height = 10;
slit_separation = 24.5;

end_stem_edge_length = 24.9;
stem_diameter = 6.4;

handle_length = 60;

total_length = end_stem_edge_length + stem_diameter + handle_length;

difference() {
    translate(v = [0, total_length/2, 0]) 
    cube([width, total_length, height], center = true);

    translate(v = [slit_separation/2, end_stem_edge_length/2 - trace, 0])
    cube([slit_width, end_stem_edge_length, slit_height], center = true);

    translate(v = [-slit_separation/2, end_stem_edge_length/2 - trace, 0])
    cube([slit_width, end_stem_edge_length, slit_height], center = true);

    translate(v = [0, end_stem_edge_length, 0]) 
    rotate(a = 90, v = [0, 1, 0]) 
    cylinder(h = 2*width, d=stem_diameter, center = true);
}