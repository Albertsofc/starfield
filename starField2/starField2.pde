int numPlanets=2;
PlanetClass[] planet=new PlanetClass[numPlanets];
JupiterClass[] jupiter=new JupiterClass[numPlanets];
PImage plan, met, jup;
Particle[] p= new Particle[403];
void setup() {
  size(600, 600);
  jup=loadImage("otherplan.png");
  jup.resize(60,50);
  met=loadImage("meteor.png");
  met.resize(50, 50);
  plan=loadImage("earth.png");
  plan.resize(40, 35);
  
  for (int i=0; i<p.length; i++) {
    p[i]=new NormalParticle();
  }
  for (int i=399; i<401; i++) {
    p[i]=new OddballParticle();
  }
  for (int i=401; i<p.length; i++) {
    p[i]=new OdderParticle();
  }
  for (int i=0; i<3; i++) {
    p[i]=new Jumbo();
  }
}
void draw() {
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  for (int i=0; i<p.length; i++) {
    p[i].move();
    p[i].show();
  }
}

class NormalParticle implements Particle {
  double x, y, speed, angle;
  NormalParticle() {
    x=width/2;
    y=height/2;
    speed=(Math.random()*4)+1;
    angle=(Math.random()*(Math.PI*4));
  }
  void show() {
    noStroke();
    fill(255, (float)((Math.random()*69)+171), (float)(Math.random()*230));
    ellipse((int)x, (int)y, (int)(Math.random()*50), (int)(Math.random()*50));
  }
  void move() {
    x+=Math.cos(angle)*speed;
    y+=Math.sin(angle)*speed;
    angle+=0.025;
  }
}
interface Particle {
  void move();
  void show();
}
class OddballParticle implements Particle {
  double x, y, speed, angle;
  OddballParticle() {
    x=width/2;
    y=height/2;
    speed=(Math.random())*3;
    angle=(Math.random()*(Math.PI*2));
  }
  void move() {
    
    x+=Math.cos(angle)*speed;
    y+=Math.sin(angle)*speed;
    angle+=0.075;
  }

  void show() {
    noStroke();
    image(plan, (int)x, (int)y);
  }
}
class OdderParticle implements Particle {
  double x, y, speed, angle;
  OdderParticle() {
    x=width/2;
    y=height/2;
    speed=(Math.random())*2+2;
    angle=(Math.random()*(Math.PI*2));
  }
  void move() {
    
    x+=Math.cos(angle)*speed;
    y+=Math.sin(angle)*speed;
    angle+=0.025;
  }

  void show() {
    noStroke();
    image(jup, (int)x, (int)y);
  }
}
class Jumbo extends NormalParticle {
  float xspeed;
  float yspeed;
  Jumbo() {
    xspeed=1;
    yspeed=1;
  }
  void move() {
    x+=xspeed;
    y+=yspeed;
    if (x<600&&x>0) {
      x+=Math.sin(angle)*xspeed;
    } else if (x>=600-25||x<=0+25) {
      x-=600;
    }
    if (y<600-25&&y>0+25) {
      y+=Math.cos(angle)*yspeed;
    } else if (y>=600||y<=0) {
      y-=600;
    }
    angle+=0.0045;
  }
  void show() {
    noStroke();
    image(met, (int)x, (int)y);
  }
}
class PlanetClass  
{     
  int x, y, c;
  {
    x=(int)(Math.random()*600);
    y=(int)(Math.random()*600);
  }
  PImage planet;

  PlanetClass(int x, int y, PImage p) {
    this.x=x;
    this.y=y;
    planet = p;
    image(p, x, y);
  }
  void show() {
    image(planet, x, y);
  }
  void move() {
  }
}
class JupiterClass{    
  int x, y, c;
  {
    x=(int)(Math.random()*600);
    y=(int)(Math.random()*600);
  }
  PImage jup;

  JupiterClass(int x, int y, PImage j) {
    this.x=x;
    this.y=y;
    jup = j;
    image(j, x, y);
  }
  void show() {
    image(jup, x, y);
  }
  void move() {
  }
}
