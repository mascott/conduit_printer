use <MCAD/motors.scad>
use <MCAD/triangles.scad>
use </Users/sxm/Projects/simple_conduit/WIP/simple_corner.scad>
use </Users/sxm/Projects/simple_conduit/WIP/xy_motor_mount.scad>
include </Users/sxm/Projects/simple_conduit/simple_conduit_config.scad>

// Local variables
plateThickness = 2.5;
tubeInnerRadius = 9;


corner();
translate([18,32,5]) rotate([0,0,0]) mount();

// Modules
module mount(){
  top_plate();
  corner_brace();
}

module top_plate(){
  difference(){
    translate([-2,0,0]) cube([55, 45, plateThickness], center = true);
    translate([5,0,0]) stepper_motor_mount(17, 1);
  }
}

module corner_brace(){
  translate([-29.5+plateThickness, -30, -1.2]) rotate([0,270,0]) triangle(50, 25, plateThickness);
}

module pipe_tab(){
  difference(){
    tab();
    translate([0,6,0]) cylinder(d = tubeInnerRadius, plateThickness);
  }

  module tab(){
    cube([6, 12, plateThickness]);
    translate([0,6,0]) cylinder(d=12, plateThickness);
  }
}
