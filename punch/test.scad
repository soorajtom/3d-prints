$fa = 4.0;
$fs = 0.2;

hole_diameter = 3;
punch_diameter = 2.8;
punch_height = 3;
base_height = 1.5;
base_side_length = 15;

connector_height = 0.2;
connector_width = 15;
rotate([0, 0, 45])
difference() {
    union() {
        translate(v = [0, connector_width/2, 0]) 
        cube([base_side_length, base_side_length, base_height]);

        translate(v = [0, -(base_side_length + connector_width/2), 0])
        cube([base_side_length, base_side_length, base_height]);

        translate(v = [0, -(base_side_length + connector_width/2), 0])
        cube([base_side_length, connector_width + 2*base_side_length, connector_height]);

        translate(v = [base_side_length/2, -(base_side_length/2 + connector_width/2), base_height])
        cylinder(h = punch_height, d = punch_diameter);
    }

    translate(v = [base_side_length/2, (base_side_length/2 + connector_width/2), -0.1])
    cylinder(h = 2*base_height, d = hole_diameter);
}