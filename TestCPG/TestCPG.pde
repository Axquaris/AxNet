import de.bezier.guido.*;

//UI Stuff
  UiSlider weightA;
  UiSlider weightB;
  UiSlider weightC;
  UiSlider weightD;
  UiSlider biasA;
  UiSlider biasB;
  UiGrapherIII graph;
  int frame;
  
  //Tester Program
  Neuron n1;
  Neuron n2;

void setup() {
  size(600, 400);
  Interactive.make(this);
  
  n1 = new Neuron(2);
  n2 = new Neuron(2);
  n1.addInput(n1, 1);
  n1.addInput(n2, 1);
  n2.addInput(n2, 1);
  n2.addInput(n1, 1);
  n1.setBias(1);
  n2.setBias(1);
  
  
  //UI
  setupUi();
  frame = 0;
}

void draw() { 
  background(89, 123, 150);
    
  updateVars();
  if (frame % 2 == 0) {
    n1.process();
    n2.process();
  }
  graph.plotA(n1.getOutputJS());
  graph.plotB(n2.getOutputJS());
  graph.plotC(n1.getOutputJS()+n2.getOutputJS());
  
  //UI
  graph.render();
  strokeWeight(1);
  stroke(0);
  line(0, 85, width, 85);
  line(0, 125, width, 125);
  textSize( 20 );
  textAlign( CENTER, CENTER );
  fill(0);
  text("W", width/2+1, 48);
  text("B", width/2, 103);
  frame++;
}

void updateVars() {
  n1.setWeightJS(weightB.getValue(), 0);
  n1.setWeightJS(weightA.getValue(), 1);
  n2.setWeightJS(weightC.getValue(), 0);
  n2.setWeightJS(-weightA.getValue(), 1);
  n1.setBias(biasA.getValue());
  n2.setBias(biasB.getValue());
}

void setupUi() {
  weightA = new UiSlider(10, 10, 580, 30, -1.5, 1.5, 1);
  weightA.button = color(83, 81, 84);
  
  weightB = new UiSlider(10, 50, 280, 30, -1.5, 1.5, 1);
  weightB.button = color(218, 124, 48);
  weightC = new UiSlider(310, 50, 280, 30, -1.5, 1.5, 1);
  weightC.button = color(57, 106, 177);
  
  biasA = new UiSlider(10, 90, 280, 30, -1.5, 1.5, .1);
  biasA.button = color(218, 124, 48);
  biasB = new UiSlider(310, 90, 280, 30, -1.5, 1.5, .1);
  biasB.button = color(57, 106, 177);
  
  graph = new UiGrapherIII(10, height-270, 580, 260, "Outputs");
}
