function execute(player) {

    print("Spotkałeś kupca!");

    if (player.getGold() >= 50) {

        player.addGold(-50);

        return "Kupiłeś miksturę za 50 złota";
    }

    return "Nie masz wystarczająco złota";
}