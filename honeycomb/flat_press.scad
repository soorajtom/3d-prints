$fa = 4.0;
$fs = 0.2;

hexagon_width = 70.0/15.0;
base_height = 1.5;
stamp_height = 1.5;
flat_height = 1;
border_thickness = 3;
panel_width = 200;
panel_breadth = 5 * 25.4;
grid_padding = 2;

// ==== PARAMETERS ====
hex_size = hexagon_width / sqrt(3);          // Side length of each hexagon
wall_thickness = 0.5;   // Wall thickness
scale_factor = 0.1;
rows = 25;               // Number of rows
cols = 50;              // Number of columns
grid_height = 2;       // Extrusion height

// ==== HELPER: Single Hexagon with Tapered Walls ====
module tapered_hexagon() {
    // Outer hexagon
    outer_points = [for(i = [0:5]) [hex_size * cos(i * 60), hex_size * sin(i * 60)]];
    
    // Inner hexagon (offset by wall thickness)
    inner_points = [for(i = [0:5]) [(hex_size - wall_thickness) * cos(i * 60), (hex_size - wall_thickness) * sin(i * 60)]];
    
    // Create the tapered hexagon
    difference() {
        // Outer hexagon walls remain straight
        linear_extrude(height = grid_height) {
            polygon(outer_points);
        }
        // Inner cavity tapers inward
        linear_extrude(height = grid_height, scale = scale_factor) {
            polygon(inner_points);
        }
    }
}

// ==== HELPER: Grid of Tapered Hexagons ====
module hex_grid(rows, cols) {
    for (row = [0:rows-1])
        for (col = [0:cols-1]) {
            x = 1.5 * hex_size * col;
            y = sqrt(3) * hex_size * row + (col % 2) * (sqrt(3) * hex_size / 2);
            translate([x, y])
              scale(v = [1.01, 1.01, 1]) 
                tapered_hexagon();
        }
}

// ==== MAIN BODY ====
difference() {
    cube([panel_width, panel_breadth, base_height+stamp_height+flat_height]);
    translate([border_thickness+grid_padding, border_thickness+grid_padding, base_height])
        intersection() {
            cube([panel_width-2*(border_thickness+grid_padding), panel_breadth-2*(border_thickness+grid_padding), base_height+stamp_height]);
            hex_grid(rows, cols);
        }
    translate([border_thickness, border_thickness, base_height+stamp_height])
        cube([panel_width-2*(border_thickness), panel_breadth-2*(border_thickness), flat_height]);
}

