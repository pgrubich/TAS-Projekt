<?php
session_start();

#if(!isset($_SESSION['loggedIn']))
#{
#  header('Location: index.php');
#  exit();
#}
?>
<!DOCTYPE HTML>
<html>
     <head>
          <meta charset="UTF-8" />
    </head>

    <body>
      <?php
      echo "<p>Main page</p>";
      ?>
    </body>

</html>
