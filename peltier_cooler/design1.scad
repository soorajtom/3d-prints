$fa = 1;
$fs = 0.2;

peltier_x = 40;
peltier_y = 40;
peltier_z = 3.7;

block_x = 55;
block_y = 50;
block_z = 10;

wall_thickness = 1.5;
cold_cabin_depth = 6;

inlet_radius = 4;
outlet_radius = 4;

tie_down_radius = 0.5;

clearance = 0.1;

cabin_x_padding = ((block_x-peltier_x)/2);
cabin_y_padding = ((block_y-peltier_y)/2);

difference() {
    cube(size = [block_x, block_y, block_z]);
    translate([cabin_x_padding, cabin_y_padding, block_z-cold_cabin_depth])
        cube([peltier_x + clearance, peltier_y + clearance, cold_cabin_depth+block_z]);
    
    translate(v = [cabin_x_padding + (7/8) * peltier_x,
        cabin_y_padding + (7/8) * peltier_y,
        -clearance
    ])
    cylinder(h = block_z, r = inlet_radius);

    translate(v = [cabin_x_padding + (7/8) * peltier_x,
        cabin_y_padding + (1/8) * peltier_y,
        -clearance
    ])
    cylinder(h = block_z, r = outlet_radius);

    translate(v = [cabin_x_padding/2, block_y/2, -clearance])
    cylinder(h = block_z + 2* clearance, r = tie_down_radius);

    translate(v = [3*cabin_x_padding/2 + peltier_x, block_y/2, -clearance])
    cylinder(h = block_z + 2* clearance, r = tie_down_radius); 
}

translate(v = [cabin_x_padding + 0.25*peltier_x,
    cabin_y_padding + 0.25*peltier_y - wall_thickness/2,
    block_z-cold_cabin_depth]) 
cube([0.75*peltier_x, wall_thickness, cold_cabin_depth-2*peltier_z/3]);

translate(v = [cabin_x_padding,
    cabin_y_padding + 0.5*peltier_y - wall_thickness/2,
    block_z-cold_cabin_depth]) 
cube([0.75*peltier_x, wall_thickness, cold_cabin_depth-2*peltier_z/3]);

translate(v = [cabin_x_padding + 0.25*peltier_x,
    cabin_y_padding + 0.75*peltier_y - wall_thickness/2,
    block_z-cold_cabin_depth]) 
cube([0.75*peltier_x, wall_thickness, cold_cabin_depth-2*peltier_z/3]);
