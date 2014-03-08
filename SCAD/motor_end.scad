include <configuration.scad>
use <bracket.scad>

h = motor_end_height; // Total height.
m = 31; // Motor mounting screws distance (center to center)

module motor_end() {
    translate([0, 0, h/2]) 
    difference() {
    union() {
      bracket(h);
      for (x = [-30, 30]) {
        // Diagonal fins.
        translate([x, 29.5, 0]) intersection() {
          cube([5, 30, h], center=true);
          rotate([45, 0, 0]) translate([0, -50, 0])
            cube([20, 100, 100], center=true);
        }
        // Extra mounting screw holes.
        translate([x, 48, 4-h/2]) difference() {
          cylinder(r=5, h=8, center=true, $fn=24);
          translate([0, 0, 0]) cylinder(r=1.9, h=9, center=true, $fn=12);
        }
      }
    }
    // Motor shaft (RepRap logo)
    rotate([90, 0, 0]) cylinder(r=12, h=40, center=true);
    // Motor mounting screw slots
    translate([m/2, 0, m/2]) rotate([90, 0, 0])
      cylinder(r=1.7, h=40, center=true, $fn=24);
    translate([-m/2, 0, m/2]) rotate([90, 0, 0])
      cylinder(r=1.7, h=40, center=true, $fn=24);
    translate([m/2, 0, -m/2]) rotate([90, 0, 0])
      cylinder(r=1.7, h=40, center=true, $fn=24);
    translate([-m/2, 0, -m/2]) rotate([90, 0, 0])
      cylinder(r=1.7, h=40, center=true, $fn=24);
    for (i = [-1, 1]) for (z = [-14, 0, 14])
      translate([i, -1, z]) screws();

  }
}

motor_end();
