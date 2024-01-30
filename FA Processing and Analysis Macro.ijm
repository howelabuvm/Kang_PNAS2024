selectWindow("Registered Un");
run("Stack to Images");
selectWindow("Tln");

run("Duplicate...", "title=Tln-mask");
run("Subtract Background...", "rolling=20");
run("Duplicate...", "title=Tln-mask-MF");
run("Gaussian Blur...", "sigma=20");
imageCalculator("Subtract create", "Tln-mask","Tln-mask-MF");
selectWindow("Result of Tln-mask");
selectWindow("Tln-mask-MF");
close();
setAutoThreshold("Otsu dark");
//run("Threshold...");
run("Convert to Mask");
run("Despeckle");
run("Despeckle");

run("Set Measurements...", "area mean modal min shape display redirect=None decimal=3");


run("Analyze Particles...", "size=0.45-Infinity pixel circularity=0.00-.82 show=Masks add");
selectWindow("Mask of Result of Tln-mask");
selectWindow("Result of Tln-mask");
close();
selectWindow("Tln");
run("Subtract Background...", "rolling=20");
selectWindow("pR2");
run("Subtract Background...", "rolling=20");
selectWindow("Mask of Result of Tln-mask");
run("Duplicate...", "title=01mask");
run("Divide...", "value=255");
imageCalculator("Multiply create", "Tln","01mask");
selectWindow("Result of Tln");
imageCalculator("Multiply create", "pR2","01mask");
selectWindow("Result of pR2");
imageCalculator("Divide create 32-bit", "Result of pR2","Result of Tln");
selectWindow("Result of Result of pR2");
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

//run("script:H:\Recent IF\Analysis Pt1\Measure_from_all_ROIs.ijm");
//run("script:C:\Users\Alan.Alanhowe\OneDrive - University of Vermont\Documents\Fiji64\Fiji.app\macros\SaveAllOpenAsTiff.ijm", "choose=H:/Analysis/");

