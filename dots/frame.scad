$fa = 4.0;
$fs = 0.2;

sidelen = 64;

wall_thickness = 2;
height = 5;

difference() {
    cube([sidelen+2*wall_thickness, sidelen+2*wall_thickness, height], center = true);
    cube([sidelen, sidelen, height], center = true);
}
