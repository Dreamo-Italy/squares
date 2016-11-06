//constants declaration
int COLOR_NUM = 5 ; //number of the avalaible colors

class Square extends VisualObject {
  private int size;
  private int hue, saturation, brightness;
  private int opacity = 255;
  private int [] colorArray ;
  private float rotation;
  
  //private methods
  
   private void updateColor() //makes the square lighter
  {
    saturation *= 0.99;
    brightness *= 1.01;
    opacity *= 0.95;
  }
  
  private void colorFromList() //picks a random color and stores the values into colorArray
  {
    int sel = int(random(COLOR_NUM));
    
    colorArray = new int[3];
    
    //debug
    println(sel);
    
    switch(sel){
    
      case 0:
        colorArray[0] = 359; //hue
        colorArray[1] = 73;  //saturation
        colorArray[2] = 94;   //brightness
        break;
        
      case 1: 
        colorArray[0] = 144;
        colorArray[1] = 35;
        colorArray[2] =94;
                break;

       case 2: 
        colorArray[0] = 51;
        colorArray[1] = 100;
        colorArray[2] = 94;
                break;
                
      case 3:
        colorArray[0] = 238;
        colorArray[1] = 36;
        colorArray[2] = 74;
         break;
      
      case 4:
        colorArray[0] = 37;
        colorArray[1] = 90;
        colorArray[2] = 90;
         break;

      default: 
         colorArray[0] = 103;
         colorArray[1] = 24;
         colorArray[2] =15;
                 break;

    }
    return;
    
  }
  
   private void setColor() //assigns colorArray values to hue, sat, bright of this square
  {
    hue =  colorArray[0];
    saturation =  colorArray[1];
    brightness =  colorArray[2];
  }
      
  public Square(float newX, float newY, int newSize) {
    super(newX, newY);
    size = newSize;
    
    colorFromList();
    setColor();
    
  }
  
  public void trace() {
    rotation += PI/20;
    translate(x, y);
    rotate(rotation);   
    //stroke(hue, saturation, brightness, opacity);
    noStroke();
    fill(hue, saturation, brightness, opacity);
    updateColor();
    rect(-size>>1, -size>>1, size, size);
    rotate(-rotation);
    translate(-x, -y);
  }
}