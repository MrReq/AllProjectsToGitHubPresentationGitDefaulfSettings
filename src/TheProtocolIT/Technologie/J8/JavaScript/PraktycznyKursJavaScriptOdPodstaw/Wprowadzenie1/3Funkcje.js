function helloName(name){
    console.log("hello, ")
    console.log(name)
    console.log()
}
let testName = "test"

helloName("Kuba")
helloName(testName)
helloName()

function helloName2(name){
    let result = "Hello, " + name
    console.log(result)
}

helloName2()

function helloNamereturn(name){
    return "Hello, " + name;
}

const result1 = helloNamereturn("Kuba")
const result2 =helloNamereturn(testName)
const result3 =helloNamereturn()
//======================
const variableFunction = function (name){
    console.log("hello, ")
    console.log(name)
    console.log()
}

const arrowFunction = (name) =>{
    let result = "Hello, " + name
    return result
}