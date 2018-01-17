var date= new Date();
var year = date.getFullYear();
var month = date.getMonth();
var months = ["January", "February", "March", "April", "May", "June",
 "July", "August", "September", "October", "November", "December"];
var days = ["pn","wt","sr","czw","pt","sb","ndz"];

// ustawienie poczatkowego miesiaca i roku
(function setMonth() {

    var element = document.getElementById("head-control");
    
    element.innerHTML ="<h3>"+months[month]+"  "+ year +"</h3>";
    date.setFullYear(year,month,0);
    getDayCell();

})();
// cofniecie kalendarza o miesiac
function previousMonth(){
   var element = document.getElementById("head-control");
   month--;
   if(month<0){ 
       year--;
       month = 11;
       element.innerHTML ="<h3>"+months[month]+"  "+ year +"</h3>"; 
       date.setFullYear(year,month,0);

       removeTd();
       getDayCell();
       
    }
   else{
        element.innerHTML ="<h3>"+months[month]+"  "+ year +"</h3>";
        date.setFullYear(year,month,0);
        removeTd();
        getDayCell();
       
   }
}
// przesuniecie kalendarza o miesiac w przod
function nextMonth(){
    var element = document.getElementById("head-control");
    month++;
    if(month>11){
        year++; 
        month = 0;
        element.innerHTML ="<h3>"+months[month]+"  "+ year +"</h3>";   
        date.setFullYear(year,month,0);
        removeTd();
        getDayCell();
     }
    else{
         element.innerHTML ="<h3>"+months[month]+"  "+ year +"</h3>";
         date.setFullYear(year,month,0);
         removeTd();
         getDayCell();
    }
}
//obsluga zdarzen przesuniecia kalendarza
var el1 = document.getElementById("previousMonth");
var el2 = document.getElementById("nextMonth");
el1.addEventListener('click', previousMonth, false);
el2.addEventListener('click', nextMonth, false);


// Ile dni w miesiącu
function daysInMonth(month,year) {
    return new Date(year, month, 0).getDate();
}



function getDayCell(){
    var element = document.getElementsByTagName("tr");
    var element2 = element[1].getElementsByTagName("td");
    var numberOfDays = daysInMonth(month,year);   
   

//6 wiersz
   if((date.getDay()+daysInMonth(month+1,year))>35)
    {   
        
         var newElement = document.createElement('tr');
         var table = document.getElementById("mainTable");
         table.appendChild(newElement);
         
         for(var i = 0; i<7 ; i++){
            var newTd = document.createElement('td');
            var tr = document.getElementsByTagName("tr")[6];
            tr.appendChild(newTd);
         }
    }
   
    //puste bloki na poczatku
    for(var i=0; i<date.getDay();i++){
        element2[i].innerHTML = "<td class='calendar-day-np'></td>";
        element2[i].setAttribute("class","calendar-day-np");
    }

    //dni
    var j=1;
    var x=date.getDay();
   for(var i=0; i<daysInMonth(month+1,year); i++)
      {
        
        if((x+1)%7 === 0 && x!=0 ){
            
            element[j].getElementsByTagName("td")[x].innerHTML = "<td><div class='day-number'>"+(i+1)+"</div></td>";
            element[j].getElementsByTagName("td")[x].setAttribute('class',"calendar-day");
            j++;
            x=0;
        }
        else{
            element[j].getElementsByTagName("td")[x].innerHTML = "<td><div class='day-number'>"+(i+1)+"</div></td>";
            element[j].getElementsByTagName("td")[x].setAttribute('class',"calendar-day");
            x++;
        }

     }

     //puste bloki na koncu
     var y = 6;
     var z = daysInMonth(month+1,year) + date.getDay();
     for(var i=35; i > z ; i--)
     {
        element[5].getElementsByTagName("td")[y].innerHTML = "<td></td>";
        element[5].getElementsByTagName("td")[y].setAttribute('class','calendar-day-np');
        y--;
     }

    //puste bloki w 6 wierszu
    if((date.getDay()+daysInMonth(month+1,year))>35){
        for(var i=42; i > z ; i--)
        {
           element[6].getElementsByTagName("td")[y].innerHTML = "<td></td>";
           element[6].getElementsByTagName("td")[y].setAttribute('class','calendar-day-np');
           y--;
        }
   

    }
     
}


//usuwanie 6 wiersza
function removeTd(){
        var element = document.getElementsByTagName("tr")[6];
        var parentElement = document.getElementById("mainTable");
        if(element)
        {   
            parentElement.removeChild(element);
        }
}