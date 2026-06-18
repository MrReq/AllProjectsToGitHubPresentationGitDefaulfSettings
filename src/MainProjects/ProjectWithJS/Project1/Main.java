package MainProjects.ProjectWithJS.Project1;

import java.util.Random;

public class Main {

    public static void main(String[] args) throws Exception {

        Player player =
                new Player("Marcin",100,50);

        GameEngine game =
                new GameEngine();

        System.out.println(player);

        System.out.println();

        game.runEvent(
                "src/MainProjects/ProjectWithJS/Project1/jsscripts/treasure.js",
                player
        );

        System.out.println();

        System.out.println(player);

        System.out.println();

        game.runEvent(
                "src/MainProjects/ProjectWithJS/Project1/jsscripts/dragon.js",
                player
        );

        System.out.println();

        System.out.println(player);

        System.out.println();

        String[] events = {
                "treasure.js",
                "dragon.js",
                "merchant.js"
        };

        Random random = new Random();

        String event =
                events[random.nextInt(events.length)];


        game.runEvent(
                "src/MainProjects/ProjectWithJS/Project1/jsscripts/"+event,
                player
        );

        System.out.println();

        Item item = game.openChest(
                "src/MainProjects/ProjectWithJS/Project1/jsscripts/chest.js"
        );

        player.addItem(item);

        System.out.println(player);
    }
}
