$fa = 1;
$fs = 0.2;


pole_offset_radius = 50/2 + 5;
pole_straight_height = 50 + 8;
pole_width = 10;
pole_thickness = 2;


base_diameter = 66;
base_thickness = 5;
base_thickness_origin = 2;
base_divot_diameter = 150;

hole_edge_len = 15;

difference () {
    cylinder(h = base_thickness, d=base_diameter);
    translate(v = [0,0, base_thickness_origin+ base_divot_diameter/2])
        sphere(d = base_divot_diameter); 
}

translate([pole_offset_radius, -pole_width/2, base_thickness]) {
    cube([pole_thickness, pole_width, pole_straight_height]);
}

translate([-pole_offset_radius-pole_thickness, -pole_width/2, base_thickness]) {
    cube([pole_thickness, pole_width, pole_straight_height]);
}

difference() {
    translate([0, 0, base_thickness + pole_straight_height]) {
        rotate(a = 90, v = [1, 0, 0]) {
            difference() {
                cylinder(h = pole_width, d=(pole_offset_radius+pole_thickness)*2, center=true);
                cylinder(h = pole_width+1, d=pole_offset_radius*2, center=true);
            }
        }
    }
    cube([base_diameter, base_diameter, (pole_straight_height+base_thickness)*2], center=true);
    rotate(a = 45, v = [0,0,1])
    cube([hole_edge_len, hole_edge_len, (pole_straight_height+base_thickness)*4], center=true); 
}
