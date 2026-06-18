package MainProjects.ProjectWithJS.Project1;
import java.util.ArrayList;
import java.util.List;
public class Player {
    List<Item> inventory = new ArrayList<>();

    private String name;
    private int hp;
    private int gold;


    public Player(String name, int hp, int gold) {
        this.name = name;
        this.hp = hp;
        this.gold = gold;
    }

    public int getHp() {
        return hp;
    }

    public int getGold() {
        return gold;
    }

    public void addGold(int gold) {
        this.gold += gold;
    }

    public void damage(int damage) {
        this.hp -= damage;
    }

    public void heal(int amount) {
        this.hp += amount;
    }

    @Override
    public String toString() {
        return name + " HP: " + hp + " Gold: " + gold + " Inventory: " + inventory;
    }

    public void addItem(Item item){
        inventory.add(item);
    }


}
