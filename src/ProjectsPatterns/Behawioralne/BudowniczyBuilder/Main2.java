package ProjectsPatterns.Behawioralne.BudowniczyBuilder;


public class Main2 {

    public static void main(String[] args) {

        // Zamówienie 1: kawa z mlekiem i syropem
        CoffeeOrder order1 = new CoffeeOrder.Builder("Large")
                .milk(true)
                .sugar(2)
                .syrup("Caramel")
                .build();

        // Zamówienie 2: kawa bez dodatków
        CoffeeOrder order2 = new CoffeeOrder.Builder("Small")
                .build();

        // Zamówienie 3: kawa z mlekiem i jednym cukrem
        CoffeeOrder order3 = new CoffeeOrder.Builder("Medium")
                .milk(true)
                .sugar(1)
                .build();

        // Wyświetlenie zamówień
        System.out.println("=== COFFEE ORDERS ===");
        System.out.println(order1);
        System.out.println(order2);
        System.out.println(order3);
    }
}

