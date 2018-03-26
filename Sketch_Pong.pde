int deplacementX, deplacementY;
int x, y;

int w, z;

int hRaquette;

void setup() 
{
  size(600, 400);
  background(0);
  x = width/2;
  y = height/2;

  hRaquette = 85;

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
  rect(w, z, 25, hRaquette);
  rect(width-(w*3), z, 25, hRaquette);
  ellipse(x, y, 20, 20);
  line(200, 0, 200, 400);
}

void bouger() 
{
  x = x + deplacementX;
  y = y + deplacementY;
  z = (mouseY);
}

void rebondir() 
{
  println(y+" ");
  // si on est trop bas et le déplacement vertical est positif
  if (y > height-10 && deplacementY > 0) 
  { 
    deplacementY = -deplacementY; // rendre négative la valeur
  }

  // si on est trop haut et le déplacement vertical est negatif
  if (y < 10 && deplacementY < 10) 
  {
    deplacementY = abs(deplacementY); // rendre positive cette valeur
  }

  if (x<(2*w)+10 && y>z && y<z+hRaquette)
  {
    deplacementX = -deplacementX; // inverser la valeur
  }

  if (x>width-(w*3)-10 && y>z && y<z+hRaquette)
  {
    deplacementX = -deplacementX; // inverser la valeur
  }

  if (x < 10 || x > width-(w*3))
  {
    nettoyer();
    text("GAME OVER", width/2-25, height/2);
    noLoop();
  }
}
