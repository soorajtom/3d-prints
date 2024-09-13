$fa = 1;
$fs = 0.2;

depth = 9.8;
width = 33.3;
length = 30;

thickness = 2;

tab_thickness = 1;
tab_depth = 1.2;
blank = 20;

difference() {
    union() {
        cube([length, width + 2*thickness, depth + thickness]);
        translate([depth+thickness, 0, 0])
        rotate(-90, [0,1,0])
        cube([length, width + 2*thickness, depth + thickness]);
        }
    
    translate([thickness, thickness, thickness]) {
        cube([length, width, depth]);
    translate([depth, 0, 0])
    rotate(-90, [0,1,0])
    cube([length, width, depth]);
        }    
}

translate(v = [0,0,depth+thickness-tab_thickness]) {
    translate([blank, 0, 0])
    cube([length-blank, thickness+tab_depth, tab_thickness]);

    translate([blank, 0, 0])
    translate([0, (width+2*thickness) - (thickness+tab_depth), 0])
    cube([length-blank, thickness+tab_depth, tab_thickness]);
}

translate([depth+thickness-tab_thickness,0,0]){
    translate([0,0,blank])
    cube([tab_thickness, thickness+tab_depth, length-blank]);

    translate([0,0,blank])
    translate([0, (width+2*thickness) - (thickness+tab_depth), 0])
    cube([tab_thickness, thickness+tab_depth, length-blank]);
}
