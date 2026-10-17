//================CONSOLELOG============================================================================================
console.log("Hello world")
console.log("from JS file")

//=============CONST====================================================================================================

const contstTest = "contstTest"
// contstTest = "contstTest2" ERROR bo nie można zmienić const

//=================LET==================================================================================================
let test2 = "Test2"

{
    let test = "Test"
    console.log(test);

    test2 = "Test2"
    console.log(test2);


}

// console.log(test) //ERROR bo odwołanie się do zmiennej, która jest poza blokiem

let test = "Test2"
console.log(test);
/*
let test = "Test2"
console.log(test); Nie można definiować dwa razy tych samych zmiennych w danym bloku
 */


//==========================VAR=========================================================================================

console.log(vartest);
{
    var vartest = "vartest"
    console.log(vartest);
}
console.log(vartest);