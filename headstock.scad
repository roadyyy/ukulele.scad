module headstock () {
    union () {
        difference () {
            translate([0,0,neckL+nutL+clearance]){
                rotate([90-headstockAngle, 0,180])
                    translate([0,0,-headstockD])
                        resize([headstockResizeW, headstockResizeL, 0])
                            linear_extrude(headstockD, convexity=10) 
                                import (file = "headstock.dxf");
                difference() {
                    scale([1, neckD/neckW1*2])
                        cylinder(headstockResizeL/2, neckW1/2, neckW1/2);
                    rotate([headstockAngle,0,0]) 
                        translate([-neckW2/2, 0, -30])
                            cube([headstockResizeL, neckW2, neckL+2]);

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