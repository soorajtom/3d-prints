$fa = 1;
$fs = 0.2;

leg_dia = 1.5 * 25.4;
bushing_base_dia = leg_dia + 10;

height = 10;
bushing_pad_height = 5;

difference() {
    cylinder(d2=leg_dia, d1=bushing_base_dia, h=height);
    translate([0, 0, bushing_pad_height])
    cylinder(d=leg_dia, h=height+1);
    translate(v = [0, 0, 1.5*bushing_pad_height])
    cylinder(d1=leg_dia, d2=leg_dia*1.2, h=height+1); 
}