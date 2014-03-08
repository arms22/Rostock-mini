include <configuration.scad>
use <bracket_no_holl.scad>

h = 22; // Total height.

module bearing_mount() {
  translate([0, 0, 2.3]) cylinder(r1=11, r2=8, h=3, center=true);
  translate([0, 0, -2.3]) cylinder(r1=8, r2=11, h=3, center=true);
}

module belt_idler() {
  translate([0, 0, h/2]) 
  difference() {
    union() {
      bracket(h);
      translate([0, 8, 0]) rotate([90, 0, 0]) bearing_mount();
    }
    translate([0, 8, 0]) rotate([90, 0, 0])
      cylinder(r=4, h=40, center=true);
    for (i = [-1, 1])
	 for (z = [-5.5, 5.5])
       translate([i, -1, z]) screws();
  }
}

belt_idler();
