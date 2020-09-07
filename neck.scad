module neck () {
    difference () {
        scale([1, neckD/neckW1*2]) 
            cylinder(neckL+nutL, neckW2/2, neckW1/2);
        translate([-neckW2/2, 0, -1]) 
            cube([neckW2, neckW2, neckL+nutL+2]);
        translate([0,0, neckL-socketDistance-socketL/2]) 
            cube ([neckW2, neckW2, socketL], true);
        headstockSocket(clearance);
        // end of socket cut. fretboard will be extended to full length
        translate([-neckW2/2,-socketD, neckEnd]) cube ([neckW2, socketD, socketL]);

        carbon();
    }
}

module socket () {
    difference() {
        translate([0, -socketD, socketD]) 
            rotate([0,90,0]) 
                intersection () {
                    rotate_extrude(angle = 360, convexity = 2) {
                        translate([socketD,0,0])
                            scale([neckD/neckW1*2, 1])
                            hull () {
                                circle(socketW/2-2);
                                translate([socketW/2+30, 0, 0]) square([socketW,socketW], center=true);
                            }
                    }
                    translate([0,0,socketW/2])
                        rotate([0,90,0])
                            cube ([socketW, socketD, socketL+socketD]);
                }
        // cutouts
        translate([0,-socketD/2, socketCylinder*1.5])
            translate([-socketW/2, socketD/2, -socketL]) 
                rotate([90, 0, 0]) 
                    cylinder (socketD+2, socketCylinder, socketCylinder-clearance);
        translate([0,-socketD/2, socketCylinder*1.5]) 
            translate([socketW/2, socketD/2, -socketL]) 
                rotate([90, 0, 0]) 
                    cylinder (socketD+2, socketCylinder, socketCylinder-clearance);

        // carbon tube slot
        translate([0,0, -socketD]) carbon();
    }
    
}

module carbon () {
    if (tubeSlot) {
        translate([0, -neckD/2, nutL]) {
            if (doubleTube) {
                translate ([neckW1 / 4, 0, 0]) cylinder (neckL + clearance - (neckW1/2+clearance*2), tubeSlot + clearance, tubeSlot + clearance);
                translate ([-neckW1 / 4, 0, 0]) cylinder (neckL + clearance - (neckW1/2+clearance*2), tubeSlot + clearance, tubeSlot + clearance);
            } else {
                cylinder (neckL + clearance - (neckW1/2+clearance*2), tubeSlot + clearance, tubeSlot + clearance);
            }
        }
        headstockSocket(0);
    }
}