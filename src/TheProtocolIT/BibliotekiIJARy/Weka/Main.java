package TheProtocolIT.BibliotekiIJARy.Weka;

import java.io.FileWriter;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;
import weka.classifiers.functions.LinearRegression;
import javax.swing.*;
import java.awt.*;

class App {

    public App(Instances data, LinearRegression model) {

        JFrame frame = new JFrame("Predykcja ceny mieszkania");
        frame.setSize(400, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(new GridLayout(5, 2));
        frame.setLocationRelativeTo(null); // 🔥 KLUCZOWE

        JTextField metrazField = new JTextField();
        JTextField pokojeField = new JTextField();
        JComboBox<String> miastoBox =
                new JComboBox<>(new String[]{"Warszawa", "Krakow", "Gdansk"});

        JLabel resultLabel = new JLabel("Cena: ");
        JButton button = new JButton("Oblicz");

        frame.add(new JLabel("Metraż:"));
        frame.add(metrazField);
        frame.add(new JLabel("Pokoje:"));
        frame.add(pokojeField);
        frame.add(new JLabel("Miasto:"));
        frame.add(miastoBox);
        frame.add(button);
        frame.add(resultLabel);

        button.addActionListener(e -> {
            try {
                double metraz = Double.parseDouble(metrazField.getText());
                double pokoje = Double.parseDouble(pokojeField.getText());
                String miasto = (String) miastoBox.getSelectedItem();

                Instances newData = new Instances(data);
                newData.clear();

                double[] values = new double[newData.numAttributes()];

                values[0] = metraz;
                values[1] = pokoje;

                if (miasto.equals("Warszawa")) values[2] = 0;
                else if (miasto.equals("Krakow")) values[2] = 1;
                else values[2] = 2;

                values[3] = 0;

                newData.add(new weka.core.DenseInstance(1.0, values));
                newData.setClassIndex(newData.numAttributes() - 1);

                double prediction = model.classifyInstance(newData.instance(0));

                resultLabel.setText("Cena: " + Math.round(prediction));

            } catch (Exception ex) {
                resultLabel.setText("Błąd danych!");
            }
        });
        frame.setSize(Toolkit.getDefaultToolkit().getScreenSize());
        frame.setVisible(true);
    }
}
class ArffGenerator {
    public static void main(String[] args) throws Exception {
        FileWriter writer = new FileWriter("mieszkania.arff");
        writer.write("@relation mieszkania\n\n");
        writer.write("@attribute metraz numeric\n");
        writer.write("@attribute pokoje numeric\n");
        writer.write("@attribute miasto {Warszawa,Krakow,Gdansk}\n");
        writer.write("@attribute price numeric\n\n");
        writer.write("@data\n");
        writer.write("50,2,Warszawa,500000\n");
        writer.write("70,3,Krakow,650000\n");
        writer.write("40,1,Warszawa,420000\n");
        writer.write("90,4,Gdansk,800000\n");
        writer.close();
        System.out.println("Plik ARFF zapisany!");
    }
}
public class Main {
    public static void main(String[] args) throws Exception {

        DataSource source = new DataSource("mieszkania.arff");
        Instances data = source.getDataSet();
        data.setClassIndex(data.numAttributes() - 1);

        LinearRegression model = new LinearRegression();
        model.buildClassifier(data);

        System.out.println(model);

        SwingUtilities.invokeLater(() -> {
            try {
                new App(data, model);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }
}
