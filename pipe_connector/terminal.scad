$fa = 1;
$fs = 0.2;

depth = 9.8;
width = 33.3;
length = 30;

thickness = 2;

tab_thickness = 1;
tab_depth = 1.2;
blank = 15;

term_len = 100;
term_offset = 10;

difference() {
    cube([term_len+2*thickness, term_len+2*thickness, depth+thickness]);
    translate(v = [thickness, thickness, 0]) 
    cube([term_len, term_len, depth]);
    translate(v = [term_len+thickness, (term_len+2*thickness)/2-width/2, 0]) 
    cube([length, width, depth]);

    translate([thickness+term_len/2, term_offset+thickness, 0])
    cylinder(h = 2*depth, r = 1.5);

    translate([thickness+term_len/2, thickness+term_len-term_offset, 0])
    cylinder(h = 2*depth, r = 1.5);

    translate([term_offset+thickness, thickness+term_len/2, 0])
    cylinder(h = 2*depth, r = 1.5);

    translate([thickness+term_len-term_offset, thickness+term_len/2, 0])
    cylinder(h = 2*depth, r = 1.5);
}

translate(v = [term_len+2*thickness, (term_len+2*thickness)/2-width/2-thickness, 0]) 
{
    difference() {
        union() {
            cube([length, width + 2*thickness, depth + thickness]);
            }
        
        translate([0, thickness, 0]) {
            cube([length, width, depth]);
            }    
    }

    translate([blank, 0, 0])
    cube([length-blank, thickness+tab_depth, tab_thickness]);

    translate([blank, 0, 0])
    translate([0, (width+2*thickness) - (thickness+tab_depth), 0])
    cube([length-blank, thickness+tab_depth, tab_thickness]);
}

