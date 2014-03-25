ball_d = 9;
outer_d = 8;
inner_d = 5;
height = 25;
offset = 2.6;
$fn = 64;

module joint() {
	difference() {
		union() {
			// poll
			cylinder(r=outer_d/2, h=height, center=true);
			// helper disc
			translate([0, 0, -height/2 + 0.1]) cylinder(r=outer_d*1.1, h=0.2, center=true);
		}
		cylinder(r=inner_d/2, h=height*2, center=true);
		translate([0, 0, height/2+offset]) sphere(r=ball_d/2);
	}
}

for(x=[0:2]) for(y=[0:1])
		translate([x*(outer_d * 2), y*(outer_d * 2), 0]) joint();
