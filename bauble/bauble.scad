$fa = 4.0;
$fs = 0.5;


// Ornament parameters
disc_diameter = 80;      // Diameter of the ornament
disc_thickness = 2;      // Thickness of the ornament disc
inner_ring_offset = 8;   // Offset for inner decorative ring
outer_ring_offset = 3;   // Offset for outer decorative ring
ring_thickness = 2;      // Thickness of the decorative rings
hole_diameter = 5;       // Diameter of hanging hole

text_indent = 1;         // Indentation for text lines

// Text parameters
line1_text = "First";
line2_text = "Christmas";
line2_1_text = "as";
line3_text = "Mr. and Mrs.";  // Leave empty if no third line is needed
year_text = "2024";

// Text sizes and fonts
line1_text_size = 10;
line2_text_size = 10;
line2_1_text_size = 8;
line3_text_size = 8;
year_text_size = 10;

// text_font = "Mistral:style=Regular";  // Set same font for consistency
// text_font = "WhisperWrite:style=Regular";  // Set same font for consistency
// text_font = "AdineKirnberg:style=Regular";  // Set same font for consistency
text_font = "Banff\\-Normal:style=Regular";  // Set same font for consistency
// as_text = "Liberation Sans:style=Bold";  // Set same font for consistency
as_text = "Mistral:style=Regular";  // Set same font for consistency
// year_text_font = "Times New Roman:style=Italic";
// year_text_font = "Bauhaus 93:style=Regular";
year_text_font = "Bazooka:style=Regular";

// Ornament base disc
module ornament_disc() {
    difference() {
        // Main disc
        cylinder(d = disc_diameter, h = disc_thickness, center = true);
        
        // Hole for hanging
        translate([0, disc_diameter/2 - hole_diameter - 1, 0])
            cylinder(d = hole_diameter, h = disc_thickness + 1, center = true);
    }
}

// Decorative ring patterns
module outer_ring() {
    difference() {
        cylinder(d = disc_diameter - outer_ring_offset, h = disc_thickness, center = true);
        cylinder(d = disc_diameter - outer_ring_offset - ring_thickness, h = disc_thickness, center = true);
    }
}

module inner_ring() {
    cylinder(d = disc_diameter - inner_ring_offset, h = disc_thickness + 0.5, center = true);
}

// Arched year text
module arched_year_text() {
    letter_spacing = 12;               // Adjust spacing to fit arch
    year_text_radius = (disc_diameter / 2) - ((inner_ring_offset + outer_ring_offset) / 2); // Place text between rings

    for (i = [0 : len(year_text) - 1]) {
        rotate([0, 0, i * letter_spacing - (len(year_text) * letter_spacing) / 2])
            translate([year_text_radius, 0, 0])
                linear_extrude(height = disc_thickness)
                    text(year_text[i], size = year_text_size, font = year_text_font, valign = "center", halign = "center");
    }
}

// Straight text modules for each line of main text
module line1_text_label() {
    linear_extrude(height = disc_thickness)
        text(line1_text, size = line1_text_size, font = text_font, halign = "center", valign = "center");
}

module line2_text_label() {
    linear_extrude(height = disc_thickness)
        text(line2_text, size = line2_text_size, font = text_font, halign = "center", valign = "center");
}

module line2_1_text_label() {
    linear_extrude(height = disc_thickness)
        text(line2_1_text, size = line2_1_text_size, font = as_text, halign = "center", valign = "center");
}

module line3_text_label() {
    linear_extrude(height = disc_thickness)
        text(line3_text, size = line3_text_size, font = text_font, halign = "center", valign = "center");
}

module year_text_label() {
    linear_extrude(height = disc_thickness)
        text(year_text, size = year_text_size, font = year_text_font, halign = "center", valign = "center");
}

scale(v = 1.4) 
// Assembling the ornament
translate([0, 0, disc_thickness / 2]) {
    difference () {
        
        ornament_disc();
        
        // Add inner and outer rings

        translate(v = [0,0,ring_thickness-text_indent])  outer_ring();
        // inner_ring();

        // Place arched year text between rings
        // translate([0, 0, -text_indent]) arched_year_text();

        // Place text lines in the center of the disc
        translate([0, 22, -text_indent]) line1_text_label();
        translate([0, 10, -text_indent]) line2_text_label();
        translate([0, -1, -text_indent]) line2_1_text_label();
        translate([0, -9, -text_indent]) line3_text_label();
        translate([0, -24, -text_indent]) year_text_label();
    }
}
