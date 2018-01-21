<?php
session_start();
if(!isset($_SESSION['signedUp']))
{
  header('Location: ../index.php');
  exit();
}
else
{
    unset($_SESSION['signedUp']);
}
?>

<!DOCTYPE HTML>
<html>
     <head>
          <meta charset="UTF-8" />
          <title>Logowanie</title>
		  <link rel="stylesheet" href="../style.css" type="text/css"/>
		  <script src="../script.js" type="text/javascript"></script>
     </head>
	 <body>

		Rejestracja zakończona sukcesem <br>
            <a href="../index.php" >Zaloguj się</a>

	 </body>
</html>
