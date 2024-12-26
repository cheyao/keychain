include <BOSL/constants.scad>
use <BOSL/shapes.scad>

module base() {
	difference() {
		cuboid([30,30,2.6], fillet=5, edges=EDGE_BK_LF+EDGE_BK_RT+EDGE_FR_LF+EDGE_FR_RT, $fn=100, align=V_UP);
		translate([0, 0, 0.8])
		cyl(h=0.4, d=25.8, align=V_UP);
	}
}

module keyhole() {
	translate([0, -0.001, 0])
	union() {
		difference() {
			union() {
				cyl(r=4.5, h=2.6, $fn=100, align=V_UP);
				cuboid([4.5*2, 4.5, 2.6], align=V_UP+V_FRONT);
			}

			translate([0, 0, -1])
			cyl(r=2.5, h=8, $fn=100, align=V_UP);
		}

		translate([4.5 - 0.001, -4.5, 0])
		interior_fillet(l=2.6, r=4.5, orient=ORIENT_Z, $fn=100, align=V_UP);

		translate([-4.5 + 0.001, -4.5, 0])
		interior_fillet(l=2.6, r=4.5, orient=ORIENT_Z_90, $fn=100, align=V_UP);
	}
}

module mold() {
	union() {
		base();
		translate([0, 30/2+4.5, 0])
		keyhole();
	}
}

mold();

