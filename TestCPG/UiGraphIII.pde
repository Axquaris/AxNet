

public class UiGrapherIII{
  int x, y, w, h;
  String title;
  
  float[] pointsA, pointsB, pointsC;
  int pNA, pNB, pNC; //Number of points ready for plotting
  float max, min;
  
  //Layout Vars
  int edge = 25;
  int titleEdge = 30;
  int numberEdge = 30;
  
  UiGrapherIII(int x, int y, int w, int h, String title) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.title = title;
    
    pointsA = new float[w - edge - numberEdge];
    pNA = 0;
    pointsB = new float[w - edge - numberEdge];
    pNB = 0;
    pointsC = new float[w - edge - numberEdge];
    pNC = 0;
    max = 1;
    min = 0;
  }
  
  void plotA (float p){
    for (int i = pointsA.length-1; i > 0; i--) {
      pointsA[i] = pointsA[i-1];
    }
    pointsA[0] = p;
    if (p > max) max = p;
    if (p < min) min = p;
    
    if (pNA < pointsA.length){
      pNA++;
    }
  }
  
  void plotB (float p){
    for (int i = pointsB.length-1; i > 0; i--) {
      pointsB[i] = pointsB[i-1];
    }
    pointsB[0] = p;
    if (p > max) max = p;
    if (p < min) min = p;
    
    if (pNB < pointsB.length){
      pNB++;
    }
  }
  
  void plotC (float p){
    for (int i = pointsC.length-1; i > 0; i--) {
      pointsC[i] = pointsC[i-1];
    }
    pointsC[0] = p;
    if (p > max) max = p;
    if (p < min) min = p;
    
    if (pNB < pointsC.length){
      pNC++;
    }
  }
  
  void render(){
    
    fill(200);
    rect(x, y, w, h);
    strokeWeight(1);
    line(x+numberEdge, y+map(0, min, max, h-edge, titleEdge), x+w-numberEdge, y+map(0, min, max, h-edge, titleEdge));
    
    strokeWeight(3);
    pushMatrix();
    strokeCap(ROUND);
    //Draws graphs
    stroke(83, 81, 84);
    for (int i = 0; i < pNC-1; i++) {
      line(x+numberEdge+i, getPosC(i), x+numberEdge+(i), getPosC(i+1));
    }
    stroke(57, 106, 177);
    for (int i = 0; i < pNB-1; i++) {
      line(x+numberEdge+i, getPosB(i), x+numberEdge+(i), getPosB(i+1));
    }
    stroke(218, 124, 48);
    for (int i = 0; i < pNA-1; i++) {
      line(x+numberEdge+i, getPosA(i), x+numberEdge+(i), getPosA(i+1));
    }
    popMatrix();
    
    stroke(0);
    strokeWeight(1);
    line(x+numberEdge, y+titleEdge, x+numberEdge, y+h-edge);
    line(x+numberEdge, y+h-edge, x+w-edge, y+h-edge);
    
    
    fill(0);
    textSize( 20 );
    textAlign( CENTER, CENTER );
    text(title, x+w/2, y+titleEdge/2);
    textSize( 15 );
    text(round(max), x+numberEdge/2, y+titleEdge);
    if (min != 0)
      text("0", x+numberEdge/2, y+map(0, min, max, h-edge, titleEdge));
    text(round(min), x+numberEdge/2, y+h-edge);
    
  }
    
  int getPosA(int i) {
    float n = map(pointsA[i], min, max, 0, h-edge-titleEdge);
    n *= -1;
    n += y + h - edge;
    
    return round(n);
  }
    
  int getPosB(int i) {
    float n = map(pointsB[i], min, max, 0, h-edge-titleEdge);
    n *= -1;
    n += y + h - edge;
    
    return round(n);
  }
  
  int getPosC(int i) {
    float n = map(pointsC[i], min, max, 0, h-edge-titleEdge);
    n *= -1;
    n += y + h - edge;
    
    return round(n);
  }
  
  void reset() {
    pointsA = new float[w - edge - numberEdge];
    pNA = 0;
    pointsB = new float[w - edge - numberEdge];
    pNB = 0;
    pointsC = new float[w - edge - numberEdge];
    pNC = 0;
    max = 0;
    min = 0; 
  }
}
