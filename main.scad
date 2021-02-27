$fn = 64;
clearance= .3; // overall clearance
// neck
scaleLength = 350;
neckL = 230; // neck length
neckW1 = 34; // neck with at the nut
neckW2 = 44; // neck with at the body
neckD = 15; // neck depth
tubeSlot = 8/2; // carbon tube insert radius (not diameter). 0 for none
doubleTube = false; // two tube inserts

// body
bodyPos = -10; // body Z offset
bodyTh = 60; // body thickness
// body wall thickness
/*
Recommendations:
    1.4 for Esun - eWood
    0.8 or 1 for Esun PLA+
*/
wall = 1.2; 
sbWall = wall; // soundboard wall thickness
bodyShape = "violin.svg"; // shape pd the body
bodyResize = scaleLength/2+50; // resize body to this
hole = 50/2; // hole radius
customHole = true; // is set true, this will be generated from shShape instead oh circular hole
shShape = "soundHole.svg"; // filename for a custom soundhole
holePos = 70; // hole position on the body

// socket
socketL = 40; // socket length
socketCylinder = 15/2; // socket cylinder cutouts raduis
socketCylinderOffset = -10; // socket cylinder cutout position

//headstock
headstockShape = "noteHeadstock.svg";
headstockClearance = clearance;
headstockD = 10; // headstock depth
headstockAngle = 15; // headstock angle
headstockResizeL = 100; // headstock resize to length
headstockResizeW = 55; // headstock resize to width
tunerHole = 5; // tuner hole raduis (usually 5mm)
tunerScrew = 0.7; // tuner screw raduis
tunerScrewL = 8; // tuner screw length
tunerScrewDistance = 11.35; // tuner screw hole distance from tuner axis
tunerScrewAngle = 45; // tuner screw hole angle

//fretboard
fretBoardD= 4; // fretboard depth (height above body)
nutH = 2; // nut height
nutL = 3; // nut length (along neck)
fretH = 1.8; // fret height above neck (radius)
numFrets = 18; // number of frets

fm = [5,7,10,15]; // fretmarks on frets #
fm2 = [12]; // double fretmarks on frets #
fretMark = 3; // fretmark radius

// strings
stringsWidthNut = 26.8; // 1st to 4th string center distance at nut
stringsWidthBridge = 40.2; // 1st to 4th string center distance at bridge
stringHeight = 1.7; // height of strings above fretboard at nut
stringHeightBridge = 9; // height of strings above fretboard at bridge

// gauges
s1g = .8; // 1st A
s2g = 1; // 2nd E
s3g = 1.2; // 3rd C
s4g = .8; // 4th G

// bridge
bridgeNutW = stringsWidthBridge + 10;
bridgeNutH = stringHeightBridge;
bridgeNutTh = 3;
bridgeBaseHeight = 3;
bridgeL = 25;

// computed
socketDistance = scaleLength/2+10;
neckEnd = neckL-socketDistance-socketL*2;
socketW =  neckW1 + (neckW2 - neckW1)/ neckL * socketDistance;
socketD = bodyTh - wall - clearance;

include <./body.scad>;
include <./neck.scad>;
include <./headstock.scad>;
include <./fretboard.scad>;
include <./bridge.scad>;
include <./bridgePins.scad>;



// assembly
    body();
    #deck();
    #bridge(bridgeL, bridgeBaseHeight, bridgeNutW, bridgeNutTh, stringsWidthBridge, s3g+.3);
    bridgeNut(bridgeNutH, bridgeNutW, bridgeNutTh-.4, bridgeBaseHeight);
    bridgePins(0);
    translate([0,0.01,0]) union () {
        neck();
        translate([0,0,neckL-socketDistance]) 
            socket();
    }

    headstock(headstockClearance);
    #fretboard();
    fretmarks(0, clearance);