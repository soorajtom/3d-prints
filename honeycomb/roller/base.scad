include <config.scad>

difference() {
    cube([base_length, base_width, base_height]);
    translate([base_margin, base_margin, 0])
        cube([post_groove_offset + post_groove_depth, post_base_width, post_base_height]);
    translate([base_margin, base_width - base_margin - post_base_width, 0])
        cube([post_groove_offset + post_groove_depth, post_base_width, post_base_height]);
    
    translate([2*base_margin + post_groove_offset + post_groove_depth, base_margin, 0])
        cube([base_length - 2*(post_groove_offset + post_groove_depth + 2*base_margin), post_base_width, post_base_height]);
    
    translate([base_length - base_margin - post_groove_offset - post_groove_depth, base_margin, 0])
        cube([post_groove_offset + post_groove_depth, post_base_width, post_base_height]);
    translate([base_length - base_margin - post_groove_offset - post_groove_depth, base_width - base_margin - post_base_width, 0])
        cube([post_groove_offset + post_groove_depth, post_base_width, post_base_height]);
    translate([2*base_margin + post_groove_offset + post_groove_depth, base_width - base_margin - post_base_width, 0])
        cube([base_length - 2*(post_groove_offset + post_groove_depth + 2*base_margin), post_base_width, post_base_height]);
    
    translate([base_margin, 2* base_margin + post_base_width, 0])
        cube([post_length, base_width - 4*base_margin - 2*post_base_width, post_height - post_base_height]);
}