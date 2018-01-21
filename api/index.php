<?php
session_start();
if((isset($_SESSION['loggedIn'])) && ($_SESSION['loggedIn']))
{
  header('Location: ../Kalendarz/index.php');
  exit();
}
?>

<!DOCTYPE HTML>
<html>
     <head>
          <meta charset="UTF-8" />
          <title>Logowanie</title>
		  <link rel="stylesheet" href="style.css" type="text/css"/>
		  <script src="script.js" type="text/javascript"></script>
     </head>
	 <body>
	 <div id="container">
	 <div id="panel">
		<div id="top">
		<a href="sign_up/signupView.php" ><button id="regis">Zarejerstruj się</button></a>
		</div>
		<div id="mid">
			<form action="log_in/login.php" method="post">
			Nazwa użytkownika:
			<input type="username" name="login"><br>
			Hasło: <br>
			<input type="password" name="password"><br>

			<input type="submit" value="Zaloguj się" ><br>

			</form>
		</div>
	 </div>
	 </div>

<?php
  if(isset($_SESSION['error'])){
    echo $_SESSION['error'];
    unset($_SESSION['error']);
    }
?>

	 </body>
</html>
