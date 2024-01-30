n=nSlices();
setSlice(1);
run("Set Label...", "label=Tln");
setSlice(2);
run("Set Label...", "label=pR2");
if (n==3) {
	setSlice(3);
	run("Set Label...", "label=R2");
	}

run("Stack to Images");

dir = getDirectory("Choose a Directory to save input images");
dira = getDirectory("Choose a Directory to save aligned images");

ids=newArray(nImages);
for (i=0;i<nImages;i++) {
        selectImage(i+1);
        title = getTitle;
        print(title);
        ids[i]=getImageID;

        saveAs("tiff", dir+title);
} 


run("Register Virtual Stack Slices", "source="+dir+" output="+dira+" feature=Rigid registration=[Rigid                -- translate + rotate                  ]");

selectWindow("Tln.tif"); run("Close");
selectWindow("pR2.tif"); run("Close");
if (n==3) {
	selectWindow("R2.tif"); run("Close");
	}


close("Log");
