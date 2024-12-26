include <BOSL/constants.scad>
use <BOSL/shapes.scad>

cuboid([30,30,2.6], fillet=5, edges=EDGE_BK_LF+EDGE_BK_RT+EDGE_FR_LF+EDGE_FR_RT, $fn=100);
cylinder(h=0.4, d=25.4);
