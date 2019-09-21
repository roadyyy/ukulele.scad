$fn = 64;
clearance= 0.2;
// neck
scaleLength = 350;
neckL = 230;
neckW1 = 35;
neckW2 = 45;
neckD = 15;
neckAbovebody = 5;

// body
bodyPos = 10;
bodyTh = 60;
wall = 2;
bodyShape = "jt.dxf";
bodyResize = scaleLength/2+50;
hole = 50/2;
holePos = 40;

// socket
socketDistance = scaleLength/2+10;
socketL = 40;
socketW =  neckW1 + (neckW2 - neckW1)/ neckL * socketDistance;
socketD = bodyTh - wall - clearance;
socketCylinder = 15/2;
socketCylinderOffset = -10;
//headstock

headstockD = 10;
headstockAngle = 13;
headstockResizeL = 90;
headstockResizeW = 60;

//fretboard
fretBoardD= 3;
nutH = 3;
nutL = 3;
fretH = 2;
numFrets = 18;

// colors (view only)
bodyC = "white";
neckC = "#333333";
headstockC = "white";
fretboardC = "#333333";

include <./body.scad>;
include <./neck.scad>;
include <./headstock.scad>;
include <./fretboard.scad>;

// computed
neckEnd = neckL-socketDistance-socketL*2;


// build
color(bodyC) body();

color(neckC) translate([0,0.01,0]) union () {
    neck();
    translate([0,0,neckL-socketDistance]) 
        socket();
}

color(headstockC) headstock();
color(fretboardC) fretboard();

