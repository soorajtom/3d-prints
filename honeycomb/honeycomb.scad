$fa = 1;
$fs = 0.2;
r2 = sqrt(2);
r3 = sqrt(3);
pi = 3.1415926;
// shrink_factor = 1.18;
// radius_correction = 1.15;
// roll_correction = 8;
shrink_factor = 1;
radius_correction = 1.55;
roll_correction = 5;

radius = 15;
num_hill = 18;

// cube_len = (2*pi*radius)/((1+r2)*num_hill*sin(45)*shrink_factor);
cube_len = (2*pi*radius)/((r2)*num_hill*shrink_factor);
fall_height = 10;

module pointy_cube(offset_v) {
    translate(offset_v)
    // rotate(atan(1/r2), [0, -1, 0])
    translate(v = [0,0,cube_len*r2/2]) 
    rotate(45, [1, 0, 0])
    cube(size = cube_len, center=true);
}

module pointy_cube_fall(rotate_deg=45 + roll_correction) {
    rotate(a = rotate_deg, v = [0,0,1]){
        for (i=[0:fall_height-1]) {
            // rotate(i*180, [0,0,1])
            pointy_cube(offset_v = [0,0,r2*cube_len*i]);
        }
    }
}

for (i=[0:num_hill-1]) {
    rotate(a = i*(360/num_hill), v = [0,0,1]) 
    translate(v = [radius*radius_correction, 0, 0]) 
    pointy_cube_fall();

    rotate(a = i*(360/num_hill)+(360/(2*num_hill)), v = [0,0,1]) 
    translate(v = [radius*radius_correction, 0, cube_len*r2/2]) 
    pointy_cube_fall();
}


cylinder(h = cube_len, r = radius*radius_correction);
cylinder(h = cube_len*r2*(fall_height-0), r = radius*radius_correction*0.98);
// translate(v = [0,0,r2*cube_len*fall_height]) 
// cylinder(h = cube_len, r = radius);