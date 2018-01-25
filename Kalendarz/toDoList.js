document.getElementById("goToCalendar").addEventListener('click',function () {location.href = "index.php";},false);

var xhr = new XMLHttpRequest();

xhr.open('GET', '../api/user/read.php', true); 
xhr.send(null);

xhr.onload = function() {                      
  if(xhr.status === 200) {         

    toDoList(JSON.parse(xhr.responseText));
    
  }
}


function toDoList(responseObject){
    var cont = "";
    var j = 1;
    for(var i=0; i<responseObject.events.length ; i++){
        if(responseObject.events[i].task_name){
            cont+= "<tr><td>"+j+"</td>";
            cont+= "<td>"+responseObject.events[i].task_name+"</td>";
            cont+= "<td>"+responseObject.events[i].task_deadline_day+"</td>";
            cont+= "<td>"+responseObject.events[i].task_desc+"</td>";
            if(responseObject.events[i].task_status == "DONE"){
            cont+= "<td><input type='checkbox' name='status' checked='checked' id='status"+j+"'/></td>";
            }
            else{
                cont+="<td><input type='checkbox' name='status' id='status"+j+"' /></td>";
            }
            cont+="<td><button id='but"+j+"'>Save</button></td></tr>"
            j++
        }
    }
    document.getElementById("toDoBody").innerHTML = cont;

        //zdarzenie click dla buttonow
        for(var k=1; k<=document.getElementById("toDoTable").rows.length-1; k++)
        {
    
            document.getElementById("but"+k).addEventListener('click',changeStatus,false);
        }
        function changeStatus(){
            var y = this.id;
            var x = y.replace('but','');

            var z = document.getElementById('status'+x);

            var data = {};
            if(z.checked){
                data.status = "DONE";
            }else{
                data.status = "DOING";
            }

            var json = JSON.stringify(data);

            var xhr1 = new XMLHttpRequest();
            xhr1.open("PUT", '#', true);
            xhr1.setRequestHeader('Content-type','application/json; charset=utf-8');
            xhr1.onload = function () {
            var tasks = JSON.parse(xh1r.responseText);
            if (xhr1.readyState == 4 && xhr1.status == "200") {
                console.table(tasks);
            } else {
                console.error(tasks);
            }
            }
            xhr1.send(json);

        }


}







