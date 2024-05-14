$fa = 1;
$fs = 0.2;

ring_height = 7.5;
inner_radius = 26.4/2;
outer_radius = 31/2;
slope_diff = 0.3;

peg_height = 10;
peg_radius = 2.5;

insert_radius = 6/2;
screw_hole_r = 4.5/2;
screw_head_r = (6)/2;
screw_head_depth = 2;
screw_head_support_depth = 2;
insert_height = 6;
air_gap = 3;

tighten_x = insert_height+air_gap+screw_head_depth+screw_head_support_depth;
tighten_y = ring_height + (outer_radius-inner_radius);

support_x = ring_height;
support_y = ring_height*2;

difference() {
    union() {
        cylinder(ring_height, r1=outer_radius, r2=outer_radius-slope_diff);
        // rotate([asin(slope_diff/ring_height)/2,0,0])
        translate([-tighten_x/2, inner_radius, 0])
            cube([tighten_x, tighten_y, ring_height]);
    }
    translate([0,0,-0.0005])
    cylinder(ring_height+0.001, r1=inner_radius, r2=inner_radius-slope_diff);
    translate([-tighten_x/2, inner_radius, 0])
    {
        translate([insert_height, 0, 0])
            cube([air_gap, tighten_y, ring_height]);
    }
    // screw head hole
    translate([
        tighten_x/2-screw_head_depth,
        outer_radius+(outer_radius-inner_radius)/2+tighten_y/2-screw_head_r,
        ring_height/2])
    rotate([0,90,0])
        cylinder(h=screw_head_depth, r=screw_head_r);
    // screw body hole
    translate([
        tighten_x/2-screw_head_depth-screw_head_support_depth,
        outer_radius+(outer_radius-inner_radius)/2+tighten_y/2-screw_head_r,
        ring_height/2])
    rotate([0,90,0])
        cylinder(h=screw_head_depth+screw_head_support_depth, r=screw_hole_r);
    //insert hole
    translate([
        -tighten_x/2,
        outer_radius+(outer_radius-inner_radius)/2+tighten_y/2-insert_radius,
        ring_height/2])
    rotate([0,90,0])
        cylinder(h=insert_height, r=insert_radius);
}

translate([inner_radius, -support_y/2, 0])
    cube([ring_height, support_y, ring_height]);
