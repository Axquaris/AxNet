
public class NeuralLayer {
  
  private Neuron[] neurons;
  
  public NeuralLayer(int numNeurons) {
    neurons = new Neuron[numNeurons];
    
    for (int i = 0; i < numNeurons; i++)
      neurons[i] = null;
  }
  
  public NeuralLayer(Neuron[] neurons) {
    this.neurons = neurons;
  }
  
  public void process() {
    for (Neuron n: neurons)
      n.process();
  }
  
  //Mutator Methods
  public int addNeuron(Neuron n) {
    for (int i = 0; i < neurons.length; i++) {
      if (neurons[i] == null) {
        neurons[i] = n;
        return i;
      }
    }
    return -1;
  }
  
  public int addNeurons(Neuron[] n) {
    for (int i = 0; i <= neurons.length - n.length; i++) {
      if (neurons[i] == null) {
        for (int j = 0; j < n.length; j++)
          neurons[i+j] = n[j];
        return i;
      }
    }
    return -1;
  }
  
  //Acessor Methods
  public Neuron getNeuron(int i) {
    return neurons[i];
  }
  
  public Neuron[] getNeurons(int i) {
    return neurons;
  }
}