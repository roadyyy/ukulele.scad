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
                translate([0, -bodyTh+wall, bodyPos]) 
                    rotate([0, -90,-90]) 
                        linear_extrude(bodyTh-2*wall, convexity=10)
                            offset (-wall)
                                resize([bodyResize, 0, 0])
                                    import (file = bodyShape, convexity= 4);
                
                translate([0,1,-holePos]) rotate([90,0,0]) cylinder(wall+2, hole, hole);
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