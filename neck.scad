module neck () {
    difference () {
        scale([1, neckD/neckW1*2]) cylinder(neckL, neckW2/2, neckW1/2);
        translate([-neckW2/2, 0, -1]) cube([neckW2, neckW2, neckL+2]);
        translate([0,0, neckL-socketDistance-socketL/2]) cube ([neckW2, neckW2, socketL], true);
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

        translate([0,-socketD/2, socketCylinder*1.5])
            translate([-socketW/2, socketD/2, -socketL]) 
                rotate([90, 0, 0]) 
                    cylinder (socketD+2, socketCylinder, socketCylinder-clearance);
        translate([0,-socketD/2, socketCylinder*1.5]) 
            translate([socketW/2, socketD/2, -socketL]) 
                rotate([90, 0, 0]) 
                    cylinder (socketD+2, socketCylinder, socketCylinder-clearance);

        }
}