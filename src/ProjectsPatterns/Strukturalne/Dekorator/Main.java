package ProjectsPatterns.Strukturalne.Dekorator;
public class Main {
    public static void main(String[] args) {
        var pizza = new MediumPizza();
        var pizzaMediumwithcheese = new CheeseDecorator(pizza);
        System.out.println(pizzaMediumwithcheese.CalculatePrice());
        var pizza2 = new SalamiDecorator(pizzaMediumwithcheese);
        System.out.println(pizza2.CalculatePrice());
    }
}
class HamDecorator extends PizzaDecorator{
    public HamDecorator(IPizza pizza) {
        super(pizza);
    }
    @Override
    public double CalculatePrice() {
        return super.CalculatePrice() + 5;
    }
}
class CheeseDecorator extends PizzaDecorator{
    public CheeseDecorator(IPizza pizza) {
        super(pizza);
    }
    @Override
    public double CalculatePrice() {
        return super.CalculatePrice() + 4.5;
    }
}
class SalamiDecorator extends PizzaDecorator{
    public SalamiDecorator(IPizza pizza) {
        super(pizza);
    }
    @Override
    public double CalculatePrice() {
        return super.CalculatePrice() + 6.5;
    }
}
abstract class PizzaDecorator implements IPizza{
    protected IPizza pizza;
    public PizzaDecorator(IPizza pizza){
        this.pizza=pizza;
    }
    @Override
    public double CalculatePrice() {
        return pizza.CalculatePrice();
    }
}
interface IPizza{
    double CalculatePrice();
}
class SmallPizza implements IPizza{
    double price;
    public double CalculatePrice() {
        return 15;
    }
}
class MediumPizza implements IPizza{
    double price;
    @Override
    public double CalculatePrice() {
        return 20;
    }
}
class BigPizza implements IPizza{
    double price;
    public double CalculatePrice() {
        return 30;
    }
}