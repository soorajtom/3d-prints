include<config.scad>

delta = 0.1;

difference() {
    cube([casing_length-delta, casing_height, casing_width]);
    cube([post_groove_depth+delta, casing_height, (casing_width - post_groove_width)/2+delta]);
    translate([casing_length - post_groove_depth, 0, 0])
        cube([post_groove_depth+delta, casing_height, (casing_width - post_groove_width)/2+delta]);
    
    translate([0, 0, (casing_width - post_groove_width)/2 + post_groove_width-delta]) {
        cube([post_groove_depth+delta, casing_height, (casing_width - post_groove_width)/2+delta]);
        translate([casing_length - post_groove_depth, 0, 0])
            cube([post_groove_depth+delta, casing_height, (casing_width - post_groove_width)/2+delta]);
    }

    translate([casing_length/2, casing_height/2, 0]) {
        cylinder(r = bearing_outer_dia/2, h = casing_width);
    }
}
