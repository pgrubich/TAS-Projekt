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
                    <li><a href="#">ADD TASK</a></li>
                    <li><a href="#">DELETE TASK</a></li>
                    <li><a href="#">CHECK TASK LIST</a></li>
                </ul>
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