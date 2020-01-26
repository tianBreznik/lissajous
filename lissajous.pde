float angle = 0;
int w = 60;
int cols;
int rows;
Curve[][] curves;
void setup(){
  frameRate(30);
  size(600, 600);
  pixelDensity(2);
  cols = width/w - 1;
  rows = height/w -1;
  curves = new Curve[rows][cols];
  
  for (int j=0; j < rows; j++){
    for(int i = 0; i < cols; i++){
      curves[j][i] = new Curve();
    }
  }

}

void draw(){
  background(255, 204, 0);
  float d = w - 10;
  float r = d/2;
  
  
  stroke(255);
  noFill();
  for(int i = 0; i < cols; i++){
    float cx = w + i * w + w/2;
    float cy = w/2;
    strokeWeight(1);
    stroke(255);
    ellipse(cx, cy, d, d);
    float x = r * cos(angle * (i + 1) - PI/2);
    float y = r * sin(angle * (i +1) - PI/2);
    strokeWeight(8);
    stroke(255);
    point(cx + x, cy +y);
    
    stroke(255, 150);
    strokeWeight(1);
    line(cx + x, cy + y, cx + x, height);
    
    for (int j = 0; j < rows; j++){
      curves[j][i].setX(cx + x);
    
    }
  }
  
  stroke(255);
  noFill();
  for(int j = 0; j < rows; j++){
    float cy = w + j * w + w/2;
    float cx = w/2;
    strokeWeight(1);
    stroke(255);
    ellipse(cx, cy, d, d);
    float x = r * cos(angle * (j + 1) - HALF_PI);
    float y = r * sin(angle * (j +1) - HALF_PI);
    strokeWeight(8);
    stroke(255);
    point(cx + x, cy +y);
    
    stroke(255, 150);
    strokeWeight(1);
    line(cx + x, cy + y, width, cy + y);
    
    for (int i = 0; i < cols; i++){
      curves[j][i].setY(cy + y);
    
    }
  }
  
  for (int j=0; j < rows; j++){
    for(int i = 0; i < cols; i++){
      curves[j][i].addPoint();
      curves[j][i].show();
    }
  }
 
  angle -= 0.05;
  if(angle < -TWO_PI){
   for (int j=0; j < rows; j++){
    for(int i = 0; i < cols; i++){
      curves[j][i].reset();
    }
  }
  angle = 0;
 }
}
