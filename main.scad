$fn = 64;
clearance= 0.2;
// neck
scaleLength = 350;
neckL = 230; // neck length
neckW1 = 34; // neck with at the nut
neckW2 = 44; // neck with at the body
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
headstockResizeL = 100; // headstock resize to length
headstockResizeW = 60; // headstock resize to width
tunerHole = 5; // tuner hole raduis (usually 5mm)
tunerScrew = 0.5; // tuner screw raduis
tunerScrewL = 8; // tuner screw length
tunerScrewDistance = 10.35; // tuner screw hole distance from tuner axis
tunerScrewAngle = 45; // tuner screw hole angle

//fretboard
fretBoardD= 3; // fretboard depth (height above body)
nutH = 2.1; // nut height
nutL = 3; // nut length (along neck)
fretH = 1; // fret height above neck (radius)
numFrets = 18; // number of frets

// strings
stringsWidthNut = 26.8; // 1st to 4th string center distance at nut
stringsWidthBridge = 40.2; // 1st to 4th string center distance at bridge
stringHeight = 1.7; // height of strings above fretboard

// gauges
s1g = .5; // 1st A
s2g = .7; // 2nd E
s3g = .9; // 3rd C
s4g = .5; // 4th G

// colors (view only)
bodyC = "white"; // body color
neckC = "#333333"; //neck color
headstockC = "white"; // headstock color
fretboardC = "#333333"; // fretboard color

// computed
socketDistance = scaleLength/2+10;
neckEnd = neckL-socketDistance-socketL*2;
socketW =  neckW1 + (neckW2 - neckW1)/ neckL * socketDistance;
socketD = bodyTh - wall - clearance;

include <./body.scad>;
include <./neck.scad>;
include <./headstock.scad>;
include <./fretboard.scad>;


// build
color(bodyC) body();

color(neckC) translate([0,0.01,0]) union () {
    neck();
    translate([0,0,neckL-socketDistance]) 
        socket();
}

color(headstockC) headstock();
color(fretboardC) fretboard();

