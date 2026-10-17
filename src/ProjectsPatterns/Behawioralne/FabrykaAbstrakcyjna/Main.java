package ProjectsPatterns.Behawioralne.FabrykaAbstrakcyjna;

import java.awt.*;

// Klasa uruchomieniowa
public class Main {
    public static void main(String[] args) {

        // Tworzymy rodzinę produktów Windows
        GUIFactory factory = new WindowsFactory();

        Button button = factory.createButton();
        CheckBox checkbox = factory.createCheckbox();

        button.render();
        checkbox.render();

        System.out.println("--------------------");

        // Zmieniamy rodzinę produktów na macOS
        factory = new MacOSFactory();

        button = factory.createButton();
        checkbox = factory.createCheckbox();

        button.render();
        checkbox.render();
    }
}
