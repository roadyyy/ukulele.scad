$fn = 64;
clearance= 0.2;
// neck
scaleLength = 350;
neckL = 210;
neckW1 = 35;
neckW2 = 45;
neckD = 15;
neckAbovebody = 5;

// body
bodyPos = -10;
bodyTh = 60;
wall = 3;
bodyShape = "kurt.dxf";
bodyResize = scaleLength/2+50;
hole = 50/2;
holePos = 70;

// socket
socketDistance = scaleLength/2+10;
socketL = 40;
socketW =  neckW1 + (neckW2 - neckW1)/ neckL * socketDistance;
socketD = bodyTh - wall;
socketCylinder = 15/2;
socketCylinderOffset = -10;

// colors (view only)
bodyC = "white";
neckC = "#333333";

include <./body.scad>;
include <./neck.scad>;

color(bodyC) body();

color(neckC) translate([0,0.01,0]) union () {
    neck();
    translate([0,0,neckL-socketDistance]) 
        socket();
}