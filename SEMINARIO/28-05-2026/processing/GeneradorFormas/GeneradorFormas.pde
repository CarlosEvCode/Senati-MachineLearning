//Version Final - generar INPUT para entrenamiento
void setup(){
  size(64,64);
}

//Cuadrados, triangulos, circulos
void draw(){
  
  
  //Un ciclo por cada figura
  for (int i = 0; i < 3; i++){
    background(255); //Blanco
    strokeWeight(4); //Contorno
    pushMatrix(); //Capa, trasladar un objeto
    
    float r = random(8, 24);
    float x = random(r, width - r);
    float y = random(r, height - r);
    
    stroke(random(100), random(100), random(100));
    translate(x,y); //Nuevo punto de referencia
    
    if (i==0){
      //Circulos
      circle(0, 0, (r*2)); //¿Por qué 0,0?
      saveFrame("data/circle###.png");
    
    }else if (i== 1){
      //Cuadrados
      rectMode(CENTER);
      rotate(random(-0.1, 0.1));
      square(0, 0, (r * 2));
      saveFrame("data/square###.png");
      
    }else if (i==2){
      //Triangulos
      rotate(random(-0.1, 0.1));
      triangle(0, -r, r, r, -r, r);
      saveFrame("data/triangle###.png");
    
    }
    
    popMatrix(); //Finalizar capa
  } //for
  
  if (frameCount == 100){
    exit();
  }
  
}//draw()
