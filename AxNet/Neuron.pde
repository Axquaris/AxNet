
public class Neuron extends Buffer {
  private final float E = 2.71828183f;
  
  private Buffer[] inputs;
  private float[] weights;
  private float bias;
  
  public Neuron(int numInputs) {
    inputs = new Buffer[numInputs];
    weights = new float[numInputs];
    
    for (int i = 0; i < numInputs; i++)
      inputs[i] = null;
    for (int i = 0; i < numInputs; i++)
      weights[i] = 1;
    bias = 0;
  }
  
  public Neuron(Buffer[] inputs, float[] weights, float bias) {
    this.inputs = inputs;
    this.weights = weights;
    this.bias = bias;
  }
  
  public void process() {
    //Activation Function
    float activation = 0;
    for (int i = 0; i < inputs.length; i++) {
      activation += inputs[i].output * weights[i];
    }
    activation += bias;
    
    //Transfer Function
    output = 2 / (1 + pow(E, -2*activation)) - 1;
  }
  
  //Mutator Methods
  public int linkTo(Neuron n) {
    for(int i = 0; i < n.inputs.length; i++) {
      if(n.inputs[i] == null) {
        n.inputs[i] = this;
        return i;
      }
    }
    return -1;
  }
  
  public int linkTo(Neuron n, int weight) {
    int i = linkTo(n);
    if (i != -1)
      n.weights[i] = weight;
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
        return getWeight(w, i);
    }
    return null;
  }
  
  public float getBias() {
    return bias;
  }
}