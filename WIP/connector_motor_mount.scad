use <MCAD/motors.scad>
use <MCAD/triangles.scad>
use </Users/sxm/Projects/simple_conduit/WIP/simple_corner.scad>
use </Users/sxm/Projects/simple_conduit/WIP/xy_motor_mount.scad>
include </Users/sxm/Projects/simple_conduit/simple_conduit_config.scad>

// Local variables
plateThickness = 2.5;
tubeInnerRadius = 9;
tubeOuterRadius = 11.5;


// Object

// translate([-50,0,0]){
  complete_mount();
// }

// translate([50,0,0]){
//   mirror([1,0,0]){
//     complete_mount();
//   }
// }


// Modules
module complete_mount(){
  corner();
  translate([18,32,5]) rotate([0,0,0]) mount();
}

module mount(){
  top_plate();
  corner_brace();
}

module top_plate(){
  difference(){
    translate([-2,0,0]) cube([55, 45, plateThickness], center = true);
    translate([5,0,0]) motor_mount_17();
  }

  translate([-2,20,2]) cube([55, 3, 2], center=true);
  translate([-2,-20,2]) cube([55, 3, 2], center=true);
  translate([-17,8,2]) cube([25, 3, 3], center=true);
  translate([-17,-8,2]) cube([25, 3, 3], center=true);
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

module motor_mount_17(){
  translate([0, 0, -2]) color("red") cylinder(d=23, plateThickness+1);
  translate([ 15.5,  15.5, -2]) color("red") cylinder(d=3.5, plateThickness+1);
  translate([ 15.5, -15.5, -2]) color("red") cylinder(d=3.5, plateThickness+1);
  translate([-15.5,  15.5, -2]) color("red") cylinder(d=3.5, plateThickness+1);
  translate([-15.5, -15.5, -2]) color("red") cylinder(d=3.5, plateThickness+1);
}