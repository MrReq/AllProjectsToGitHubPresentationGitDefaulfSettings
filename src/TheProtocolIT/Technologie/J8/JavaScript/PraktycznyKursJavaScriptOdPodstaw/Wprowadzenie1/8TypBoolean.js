//======================================================================================================================
let firstValue = true;
let secondValue = false;

let andresult = firstValue && secondValue;
console.log(andresult);

let orResult = firstValue || secondValue;
console.log(orResult)

let notResult = !firstValue;
console.log(notResult)

let longExpression = firstValue || secondValue && orResult || notResult;
console.log(longExpression)

let a =false;
let b =true;
let c = false;
let resultWithParentheses = (b || a) && c
console.log(resultWithParentheses)