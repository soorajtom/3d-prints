$fa = 1;
$fs = 0.2;

dia = 30;
height = 3;
scale_factor = 1;


difference() {
    cylinder(h = height, r = dia/2);
    linear_extrude(height=height)
    scale(v = 1) 
    import("logo.svg", center=true);
}