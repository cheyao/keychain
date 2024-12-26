module corner(size, r) {
	difference() {
		cube([r, r, size[2]+0.002]);
		translate([-0.001, -0.001, -0.001])
		intersection() {
			cylinder(r=r+0.001, h=size[2]+0.2, center=false);
			cube([r+0.001, r+0.001, size[2]+0.2]);
		}
	}
}

module rcube(size, r) {
	difference() {
	cube(size, true);

	translate([size[0]/2 - r + 0.001, size[1]/2 - r + 0.001, -size[2] / 2 - 0.001])
	corner(size, r);
	}
}

rcube([200, 200, 2], 20);
