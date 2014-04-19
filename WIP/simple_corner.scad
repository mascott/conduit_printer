include </Users/sxm/Projects/simple_conduit/simple_conduit_config.scad>

// Local variables
tubeLength = 40;
tubeInnerRadius = 9;
tubeOuterRadius = 11.5;


// Object
corner();

// Modules
module corner(){
  difference(){
    triplet();
    cylinder(h = tubeLength, r = tubeInnerRadius);
    rotate([90,0,0])  cylinder(h = tubeLength, r = tubeInnerRadius);
    rotate([0,90,0])  cylinder(h = tubeLength, r = tubeInnerRadius);
  }
  corner_supports();
}

module corner_support(){
  translate([20, 0, 6]) rotate([0, -45, 0]) cylinder(h = 20, r = 4);
}

module corner_supports(){
  corner_support();
  rotate([0, 0, 270]) corner_support();
  rotate([90, 0, 0]) corner_support();
}

module triplet(){
  receptor();
  rotate([90,0,0]) receptor();
  rotate([0,90,0]) receptor();
  sphere(tubeOuterRadius);
}

module receptor(){
  difference(){
    tube(tubeInnerRadius, tubeOuterRadius, tubeLength);
    rotate([0,0,45]) drillHoles();
  }
}

module drillHoles(){
  translate([-tubeOuterRadius,0,25]) rotate([0,90,0]) cylinder(h = tubeOuterRadius*2, r = 2);
}

module tube(inner, outer, height){
  difference(){
    cylinder(h = height, r = outer);
    cylinder(h = height, r = inner);
  }
}
