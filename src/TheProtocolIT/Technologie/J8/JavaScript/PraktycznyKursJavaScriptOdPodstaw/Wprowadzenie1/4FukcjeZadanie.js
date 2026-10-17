function met1(name, surname){
    return name + " " + surname;
}

const anonimfunction = function (name,surname){
    return name + " " + surname;
}

const  met3 = (name, surname)=>{
    return name + " " + surname;
}
met1('Jan','Dobry')
anonimfunction('Jan','Dobry')
met3('Jan','Dobry')

console.log(met1('Jan','Dobry'))
console.log(anonimfunction('Jan','Dobry'))
console.log(met3('Jan','Dobry'))