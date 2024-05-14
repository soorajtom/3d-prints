// $fa = 40;
// $fs = 10;

dia = 30;
height = 3;
scale_factor = 1;


// difference() {
//     cylinder(h = height, r = dia/2);
//     linear_extrude(height=height)
//     scale(v = 1) 
//     import("dvorak.jpg", center=true);
// }

difference() {
    cube([90, 19, height]);
    translate(v = [0, 13, -1]) 
    linear_extrude(height=height+2) 
    scale(v = 0.2) 
    import("dvorak.svg");
}