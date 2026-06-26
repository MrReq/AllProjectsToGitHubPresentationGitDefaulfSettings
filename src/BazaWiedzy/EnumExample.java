package BazaWiedzy;

 enum Day {

    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY,
    SUNDAY

}
interface Printable {
    void print();
}

enum Color implements Printable {

    RED,
    GREEN,
    BLUE;

    @Override
    public void print() {
        System.out.println(this);
    }
}

 enum Size {

    SMALL(1),
    MEDIUM(2),
    LARGE(3);

    private int level;

    Size(int level) {
        this.level = level;
    }

}

 enum Size2 {

    SMALL,
    MEDIUM,
    LARGE;

    public boolean isLarge() {
        return this == LARGE;
    }

}
 enum Planet {

    MERCURY(3.30),
    VENUS(4.87),
    EARTH(5.97);

    private final double mass;

    Planet(double mass) {
        this.mass = mass;
    }

    public double getMass() {
        return mass;
    }

}
 enum Operation {

    ADD {
        public int calculate(int a, int b) {
            return a + b;
        }
    },

    SUBTRACT {
        public int calculate(int a, int b) {
            return a - b;
        }
    };

    public abstract int calculate(int a, int b);

}

 enum OrderStatus {

    NEW,
    PAID,
    SHIPPED,
    DELIVERED,
    CANCELLED

}


 enum Role {

    USER,
    MODERATOR,
    ADMIN

}

