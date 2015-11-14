
public class NeuralNetwork {
  
  public Buffer[] input;
  private NeuralLayer[] layers;
  public NeuralLayer output;
  
  public NeuralNetwork(int numInputs, int numLayers) {
    input = new Buffer[numInputs];
    layers = new NeuralLayer[numLayers];
    
    for (int i = 0; i < numInputs; i++)
      input[i] = null;
    for (int i = 0; i < numLayers; i++)
      layers[i] = null;
  }
  
  public NeuralNetwork(int numInputs, int[] numLayers) {
    input = new Buffer[numInputs];
    layers = new NeuralLayer[numLayers.length];
    
    for (int i = 0; i < numInputs; i++)
      input[i] = null;
    for (int i = 0; i < numLayers.length; i++)
      layers[i] = new NeuralLayer(numLayers[i]);
  }
  
  public NeuralNetwork(Buffer[] input, NeuralLayer[] layers) {
    this.input = input;
    this.layers = layers;
  }
  
  public void process() {
    for (NeuralLayer nl: layers)
      nl.process();
    output = layers[layers.length];
  }
  
  //Mutator Methods
  public int addLayer(NeuralLayer nl) {
    for (int i = 0; i < layers.length; i++) {
      if (layers[i] == null) {
        layers[i] = nl;
        return i;
      }
    }
    return -1;
  }
  
  public int addLayers(NeuralLayer[] nl) {
    for (int i = 0; i <= layers.length - nl.length; i++) {
      if (layers[i] == null) {
        for (int j = 0; j < nl.length; j++)
          layers[i+j] = nl[j];
        return i;
      }
    }
    return -1;
  }
}