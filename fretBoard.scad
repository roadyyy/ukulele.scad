module fretboard () {
    s = scaleLength;
    difference () {
        union () {
            rotate([90,0,0]) {

                translate([0,0, -fretBoardD]) 
                    linear_extrude(fretBoardD) 
                        hull () {
                            translate([-neckW2/2,0,0]) 
                                square([neckW2, 0.1]);
                            translate([-neckW1/2,neckL,0]) 
                                square([neckW1, 0.1]);
                        }
                
                // nut
                
                    translate([-neckW1/2, neckL, -fretBoardD-nutH]) 
                        difference () {
                            cube ([neckW1, nutL, fretBoardD+nutH]);
                            
                            translate([neckW1/2-stringsWidthNut/2,nutL, nutH - stringHeight]) 
                                rotate([90,0,0]) 
                                    translate([0,0, -1])
                                        linear_extrude(nutL+2) hull () {
                                            circle (s1g/2);
                                            translate([0, -nutH, 0]) circle (s1g/2);
                                        }
                            translate([neckW1/2-stringsWidthNut/2+stringsWidthNut/3,nutL,nutH - stringHeight]) 
                                rotate([90,0,0]) 
                                    translate([0,0, -1])
                                        linear_extrude(nutL+2) hull () {
                                            circle (s2g/2);
                                            translate([0, -nutH, 0]) circle (s2g/2);
                                        }
                            translate([neckW1/2-stringsWidthNut/2+stringsWidthNut/3*2,nutL,nutH - stringHeight]) 
                                rotate([90,0,0]) 
                                    translate([0,0, -1])
                                        linear_extrude(nutL+2) hull () {
                                            circle (s3g/2);
                                            translate([0, -nutH, 0]) circle (s3g/2);
                                        }
                            translate([neckW1/2+stringsWidthNut/2,nutL,nutH - stringHeight]) 
                                rotate([90,0,0]) 
                                    translate([0,0, -1])
                                        linear_extrude(nutL+2) hull () {
                                            circle (s4g/2);
                                            translate([0, -nutH, 0]) circle (s4g/2);
                                        }
                        }
            // /rotate
            }

            // lets do the frets
            translate([0, fretBoardD, neckL]) {
                rotate ([-90,0,90]) {
                    for (n = [1:1:numFrets]) {
                        translate([0, s-(s/(pow(2,(n/12)))), 0]) {

                            difference () {
                                cylinder (neckW1 + (neckW2-neckW1)/neckL*(s-(s/(pow(2,(n/12))))), fretH/2, fretH/2, true);
                                translate([0,-fretH/2, -(neckW1 + (neckW2-neckW1)/neckL*(s-(s/(pow(2,(n/12))))))/2])
                                    rotate([0,45,0])
                                        cube([fretH, fretH, fretH]);
                                translate([0,-fretH/2, (neckW1 + (neckW2-neckW1)/neckL*(s-(s/(pow(2,(n/12))))))/2])
                                    rotate([0,45,0])
                                        cube([fretH, fretH, fretH]);
                            }
                        }
                    }
                }
            }
        }
        // fret marks
        fretmarks(1, 0);
    }
}

module fretmarks (margin, clr) {
    s = scaleLength;
    for (n = fm) {
        translate([0,0, neckL - (s-(s/(pow(2,((n-1)/12))))) - (((s-(s/(pow(2,((n)/12))))) - (s-(s/(pow(2,((n-1)/12)))))) / 2)])
            rotate([-90,0,0]) cylinder (fretBoardD+margin, fretMark-clr, fretMark-clr);
    }
    // double mark
    for (n = fm2) {
        translate([neckW2/2-10,0, neckL - (s-(s/(pow(2,(n/12))))) - (((s-(s/(pow(2,((n+1)/12))))) - (s-(s/(pow(2,(n/12)))))) / 2)])
            rotate([-90,0,0]) cylinder (fretBoardD+margin, fretMark-clr, fretMark-clr);
        translate([-neckW2/2+10,0, neckL - (s-(s/(pow(2,(n/12))))) - (((s-(s/(pow(2,((n+1)/12))))) - (s-(s/(pow(2,(n/12)))))) / 2)])
            rotate([-90,0,0]) cylinder (fretBoardD+margin, fretMark-clr, fretMark-clr);
    }
}