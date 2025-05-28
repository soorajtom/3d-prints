include <config.scad>

delta = 0.15;
// cube([post_length, post_base_width, post_base_height]);
// translate(v = [0, 0, post_base_height])
//     difference() {
//         cube([post_groove_offset+post_groove_depth, post_base_width, post_height - post_base_height]);
//         translate([post_groove_offset, (post_base_width-post_groove_width)/2, 0])
//             cube([post_groove_depth, post_groove_width, post_height - post_base_height]);
//     }

// translate(v = [post_length - post_groove_offset - post_groove_depth, 0, post_base_height])
//     difference() {
//         cube([post_groove_offset+post_groove_depth, post_base_width, post_height - post_base_height]);
//         translate([0, (post_base_width-post_groove_width)/2, 0])
//             cube([post_groove_depth, post_groove_width, post_height - post_base_height]);
//     }

groove_offset = casing_width-base_margin/2;
difference() {
    cube([2* base_height, casing_width + base_margin + casing_width, post_groove_offset + post_groove_depth-delta]);
    translate(v = [0, casing_width, 0])
        cube([base_height+delta, base_margin+delta, post_groove_offset + post_groove_depth+delta]);
    translate(v = [0, groove_offset + (casing_width - post_groove_width) / 2, post_groove_offset])
            cube([post_height+delta, post_groove_width+delta, post_groove_depth+delta]);
}
translate([2*base_height, 0, 0]) {
    translate([0, groove_offset, 0])
    difference() {
        cube([post_height, casing_width, post_groove_depth + post_groove_offset-delta]);
        translate(v = [0, (casing_width - post_groove_width) / 2, post_groove_offset])
            cube([post_height+delta, post_groove_width+delta, post_groove_depth+delta]);
    }
    translate(v = [post_height, 0, 0]){
        difference() {
            cube([2* base_height, casing_width + base_margin + casing_width, post_groove_offset + post_groove_depth-delta]);
            translate(v = [base_height, casing_width, 0])
                cube([base_height+delta, base_margin+delta, post_groove_offset + post_groove_depth+delta]);
        }
    }
}