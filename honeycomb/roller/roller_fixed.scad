include<config.scad>
include<../sotc_1.scad>

// translate([0, 0, roller_stem_protrusion + roller_padding + casing_width])
difference() {
    translate([0, 0, roller_width/2])
    sotc(h = roller_width);
    
    translate(v = [0,0,roller_stem_depth/2]) 
    cube([bearing_inner_dia, bearing_inner_dia, roller_stem_depth], center = true);

    translate(v = [0,0,roller_width - roller_stem_depth/2]) 
    cube([bearing_inner_dia, bearing_inner_dia, roller_stem_depth], center = true);
}