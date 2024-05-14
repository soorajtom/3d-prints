$fa = 1;
$fs = 0.2;

dia = 30;
height = 3;
scale_factor = 0.5;

longest_offset = 11.3*scale_factor;
longest_height = 33.9*scale_factor;
code_width = 79.03;

y_buffer = 2.5;
x_buffer = 3;

total_height = longest_height + 2*y_buffer;

intersection() {
    difference() {
        cube([total_height, total_height, height]);
        translate(v = [x_buffer + longest_height/2, y_buffer +longest_height/2, -1]) 
        cylinder(h = height+2, r = longest_height/2);
    }
    union() {
        translate(v = [x_buffer + longest_height/2, y_buffer +longest_height/2, -1]) 
        cylinder(h = height+2, r = y_buffer + longest_height/2);
        translate(v = [x_buffer + longest_height/2, 0, 0])
        cube([50, total_height, height]); 
    }
}

translate(v = [total_height, 0,0]) 
difference() {
    cube(size = [code_width + 2*x_buffer,longest_height + 2*y_buffer,height]);
    translate(v = [x_buffer,-longest_offset + y_buffer,-1]) 
    scale(v = scale_factor)  
    linear_extrude(height=(height/scale_factor)+5)
    import("dark.svg", center=false);
}