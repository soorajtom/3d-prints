$fa = 1;
$fs = 0.2;

hole_dia = 4.7;
hole_sep = 40.5;
hole_height = 4;
padding = 15;

width = 20;
length = 200;
depth = 3;

nail_hole_dia = 5;

translate(v = [width/2, padding, 0])
    cylinder(r=hole_dia/2, h=hole_height+depth); 

translate(v = [width/2, padding+hole_sep+hole_dia, 0])
    cylinder(r=hole_dia/2, h=hole_height+depth); 

translate(v = [width/2, padding+(hole_sep+hole_dia)*2, 0])
    cylinder(r=hole_dia/2, h=hole_height+depth); 

difference() {
    cube([width, length, depth]);
    hull() {
        translate(v = [width/2, length-padding, 0]){
            cylinder(r=nail_hole_dia/2, h=depth); 
        }
        translate(v = [width/2, length-padding-nail_hole_dia, 0]){
            cylinder(r=nail_hole_dia/1.2, h=depth); 
        }
    }
}

