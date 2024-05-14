$fa = 1;
$fs = 0.2;

full_dia = 6.1;
small_dia = 5.1;

start_depth = 3.8;
hole_height = 5;

// translate([0,0,20]) {
//     difference() {
//         cylinder(h = hole_height, r = full_dia/2);
//         translate([-6,small_dia-(full_dia/2),-1])
//         cube(20);
//     }
// }

difference() {
    translate([0, -7, 0])
    linear_extrude(height=10)
    scale([1/25, 1/25,1/25]) 
    import("cat.svg", center=true);
    difference() {
        cylinder(h = hole_height, r = full_dia/2);
        translate([-6,small_dia-(full_dia/2),-1])
        cube(20);
    }
}