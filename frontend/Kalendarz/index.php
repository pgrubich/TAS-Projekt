<?php
session_start();

if(!isset($_SESSION['loggedIn']))
{
  header('Location: ../index.php');
  exit();
}
?>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>Calendar</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link rel="stylesheet" type="text/css" href="./font-awesome/css/font-awesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Norican|Quicksand" rel="stylesheet">
	</head>
	<body>
            <div id ="menu"><h4>Hello Marcin</h4></br>
                <button id="menuButton">Expand the menu</button>
                <ul>
                    <li><span id="addEvent" >ADD TASK</span></li>
                    <li><span id="removeEvent" >DELETE TASK</span></li>
                    <li><span >CHECK TASK LIST</span></li>
                </ul>
				<div>
				
				<form action="#" method="post" id="formMeeting">
					<h4>Meeting</h4><button type="button" id="goToTask">Create task</button><div style="clear:both;"></div>
					<p>Creator: 
						<input type="text" name="creator"/>
					</p>
					<p>Name: 
						<input type="text" name="name"/>
					</p>
					<p>Description: 
						<input type="text" name="description"/>
					</p>
					<p>Date: 
						<input type="date" name="date"/>
					</p>
					<p>Time: 
						<input type="time" name="time"/>
					</p>
					<p>Place: 
						<input type="text" name="place"/>
					</p>
						<input type="submit" value="Send" />
						<button type="button" class="quitCreating">Quit</button><div style="clear:both;"></div>
				</form>
				<form action="#" method="post" id="formTask">
					<h4>Task</h4><button type="button" id="goToMeeting">Create meeting</button><div style="clear:both;"></div>
					<p>Name: 
						<input type="text" name="name"/>
					</p>
					<p>Description: 
						<input type="text" name="description"/>
					</p>
					<p>Deadline: 
						<input type="date" name="date"/>
					</p>
						<input type="hidden" name="status" value="doing" />
						<input type="submit" value="Send" />
						<button type="button" class="quitCreating">Quit</button><div style="clear:both;"></div>
				</form>
				
				<form action="#" method="post" id="deleteEvent">
					<p>Event name: 
						<input type="text" name="place"/>
					</p>
					<input type="submit" value="Delete" />
					<button type="button" class="quitCreating">Quit</button><div style="clear:both;"></div>
				</form>
				</div>
            </div>
        <div id = "container">

            
            <h1>Calendar</h1>
            
            <div id ="calendar">
                <div id="control-panel">
                        <i id="previousMonth" class="fa fa-angle-left" aria-hidden="true"></i>

                    <div id ="head-control"></div>

                         <i id="nextMonth" class="fa fa-angle-right" aria-hidden="true"></i>
                   
                </div>
                <table id="mainTable" cellspacing="1" cellpadding="1" align="center">
                    <tr class = "calendar-week">  
                            <td>Monday</td>
                            <td>Tuesday</td>
                            <td>Wednesday</td>
                            <td>Thursday</td>
                            <td>Friday</td>
                            <td>Saturday</td>
                            <td>Sunday</td>
                    </tr>
                    <tr class = "calendar-row"  >
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                    
                    </tr>
                    <tr class = "calendar-row">
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                    </tr>
                    <tr class = "calendar-row">
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                    </tr>
                    <tr class = "calendar-row">
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                    </tr>
                    <tr class = "calendar-row">
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                        <td>...</td>
                    </tr>
                </table>


            </div>
        </div>
        <script src="calendar.js" type="text/javascript"></script>
        <script src="menu.js" type="text/javascript"></script>
        <script src="getJson.js" type="text/javascript"></script>
        
    </body>
    
</html>