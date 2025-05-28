$fa = 1;
$fs = 0.2;

bearing_outer_dia = 22;
bearing_inner_dia = 10;
bearing_padding = 8;

casing_width = 10;

post_height = 100;
post_base_height = 20;
post_groove_width = 4;
post_groove_depth = 4;
post_groove_offset = 4;

base_margin = 5;
post_base_width = casing_width;
post_length = 2*(post_groove_offset + post_groove_depth + bearing_padding) + bearing_outer_dia;
post_separation = 210;

base_length = post_length + 2 * base_margin;
base_width = post_separation + 2 * base_margin;
base_height = 10;

// groove to groove distance
casing_length = 2*(post_groove_depth + bearing_padding) + bearing_outer_dia;
casing_height = 1.5 * bearing_padding + bearing_outer_dia;

roller_width = 200;
roller_padding = post_separation - roller_width;
roller_stem_protrusion = 20;
roller_groove_toroid_radius = 2;
roller_stem_depth = 50;
