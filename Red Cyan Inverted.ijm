
run("Stack to Images");
run("Merge Channels...", "c1=Tln c5=pR2 keep ignore");

selectImage("Tln");
run("Duplicate...", "title=Tln-inverted");
setOption("ScaleConversions", true);
run("8-bit");
run("Grays");
run("Invert");

selectImage("pR2");
run("Duplicate...", "title=pR2-inverted");
setOption("ScaleConversions", true);
run("8-bit");
run("Grays");
run("Invert");
