$fn = 64;
clearance= 0.2;
// neck
scaleLength = 350;
neckL = 230; // neck length
neckW1 = 35; // neck with at the nut
neckW2 = 45; // neck with at the body
neckD = 15; // neck depth

// body
bodyPos = 10; // body Z offset
bodyTh = 60; // body thickness
wall = 2; // body wall thickness
bodyShape = "jt.dxf"; // shape pd the body
bodyResize = scaleLength/2+50; // resize body to this
hole = 50/2; // hole radius
holePos = 40; // hole position on the body

// socket
socketL = 40; // socket length
socketCylinder = 15/2; // socket cylinder cutouts raduis
socketCylinderOffset = -10; // socket cylinder cutout position
//headstock

headstockD = 10; // headstock depth
headstockAngle = 13; // headstock angle
headstockResizeL = 90; // headstock resize to length
headstockResizeW = 60; // headstock resize to width

//fretboard
fretBoardD= 3; // fretboard depth (height above body)
nutH = 3; // nut height
nutL = 3; // nut length (along neck)
fretH = 2; // fret height above neck (radius)
numFrets = 18; // number of frets

// colors (view only)
bodyC = "white"; // body color
neckC = "#333333"; //neck color
headstockC = "white"; // headstock color
fretboardC = "#333333"; // fretboard color

include <./body.scad>;
include <./neck.scad>;
include <./headstock.scad>;
include <./fretboard.scad>;

// computed
neckEnd = neckL-socketDistance-socketL*2;
socketW =  neckW1 + (neckW2 - neckW1)/ neckL * socketDistance;
socketD = bodyTh - wall - clearance;
socketDistance = scaleLength/2+10;

// build
color(bodyC) body();

color(neckC) translate([0,0.01,0]) union () {
    neck();
    translate([0,0,neckL-socketDistance]) 
        socket();
}

color(headstockC) headstock();
color(fretboardC) fretboard();
