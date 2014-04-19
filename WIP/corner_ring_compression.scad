include </Users/sxm/Projects/simple_conduit/simple_conduit_config.scad>

tubeHeight = 30;
innerRadius = 9;
outerRadius = 12;

compression_connector();

translate([20, 20, 0]) color("blue") compression_ring();


//
// MODULES
//

module compression_ring(){
  tube(innerRadius, outerRadius, 5);
}

module compression_connector(){
  compression_reciever();
  // translate([0,0,13]) rotate([0, 270, 90]) compression_reciever();
  // translate([0,0,13]) rotate([0, 270, 180]) compression_reciever();
}

module compression_reciever(){
  difference(){
    receptor();
    translate([0,0, tubeHeight - 25]) tube(innerRadius+1.5, outerRadius, 22);
  }

  difference(){
    translate([0, 0, 23]) cylinder(h = 4, r1 = innerRadius, r2 = outerRadius, center = false);
    translate([0, 0, 23]) cylinder(6, 29);
    translate([-13, -1.5, tubeHeight - 25]) cube([26, 3, 25]);                    // DUPLICATE
    rotate([0, 0, 90]) translate([-13, -1.5, tubeHeight - 25]) cube([26, 3, 25]); // DUPLICATE
  }

  rotate([0,0,45]) pressure_triangle();
  rotate([0,0,135]) pressure_triangle();
  rotate([0,0,225]) pressure_triangle();
  rotate([0,0,315]) pressure_triangle();

  // translate([0,0,35]) color("red") tube(12, 13, 25);
}

// module connector(){
//   translate([-13,-13,0]) cube([26,26,26]);
//   translate([0,0,13]) tube(10, 13, tubeHeight);
//   translate([0,0,13]) rotate([0, 270, 90]) reciever();
//   translate([0,0,13]) rotate([0, 270, 180]) reciever();
// }

// module reciever(){
//   difference(){
//     receptor();
//     translate([3, -4, 41]){
//       cube([20, 8, 20]);
//     }
//   }
//
//   translate([9, 4, 50]){
//     tab();
//   }
//
//   translate([9, -9, 50]){
//     tab();
//   }
// }

module pressure_triangle(){
  translate([9.5, 0, tubeHeight - 8]) rotate([90,0,90]) polyhedron(
    points=[ [5,5,0],[5,-10,0],[-5,-10,0],[-5,5,0], // the four points at base
             [0,5,2.3]  ],                                 // the apex point
    faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
                [1,0,3],[2,1,3]  ]                         // two triangles for square base
  );
}

module receptor(){
  difference(){
    tube(innerRadius, outerRadius, tubeHeight);
    translate([-outerRadius, -1.5, tubeHeight - 25]) cube([26, 3, 25]);
    rotate([0, 0, 90]) translate([-outerRadius, -1.5, tubeHeight - 25]) cube([26, 3, 25]);
  }
}

module tube(inner, outer, height){
  difference(){
    cylinder(height, outer, outer);
    translate([0, 0, -1]) cylinder(height + 2, inner, inner);
  }
}

// module tab(){
//   difference(){
//     cube([14, 5, 10]);
//     translate([9, 9, 5]) rotate([90, 0, 0]) cylinder(10, 3, 3);
//   }
// }