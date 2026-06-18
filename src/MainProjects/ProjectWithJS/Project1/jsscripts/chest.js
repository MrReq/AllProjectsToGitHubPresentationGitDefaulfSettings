function execute(player){
    let items =[
        "Sword",
        "Shield",
        "Helmet",
        "Bow"
    ];
    let randomIndex = Math.floor(Math.random()*items.length);

    let reward = items[randomIndex]

    return reward;
}