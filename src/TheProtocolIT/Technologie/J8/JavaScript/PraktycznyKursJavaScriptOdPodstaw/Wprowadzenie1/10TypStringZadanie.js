function getInitials(fullname){
    let spaceIndex = fullname.indexOf(" ");
    imie = fullname.substring(0,spaceIndex);
    nazwiskolen = fullname.length - imie.length;
    nazwisko = fullname.substring(imie.length+1,nazwiskolen)
    initials = imie.substring(0) +  nazwisko.substring(0)
    return initials;
}

console.log(getInitials("Marcin Ząbkowski"));