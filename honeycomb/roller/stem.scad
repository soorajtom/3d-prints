include<config.scad>

delta = 0.05;

translate(v = [0, 0, roller_stem_depth/2]) 
cube([bearing_inner_dia-2*delta, bearing_inner_dia-2*delta, roller_stem_depth], center = true);

translate(v = [0,0, roller_stem_depth])
cylinder(r = bearing_inner_dia/2 - delta, h = roller_padding + casing_width + roller_stem_protrusion/2);

translate(v = [0, 0, roller_stem_depth + roller_padding + casing_width + roller_stem_protrusion/2])
cylinder(r = bearing_inner_dia/2 - roller_groove_toroid_radius - delta - delta, h = roller_groove_toroid_radius);

translate(v = [0, 0, roller_stem_depth + roller_padding + casing_width + roller_stem_protrusion/2 + roller_groove_toroid_radius])
cylinder(r = bearing_inner_dia/2 - delta, h = roller_stem_protrusion/2);

// comment
translate(v = [0, 0, roller_stem_depth + roller_padding + casing_width + roller_stem_protrusion + roller_groove_toroid_radius + roller_stem_protrusion/2])
cube([bearing_inner_dia/sqrt(2)-2*delta, bearing_inner_dia/sqrt(2)-2*delta, roller_stem_protrusion], center = true);