// all in mm
module holder(pen_diameter, hole_height = 0, hole_diameter, screw_width) {
    slack_height = 3;
    slack_width = 4;
    module pen(height) {
        translate([0, 0, - 1])
            cylinder(h = hole_height * 2 + 2, d = pen_diameter);
    };
    module inner_holder() {
        union() {
            translate([0, 0, slack_height ]) {
                cylinder(h = hole_height, d = hole_diameter);
            }
            // sockel
            cylinder(h = slack_height, d = hole_diameter + 2 * slack_width );
        }
    }
    module screw_hole() {
        translate([- screw_width / 2, 0, - 1])
            cube([screw_width, hole_diameter, hole_height * 2 + 2], center = false);
    }
    //screw_hole();
    //inner_holder();
    //pen();
    difference() {
        inner_holder();
        pen();
        screw_hole();
    }
}

module big_holder(pen_diameter){
    holder(pen_diameter = pen_diameter, hole_height = 10.5 , hole_diameter = 24.2, screw_width = 2.7 + 2);
}

module smale_holder(pen_diameter){
    holder(pen_diameter = pen_diameter, hole_height = 10.5 , hole_diameter = 10, screw_width = 2.7 + 2);
}

// molotow
//big_holder(12.3);
