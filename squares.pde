//constants declaration
final int SCREEN_WIDTH = 1280;
final int SCREEN_HEIGHT = 720;

final byte BUFFER_DIM = 40;

//variables declaration
Square[] mySquare = new Square[BUFFER_DIM];
short timer;
byte bufferPointer;

void settings()
{ 
  //screen setup
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup()
{
  //screen setup
  stroke(0);
  
  //blend mode selection
  //blendMode(EXCLUSION);
  
  colorMode(HSB, 360, 100, 100);
  
  background(0,0,100);

  
  //variables initialization
  timer = 0;
  bufferPointer = 0;
}

void draw()
{
  //timer update
  timer++;
  
  //screen cleaning
  
  
  
  
  
  //background(0,0,100);
  
  //refresh
  if(mousePressed)  background(0,0,100);
  
  //square instantiation
  if(true) //timer % 2 == 0
  {
    
  
    mySquare[bufferPointer] = new Square((float)(Math.random()*SCREEN_WIDTH), (float)(Math.random()*SCREEN_HEIGHT), 20);
    mySquare[bufferPointer].setSpeed((float)(Math.random()*20));
    mySquare[bufferPointer].setDirection((float)(Math.random()*PI/2+PI/4));
    mySquare[bufferPointer].setGravity(1.5);
    bufferPointer++;
    if(bufferPointer >= BUFFER_DIM) bufferPointer = 0;
  }
  
  //update cicle
  for(int i = 0; i < BUFFER_DIM; i++)
  {
    if(mySquare[i] != null)
    {
      mySquare[i].update();
      mySquare[i].trace();
    }
  }
  
  //~60 fps
  delay(34);
}