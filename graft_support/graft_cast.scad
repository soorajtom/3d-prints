$fa = 4.0;
$fs = 0.2;

capsule_width = 80;
capsule_height = 50;
wall_thickness = 3;
stem_width = 15;
stem_height = 20;

tab_width = 10;

// half of the cast
difference() {
    union(){
        // bottom stem
        difference() {
            cylinder(h = stem_height, r = stem_width/2 + wall_thickness);   
            cylinder(h = stem_height, r = stem_width/2);
        }

        // capsule
        translate([0, 0, stem_height - wall_thickness])
            difference() {
                translate([0,0, capsule_width/2])
                    hull() {
                        sphere(d = capsule_width);
                        translate([0, 0, capsule_height])
                            sphere(d = capsule_width);
                    }

                translate([0, 0,(capsule_width-2*wall_thickness)/2+ wall_thickness])
                    hull() {
                        sphere(d = capsule_width-2*wall_thickness);
                        translate([0, 0, capsule_height])
                            sphere(d = capsule_width-2*wall_thickness);
                    }

                cylinder(h = stem_height+3*capsule_width, r = stem_width/2);
            }

        // top stem
        translate(v = [0, 0, stem_height+capsule_width+capsule_height-2*wall_thickness])
            difference() {
                cylinder(h = stem_height, r = stem_width/2 + wall_thickness);
                cylinder(h = stem_height, r = stem_width/2);
            }
        
        translate(v = [0, capsule_width/2 + tab_width/2 - wall_thickness/2, stem_height + capsule_width/2 + capsule_height/2])
            cube([tab_width, tab_width, 2*tab_width], center = true);
        translate(v = [0, -(capsule_width/2 + tab_width/2 - wall_thickness/2), stem_height + capsule_width/2 + capsule_height/2])
            cube([tab_width, tab_width, 2*tab_width], center = true);

    }

    // slice in half
    translate([500, 0, 0])
    cube([1000, 1000, 1000], center = true);
}