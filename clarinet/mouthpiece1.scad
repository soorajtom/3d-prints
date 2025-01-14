$fa = 1;
$fs = 1;

insert_dia_outer = 20;
insert_dia_inner = 15;
insert_length = 15;

cavity_length = 43.3;
reed_length = 25;
cavity_d1 = 26;
cavity_d2 = 22;

beak_angle = 45;
beak_length = 10;

reed_width = 8;

cubelen = 100;

total_length = insert_length+cavity_length+beak_length+reed_length;
sphere_r = 23;

difference() {
    difference() {
        union() {
            cylinder(h = total_length, d1 = cavity_d1, d2=cavity_d2);
            translate([0,0,insert_length])
            translate(v = [0,0,sphere_r])
            sphere(r = sphere_r); 
        }

        difference() {
            cylinder(h = insert_length, d=cavity_d1+1);
            cylinder(h = insert_length, d=insert_dia_outer);
        }

        // bore
        difference() {
            cylinder(h = total_length+1, d1 = insert_dia_inner, d2=insert_dia_inner*(cavity_d1/cavity_d2)*0.7);
        }

        // spherical cavity
        translate([0,0,insert_length])
        translate(v = [0,0,sphere_r])
        sphere(r = sphere_r-3);
    }

    

    translate([0,0,total_length-10 ])
    rotate(a = -90+beak_angle, v = [1,0,0])
    translate([0,0,cubelen/2])
    cube([cubelen, cubelen, cubelen], center=true);

}
