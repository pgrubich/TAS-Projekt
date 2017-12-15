<?php
session_start();

if(!isset($_SESSION['loggedIn']))
{
  header('Location: index.php');
  exit();
}
?>
<!DOCTYPE HTML>
<html>
     <head>
          <meta charset="UTF-8" />
    </head>

    <body>
      <p>Main page</p>
      <a href="logout.php">Wyloguj się</a>;

    </body>

</html>
