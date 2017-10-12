import queasycam.*;

QueasyCam cam;

int columns, rows;
int scale = 20;
int w = width+3000;
int h = height+3000;

float [][] terrain;

void setup()
{
  fullScreen(P3D);

  cam = new QueasyCam(this);
  cam.speed = 5;              // default is 3
  cam.sensitivity = 0.5;      // default is 2

  columns = w/scale;
  rows = h/scale;
  terrain = new float [columns] [rows];
  
}

void draw()
{
  background(0);
  //noStroke();
  //fill(255);
  stroke(161, 252, 226);
  noFill();
  
  //colorMode(RGB);
  //directionalLight(68, 232, 222, 0, 100, 100);
  
  float yoff = 0;
  
  for (int y = 0; y < rows; y++)
  {
    float xoff = 0;
    for (int x = 0; x < columns; x++)
    {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }

  translate(width/2, height/2);
  rotateX(PI/2);

  translate(-w/2, -h/2);

  for (int y = 0; y < rows -1; y++)
  {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < columns; x++)
    {
      vertex(x*scale, y*scale, terrain[x][y]);
      //vertex(x*scale, y*scale, random(-10, 10));
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
      //vertex(x*scale, (y+1)*scale, random(-10, 10));
    }
    endShape();
  }
}