$fa = 1;
$fs = 0.2;

hole_dia_inner = 24.8;
hole_dia_offsetted = 21.3;

rect_len = 44.3;
rect_width = 55.3;
height = 20;

base_dia = ((hole_dia_offsetted/2)+7.4)*2;
base_offset = 48.5 + (hole_dia_offsetted/2);

y_num = 10;
grip_dia = rect_width/y_num;
x_num = rect_len/grip_dia - 1;
grip_height = 2;

difference() {
    hull() {
        cube([rect_len, rect_width, height]);
        translate(v = [base_offset, rect_width/2, 0])
        cylinder(h = height, r = base_dia/2);
    }
    difference() {
        translate(v = [base_offset, rect_width/2, -1])
        cylinder(h = height+2, r = hole_dia_inner/2);
        cube([base_offset-hole_dia_offsetted/2, rect_width, height]);
        translate([base_offset+hole_dia_offsetted/2, 0,0])
        cube([base_offset-hole_dia_offsetted/2, rect_width, height]);
    }
    for (i=[0:x_num]){
        translate(v = [i*grip_dia, 0, -0.5])
            for(j=[0:y_num]) {
                translate(v = [0,j*grip_dia,0])
                    cylinder(h=grip_height, r=grip_dia/2);
            }
    }
}