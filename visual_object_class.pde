abstract class VisualObject {
  
  //private parameters
  
  protected float x;
  protected float y;
  private float xspeed;
  private float yspeed;
  private float direction;
  private float speed;
  private float gravity;
  private float gravityDirection;
  
  
  //private methods
  
  private void applyGravity()
  {
    xspeed += gravity*cos(gravityDirection);
    yspeed -= gravity*sin(gravityDirection);
    recalculateSpeed();
  }
  
  private void recalculateSpeed()
  {
    speed = sqrt(xspeed*xspeed + yspeed*yspeed);
    direction = (float)Math.atan2(xspeed, -yspeed);
  }
  
  private void recalculateXYSpeed()
  {
    xspeed = speed*cos(direction);
    yspeed = -speed*sin(direction);
  }
  
  //constructor
  
  public VisualObject(float setX, float setY)
  {
    x = setX;
    y = setY;
    xspeed = 0;
    yspeed = 0;
    direction = 0;
    speed = 0;
    gravity = 0;
    gravityDirection = PI/2*3;
  }
  
  
  //get methods
  
  public float getX()
  {
    return x;
  }
  
  public float getY()
  {
    return y;
  }


  //set methods
  
  public void setPosition(float newX, float newY)
  {
    x = newX;
    y = newY;
  }
  
  public void setTranslation(float shiftX, float shiftY)
  {
    x += shiftX;
    y += shiftY;
  }
  
  public void setSpeed(float newSpeed)
  {
    speed = newSpeed;
    recalculateXYSpeed();
  }
  
  public void setDirection(float newDirection)
  {
    direction = newDirection;
    recalculateXYSpeed();
  }
  
  public void setXSpeed(float newXSpeed)
  {
    xspeed = newXSpeed;
    recalculateSpeed();
  }
  
    public void setYSpeed(float newYSpeed)
  {
    yspeed = newYSpeed;
    recalculateSpeed();
  }
  
  public void setGravity(float newGravity)
  {
    gravity = newGravity;
  }
  
  public void setGravityDirection(float newGravityDirection)
  {
    gravityDirection = newGravityDirection; 
  }
  
  //update and trace methods
  
  public void update()
  {
    x += xspeed;
    y += yspeed;
    applyGravity();    
  }
  
  abstract void trace();
}