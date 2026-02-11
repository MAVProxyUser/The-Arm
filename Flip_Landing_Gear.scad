/*Replacement landing strut to fit
original Hoverthings Flip arm*/

//Dimensions
thickness=7;
arm_slot_width=28.3;
arm_slot_height=7;
total_height=59.5; //from center of arm slot

$fn=100;

// extrusion height will be thickness
linear_extrude(height=thickness) {
  difference() {
    // base shape
    union() {
      minkowski() {
        polygon(points=[[8,17.5],[(total_height-2.5),0],[8,-17.5]]);
        circle(r=2);
      }
      minkowski() {
        square([15.5,35],center=true);
        circle(r=2);
      }
    }
    // vertical slot
    square([25,18.5],center=true);
    // horizontal slot for arm
    translate([-0.5,0]) square([arm_slot_height,arm_slot_width],center=true);
    // top finger tapers
    for(i=[-1:1])
      polygon(points=[[-9.75,8*i],[-9.75,15.5*i],[-6,8*i]]);
    // small triangular cutout
    minkowski() {
      polygon(points=[[37.6,-2],[37.6,2],[(total_height-15.5),0]]);
      circle(r=1.75);
    }
    translate([15.5,0]) scale([1.3,1]) circle(r=10.4);
    // rounded main cutout
    minkowski() {
      polygon(points=[[19,-8],[19,8],[28.2,4.5],[28.2,-4.5]]);
      circle(r=2); 
    }
  }
}