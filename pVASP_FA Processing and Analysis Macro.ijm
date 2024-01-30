run("Set... ", "zoom=25 x=1024 y=1024");
run("Subtract Background...", "rolling=20 stack");
run("StackReg", "transformation=Affine");
n=nSlices();
setSlice(1);
run("Set Label...", "label=Tln");
setSlice(2);
run("Set Label...", "label=pVASP");
setSlice(3);
run("Set Label...", "label=VASP");
run("Stack to Images");

selectWindow("Tln");
run("Duplicate...", "title=Tln-mask");
//////run("Subtract Background...", "rolling=20");
//////run("Duplicate...", "title=Tln-mask-MF");
////run("Gaussian Blur...", "sigma=20");
//imageCalculator("Subtract create", "Tln-mask","Tln-mask-MF");
//selectWindow("Tln-mask-MF");
//close();
//selectWindow("Result of Tln-mask");
run("Median...", "radius=2");
setAutoThreshold("Otsu dark");
//setAutoThreshold("Triangle dark");
//run("Threshold...");
run("Convert to Mask");
run("Despeckle");
run("Despeckle");

run("Set Measurements...", "area mean modal min shape display redirect=None decimal=3");


run("Analyze Particles...", "size=0.45-Infinity pixel circularity=0.00-.95 show=Masks add");
//selectWindow("Mask of Result of Tln-mask");
//selectWindow("Result of Tln-mask");
//close();
selectWindow("VASP");
run("Median...", "radius=1.5");
selectWindow("pVASP");
run("Median...", "radius=1.5");
selectWindow("Mask of Tln-mask");
run("Duplicate...", "title=01mask");
run("Divide...", "value=255");
imageCalculator("Multiply create", "VASP","01mask");
selectWindow("Result of VASP");
imageCalculator("Multiply create", "pVASP","01mask");
selectWindow("Result of pVASP");
imageCalculator("Divide create 32-bit", "Result of pVASP","Result of VASP");
selectWindow("Result of Result of pVASP");
run("S Pet");
run("Enhance Contrast", "saturated=0.35");

img=getImageID();
n=roiManager("count");
//run("Set Measurements...", "area mean display redirect=None decimal=3")
run("Set Measurements...", "area mean modal min shape redirect=None decimal=3");

setBatchMode(true);
for(i=0; i<n; i++) {
	roiManager("select", i);
	selectImage(img); 
	run("Measure");
	}
setBatchMode(false);

for (i=0;i<nImages;i++) {
        selectImage(i+1);
        run("Set... ", "zoom=25 x=1024 y=1024");
} 

run("Tile");
String.copyResults();
//run("script:H:\Recent IF\Analysis Pt1\Measure_from_all_ROIs.ijm");
//run("script:C:\Users\Alan.Alanhowe\OneDrive - University of Vermont\Documents\Fiji64\Fiji.app\macros\SaveAllOpenAsTiff.ijm", "choose=H:/Analysis/");

