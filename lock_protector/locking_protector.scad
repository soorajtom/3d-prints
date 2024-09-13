$fa = 1;
$fs = 0.2;

frame_height = 58.9;

outer_dia = 16.5;
inner_dia = 12.8;

difference() {
    
    union() {
        difference() {
        sphere(r = frame_height);
        cylinder(h = frame_height-1, r = inner_dia/2);
        }
        translate(v = [0,0,0]) 
        cylinder(h = frame_height, r = inner_dia/2-3);
    }

    translate([-1.5*frame_height, -3*frame_height, -1.5*frame_height])
    cube(size = [3*frame_height,3*frame_height,3*frame_height]); 
    translate([-1.5*frame_height, -1, -3*frame_height])
    cube(size = [3*frame_height,3*frame_height,3*frame_height]); 

    
}

