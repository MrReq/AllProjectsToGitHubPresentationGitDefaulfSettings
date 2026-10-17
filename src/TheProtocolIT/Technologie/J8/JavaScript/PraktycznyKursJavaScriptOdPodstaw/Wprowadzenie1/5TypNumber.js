let a =10;
let b =5;

let sum = a + b;
let difference = a - b;
let product = a * b;
let quotient = a / b;

let evenNumber = 4;
let oddNumber = 7;

console.log(sum);
console.log(difference);
console.log(product);
console.log(quotient);

console.log(evenNumber%2);
console.log(oddNumber%2);

let square = a ** 2;
console.log(square);

let textualNumber = "123";
console.log(textualNumber * 2);  //konwersja na number
console.log(textualNumber + 2);  //brak konwersji na number, pozostanie przy String
console.log(parseInt(textualNumber) + 2);  //parsowanie

console.log(a===b); //Porównianie zarówno wartości jak i typu
console.log(a!==b); //Porównianie zarówno wartości jak i typu
console.log(a==b); //Porównianie wartości bez typu
console.log(a!=b); //Porównianie wartości bez typu
console.log(a>b); //Porównianie wartości bez typu
console.log(a>=b); //Porównianie wartości bez typu
console.log(a<b); //Porównianie wartości bez typu
console.log(a<+b); //Porównianie wartości bez typu

//MATH==========
console.log(Math.floor(5.9))
console.log(Math.abs(-5.9))
console.log(Math.ceil(5.9))