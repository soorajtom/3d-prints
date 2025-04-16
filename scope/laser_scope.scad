$fa = 4.0;
$fs = 0.2;

// Main dimensions
barrel_dia = 15;  // Paintball barrel diameter
laser_dia = 5;    // Laser module diameter
mount_height = 20; // Height of the main mount
mount_width = 25;  // Width of the main mount

// Adjustment mechanism dimensions
adjustment_range = 5;  // Maximum adjustment range in mm
insert_radius = 6/2;   // Threaded insert radius
screw_hole_r = 4.5/2;  // Screw hole radius
screw_head_r = 6/2;    // Screw head radius
screw_head_depth = 2;  // Screw head depth
insert_height = 6;     // Threaded insert height

// Laser mount dimensions
laser_mount_height = 15;
laser_mount_width = 10;
laser_mount_thickness = 5;

// Main mount
module main_mount() {
    difference() {
        // Main body
        translate([0, 0, mount_height/2])
            cube([mount_width, mount_width, mount_height], center=true);
        
        // Barrel hole
        translate([0, 0, -0.1])
            cylinder(h=mount_height+0.2, d=barrel_dia);
        
        // Adjustment slots
        // Vertical adjustment slot
        translate([0, 0, mount_height/2])
            cube([mount_width-10, adjustment_range*2, mount_height], center=true);
        
        // Horizontal adjustment slot
        translate([0, 0, mount_height/2])
            cube([adjustment_range*2, mount_width-10, mount_height], center=true);
        
        // Screw holes for adjustment
        // Vertical adjustment
        translate([0, mount_width/2-5, mount_height/2])
            rotate([90, 0, 0])
            cylinder(h=10, r=screw_hole_r);
        
        // Horizontal adjustment
        translate([mount_width/2-5, 0, mount_height/2])
            rotate([0, 90, 0])
            cylinder(h=10, r=screw_hole_r);
    }
}

// Laser mount
module laser_mount() {
    difference() {
        // Laser mount body
        translate([0, 0, laser_mount_height/2])
            cube([laser_mount_width, laser_mount_thickness, laser_mount_height], center=true);
        
        // Laser hole
        translate([0, 0, -0.1])
            cylinder(h=laser_mount_height+0.2, d=laser_dia);
        
        // Screw holes for mounting
        for(i = [-1, 1]) {
            translate([i*(laser_mount_width/2-5), 0, laser_mount_height/2])
                rotate([90, 0, 0])
                cylinder(h=laser_mount_thickness+0.2, r=screw_hole_r, center=true);
        }
    }
}

// Assembly
main_mount();
translate([0, mount_width/2 + laser_mount_thickness/2, mount_height/2])
    laser_mount(); 