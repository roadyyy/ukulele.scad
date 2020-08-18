# ukulele.scad
Easy to print and assemble ukulele that doesn't sound like crap )

Project page: https://www.thingiverse.com/thing:4389517
Sound sample here: https://youtu.be/leMtTsVdUpw

Wood fillament is recommended (I have not yet tried my successful version with PLA)

I decided to make a customizable ukulele design for easy 3d-printing and assembly.

There are a lot of parameters that can be customized like scale length, fret number, string gauges etc.

Any body and headstock shapes can be drawn in Inkscape (or whatever can export svg or dxf) and applied to the design with some corrections (variables like bodyPos are there to help with positioning of custom drawn deck designs)

Only non 3d printed things you need are strings and tuners

UPD: Many bugs discovered at initial print fixed. Added s superstrat shape. And guess what. It sounds surprisingly decent when printed with wood fillament

How to print one:
INSTRUCTIONS

You can either use the stl files from this project (if so, just skip to step 4) or get you hands a little dirty and customize the design or other parameters which I will cover below.

1. Open main.scad file and review or change the parameters to your preference. in the bottom of this file are module calls to render the ukulele.

2. draw your own shapes for body and headstock in inkscape (files also included). Try to get them positioned roughly like the ones provided. You can also position them in main.scad using coresponding params

3. When you are satisfied with the design scroll to the bottom of main.scad and comment all the part module calls and render and export them uncommenting lines one by one so you get all the parts as separate stl files. 

4. print it using following materiald and settings:
- Headstock - wood fillament 70% infill or more
- Neck - wood, 70% infill or more
- Body - wood, 100% infill
- Deck - wood, 100% infill
- Bridge - PLA or any, 100% infill
- Bridge Nut - pla, 100%
- fretboard - PLA or PA, 100%
- Dots - PLA, or any, 30%+ infill
5. snap all parts together and glue them with cyanoacrilate adhesive (superglue), except for bridge nut, no need to glue that one.
6. buy and install tuners
7. set up strings
8. tune it and play your favorite song

