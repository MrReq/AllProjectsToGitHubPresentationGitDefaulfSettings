package MainProjects.ProjectWithKubernetess.Project1.models;

public class Player {
    int id;
    String nickname;
    String level;
    int gold;
    public Player() {
    }

    public Player(String name) {
        this.nickname = name;
    }

    public String getName() {
        return nickname;
    }

    public void setName(String name) {
        this.nickname = name;
    }

    public Player(int id, String nickname, String level, int gold) {
        this.id = id;
        this.nickname = nickname;
        this.level = level;
        this.gold = gold;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public int getGold() {
        return gold;
    }

    public void setGold(int gold) {
        this.gold = gold;
    }
}
