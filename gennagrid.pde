int cols;
int rows;
int cellSize;

int drawnCount;

String pattern;

void setup() {
  drawnCount = 0;

  // Configuration.
  cellSize = 7;
  cols = 100;
  rows = 130;
  pattern = "rrrrrggggaaaaaaff";

  noStroke();

  // This is to set the size of the canvas correctly.
  // For some reason it's not possible to pass variables to size so this line prints out the correct size to use.
  // Stop the application, set the width and height, then restart the application.
  println("Use size(" + cellSize * cols + "," + cellSize * rows + ")");
  size(700, 910);

  // Draw grid
  for (int i=0; i<rows; i++) {
    drawRow(i);
  }

  noLoop();
}

void drawRow(int index) {
  int y = cellSize * index;
  // int one = 1;

  if ( index % 2 == 0 ) {
    int x = 0;
    for (int i=0; i<cols; i++) {
      fill(getColor(pattern, drawnCount));
      rect(x, y, cellSize, cellSize);
      drawnCount++;
      x += cellSize;
    }
  } else {
    int x = cellSize * (cols - 1);
    for (int i=0; i<cols; i++) {
      fill(getColor(pattern, drawnCount));
      rect(x, y, cellSize, cellSize);
      drawnCount++;
      x -= cellSize;
    }
  }
}

color getColor(String pattern, int drawnCount) {
  color red = color(#c43587);
  color green = color(#79ca52);
  color lightGreen = color(#b7f6cd);
  color blue = color(#1989f2);
  color lightBlue = color(#a2b3f8);
  color black = color(0);

  color one = red;
  color two = green;
  color three = blue;
  color four = lightBlue;
  color five = lightGreen;

  char code = pattern.charAt(drawnCount % pattern.length());

  switch(code) {
  case 'r':
    return red;

  case 'g':
    return green;

  case 'b':
    return blue;

  case 'a':
    return lightBlue;

  case 'f':
    return lightGreen;

  case '1':
    return one;

  case '2':
    return two;

  case '3':
    return three;

  case '4':
    return four;

  case '5':
    return five;

  default:
    return black;
  }
}
