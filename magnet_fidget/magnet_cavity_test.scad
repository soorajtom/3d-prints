$fa = 1;
$fs = 0.2;

difference(){
    // Outer cylinder of the ring
    cube([30, 12, 3]);
    cylinder(h = 3, r = 2);

    // Inner cylinder to create the hole in the middle
    translate([7, 6, 3 - 1.4])
        cylinder(h = 1.4, d = 4.0);

        // Inner cylinder to create the hole in the middle
    translate([15, 6, 3 - 1.5])
        cylinder(h = 1.5, d = 4.1);

        // Inner cylinder to create the hole in the middle
    translate([23, 6, 3 - 1.6])
        cylinder(h = 1.6, d = 4.2);

}