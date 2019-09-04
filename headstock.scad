module headstock () {
    translate([0,0,neckL]){

        rotate([90-headstockAngle, 0,180])
            translate([0,0,-headstockD])
                resize([headstockResizeW, headstockResizeL, 0])
                    linear_extrude(headstockD) 
                        import (file = "headstock.dxf");
        difference() {
            scale([1, neckD/neckW1*2]) 
                cylinder(headstockResizeL/2, neckW1/2, neckW1/2);
            rotate([headstockAngle,0,0]) 
                translate([-neckW2/2, 0, -30])
                    cube([headstockResizeL, neckW2, neckL+2]);
        }
    }
}