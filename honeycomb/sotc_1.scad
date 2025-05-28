// adapted from  https://www.thingiverse.com/thing:837848

// h=30;            // height of the cylinder
n=20;            // number of cells on the circumference
dw=4 * 1.35;        // distance between the faces of the cell
h1=1.6;            // height of the cell protrusion
w=1 * 0.95;        // gap between the cells
an=30;        // angle of cell tip sharpening


ds=(dw-w)/sin(360/6);
dc=((n*dw)/(2*PI))*2;
dh=dw*sin(360/6);


module st(h) {
difference() {
translate([dc/2, 0,0]) rotate([0,90,0]) cylinder(h1*2, ds/2, ds/2, $fn=6, true);
for (r1=[0:2])
translate([dc/2+h1, 0,0]) rotate([r1*120,0,0]) rotate([0,-an,0]) translate([0.01,-dw/2,0]) cube([h1*2,dw,dw]);
} // df

} // mod st;

module sotc(h) {
    difference() {
        union() {
            difference() {
                cylinder(h+0.1, dc/2, dc/2, $fn=128, true);
                // cylinder(h+0.1, dc/2.5, dc/2.5, $fn=128, true);
            }

            for (mz=[0,1]) mirror([0,0,mz])
            for (hn=[dh:dh*2:h/2+dh])
            translate([0,0,hn]) mirror([0,0,mz])
            for (r=[0:n-1]) {
                translate([0,0,dh/2]) rotate([0,0,360/n*r]) st(h);
                translate([0,0,-dh/2]) rotate([0,0,360/n/2]) rotate([0,0,360/n*r]) st(h);
            } // for

        } // un
        for (mz=[0,1]) mirror([0,0,mz])
            translate([0,0,h/2]) cylinder(ds*2, dc/2+h1*2, dc/2+h1*2, $fn=128);
    } // df
} // mod sotc


// sotc(30);

// measurements
// 5x + 5y = 25.3  -- x + y = 5.06
// 25.2 25.05 25.2 25.43 25.19 25.35 25.28 25.19 25.49 
// 24.62 24.69 24.61 
// 25.64 26.01 26.24
// 6x + 7y = 31.7 
// 31 31.34 31.45 32.08 32.06 32.04 32.33 31.21

// y = 1.34
// x = 3.72





// // Parameters
// h = 40;           // Total height of the structure
// n = 20;           // Number of cells around the circumference
// dw = 4.5;           // Distance between opposing flat faces of a hexagon (cell width)
// h1 = 1;           // Protrusion height of cell tips
// w = 1;            // Gap between adjacent cells
// an = 30;          // Angle for tip sharpening

// // Derived values
// ds = (dw - w) / sin(30);                        // Hexagon circumscribed diameter
// dc = (n * dw) / (PI);                           // Outer diameter of cell ring
// dh = dw * sin(30);                              // Vertical distance between cell layers

// // Cell shape module
// module cell_tip() {
//     difference() {
//         // Main hexagonal prism
//         translate([dc / 2, 0, 0])
//             rotate([0, 90, 0])
//                 cylinder(h1 * 2, ds / 2, ds / 2, $fn=6, center=true);

//         // Tip sharpening (3 wedges at 120° apart)
//         for (r1 = [0, 120, 240]) {
//             translate([dc / 2 + h1, 0, 0])
//                 rotate([r1, 0, 0])
//                     rotate([0, -an, 0])
//                         translate([0.01, -dw / 2, 0])
//                             cube([h1 * 2, dw, dw], center=false);
//         }
//     }
// }

// // Cell ring module
// module honeycomb_ring() {
//     difference() {
//         union() {
//             // Outer cylinder (base)
//             cylinder(h + 0.1, dc / 2, dc / 2, $fn=128, center=true);

//             // Cell placement (staggered)
//             for (z_shift = [-1, 1]) {
//                 for (layer = [dh : dh * 2 : h / 2]) {
//                     z_pos = z_shift * layer;

//                     for (i = [0 : n - 1]) {
//                         rotate([0, 0, 360 / n * i])
//                             translate([0, 0, z_pos + dh / 2])
//                                 cell_tip();
//                     }

//                     // Offset ring for staggered cells
//                     for (i = [0 : n - 1]) {
//                         rotate([0, 0, 360 / n * i + 360 / n / 2])
//                             translate([0, 0, z_pos - dh / 2])
//                                 cell_tip();
//                     }
//                 }
//             }
//         }

//         // Trim top and bottom
//         translate([0, 0, h / 2])
//             cylinder(h1 * 4, dc / 2 + h1 * 2, dc / 2 + h1 * 2, $fn=128, center=false);

//         translate([0, 0, -h / 2 - h1 * 4])
//             cylinder(h1 * 4, dc / 2 + h1 * 2, dc / 2 + h1 * 2, $fn=128, center=false);
//     }
// }

// // Call main module
// honeycomb_ring();