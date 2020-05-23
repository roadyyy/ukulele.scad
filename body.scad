module body () {
    
    difference () {
        
        union () {
            // outer
            difference () {
                translate([0, -bodyTh, bodyPos]) 
                    rotate([0, -90,-90]) 
                        linear_extrude(bodyTh, convexity=10) 
                            resize([bodyResize, 0, 0]) 
                                import (file = bodyShape, convexity= 4);
                // inner
                translate([0, -bodyTh-.1, bodyPos]) 
                    rotate([0, -90,-90]) 
                        linear_extrude(bodyTh-wall+.1, convexity=10)
                            offset (-wall)
                                resize([bodyResize, 0, 0])
                                    import (file = bodyShape, convexity= 4);
                
                translate([0,1,-holePos]) rotate([90,0,0]) cylinder(wall+2, hole, hole);
                
                //bridge positioning sockets
                translate([15,-wall/2, neckL - scaleLength])
                    rotate([90,0,0])
                        cylinder (wall, 2.5+clearance/2, 2.5+clearance/2);
                translate([-15,-wall/2, neckL - scaleLength])
                    rotate([90,0,0])
                        cylinder (wall, 2.5+clearance/2, 2.5+clearance/2);
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
                translate([-1.5 + neckW2/2,-bodyTh-1-wall, neckL-scaleLength-40]) 
                    cube ([3, bodyTh, 40]);

                translate([0, -bodyTh, bodyPos]) 
                    rotate([0, -90,-90]) 
                        linear_extrude(bodyTh, convexity=10) 
                            resize([bodyResize, 0, 0]) 
                                import (file = bodyShape, convexity= 4);
            }

            intersection() {
                translate([-1.5 - neckW2/2,-bodyTh-1-wall, neckL-scaleLength-40]) 
                    cube ([3, bodyTh, 40]);

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


module deck() {
    // deck front
    translate([0, -bodyTh-wall-clearance]) mirror ([0, 1, 0])
    union () {
        difference () {
            innerDeck(0);
            innerDeck(-3);
        }
        difference () {
            translate([0, -wall, bodyPos])
                rotate([0, -90,-90]) 
                    linear_extrude(wall, convexity=10)
                        resize([bodyResize, 0, 0])
                            import (file = bodyShape, convexity= 4);
            
           
        }
    }
}

module innerDeck (offset) {
    difference () {
            translate([0, -wall-2, bodyPos])
                rotate([0, -90,-90]) 
                    linear_extrude(2, convexity=10)
                        offset (-wall-clearance+offset)
                            resize([bodyResize, 0, 0])
                                import (file = bodyShape, convexity= 4);
            
            translate([-socketW/2,0, neckEnd + (socketL + socketD)/2 - bodyPos]) 
                rotate([90,0,0]) 
                    linear_extrude(bodyTh, convexity=10) 
                        offset(clearance*2+wall+offset) 
                            square ([socketW, socketL+socketD]);
        }
}