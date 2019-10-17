module headstock () {
    union () {
        difference () {
            translate([0,0,neckL+nutL+clearance]){
                difference () {
                    union () {
                        rotate([90-headstockAngle, 0,180])
                            difference () {
                                translate([0,0,-headstockD])
                                    resize([headstockResizeW, headstockResizeL, 0])
                                        linear_extrude(headstockD, convexity=10) 
                                            import (file = "headstock.dxf");
                            }
                        difference() {
                            scale([1, neckD/neckW1*2])
                                cylinder(headstockResizeL/2, neckW1/2, neckW1/2);
                            rotate([headstockAngle,0,0]) 
                                translate([-neckW2/2, 0, -30])
                                    cube([headstockResizeL, neckW2, neckL+2]);

                        }
                    }
                    rotate([90-headstockAngle, 0,180]) {
                        translate([15,30, -headstockD])
                            tuner("R");
                        translate([-21,5,0]) rotate ([0,0, -20]) {
                            translate([0,30, -headstockD])
                                tuner("L");
                            translate([0,55, -headstockD])
                                tuner("L");
                            translate([0,80, -headstockD])
                                tuner("L");
                        }
                    }
                }
            }
            translate([0,0, clearance])
                scale([1, neckD/neckW1*2]) 
                    cylinder(neckL+nutL, neckW2/2, neckW1/2);
        }
        
        intersection () {
            translate([0,0, clearance]) scale([1, neckD/neckW1*2])
                cylinder(neckL+nutL, neckW2/2, neckW1/2);
            headstockSocket(0);
        }
    }
}

module headstockSocket(clr) {
    translate([-neckW1*0.2,0, neckL+nutL-neckW1/2]) 
        rotate([90, 0, 0]) 
            linear_extrude(20, convexity=10)
                offset (clr)
                union () {
                    square ([neckW1*0.4, neckW1/2+clearance*2]);
                    translate([0, neckW1/4, 0]) circle(neckW1/8);
                    translate([neckW1*0.4, neckW1/4, 0]) circle(neckW1/8);
                }
}

module tuner (side) {
    // side = 0 for left, 1 for right
    translate([0,0,-1]) cylinder (headstockD+2, tunerHole, tunerHole);
    if (side == "L") {
        negation = 1;
        rotate([0,0, 180 + tunerScrewAngle * negation])
            translate([0, tunerScrewDistance, 0])
                cylinder (tunerScrewL, tunerScrew, tunerScrew);
    } else {
        negation = -1;
        rotate([0,0, 180 + tunerScrewAngle * negation])
            translate([0, tunerScrewDistance, 0])
                cylinder (tunerScrewL, tunerScrew, tunerScrew);
    }
}