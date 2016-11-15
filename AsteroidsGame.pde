  SpaceShip oct = new SpaceShip();
  //Asteroids[] rocks = new Asteroids[20];
  ArrayList<Asteroids> rocks =new ArrayList<Asteroids>();
  ArrayList<Bullet> pews=new ArrayList<Bullet>();
  //Asteroids [] rocks = new Asteroids[10];


  boolean wIsPressed=false;
  boolean aIsPressed=false;
  boolean sIsPressed=false;
boolean dIsPressed=false;
boolean spaceIsPressed=false;
Star[] stars = new Star[300];
public void setup() 
{
  size(1000,1000);
  for(int i=0; i<300;i+=1)
  {
    stars[i]= new Star();


  }
  for(int j=0; j<30;j++)
  {
     rocks.add(j, new Asteroids());
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
      if (key == ' ')
      {
        spaceIsPressed=true;
      }
      if (key == 'f')
      {
        oct.setPointDirection((int)(Math.random()*360));
        oct.setDirectionX(0);
        oct.setDirectionY(0);
        oct.setX((int)(Math.random()*900+50));  
        oct.setY((int)(Math.random()*900+50));
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
      if (key == ' ')
      {
        spaceIsPressed=false;
      }


    }
public void draw() 
{
  fill(0,0,0,150);
  rect(0,0,1010,1010);


    for(int i=0; i<200;i+=1)
  {
    stars[i].show();
  }


  if(wIsPressed==true && dIsPressed==true)
  {
    oct.accelerate(.125);
    oct.rotate(1);
  }


  if(wIsPressed==true && aIsPressed==true)
  {
    oct.accelerate(.125);
    oct.rotate(-1);
  }


  if(sIsPressed==true && aIsPressed==true)
  {
    oct.accelerate(-.125);
    oct.rotate(-1);
  }


  if(sIsPressed==true && dIsPressed==true)
  {
    oct.accelerate(-.125);
    oct.rotate(1);
  }
  if(wIsPressed==true)
  {
    oct.accelerate(.125);
  }
  if(sIsPressed==true)
  {
    oct.accelerate(-.125);
  }
  if(dIsPressed==true)
  {
    oct.rotate(3);
  }
  if(aIsPressed==true)
  {
    oct.rotate(-3);
  }
  if(spaceIsPressed==true)
  {
    pews.add(new Bullet(oct));


  }






  for(int i=0; i<300;i+=1)
  {
    stars[i].show();
    
  }
  for(int j=0; j<rocks.size();j++)
  {
     rocks.get(j).show();
     rocks.get(j).move();
     //if(dist(pews.get(k).getX(),pews.get(k).getY(),rocks.get(j).getX(),rocks.get(j).getY())<25)
     // rocks.remove(j);
  }
  for(int k=0; k<pews.size();k++)
  {
    pews.get(k).show();
    pews.get(k).move();
  }


  oct.show();
  oct.move();






}


class Bullet extends Floater
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


  public Bullet(SpaceShip theShip)
  {
    myCenterX=oct.getX();
    myCenterY=oct.getY();
    myPointDirection=oct.getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    myDirectionX=5*Math.cos(dRadians)+oct.getDirectionX();
    myDirectionY=5*Math.sin(dRadians)+oct.getDirectionX();
  }
  public void show(){
    
    fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    ellipse((float)myCenterX,(float)myCenterY,10*(float)Math.sin(oct.getPointDirection()),10*(float)Math.cos(oct.getPointDirection()));//3*(float)myDirectionX,3*(float)myDirectionY);  }

}
 public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     


    
  }   
}
  
class Asteroids extends Floater
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


  private int rotSpeed; 
  public Asteroids() 
  {


    corners=7;
    xCorners = new int[corners];
    yCorners = new int[corners];
    
    xCorners[0]= -14;
    yCorners[0]= 0;
    
    xCorners[1]= -8;
    yCorners[1]=  -10;
    
    xCorners[2]=  0;
    yCorners[2]=  -12;
    
    xCorners[3]= 8;
    yCorners[3]= -8;
   
    xCorners[4]=  12;
    yCorners[4]=  6;




    xCorners[5]=  8;
    yCorners[5]=  12;


    xCorners[6]=  -6;
    yCorners[6]=  10;




    myCenterX=(int)(Math.random()*900);
    myCenterY=(int)(Math.random()*900);
    myDirectionX=(float)(Math.random()*4)-2;
    myDirectionY=(float)(Math.random()*4)-2;
    myPointDirection=0;
    myColor=color(127);
    rotSpeed=(int)(Math.random()*5)-3;
  }
  public void move(){
    super.move();
    rotate(rotSpeed);


  }


}


class Star extends Floater
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


  public Star()
  {
    myCenterX=(int)(Math.random()*1000);
    myCenterY=(int)(Math.random()*1000);


    myPointDirection=0;
    myColor=color(255);


  }
  public void show()
  {
    ellipse((int)myCenterX,(int)myCenterY,3,3);
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
    corners=21;
    xCorners = new int[corners];
    yCorners = new int[corners];
    
    xCorners[0]= 2;
    yCorners[0]= 0;
    
    xCorners[1]= 0;
    yCorners[1]=  -1;
    
    xCorners[2]=  0;
    yCorners[2]=  -12;
    
    xCorners[3]= 12;
    yCorners[3]=  -12;
   
    xCorners[4]=  12;
    yCorners[4]=  -13;
   
    xCorners[5]= -6;
    yCorners[5]=  -13;
    
    xCorners[6]= -6;
    yCorners[6]=  -12;


    xCorners[7]= 0;
    yCorners[7]= -12;


    xCorners[8]= 0;
    yCorners[8]= -1;


    xCorners[9]=  -1;
    yCorners[9]=  -1;   
   
    xCorners[10]= -1;
    yCorners[10]=  1;
    xCorners[11]=  0;
    yCorners[11]=  1;
    xCorners[12]= 0;
    yCorners[12]=  12;
    xCorners[13]= -6;
    yCorners[13]=  12;


    xCorners[14]= -6;
    yCorners[14]=  13;
    xCorners[15]=  12;
    yCorners[15]=  13;
    xCorners[16]= 12;
    yCorners[16]=  12;
    xCorners[17]= 0;
    yCorners[17]=  12;


    xCorners[18]= 0;
    yCorners[18]=  1;
    xCorners[19]=  1;
    yCorners[19]=  1;
    xCorners[20]= 2;
    yCorners[20]=  0;


  
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


