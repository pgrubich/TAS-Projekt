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


var el1 = document.getElementById("addEvent");
var el2 = document.getElementById("removeEvent");
var meeting = document.getElementById("formMeeting");
var task = document.getElementById("formTask");
var remove = document.getElementById("deleteMeeting");
var remove2 = document.getElementById("deleteTask");
var goToTask = document.getElementById("goToTask");
var goToMeeting = document.getElementById("goToMeeting");
var quit = document.getElementsByClassName("quitCreating");
var goToDeleteMeeting = document.getElementById("goDeleteMeeting");
var goToDeleteTask = document.getElementById("goDeleteTask");

el1.addEventListener('click', showMeeting, false);
el2.addEventListener('click', removeEvent, false);
goToTask.addEventListener('click', showTask, false);
goToMeeting.addEventListener('click', showMeeting, false);
goToDeleteMeeting.addEventListener('click',removeEvent,false)
goToDeleteTask.addEventListener('click',showDeleteTask,false)
quit[0].addEventListener('click', hideAll, false);
quit[1].addEventListener('click', hideAll, false);
quit[2].addEventListener('click', hideAll, false);
quit[3].addEventListener('click', hideAll, false);

function showMeeting(){
     meeting.style.display = "block";
	 remove.style.display = "none";
	 task.style.display = "none";
	 remove2.style.display = "none"


}
function removeEvent(){
	remove.style.display = "block";
	meeting.style.display = "none";
	task.style.display = "none";
	remove2.style.display = "none"
}

function showTask(){
	task.style.display = "block";
	remove.style.display = "none";
	meeting.style.display = "none";
	remove2style.display = "none"
}

function hideAll(){
	task.style.display = "none";
	remove.style.display = "none";
	meeting.style.display = "none";
	remove2.style.display = "none"
}

function showDeleteTask(){
	remove2.style.display = "block"
	task.style.display = "none";
	remove.style.display = "none";
	meeting.style.display = "none";
}


document.getElementById("checkToDoList").addEventListener('click',function () {location.href = "toDoList.php";},false);   //to do list