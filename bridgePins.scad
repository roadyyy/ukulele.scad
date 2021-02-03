module bridgePins (clr) {
    //positioning sockets
        translate([15,sbWall, neckL - scaleLength])
            rotate([90,0,0])
                cylinder (sbWall * 2, 2.5+clr/2, 2.5+clr/2);
        translate([-15, sbWall, neckL - scaleLength])
            rotate([90,0,0])
                cylinder (sbWall * 2, 2.5+clr/2, 2.5+clr/2);
}