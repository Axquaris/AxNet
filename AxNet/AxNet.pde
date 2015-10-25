import de.bezier.guido.*;
import javax.swing.JOptionPane;

String testmode;
Object tester;

void setup() {
  testmode = JOptionPane.showInputDialog(
             "What tester would you like?\nTestSingleNeuron = SN, TestCPG = CPG"
             ).toUpperCase();
  size(600, 400);
  
  Interactive.make(this);
  if (testmode.equals("SN"))
    tester = new TestSingleNeuron(); //Test a single neuron, see TestSingleNeuron
  else if (testmode.equals("CPG"))
    tester = new TestCPG(); //Test a single neuron, see TestSingleNeuron
}

void draw() {
  if (testmode.equals("SN"))
    ((TestSingleNeuron)tester).drawTSN(); //Test a single neuron, see TestSingleNeuron
  else if (testmode.equals("CPG"))
    ((TestCPG)tester).drawTCPG(); //Test a single neuron, see TestSingleNeuron
}