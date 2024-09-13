$fa = 1;
$fs = 0.2;

height = 50;

od = 10;
id = od - 2* 1.5;

difference() {
    cylinder(h = height, r = od/2);
    cylinder(h = height, r = id/2);
}
