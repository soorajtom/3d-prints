$fa = 1;
$fs = 0.4;

// Board dimensions
board_thickness = 3;

// Pi 4 dimensions (85.6mm x 56mm)
pi4_width_padding = 10;
pi4_width = 85.6;
pi4_height_padding = 10;
pi4_height = 56;
pi4_mount_hole_dia = 2.75;
pi4_mount_hole_positions = [
    [3.5, 3.5],
    [3.5, 52.5],
    [61.5, 3.5],
    [61.5, 52.5]
];

// Pi 5 dimensions (85mm x 56mm)
pi5_width_padding = 10;
pi5_width = 85;
pi5_height_padding = 10;
pi5_height = 56;
pi5_mount_hole_dia = 2.75;
pi5_mount_hole_positions = [
    [3.5, 3.5],
    [3.5, 52.5],
    [61.5, 3.5],
    [61.5, 52.5]
];

hanging_hole_dia = 4;
// how far should the holes be from the edge of the board and the pis
hole_padding = 10;

board_width = 2*pi4_width_padding + pi4_width + 2*hole_padding + 2*pi5_width_padding + pi5_width;
board_height = 2*pi4_height_padding + pi4_height + 2*hole_padding + 2*pi5_height_padding + pi5_height;

// Main board
difference() {
    // Base board
    cube([board_width, board_height, board_thickness]);

    // Pi 4 mounting holes
    translate([hole_padding, hole_padding, 0])
    for(pos = pi4_mount_hole_positions) {
        translate([pos[0], pos[1], -0.1])
        cylinder(d=pi4_mount_hole_dia, h=board_thickness + 0.2);
    }

    // Pi 5 mounting holes
    

    
    // keeping this for later
    // // Pi 4 mounting holes
    // translate([(board_width/2 - pi4_width/2), (board_height/2 - pi4_height/2 - 10), 0])
    // for(pos = pi4_mount_hole_positions) {
    //     translate([pos[0], pos[1], -0.1])
    //     cylinder(d=pi4_mount_hole_dia, h=board_thickness + 0.2);
    // }
    
    // // Pi 5 mounting holes
    // translate([(board_width/2 - pi5_width/2), (board_height/2 + pi5_height/2 + 10), 0])
    // for(pos = pi5_mount_hole_positions) {
    //     translate([pos[0], pos[1], -0.1])
    //     cylinder(d=pi5_mount_hole_dia, h=board_thickness + 0.2);
    // }
    
    // // // Wall mount holes
    // for(pos = wall_mount_hole_positions) {
    //     translate([pos[0], pos[1], -0.1])
    //     cylinder(d=wall_mount_hole_dia, h=board_thickness + 0.2);
    // }
}

// Add some text labels
translate([board_width/2, board_height/2 - 30, board_thickness])
linear_extrude(1)
text("Raspberry Pi 4", size=5, halign="center");

translate([board_width/2, board_height/2 + 30, board_thickness])
linear_extrude(1)
text("Raspberry Pi 5", size=5, halign="center"); 