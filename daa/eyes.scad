$fa = 1;
$fs = 0.2;

height = 2.4;
radius = 12/2;
padding = 1.5;

iris_width = 2;

function circle_center_radius(p1, p2, p3) = let (
        // Calculate midpoint of line segments AB and BC
        mx1 = (p1[0] + p2[0]) / 2,
        my1 = (p1[1] + p2[1]) / 2,
        mx2 = (p2[0] + p3[0]) / 2,
        my2 = (p2[1] + p3[1]) / 2,
        // Calculate slopes of lines AB and BC and slopes of perpendicular bisectors
        m1 = (p2[1] - p1[1]) / (p2[0] - p1[0]),
        m2 = (p3[1] - p2[1]) / (p3[0] - p2[0]),
        mp1 = -1 / m1,
        mp2 = -1 / m2,
        // Calculate coordinates of center of circle
        cx = (mp2 * mx2 - mp1 * mx1 + my1 - my2) / (mp2 - mp1),
        cy = mp1 * (cx - mx1) + my1,
        // Calculate radius of circle
        r = sqrt((cx - p1[0]) * (cx - p1[0]) + (cy - p1[1]) * (cy - p1[1]))
    ) [cx, cy, r];

module cylinderer(p1, p2, p3) {
    the_cylinder = circle_center_radius(p1, p2, p3);
    translate([the_cylinder[0], the_cylinder[1], 0])
    linear_extrude(height = 2*height/3)
    circle(the_cylinder[2]);
}

difference(){
    hull(){
        cylinder(h = height, r = radius+padding);

        translate(v = [2*(radius+padding)+2*radius, 0, 0 ]) 
        cylinder(h = height, r = radius+padding);
    }

    cylinder(h = height, r = radius);

    translate([2*radius+padding, 0, 0])
    cylinder(h = height/3, r = radius);

    translate([2*radius+padding, 0, 0])
    cylinder(h = height/3, r = radius);

    translate([2*(2*radius+padding) , 0, 0])
    cylinder(h = height/3, r = radius);

    translate(v = [2*radius+padding, 0, 0]) 
    intersection() {
        cylinderer([0, radius*0.9], [-iris_width/2, 0], [0, -radius*0.9]);
        cylinderer([0, radius*0.9], [iris_width/2, 0], [0, -radius*0.9]);
    }

    translate(v = [4*radius+2*padding, 0, 0])
    intersection() {
        cylinderer([0, radius*0.9], [-iris_width/2, 0], [0, -radius*0.9]);
        cylinderer([0, radius*0.9], [iris_width/2, 0], [0, -radius*0.9]);
    }

}



