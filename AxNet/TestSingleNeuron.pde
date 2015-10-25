
class TestSingleNeuron {
  //UI Stuff
  UiSlider inputA;
  UiSlider inputB;
  UiSlider weightA;
  UiSlider weightB;
  UiSlider bias;
  UiGrapherIII graph;
  
  //Tester Program
  Buffer[] b;
  float[] w;
  Neuron n;
  
  TestSingleNeuron() {
    b = new Buffer[2];
    b[0] = new Buffer();
    //b[1] = new Buffer();
    w = new float[2];
    w[0] = 1f;
    w[1] = 1f;
    n = new Neuron(b, w, 1f); //Self link
    n.addInput(n);
    
    //UI
    setupUi();
  }
  
  void drawTSN() {
    background(57, 103, 144);
    
    updateVars();
    n.process();
    graph.plotA(n.getOutput());
    
    //UI
    graph.render();
  }
  
  void updateVars() {
    b[0].setOutput(inputA.getValue());
    //b[1].setOutput(inputB.getValue());
    n.setWeight(weightA.getValue(), 0);
    n.setWeight(weightB.getValue(), 1);
    n.setBias(bias.getValue());
  }
  
  void setupUi() {
    inputA = new UiSlider(10, 10, 280, 30, -1, 1, 1);
    //inputB = new UiSlider(10, 50, 280, 30, -1, 1, 1);
    
    weightA = new UiSlider(310, 10, 280, 30, -2, 2, 1);
    weightA.button = color(100);
    weightB = new UiSlider(310, 50, 280, 30, -2, 2, 0);
    weightB.button = color(100);
    
    bias = new UiSlider(10, 90, 580, 30, -10, 10, 0);
    
    graph = new UiGrapherIII(10, height-250, 580, 240, "Outputs");
  }
}