PImage img;

int resolution = 4;

char[] ascii;

void setup(){
  img = loadImage("imgtest3.jpg");
  background(255);
  fill(0);
  noStroke();
  surface.setResizable(true);
  surface.setSize(img.width, img.height);
  // build up a character array that corresponds to brightness values
  ascii = new char[256];
  String letters = "@%#*+=-:. ";
  for (int i = 0; i < 256; i++) {
    int index = int(map(i, 0, 256, 0, letters.length()));
    ascii[i] = letters.charAt(index);
  }
 
  PFont mono = createFont("Courier", resolution + 2);
  textFont(mono);
 
  }

void asciify() {
  img.filter(GRAY);
  img.loadPixels();
  for (int y = 0; y < img.height; y += resolution) {
    for (int x = 0; x < img.width; x += resolution) {
      color pixel = img.pixels[y * img.width + x];
      text(ascii[int(brightness(pixel))], x, y);
    }
  }
  //save("asciiart3.jpg");
}

void draw(){
  asciify();
}
