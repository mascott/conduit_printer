use <MCAD/motors.scad>
use <MCAD/triangles.scad>
include </Users/sxm/Projects/simple_conduit/simple_conduit_config.scad>

// Local variables
plateThickness = 2.5;
tubeInnerRadius = 9;

// Object

mount();
translate([22,28.5,-10.7]) rotate([90, 0, 270]) pipe_tab();
translate([-19.5,28.5,-10.7]) rotate([90, 0, 270]) pipe_tab();

// Modules
module mount(){
  top_plate();
  vertical_support();
  corner_brace();
}

module top_plate(){
  difference(){
    cube([44, 44, plateThickness], center = true);
    stepper_motor_mount(17, 1);
  }

}

module vertical_support(){
  translate([-22, 22.5, 1.3]) rotate([90, 90, 0]){
    horizontal_bars();
    vertical_bars();
    cross_bars();
  }

  module horizontal_bars(){
    translate([ 0, 0, 0]) cube([10, 44, plateThickness]);
    translate([35, 0, 0]) cube([10, 44, plateThickness]);
  }

  module vertical_bars(){
    translate([0,  0, 0]) cube([44, 4, plateThickness]);
    translate([0, 40, 0]) cube([44, 4, plateThickness]);
  }

  module cross_bars(){
    translate([10, 1, 0]) rotate([0, 0, 55]) cube([48, 4, plateThickness]);
    translate([8, 40, 0]) rotate([0, 0, -55]) cube([45, 4, plateThickness]);
  }
}

module corner_brace(){
  translate([22, 22, 0]) rotate([180,90,0]) triangle(42, 35, plateThickness);
  translate([-22+plateThickness, 22, 0]) rotate([180,90,0]) triangle(42, 35, plateThickness);
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
