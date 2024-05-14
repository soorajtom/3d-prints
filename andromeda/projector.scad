$fa = 1;
$fs = 0.2;

dia = 40.0;
upper_dia = 10;
height = 45;
logo_scale_factor = 1.5;

difference() {
    difference() {
        cylinder(h = height, r1 = dia/2, r2=upper_dia/2);
        linear_extrude(height=height, scale=(upper_dia/dia))
        scale(v = logo_scale_factor) 
        import("logo.svg", center=true);
    }
    translate(v = [0,0,height*1.1])
    sphere(r=(upper_dia/2)*1.5);
}