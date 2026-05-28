//1. Primera ejecucion, guarda la configuracion inicial
void setup(){
  size(256,256);  
}

//2. Segunda e indefinidas ejecuciones (loop)
void draw(){
  //Canal RGB
  background(255);
  
  strokeWeight(2);
  
  //circle ejeX, ejeY, diametro
  circle(128, 40 , 64);
  fill(255,0,0);
  
  circle(40, 216 , 64);
  
  circle(216, 216, 64);
}
