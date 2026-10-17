package ProjectsPatterns.Behawioralne.BudowniczyBuilder;


public class CoffeeOrder {

    // Pola gotowego zamówienia
    private final String size;
    private final boolean milk;
    private final int sugar;
    private final String syrup;

    // Prywatny konstruktor - obiekt tworzymy przez Builder
    private CoffeeOrder(Builder builder) {
        this.size = builder.size;
        this.milk = builder.milk;
        this.sugar = builder.sugar;
        this.syrup = builder.syrup;
    }

    // Gettery
    public String getSize() {
        return size;
    }

    public boolean hasMilk() {
        return milk;
    }

    public int getSugar() {
        return sugar;
    }

    public String getSyrup() {
        return syrup;
    }

    // Wyświetlanie zamówienia
    @Override
    public String toString() {
        return "CoffeeOrder{" +
                "size='" + size + '\'' +
                ", milk=" + milk +
                ", sugar=" + sugar +
                ", syrup='" + syrup + '\'' +
                '}';
    }

    // Wewnętrzna klasa Builder
    public static class Builder {

        // Parametry obowiązkowe i opcjonalne
        private final String size;
        private boolean milk = false;
        private int sugar = 0;
        private String syrup = "None";

        // Konstruktor wymaga podania rozmiaru
        public Builder(String size) {
            if (size == null || size.isBlank()) {
                throw new IllegalArgumentException(
                        "Coffee size cannot be empty"
                );
            }

            this.size = size;
        }

        // Konfiguracja mleka
        public Builder milk(boolean milk) {
            this.milk = milk;
            return this;
        }

        // Konfiguracja cukru
        public Builder sugar(int sugar) {
            if (sugar < 0) {
                throw new IllegalArgumentException(
                        "Sugar cannot be negative"
                );
            }

            this.sugar = sugar;
            return this;
        }

        // Konfiguracja syropu
        public Builder syrup(String syrup) {
            if (syrup == null || syrup.isBlank()) {
                throw new IllegalArgumentException(
                        "Syrup cannot be empty"
                );
            }

            this.syrup = syrup;
            return this;
        }

        // Utworzenie gotowego zamówienia
        public CoffeeOrder build() {
            return new CoffeeOrder(this);
        }
    }
}
