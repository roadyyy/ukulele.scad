module bridge (l, h, nW, thick, stringsWidth, gauge) {
    difference () {

        union () {
            mink = 6;
            heightMultiplier = 1.35;
            translate([-(nW + 35) / 2 + mink, 0, neckL - scaleLength + 5-mink])
                rotate([-90,0,0])
                    minkowski() {
                        cube([nW+35-mink*2, l-mink*2, 0.01]);
                        cylinder(h-0.01, mink,0);
                    }
                difference () {
                    translate([-nW / 2,0, neckL - scaleLength]) {

                        difference(){
                            rotate([0,90,0]) {
                                scale([1, heightMultiplier ,1])
                                    cylinder (nW, 5, 5);
                            }
                            translate([0,-heightMultiplier-10,-10/2])
                                cube([nW, heightMultiplier+10,10]);  
                        }
                    }
                
                    bridgeNut(bridgeNutH, bridgeNutW+2, bridgeNutTh, bridgeBaseHeight);
                }
            
            translate([(-nW) / 2, 10, neckL - scaleLength-l+10]) {
                translate([0,-10,-10/2]) {
                    difference () {

                    cube([nW, 8,10]);
                    // string holes
                    translate([-(-nW) / 2 + stringsWidth / 6, 4.7, -1]) 
                        cylinder(12, gauge/2 + clearance, gauge/2 + clearance);
                    translate([-(-nW) / 2 + stringsWidth / 2, 4.7, -1]) 
                        cylinder(12, gauge/2 + clearance, gauge/2 + clearance);
                    translate([-(-nW) / 2 - stringsWidth / 6, 4.7, -1]) 
                        cylinder(12, gauge/2 + clearance, gauge/2 + clearance);
                    translate([-(-nW) / 2 - stringsWidth / 2, 4.7, -1]) 
                        cylinder(12, gauge/2 + clearance, gauge/2 + clearance);
                    }
                }
            }
        }
        //positioning sockets
        bridgePins(clearance);
    // end diff
    }
}

module bridgeNut (height, width, thick, baseH) {
    translate([-width / 2,thick/2 + baseH, neckL - scaleLength])
        rotate([90,0,0])
            rotate([0,90,0])
                linear_extrude(width)  
                    hull () {
                        circle(thick/2);
                        translate([height - thick - baseH, 0]) circle(thick / 2);
                    }
}