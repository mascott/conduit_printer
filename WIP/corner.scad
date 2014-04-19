include </Users/sxm/Projects/simple_conduit/simple_conduit_config.scad>

tubeHeight = 60;

connector();

module connector(){
  translate([-13,-13,0]) cube([26,26,26]);
  translate([0,0,13]) tube(10, 13, tubeHeight);
  translate([0,0,13]) rotate([0, 270, 90]) reciever();
  translate([0,0,13]) rotate([0, 270, 180]) reciever();
}

module reciever(){
  difference(){
    receptor();
    translate([3, -4, 41]){
      cube([20, 8, 20]);
    }
  }

  translate([9, 4, 50]){
    tab();
  }

  translate([9, -9, 50]){
    tab();
  }
}

module receptor(){
  tube(10, 13, tubeHeight);
}

module tube(inner, outer, height){
  difference(){
    cylinder(height, outer, outer);
    translate([0, 0, -1]) cylinder(height + 2, inner, inner);
  }
}

module tab(){
  difference(){
    cube([14, 5, 10]);
    translate([9, 9, 5]) rotate([90, 0, 0]) cylinder(10, 3, 3);
  }
}