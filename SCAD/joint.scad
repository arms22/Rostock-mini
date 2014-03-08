h = 7;
r = h/2 / cos(30);

module stumpy() {
  rotate([0, 90, 0]) rotate([0, 0, 30]) intersection() {
    cylinder(r=r, h=8, center=true, $fn=6);
    sphere(r=5.1, $fn=24);
  }
}

module middle() {
  difference() {
    union() {
      translate([-2, 0, 0]) stumpy();
      translate([2, 0, 0]) stumpy();
      rotate([0, 0, 90]) stumpy();
// set screw guide
//      translate([0, 0, 4]) cylinder(r=3, h=2, center=true, $fn=12);
    }
    rotate([90, 0, 0]) cylinder(r=1.4, h=30, center=true, $fn=12);
    rotate([0, 90, 0]) cylinder(r=1.4, h=30, center=true, $fn=12);
// set screw hole
//    translate([0, 0, 3]) cylinder(r=1.4, h=6, center=true, $fn=12);
  }
}


//for (x = [0:2]) for (y = [0:3])
//translate([x*20, y*15, h/2]) middle();

//translate([-20,  0, h/2]) middle();
//translate([-20, 15, h/2]) middle();

middle();