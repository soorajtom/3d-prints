$fa = 1;
$fs = 0.2;

depth = 9.8;
width = 33.3;
length = 40;

thickness = 2;

tab_thickness = 1;
tab_depth = 1.2;
blank = 40-10;

difference() {
    union() {
        cube([width + 2*thickness, length*2, depth+thickness]);
        
        translate([width/1.25, length - width/2, 0])
        cube([length, width + 2*thickness, depth + thickness]);
        }
    
    translate([width/1.25, length - width/2, 0])
    translate([0, thickness, 0]) {
        cube([length, width, depth]);  
    }

    translate(v = [thickness, 0, 0]) 
    cube([width, length*2, depth]);
}

translate([width/1.25, length - width/2, 0]) {
    translate([blank, 0, 0])
    cube([length-blank, thickness+tab_depth, tab_thickness]);

    translate([blank, 0, 0])
    translate([0, (width+2*thickness) - (thickness+tab_depth), 0])
    cube([length-blank, thickness+tab_depth, tab_thickness]);
}

cube([thickness+tab_depth, length-blank, tab_thickness]);
translate(v = [0, length+blank, 0]) 
cube([thickness+tab_depth, length-blank, tab_thickness]);

translate(v = [thickness + width - tab_depth, 0, 0]) {
    cube([thickness+tab_depth, length-blank, tab_thickness]);
    translate(v = [0, length+blank, 0]) 
    cube([thickness+tab_depth, length-blank, tab_thickness]);
} 
