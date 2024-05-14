$fa = 1;
$fs = 0.2;

width = 100;
height = 50;
thickness = 5;
fillet_r = 3;

number_well = 2;
change = 0.1;

font_size = 30;

module filleted_cube(l, b, h, r) {
    hull() {
        translate(v = [r, r, 0]) 
        cylinder(h = h, r = r);
        translate(v = [l-r, r, 0]) 
        cylinder(h = h, r = r);
        translate(v = [l-r, b-r, 0]) 
        cylinder(h = h, r = r);
        translate(v = [r, b-r, 0]) 
        cylinder(h = h, r = r);
    }
}

color([0.9, 0.9, 0.9])
difference() {
    filleted_cube(l = width, b = height, h = thickness, r = fillet_r);
    translate(v = [width/2, height/2, thickness-number_well]){
        linear_extrude(height = number_well + change) {
            text("104",
                font = "Roboto:style=Bold",
                size = font_size,
                halign="center",
                valign="center");
        } 
    } 
}

// simulate colored inside
color([0,0,0])
translate(v = [width/2, height/2, thickness-number_well]){
    linear_extrude(height = change) {
        text("104",
            font = "Roboto:style=Bold",
            size = 30,
            halign="center",
            valign="center");
    } 
} 