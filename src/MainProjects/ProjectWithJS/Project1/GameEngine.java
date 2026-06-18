package MainProjects.ProjectWithJS.Project1;

import javax.script.*;
import java.io.FileReader;

public class GameEngine {

    private final ScriptEngine engine;

    public GameEngine() {
        ScriptEngineManager manager =
                new ScriptEngineManager();

        engine = manager.getEngineByName("JavaScript");
    }

    public void runEvent(String path, Player player)
            throws Exception {

        engine.eval(new FileReader(path));

        Invocable invocable = (Invocable) engine;

        Object result =
                invocable.invokeFunction("execute", player);

        System.out.println(result);
    }
    public Item openChest(String path)
            throws Exception {

        engine.eval(new FileReader(path));

        Invocable invocable = (Invocable) engine;

        String itemName =
                (String) invocable.invokeFunction("execute");

        return new Item(itemName, 100);
    }

}