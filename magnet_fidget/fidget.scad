$fa = 1;
$fs = 0.2;

// Parameters
ring_outer_diameter = 40; // Outer diameter of both rings
ring_inner_diameter = 20; // Inner diameter of both rings
ring_height = 5;          // Height (thickness) of both rings

dimple_diameter = 4.25;      // Diameter of the cylindrical dimples (magnet holes)
dimple_depth = 1.8;         // Depth of the dimples

num_dimples_part1 = 5;    // Number of dimples in Part 1
num_dimples_part2 = 6;    // Number of dimples in Part 2

// Part 1: Ring with 5 dimples
module ring_with_dimples(num_dimples) {
    difference() {
        // Outer cylinder of the ring
        cylinder(d = ring_outer_diameter, h = ring_height);
        
        // Inner cylinder to create the hole in the middle
        translate([0, 0, ring_height / 2])
            cylinder(d = ring_inner_diameter*1.02, h = ring_height);
        
        // Create dimples on the ring surface
        for (i = [0 : 360 / num_dimples : 360]) {
            rotate([0, 0, i])
            translate([(ring_outer_diameter + ring_inner_diameter)/4, 0, ring_height - dimple_depth])
                cylinder(d = dimple_diameter, h = dimple_depth);
            rotate([0, 0, i])
            translate([ring_outer_diameter/1.9 , 0, 0])
                cylinder(d = dimple_diameter, h = ring_height);
        }
    }
}

// Part 2: Ring with 6 dimples and a solid cylinder to ensure concentric rotation
module ring_with_cylinder_and_dimples(num_dimples) {
    difference() {
        // Outer cylinder of the ring
        cylinder(d = ring_outer_diameter, h = ring_height);
        
        // Create dimples on the ring surface
        for (i = [0 : 360 / num_dimples : 360]) {
            rotate([0, 0, i])
            translate([(ring_outer_diameter + ring_inner_diameter)/4, 0, ring_height - dimple_depth])
                cylinder(d = dimple_diameter, h = dimple_depth);
            rotate([0, 0, i])
            translate([ring_outer_diameter/1.9 , 0, 0])
                cylinder(d = dimple_diameter, h = ring_height);
        }
    }
    
    // Solid cylinder to ensure concentric fit
    translate([0, 0, ring_height])
        cylinder(d = ring_inner_diameter*0.95, h = ring_height/2);
}

// Display Part 1 and Part 2
translate([-ring_outer_diameter/1.9, 0, 0]) ring_with_dimples(num_dimples_part1); // Left part with 5 dimples
translate([ring_outer_diameter/1.9, 0, 0]) ring_with_cylinder_and_dimples(num_dimples_part2); // Right part with 6 dimples and central solid cylinder
