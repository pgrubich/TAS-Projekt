var element = document.getElementById("menuButton");
var element2 = document.getElementsByTagName("ul")[0];
element2.style.display = "none";
element.addEventListener('click', Menu, false);

function Menu(){


    if (element2.style.display === "none") {
        element2.style.display = "block";
        element.innerHTML = "Furl the menu";

    } else {
        element2.style.display = "none";
        element.innerHTML = "Expand the menu";
    }

}




 