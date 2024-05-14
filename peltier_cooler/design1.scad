$fa = 1;
$fs = 0.2;


peltier_x = 40;
peltier_y = 40;
peltier_z = 3.7;

table_x = 55;
table_y = 50;
table_z = peltier_z;

wall_thickness = 1.5;
cold_cabin_depth = 6;

drain_r = 3;

difference() {
    cube(size = [table_x, table_y, table_z]);
    translate([((table_x-peltier_x)/2), ((table_y-peltier_y)/2), 0])
        cube([peltier_x, peltier_y, cold_cabin_depth+table_z]);
}

translate([((table_x-peltier_x)/2), ((table_y-peltier_y)/2), table_z])
cube([peltier_x, peltier_y, cold_cabin_depth]);
