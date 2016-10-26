SpaceShip oct = new SpaceShip();
boolean wIsPressed=false;
boolean aIsPressed=false;
boolean sIsPressed=false;
boolean dIsPressed=false;
Star[] stars = new Star[200];
public void setup() 
{
  size(500,500);
  for(int i=0; i<200;i+=1)
  {
    stars[i]= new Star();
  }

}
   public void keyPressed()
    {
      if (key == 'a')
      {
        aIsPressed=true;
      }
      if (key == 'd')
      {    
        dIsPressed=true;
      }
      if (key == 'w')
      {
        wIsPressed=true; //oct.accelerate(.5);
      }
      if (key == 's')
      {
        sIsPressed=true;
      }
      if (key == 'f')
      {
        oct.setPointDirection((int)(Math.random()*360));
        oct.setDirectionX(0);
        oct.setDirectionY(0);
        oct.setX((int)(Math.random()*500));
        oct.setY((int)(Math.random()*500));
      }
    }
   public void keyReleased()
    {
      if (key == 'a')
      {
        aIsPressed=false;
      }
      if (key == 'd')
      {    
        dIsPressed=false;
      }
      if (key == 'w')
      {
        wIsPressed=false; //oct.accelerate(.5);
      }
      if (key == 's')
      {
        sIsPressed=false;
      }

    }
public void draw() 
{
  fill(0,0,0,150);
  rect(0,0,510,510);

    for(int i=0; i<200;i+=1)
  {
    stars[i].show();
  }

  if(wIsPressed==true && dIsPressed==true)
  {
    oct.accelerate(.25);
    oct.rotate(5);
  }

  if(wIsPressed==true && aIsPressed==true)
  {
    oct.accelerate(.25);
    oct.rotate(-5);
  }

  if(sIsPressed==true && aIsPressed==true)
  {
    oct.accelerate(-.25);
    oct.rotate(-5);
  }

  if(sIsPressed==true && dIsPressed==true)
  {
    oct.accelerate(-.25);
    oct.rotate(5);
  }
  if(wIsPressed==true)
  {
    oct.accelerate(.25);
  }
  if(sIsPressed==true)
  {
    oct.accelerate(-.25);
  }
  if(dIsPressed==true)
  {
    oct.rotate(5);
  }
  if(aIsPressed==true)
  {
    oct.rotate(-5);
  }





  oct.show();
  oct.move();
}
class Star 
{
  private int myX;
  private int myY;
  private int mySize;

  public Star()
  {
    myX=(int)(Math.random()*500);
    myY=(int)(Math.random()*500);
    mySize=(int)(Math.random()*3);
  }
  public void show()
  {
    ellipse(myX,myY,mySize,mySize);
  }
}
class SpaceShip extends Floater  
{   
    public void setX(int x) {myCenterX=x;}
    public int getX(){return (int)myCenterX;}  
    public void setY(int y){myCenterY=y;} 
    public int getY(){return (int)myCenterY;} 

    public void setDirectionX(double x){myDirectionX=x;}  
    public double getDirectionX(){return myDirectionX;} 
    public void setDirectionY(double y){myDirectionY=y;}
    public double getDirectionY(){return myDirectionY;} 
    public void setPointDirection(int degrees){myPointDirection=degrees;}
    public double getPointDirection(){return myPointDirection;} 
    public SpaceShip(){
    corners=9;
    xCorners = new int[corners];
    yCorners = new int[corners];
    
    xCorners[0]= 2;
    yCorners[0]= 0;
    
    xCorners[1]= 0;
    yCorners[1]= 1;
    
    xCorners[2]=  0;
    yCorners[2]=  12;
    
    xCorners[3]= 12;
    yCorners[3]=  12;
   
    xCorners[4]=  12;
    yCorners[4]=  13;
   
    xCorners[5]= -6;
    yCorners[5]=  13;
    
    xCorners[6]= -6;
    yCorners[6]=  12;

    xCorners[7]= 2;
    yCorners[7]= 0;
    xCorners[8]= 0;
    yCorners[8]= 1;
    xCorners[9]=  0;
    yCorners[9]=  12;   
    xCorners[10]= 12;
    yCorners[10]=  12;
    xCorners[11]=  12;
    yCorners[11]=  13;
    xCorners[12]= -6;
    yCorners[12]=  13;
    xCorners[13]= -6;
    yCorners[13]=  12;



   
    myCenterX=250;
    myCenterY=250;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
    myColor=color(255,255,255);
    }
    
 
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  
  abstract public void setX(int x);  
  abstract public int getX();
  abstract public void setY(int y);
  abstract public int getY(); 
  
  abstract public void setDirectionX(double x);
  abstract public double getDirectionX(); 
  abstract public void setDirectionY(double y);
  abstract public double getDirectionY();
  abstract public void setPointDirection(int degrees) ; 
  abstract public double getPointDirection();

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

