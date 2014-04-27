include </Users/sxm/Projects/simple_conduit/simple_conduit_config.scad>


tubeInnerRadius = 9;
tubeOuterRadius = 11.5;

support_ring();

module support_ring(){

  difference(){
    drill_ring();
    translate([0,0,-30]) cylinder(r=tubeOuterRadius+.2, 50);
  }

  module drill_ring(){
    difference(){
      solid_ring();
      translate([-14.1,0,0]) rotate([0,90,0]) cylinder(r=2, 28.2);
    }
  }

  module solid_ring(){
    translate([0,0,3.5]) tube(tubeOuterRadius+.2, 14, 11.5);
    translate([-14,0,0]) rotate([0,90,0]) cylinder(r=5, 28);
    translate([-12, 0, 7.5]) cube([4,10,15], center=true);
    translate([ 12, 0, 7.5]) cube([4,10,15], center=true);
  }
}

module tube(inner, outer, height){
  difference(){
    cylinder(h = height, r = outer);
    cylinder(h = height+.1, r = inner);
  }
}
