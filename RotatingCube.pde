/**
 * RGB Cube.
 * 
 * The three primary colors of the additive color model are red, green, and blue.
 * This RGB color cube displays smooth transitions between these colors. 
 */
 
JSONObject hostinfo;
int mycolour = color(128,128,128);
PFont f;
int x=0;
float xmag, ymag = 0;
int mysize = 50; 
void setup()  { 
 
  //fullScreen(P3D);
  size(320, 240, P3D); 
  noFill();
  noCursor();
  colorMode(RGB, 1); 
 // ortho();
 
  hostinfo = loadJSONObject("hostinfo.json");
  
  if (hostinfo.getString("hostname").equals("pi2")) mycolour = color(255,0,0);
  if (hostinfo.getString("hostname").equals("pi3")) mycolour = color(0,255,0);
  if (hostinfo.getString("hostname").equals("pi4")) mycolour = color(0,0,255);
  
  printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(f);
} 
 
void draw()  { 
  background(0);
  
  fill(mycolour);
  textSize(24);

  
  pushMatrix(); 

//  text(hostinfo.getString("hostname"), x%width, x%height, (x%500)-250);
//  text(hostinfo.getString("ipaddr"), x%width, x%height, (-x%500)+250);

  translate(width/2, height/2); 
  
  rotateX(ymag/2); 
 // rotateY(35-ymag/3); 
  //rotateZ(ymag/2);
  
 // scale(height/4);
  beginShape(QUADS);
  strokeWeight(5);
  
  stroke(0,255,0);
  noFill();
  //fill(0,255,0, 10);
  vertex(-mysize,  mysize,  mysize);
  vertex( mysize,  mysize,  mysize);
  vertex( mysize, -mysize,  mysize);
  vertex(-mysize, -mysize,  mysize);
  
  vertex( mysize,  mysize,  mysize);
  vertex( mysize,  mysize, -mysize);
  vertex( mysize, -mysize, -mysize);
  vertex( mysize, -mysize,  mysize);
  
  vertex( mysize,  mysize, -mysize);
  vertex(-mysize,  mysize, -mysize);
  vertex(-mysize, -mysize, -mysize);
  vertex( mysize, -mysize, -mysize);
  
  vertex(-mysize,  mysize, -mysize);
  vertex(-mysize,  mysize,  mysize);
  vertex(-mysize, -mysize,  mysize);
  vertex(-mysize, -mysize, -mysize);
  
  vertex(-mysize,  mysize, -mysize);
  vertex( mysize,  mysize, -mysize);
  vertex( mysize,  mysize,  mysize);
  vertex(-mysize,  mysize,  mysize);
  
  vertex(-mysize, -mysize, -mysize);
  vertex( mysize, -mysize, -mysize);
  vertex( mysize, -mysize,  mysize);
  vertex(-mysize, -mysize,  mysize);

  endShape();
  
  popMatrix(); 
  
  ymag += 0.01;
  
  //if (degrees(ymag) < 360 ) {
  //saveFrame("frames/frame-######.png");
  //}
  x += 1; 
  
  
  
} 