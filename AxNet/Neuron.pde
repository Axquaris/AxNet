
public class Neuron extends Buffer {
  private final float E = 2.71828183f;
  
  private Buffer[] inputs;
  private float[] weights;
  private float bias;
  
  private float lastOutput;
  private int timesFired;
  
  public Neuron(int numInputs) {
    inputs = new Buffer[numInputs];
    weights = new float[numInputs];
    
    for (int i = 0; i < numInputs; i++)
      inputs[i] = null;
    for (int i = 0; i < numInputs; i++)
      weights[i] = 1;
    bias = 0;
    
    timesFired = 0;
  }
  
  public Neuron(Buffer[] inputs, float[] weights, float bias) {
    this.inputs = inputs;
    this.weights = weights;
    this.bias = bias;
    
    timesFired = 0;
  }
  
  public void process() {
    //Activation Function
    float activation = 0;
    for (int i = 0; i < inputs.length; i++) {
      activation += inputs[i].getOutput(timesFired) * weights[i];
    }
    activation += bias;
    
    //Transfer Function
    lastOutput = output;
    output = 2 / (1 + pow(E, -2*activation)) - 1;
    timesFired++;
  }
  
  //Mutator Methods
  public int addInput(Buffer n) { //adds self to inputs of given neuron
    for(int i = 0; i < inputs.length; i++) {
      if(inputs[i] == null) {
        inputs[i] = n;
        return i;
      }
    }
    return -1;
  }
  
  public int addInput(Buffer n, float weight) {
    int i = addInput(n);
    if (i != -1)
      weights[i] = weight;
    return i;
  }
  
  public void setWeight(float w ,int i) {
    weights[i] = w;
  }
  
  public void setWeight(float w ,Buffer f) {
    for (int i = 0; i < inputs.length; i++) {
      if (inputs[i] == f)
        setWeight(w, i);
    }
  }
  
  public void setBias(float b) {
    bias = b;
  }
  
  //Acessor Methods
  public float getWeight(int i) {
    return weights[i];
  }
  
  public float getWeight(Buffer f) {
    for (int i = 0; i < inputs.length; i++) {
      if (inputs[i] == f)
        return getWeight(i);
    }
    System.err.println("ERROR AT NEURON "+this+".getWeight(Buffer f)");
    return 0;
  }
  
  public float getBias() {
    return bias;
  }
  
  @Override
  public float getOutput(int otherTimesFired) {
    if (timesFired > otherTimesFired)
      return lastOutput;
    return output;
  }
}