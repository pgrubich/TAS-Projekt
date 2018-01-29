<?php
  session_start();

  if(isset($_POST['username']))
  {
      $succeeded = true;

      $username = $_POST['username'];
      if((strlen($username) < 3) || (strlen($username) > 20))
      {
          
          $succeeded = false;

          
          $_SESSION['e_username']= "<script type='text/javascript'>alert('Nazwa użytkownika musi posiadać od 3 do 20 znaków');</script>";
          header('Location: signupView.php');
      }

      if(ctype_alnum($username) == false)
      {
          $succeeded = false;
          
          $_SESSION['e_username']="<script type='text/javascript'>alert('Nazwa użytkownika może składać się tylko z liter i cyfr');</script>";
          header('Location: signupView.php');
      }

      $pass1 = $_POST['pass1'];
      $pass2 = $_POST['pass2'];
      if((strlen($pass1) < 8) || (strlen($pass1) > 20 ))
      {
          $succeeded = false;
          
          $_SESSION['e_password'] = "<script type='text/javascript'>alert('Hasło musi posiadać od 8 do 20 znaków');</script>";
          header('Location: signupView.php');
      }

      if($pass1 != $pass2)
      {
          $succeeded = false;
         
          $_SESSION['e_password'] =  "<script type='text/javascript'>alert('Podane hasła nie są identyczne');</script>";
          header('Location: signupView.php');
      }

      //$pass_hash = password_hash($pass1, PASSWORD_DEFAULT);


      require_once "../config/database.php";

      try
      {
          $query1 = "SELECT login FROM users WHERE login= :login";
          $check = $conn->prepare($query1);
          $check->bindValue(':login', $username, PDO::PARAM_STR);
          $check->execute();


          if($check->rowCount() > 0)
          {
              $succeeded = false;
              $_SESSION['e_username'] =  "<script type='text/javascript'>alert('Ta nazwa użytkownika jest już zajęta');</script>";;
              header('Location: signupView.php');
          }

          if($succeeded)
          {
              $query2= "INSERT INTO users VALUES(:login , :pass)";
              $signin = $conn -> prepare($query2);

              $signin -> bindValue(':login',$username);
              $signin -> bindValue(':pass',$pass1);
              $signin -> execute();

              $_SESSION['signedUp'] = true;
              header('Location: welcome.php');
          }


      }

      catch(PDOException $e)
      {
          echo $e->getMessage();
      }

  }


