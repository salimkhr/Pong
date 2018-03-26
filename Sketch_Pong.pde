int deplacementX, deplacementY;
int x, y;

int w, z;

void setup() 
{
 size(400,400);
 background(0);
 x = 200;
 y = 200; 
 deplacementX = 6;
 deplacementY = -3; 
 w = 15;
 z = 60;
}


void draw() 
{
 nettoyer();
 bouger();
 rebondir();
 dessiner();
}


void nettoyer() 
{  
  background(0);
}

void dessiner() 
{
  smooth();
  fill(255);
  rect(w,z,25,85);
  rect(width-(w*3),z,25,85);
  ellipse(x,y,20,20);
  line(200,0,200,400);
}

void bouger() 
{
 x = x + deplacementX;
 y = y + deplacementY;
 z = (mouseY);
}

void rebondir() 
{
   
 // si on est trop bas et le déplacement vertical est positif
 if (y > width-(w*3)-10 && deplacementY > 0) 
 { 
   deplacementY = -deplacementY; // rendre négative la valeur
 }
 
 // si on est trop haut et le déplacement vertical est negatif
 if (y < 10 && deplacementY < 10) 
 {
   deplacementY = abs(deplacementY); // rendre positive cette valeur
 }
 
 if (x<(2*w)+10 && y>z && y<z+85)
  {
   deplacementX = -deplacementX; // inverser la valeur
 }
 
 if (x>width-(w*3)-10 && y>z && y<z+85)
  {
   deplacementX = -deplacementX; // inverser la valeur
 }

 if (x < 10 || x > width-(w*3))
 {
  noLoop();
  println("GAME OVER");   
 }
}
