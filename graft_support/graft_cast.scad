$fa = 4.0;
$fs = 0.2;

capsule_width = 80;
capsule_height = 80;
wall_thickness = 3;
stem_width = 10;
stem_height = 20;


difference() {
    cylinder(h = stem_height, r = stem_width/2 + wall_thickness);   
    cylinder(h = stem_height, r = stem_width/2);
}
translate([0, 0, stem_height - wall_thickness])
    difference() {
        translate([0,0, capsule_height/2])
            hull() {
                sphere(d = capsule_width);
                translate([0, 0, capsule_height])
                    sphere(d = capsule_width);
            }
        offset(delta = -wall_thickness)
            hull() {
                sphere(d = capsule_width);
                translate([0, 0, capsule_height])
                    sphere(d = capsule_width);
            }
        cylinder(h = stem_height, r = stem_width/2);
    }
