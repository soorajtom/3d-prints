$fa = 1;
$fs = 0.2;

width = 100;
height = 50;
thickness = 5;
fillet_r = 4;
padding = 2;

number_height = 2;
change = 0.1;

font_size = 30;

module filleted_rectangle(l, b, r) {
    hull() {
        translate(v = [r,   r,   0]) circle(r = r);
        translate(v = [l-r, r,   0]) circle(r = r);
        translate(v = [l-r, b-r, 0]) circle(r = r);
        translate(v = [r,   b-r, 0]) circle(r = r);
    }
}

color([0.9, 0.9, 0.9])
difference() {
    linear_extrude(height = thickness) 
    filleted_rectangle(l = width, b = height, r = fillet_r);
    translate(v = [padding, padding, thickness-number_height]){
        linear_extrude(height = number_height + change) {
            filleted_rectangle(l = width - 2*padding, b = height- 2*padding, r = fillet_r-padding);
        }
    }
}
translate(v = [width/2, height/2, thickness-number_height]){
    linear_extrude(height = number_height + change) {
        text("104",
            font = "Roboto:style=Bold",
            size = font_size,
            halign="center",
            valign="center");
    } 
} 

// simulate colored inside
color([0,0,0])
translate(v = [width/2, height/2, thickness-number_height]){
    linear_extrude(height = change) {
        text("104",
            font = "Roboto:style=Bold",
            size = 30,
            halign="center",
            valign="center");
    } 
} 