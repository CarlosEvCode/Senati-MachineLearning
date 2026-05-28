void setup(){
  size(128,128);
}

void draw(){
  background(255);
  strokeWeight(4); //amcho
  
  //Aleatorias
  float r = random(24,64); //24 (min) - 64 (max) (evita que se desborde)
  float x = random(r, width - r); //w = ancho
  float y = random(r, height - r); //h = alto
  
  //El color del circulo tambien sera aleatorio
  //stroke(RGB) => stroke(0-255, 0-255, 0-255)
  //Cuando random(N) ... desde 0 hasta N
  //stroke(random(100), random(100), random(100))
  //¿Por que hasta 100? -> RGB(0) = NEGRO | 255 BLANCO
  stroke(random(100), random(100), random(100));
  
  circle(x,y,(r*2));
  
  //guardar fisicamente cada imagen renderizada
  saveFrame("data/circle###.png"); //### => 001, 002, 003... 100
  
  if(frameCount == 100){
    exit(); //nos escapamos de draw()
  }
}
