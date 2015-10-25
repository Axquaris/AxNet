
class TestCPG {
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
  
  TestCPG() {
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
  
  void drawTCPG() {
    background(57, 103, 144);
    
    updateVars();
    if (frame % 2 == 0) {
      n1.process();
      n2.process();
    }
    graph.plotA(n1.getOutput());
    graph.plotB(n2.getOutput());
    
    //UI
    graph.render();
    frame++;
  }
  
  void updateVars() {
    n1.setWeight(weightB.getValue(), 0);
    n1.setWeight(weightA.getValue(), 1);
    n2.setWeight(weightC.getValue(), 0);
    n2.setWeight(-weightA.getValue(), 1);
    n1.setBias(biasA.getValue());
    n2.setBias(biasB.getValue());
  }
  
  void setupUi() {
    weightA = new UiSlider(10, 10, 580, 30, -2, 2, 1);
    weightA.button = color(150);
    
    weightB = new UiSlider(10, 50, 280, 30, -2, 2, 1);
    weightB.button = color(200);
    weightC = new UiSlider(310, 50, 280, 30, -2, 2, 1);
    weightC.button = color(100);
    
    biasA = new UiSlider(10, 90, 280, 30, -1, 1, .1);
    biasB = new UiSlider(310, 90, 280, 30, -1, 1, .1);
    biasB.button = color(100);
    
    graph = new UiGrapherIII(10, height-250, 580, 240, "Outputs");
  }
}