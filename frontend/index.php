<?php
session_start();
if((isset($_SESSION['loggedIn'])) && ($_SESSION['loggedIn']))
{
  header('Location: Kalendarz/index.php');
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
		Nie masz konta? <a href="signupView.php" >Zarejerstruj się</a>.
		</div>
		<div id="mid">
			<form action="login.php" method="post">
			Nazwa użytkownika: <br>
			<input type="username" name="login"><br>
			Hasło: <br>
			<input type="password" name="password"><br>

			<input type="submit" value="Zaloguj się" ><br>

			</form>
		</div>
	 </div>
	 </div>

<?php
  if(isset($_SESSION['error']))
    echo $_SESSION['error'];
?>

	 </body>
</html>