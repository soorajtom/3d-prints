$fa = 1;
$fs = 0.2;

// Parameters
ring_outer_diameter = 40; // Outer diameter of both rings
ring_inner_diameter = 20; // Inner diameter of both rings
ring_height_socket = 8;          // Height (thickness) of both rings
ring_height_plug = 4;          // Height (thickness) of both rings

dimple_diameter = 4.25;      // Diameter of the cylindrical dimples (magnet holes)
dimple_depth = 1.8;         // Depth of the dimples

num_dimples_part1 = 3;    // Number of dimples in Part 1
num_dimples_part2 = 4;    // Number of dimples in Part 2

bearing_height = 6;
bearing_diameter = 22;
bearing_hole_diameter = 10;
bearing_lip = 1;


// Part 1: Ring with A dimples
module ring_with_dimples(num_dimples) {
    difference() {
        // Outer cylinder of the ring
        cylinder(d = ring_outer_diameter, h = ring_height_socket);
        
        // Inner cylinder to create the hole in the middle
        translate([0, 0, ring_height_socket - bearing_height])
            cylinder(d = bearing_diameter, h = bearing_height);
        
        cylinder(h = ring_height_socket, d = bearing_diameter - bearing_lip*2);
        
        // Create dimples on the ring surface
        for (i = [0 : 360 / num_dimples : 360]) {
            rotate([0, 0, i])
            translate([(ring_outer_diameter + ring_inner_diameter)/4, 0, ring_height_socket - dimple_depth]) {
                cylinder(d = dimple_diameter, h = dimple_depth);
                translate([0, 0, -100])
                    cylinder(d = dimple_diameter/2, h = 200);
            }
            rotate([0, 0, i])
            translate([ring_outer_diameter/1.9 , 0, 0])
                cylinder(d = dimple_diameter, h = ring_height_socket);
        }
    }
}

// Part 2: Ring with B dimples and a solid cylinder to ensure concentric rotation
module ring_with_cylinder_and_dimples(num_dimples) {
    difference() {
        // Outer cylinder of the ring
        cylinder(d = ring_outer_diameter, h = ring_height_plug);
        
        // Create dimples on the ring surface
        for (i = [0 : 360 / num_dimples : 360]) {
            rotate([0, 0, i])
            translate([(ring_outer_diameter + ring_inner_diameter)/4, 0, ring_height_plug - dimple_depth]) {
                cylinder(d = dimple_diameter, h = dimple_depth);
                translate([0, 0, -100])
                    cylinder(d = dimple_diameter/2, h = 200);
            }
            rotate([0, 0, i])
            translate([ring_outer_diameter/1.9 , 0, 0])
                cylinder(d = dimple_diameter, h = ring_height_plug);
        }
    }
    
    translate([0, 0, ring_height_plug]) {
        difference() {
            cylinder(d = bearing_hole_diameter, h = bearing_height + bearing_lip);
            cube([100, 2, 100], center = true);
        }
        cylinder(d = bearing_hole_diameter + 2*bearing_lip, h = bearing_lip);
    }
}

// Display Part 1 and Part 2
translate([-ring_outer_diameter/1.9, 0, 0]) ring_with_dimples(num_dimples_part1); // Left part with 5 dimples
// translate([ring_outer_diameter/1.9, 0, 0]) ring_with_cylinder_and_dimples(num_dimples_part2); // Right part with 6 dimples and central solid cylinder
