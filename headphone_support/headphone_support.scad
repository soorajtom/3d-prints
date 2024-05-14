$fa = 1;
$fs = 0.2;

molding_height = 14.3 ;
platform_height = 23.3 -9.6;
headphone_width = 40;
tab_height = 10;

modling_width = 6.7;
width = 10;

grab_length = 15;

points = [
    [0,0],
    [0, width+(molding_height-platform_height)/2],
    [grab_length, width+(molding_height-platform_height)/2],
    [grab_length, width],
    [grab_length+modling_width, width],
    [grab_length+modling_width, width+molding_height],
    [grab_length, width+molding_height],
    [grab_length, width+platform_height+(molding_height-platform_height)/2],
    [0, width+platform_height+(molding_height-platform_height)/2],
    [0, 2*width+molding_height],
    [grab_length+modling_width+width, 2*width+molding_height],
    [grab_length+modling_width+width, width],
    [grab_length+modling_width+width+headphone_width, width],
    [grab_length+modling_width+width+headphone_width+width/4, width+tab_height],
    [grab_length+modling_width+width+headphone_width+width, width+tab_height],
    [grab_length+modling_width+width+headphone_width+width, 0],
];

linear_extrude(height = width) 
polygon(points);
