module fretboard () {
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
        s = scaleLength;
        translate([0, fretBoardD, neckL]) {
            rotate ([-90,0,90]) {
                for (n = [1:1:numFrets]) {
                    translate([0, s-(s/(pow(2,(n/12)))), 0])
                        union () {
                            translate([0, 0, ( neckW1-fretH + (neckW2-neckW1)/neckL*(s-(s/(pow(2,(n/12))))) )/2]) sphere (fretH/2);
                            translate([0, 0, -( neckW1-fretH + (neckW2-neckW1)/neckL*(s-(s/(pow(2,(n/12))))) )/2]) sphere (fretH/2);
                            cylinder (neckW1-fretH + (neckW2-neckW1)/neckL*(s-(s/(pow(2,(n/12)))))-0.05, fretH/2, fretH/2, true);
                        }
                }
            }
        }
    }
}