$fa = 1;
$fs = 0.2;

fuse_width = 12.3;
fuse_length = 35;
fuse_lip_width = 14.7;
fuse_lip_thickness = 2.5;

fuse_screw_gap = 2.8;

fuse_box_width = 90;
fuse_box_depth = 30;
fuse_box_height = 40;
fuse_box_wall_thickness = 1.6;

tab_width = 10;


module fuse_box() {
    difference() {
        cube([fuse_box_width, fuse_box_depth, fuse_box_height]);
        translate([fuse_box_wall_thickness,
            fuse_box_wall_thickness,
            fuse_box_wall_thickness])
        cube([fuse_box_width-2*fuse_box_wall_thickness,
            fuse_box_depth- 2*fuse_box_wall_thickness,
            fuse_box_height]);

        translate(v = [fuse_box_width/2 - tab_width/2, 0, fuse_box_height-fuse_box_wall_thickness])
        cube([tab_width, fuse_box_wall_thickness, fuse_box_wall_thickness]);

        translate(v = [fuse_box_width/2 - tab_width/2, fuse_box_depth - fuse_box_wall_thickness, fuse_box_height-fuse_box_wall_thickness])
        cube([tab_width, fuse_box_wall_thickness, fuse_box_wall_thickness]);

        translate(v = [0, fuse_box_depth/2 - tab_width/2, fuse_box_height-fuse_box_wall_thickness])
        cube([fuse_box_wall_thickness, tab_width, fuse_box_wall_thickness]);

        translate(v = [fuse_box_width - fuse_box_wall_thickness, fuse_box_depth/2 - tab_width/2, fuse_box_height-fuse_box_wall_thickness])
        cube([fuse_box_wall_thickness, tab_width, fuse_box_wall_thickness]);
    
    translate([-1, fuse_box_depth/2, fuse_box_height/2])
    rotate(a = 90, v = [0,1,0])
    cylinder(d=10, h=2*fuse_box_width);
    }

}

module fuse_box_lid() {
    lid_width = fuse_box_width - 2*fuse_box_wall_thickness;
    lid_depth = fuse_box_depth - 2*fuse_box_wall_thickness;
    difference() {
        union() {
            cube([lid_width,
            lid_depth, fuse_box_wall_thickness]);

            translate([lid_width/2 - tab_width/2, -fuse_box_wall_thickness, 0])
            cube([tab_width, fuse_box_wall_thickness, fuse_box_wall_thickness]);

            translate([lid_width/2 - tab_width/2, lid_depth, 0])
            cube([tab_width, fuse_box_wall_thickness, fuse_box_wall_thickness]);

            translate([-fuse_box_wall_thickness, lid_depth/2 - tab_width/2, 0])
            cube([fuse_box_wall_thickness, tab_width, fuse_box_wall_thickness]);

            translate([lid_width, lid_depth/2 - tab_width/2, 0])
            cube([fuse_box_wall_thickness, tab_width, fuse_box_wall_thickness]);
        }

        translate([lid_width/2, lid_depth/2, 0]){
            cylinder(d=fuse_width, h=fuse_box_wall_thickness);
            translate([0, 0, 1]) 
            cylinder(d=fuse_lip_width, h=fuse_lip_thickness);
        }

        translate([lid_width/4, lid_depth/2, 0]){
            cylinder(d=fuse_width, h=fuse_lip_thickness);
            translate([0, 0, 1]) 
            cylinder(d=fuse_lip_width, h=fuse_lip_thickness);
        }

        translate([lid_width*3/4, lid_depth/2, 0]){
            cylinder(d=fuse_width, h=fuse_lip_thickness);
            translate([0, 0, 1]) 
            cylinder(d=fuse_lip_width, h=fuse_lip_thickness);
        }
    }
}

fuse_box();

translate([0, fuse_box_depth*1.2, 0])
fuse_box_lid();
