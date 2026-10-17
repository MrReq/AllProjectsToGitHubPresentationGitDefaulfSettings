package ProjectsPatterns.Behawioralne.Prototyp;
interface Prototype<T>{
    T copy();
}
class Character implements Prototype<Character>{
    private String name;
    private int health;
    private int attack;
    private String weapon;

    public Character(String name, int health, int attack, String weapon){
        this.name=name;
        this.health=health;
        this.attack=attack;
        this.weapon=weapon;
    }

    @Override
    public Character copy() {
        return new Character(name,health,attack,weapon);
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setHealth(int health) {
        this.health = health;
    }

    public void setAttack(int attack) {
        this.attack = attack;
    }

    public void setWeapon(String weapon) {
        this.weapon = weapon;
    }
    public void showInfo(){
        System.out.println("Imie: "+name);
        System.out.println("Zdrowie: "+health);
        System.out.println("Atak: "+attack);
        System.out.println("Broń: "+weapon);
    }

}

public class Main {
    public static void main(String[] args) {
        Character character = new Character("Wojownik",100,20,"Łuk");
        Character character2 = character.copy();

        character2.setName("Elitarus");
        character2.setHealth(150);
        character2.setAttack(35);
        character2.setWeapon("Topór");

        System.out.println("Czy to te same obiekty? "+ (character==character2));

    }
}
