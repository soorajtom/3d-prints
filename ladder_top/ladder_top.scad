$fa = 1;
$fs = 0.2;

pipe_width = 25.5;
wall_thickness = 2;
sphere_dia = (pipe_width + 2*wall_thickness) * sqrt(2) + 8;
pipe_length = 60;

pipe_offset = sphere_dia/2;

difference() {
    union() {
        translate(v = [0, 0, sphere_dia/2]) 
        sphere(d = sphere_dia);
        translate(v = [0,0,pipe_offset + pipe_length/2])
            cube([pipe_width + 2*wall_thickness, pipe_width + 2*wall_thickness, pipe_length], center = true);
    }
    translate(v = [0,0,pipe_offset + pipe_length/2])
        cube([pipe_width, pipe_width, pipe_length+1], center = true);
}
