
var xhr = new XMLHttpRequest();



xhr.onload = function() {                       // Po zmianie stanu.
  if(xhr.status === 200) {                      // Jeżeli stan serwera wskazuje, że wszystko jest w porządku.
    responseObject = JSON.parse(xhr.responseText);
    var welcome = "Hello " + responseObject.user[0].login ;
    document.getElementsByTagName('h4')[0].innerHTML = welcome;
    jsonDay();
    
  }
}

var ele1 = document.getElementById("previousMonth");
var ele2 = document.getElementById("nextMonth");
ele1.addEventListener('click', jsonDay, false);
ele2.addEventListener('click', jsonDay, false);


function jsonDay(){

  for(i=0; i<responseObject.events.length ; i++){
    if(responseObject.events[i].meeting_name){
        var d = new Date(responseObject.events[i].meeting_date);
        var dy = parseInt(d.getUTCDate());
        var mn = months[d.getUTCMonth()];
        var yr = d.getUTCFullYear();
        

        if(mn == months[month] && yr == year)
        {
          
          var wiersz = Math.floor((date.getDay()+dy)/7); //numer+1 wiersza wydarzenia
          var komorka = (date.getDay()+dy)%7;   // numer-1 komorki wydarzenia
          
          var elA = document.getElementsByTagName("tr");
          var elB = elA[wiersz+1].getElementsByTagName("td")[komorka-1];
      
          // pole dla wydarzenia
          var newElement = document.createElement('div');
          var newText = document.createTextNode(responseObject.events[i].meeting_name);
          newElement.appendChild(newText);
          newElement.setAttribute("class","day-event");
          newElement.setAttribute("id",responseObject.events[i].meeting_name);
          
          elB.appendChild(newElement);
           
         
          // utworzenie niewidocznego pola z informacjami na temat wydarzenia
          var detailBlock = document.createElement("span");
          detailBlock.setAttribute("class","detailBlock");
          newElement.appendChild(detailBlock);
          
        }



      
    }



}


  //tablica elementow (wydarzen) 
var classname = document.getElementsByClassName("day-event");

//obluga najechania myszy na wydarzenie
var myFunction = function() {
    var attribute = this.getAttribute("id");
    for(var i = 0; i<responseObject.events.length; i++)
    {
      if(responseObject.events[i].meeting_name == attribute )
      { 
        // ustalenie zawartosci bloku ze szegolowymi informacjami
       var text1 = document.createTextNode("Place: "+responseObject.events[i].meeting_place); 
       var text2 = document.createTextNode("Time: "+responseObject.events[i].meeting_time);
       if(responseObject.events[i].meeting_desc == null){
        var text3 = document.createTextNode("Description: unknown");
       }else{
        var text3 = document.createTextNode("Description: "+responseObject.events[i].meeting_desc);
       }
       
      
       var block = document.getElementById(attribute);
       block.lastChild.textContent = text1.nodeValue+"\r\n" + text2.nodeValue+"\r\n"+ text3.nodeValue;
      }
    }
    
};
// zdarzenia najechania myszy na wydarzenia.
for (var i = 0; i < classname.length; i++) {
    classname[i].addEventListener('mouseover', myFunction, false);
}


}


xhr.open('GET', '../api/user/read.php', true); 
xhr.send(null);









































// OLD JSON 

/*


var xhr = new XMLHttpRequest(); // Utworzenie obiektu XMLHttpRequest.
               

xhr.onload = function() {                       // Po zmianie stanu.
  if(xhr.status === 200) {                      // Jeżeli stan serwera wskazuje, że wszystko jest w porządku.
    responseObject = JSON.parse(xhr.responseText);
    var welcome = "Hello " + responseObject.users[0].name ;
    document.getElementsByTagName('h4')[0].innerHTML = welcome;
    jsonDay();
  }
};
// Przygotowanie żądania.
xhr.open('GET', 'plikTestowy.json', true); 
xhr.send(null);

// obsluga zdarzen przy zmianie miesiaca
var ele1 = document.getElementById("previousMonth");
var ele2 = document.getElementById("nextMonth");
ele1.addEventListener('click', jsonDay, false);
ele2.addEventListener('click', jsonDay, false);



function jsonDay(){
 
//petla po kazdym wydarzeniu danego usera.  
for(i=0; i<responseObject.users[0].events.length ; i++){

  var mn = responseObject.users[0].events[i].month;
  var yr = responseObject.users[0].events[i].year;

  // jesli miesiac i rok zdarzenia zgadzaja sie z wyswietlana datą
  if(mn == months[month] && yr == year)
  {
    var dy = parseInt(responseObject.users[0].events[i].day);
    var wiersz = Math.floor((date.getDay()+dy)/7); //numer+1 wiersza wydarzenia
    var komorka = (date.getDay()+dy)%7;   // numer-1 komorki wydarzenia
    
    var elA = document.getElementsByTagName("tr");
    var elB = elA[wiersz+1].getElementsByTagName("td")[komorka-1];

    // pole dla wydarzenia
    var newElement = document.createElement('div');
    var newText = document.createTextNode(responseObject.users[0].events[i].name);
    newElement.appendChild(newText);
    newElement.setAttribute("class","day-event");
    newElement.setAttribute("id",parseInt(responseObject.users[0].events[i].id));
    
    elB.appendChild(newElement);
     
   
    // utworzenie niewidocznego pola z informacjami na temat wydarzenia
    var detailBlock = document.createElement("span");
    detailBlock.setAttribute("class","detailBlock");
    newElement.appendChild(detailBlock);
    

  }


}
//tablica elementow (wydarzen) 
var classname = document.getElementsByClassName("day-event");

//obluga najechania myszy na wydarzenie
var myFunction = function() {
    var attribute = this.getAttribute("id");
    for(var i = 0; i<responseObject.users[0].events.length; i++)
    {
      if(parseInt(responseObject.users[0].events[i].id) === parseInt(attribute) )
      { 
        // ustalenie zawartosci bloku ze szegolowymi informacjami
       var text1 = document.createTextNode("Opis :"+responseObject.users[0].events[i].description); 
       var text2 = document.createTextNode("Data: "+responseObject.users[0].events[i].day+" "
      +responseObject.users[0].events[i].month+ " "+ responseObject.users[0].events[i].year);
      
       var block = document.getElementById(attribute);
       block.lastChild.textContent = text1.nodeValue+"\r\n" + text2.nodeValue;
      }
    }
    
};
// zdarzenia najechania myszy na wydarzenia.
for (var i = 0; i < classname.length; i++) {
    classname[i].addEventListener('mouseover', myFunction, false);
}

};



*/



