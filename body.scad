module body () {
    
    difference () {
        
        union () {
            // outer
            difference () {
                translate([0, -bodyTh-sbWall, bodyPos]) 
                    rotate([0, -90,-90])
                        linear_extrude(bodyTh+sbWall, convexity=10) 
                            resize([bodyResize, 0, 0]) 
                                import (file = bodyShape, convexity= 4);
                // inner
                translate([0, -bodyTh-.1-sbWall, bodyPos]) 
                    rotate([0, -90,-90]) 
                        linear_extrude(bodyTh+.1, convexity=10)
                            offset (-wall)
                                resize([bodyResize, 0, 0])
                                    import (file = bodyShape, convexity= 4);
                
                translate([0,1,-holePos]) rotate([90,0,0]) cylinder(wall+2, hole, hole);
                
                //bridge positioning holes
                bridgePins(clearance);
            }
            translate([0, -bodyTh,0]) {
                difference () {
                    innerDeck(wall, 0);
                    innerDeck(-3, 0.1);
                }
            }
            translate([0, -3-sbWall,0]) {
                difference () {
                    innerDeck(wall, 0);
                    innerDeck(-3, 0.1);
                }
            }
            
            // socket insert
            intersection () {
                translate([0, -bodyTh, bodyPos]) 
                    rotate([0, -90,-90]) 
                        linear_extrude(bodyTh, convexity=10) 
                            resize([bodyResize, 0, 0]) 
                                import (file = bodyShape, convexity= 4);
                translate([-socketW/2,0, neckEnd + (socketL + socketD)/2 - bodyPos]) 
                    rotate([90,0,0]) 
                        linear_extrude(bodyTh, convexity=10) 
                            offset(clearance+wall) 
                                square ([socketW, socketL+socketD]);
            }
            // bridge supports
            intersection() {
                translate([-1.5 + neckW2/2, -bodyTh, neckL-scaleLength-50])
                    difference () {
                        cube ([3, bodyTh, 60]);
                        translate([-.1, 0, bodyTh+sbWall + 10]) rotate([0, 90, 0]) cylinder(3.2, bodyTh-10, bodyTh-10);
                    }

                translate([0, -bodyTh, bodyPos]) 
                    rotate([0, -90,-90]) 
                        linear_extrude(bodyTh, convexity=10) 
                            resize([bodyResize, 0, 0]) 
                                import (file = bodyShape, convexity= 4);
            }

            intersection() {
                translate([-1.5 - neckW2/2,-bodyTh, neckL-scaleLength-50]) 
                    difference () {
                        cube ([3, bodyTh, 60]);
                        translate([-.1, 0, bodyTh+sbWall + 10]) rotate([0, 90, 0]) cylinder(3.2, bodyTh-10, bodyTh-10);
                    }

                translate([0, -bodyTh, bodyPos]) 
                    rotate([0, -90,-90]) 
                        linear_extrude(bodyTh, convexity=10) 
                            resize([bodyResize, 0, 0]) 
                                import (file = bodyShape, convexity= 4);
            }
        }
        // socket
        translate([0,clearance,neckL - socketDistance-socketL-clearance])
            difference() {
                translate([(-socketW-2*clearance)/2,-socketD-2*clearance,0])
                    cube ([socketW+clearance*2, socketD+2*clearance, socketL+socketD-clearance]);
                translate([0,-socketD/2, 0]) 
                    translate([-socketW/2, socketD/2, socketCylinder * 1.5+clearance]) 
                        rotate([90, 0, 0]) 
                            cylinder (socketD+2, socketCylinder-clearance, socketCylinder-clearance);
                translate([0,-socketD/2, 0]) 
                    translate([socketW/2, socketD/2, socketCylinder * 1.5+clearance]) 
                        rotate([90, 0, 0]) 
                            cylinder (socketD+2, socketCylinder-clearance, socketCylinder-clearance);
            }
    }
}


module deck () {
    // deck front
    translate([0, -bodyTh-sbWall]) mirror ([0, 1, 0])
    union () {
        difference () {
            translate([0, -sbWall, bodyPos])
                rotate([0, -90,-90]) 
                    linear_extrude(sbWall, convexity=10)
                        offset (-wall-(clearance)) resize([bodyResize, 0, 0])
                            import (file = bodyShape, convexity= 4);
            
           
        }
    }
}

module innerDeck (offset, offsetH) {
    translate([0, -offsetH, bodyPos])
        rotate([0, -90,-90]) 
            linear_extrude(3 + offsetH * 2, convexity=10)
                offset (-wall-clearance+offset)
                    resize([bodyResize, 0, 0])
                        import (file = bodyShape, convexity= 4);
    
}