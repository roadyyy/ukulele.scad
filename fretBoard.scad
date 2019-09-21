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

            translate([-neckW1/2, neckL, -fretBoardD-nutH]) cube ([neckW1, nutL, fretBoardD+nutH]);
        // /rotate
        }


        // lets do the frets
        s = scaleLength;
        translate([0, fretBoardD, neckL]) {
            rotate ([-90,0,90]) {
                for (n = [1:1:numFrets]) {
                    translate([0, s-(s/(pow(2,(n/12)))), 0])
                        cylinder (neckW1 + (neckW2-neckW1)/neckL*(s-(s/(pow(2,(n/12)))))-0.05, fretH/2, fretH/2, true);
                }
            }
        }
    }
}