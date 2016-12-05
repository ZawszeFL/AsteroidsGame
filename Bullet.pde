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
    myCenterX=oct.get(0).getX();
    myCenterY=oct.get(0).getY();
    myPointDirection=oct.get(0).getPointDirection();
    double dRadians =myPointDirection*(Math.PI/180);
    myDirectionX=5*Math.cos(dRadians)+oct.get(0).getDirectionX();
    myDirectionY=5*Math.sin(dRadians)+oct.get(0).getDirectionX();
  }
  public void show(){
    
    fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    ellipse((float)myCenterX,(float)myCenterY,10,10);

}
 public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    if(myCenterX >width)
    {     
      pews.remove(this);  
    }    
    else if (myCenterX<0)
    {     
      pews.remove(this);  
   
    }    
    if(myCenterY >height)
    {    
      pews.remove(this);  
   
    }   
    else if (myCenterY < 0)
    {     
      pews.remove(this);  
    
    }  


    
  }   
}