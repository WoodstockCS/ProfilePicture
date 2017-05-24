// modification of P_4_3_2_01.pde
// at https://github.com/generative-design/Code-Package-Processing-3.x/
//    blob/master/01_P/P_4_3_2_01/P_4_3_2_01.pde
// Licensed under the Apache License, Version 2.0

PFont font;
PImage img;
boolean showOriginal = false;
float cellSize = 5;
float scale = 1;
int imgWidth = 800;
int imgHeight = 800;
String txt ="Oh, say can you see, By the dawn's early light, What so proudly we hailed, At the twilight's last gleaming? Whose broad stripes and bright stars, Through the perilous fight, O'er the ramparts we watched, Were so gallantly streaming. And the rocket's red glare, The bombs bursting in air, Gave proof through the night, That our flag was still there. Oh say does that star spangled banner yet wave, For the land of the free, and the home of the brave.";
int txtLength;
int currentLetter;

void settings() {
  size((int)(imgWidth * scale),(int)(imgHeight * scale));  
}

void setup() {
  noLoop();
  img = loadImage("Picture.jpg");
  println(img.width + " x " + img.height);
  txtLength = txt.length();
}

void draw() {
  background(240);
  textAlign(LEFT);
  noStroke();
  if (showOriginal) {
    image(img, 0, 0, imgWidth * scale, imgHeight * scale);
  } else {
    // start both of these loops at 0.
    // one should run while its variable is less than imgHeight,
    // and the other should run while its variable is less than imgWidth
    for(int y = 1; y <= imgHeight; y += cellSize) {
      for(int x = 1; x <= imgWidth; x += cellSize) { 
        currentLetter = (currentLetter+1) % txtLength;
        color c = img.pixels[y*imgWidth+x];
        int greyness = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071);
        fill(c);
        float xLoc = x * scale;
        float yLoc = y * scale;

        //float size = cellSize * scale;
        //float size = cellSize * scale * .5;
        //float size = map(greyness, 0, 255, cellSize * scale, .5);
        
        // draw an ellipse at xLoc, yLoc, using 'size' for width and height
        
        //ellipse(xLoc, yLoc, size, size);
        textSize(cellSize * scale * 1.5);
        text(txt.charAt(currentLetter), xLoc, yLoc);

      }
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    showOriginal = !showOriginal;
    redraw();
  }
}  
void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("_##.png");
}
