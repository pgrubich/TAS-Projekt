<?php
  session_start();

  if(isset($_POST['username']))
  {
    $succeeded = true;

    $username = $_POST['username'];
    if((strlen($username) < 3) || (strlen($username) > 20))
    {
      $succeeded = false;
      $_SESSION['e_username']="Nazwa użytkownika musi posiadać od 3 do 20 znaków";
    }

    if(ctype_alnum($username) == false)
    {
      $succeeded = false;
      $_SESSION['e_username']="Nazwa użytkownika może składać się tylko z liter i cyfr";
    }

    $pass1 = $_POST['pass1'];
    $pass2 = $_POST['pass2'];
    if((strlen($pass1) < 8) || (strlen($pass1) > 20 ))
    {
        $succeeded = false;
        $_SESSION['e_password'] = "Hasło musi posiadać od 8 do 20 znaków";
    }

    if($pass1 != $pass2)
    {
        $succeeded = false;
        $_SESSION['e_password'] = "Podane hasła nie są identyczne";
    }

    //$pass_hash = password_hash($pass1, PASSWORD_DEFAULT);


    require_once "../config/connect.php";
    mysqli_report(MYSQLI_REPORT_STRICT);

    try
    {
        $connection = new mysqli($host,$dbUser,$dbPassword,$dbName);
        if ($connection->connect_errno != 0)
        {
            throw new Exception(mysqli_connect_errno());
        }
        else {
            $result = $connection->query("SELECT id FROM users WHERE login='$username'");

            if(!$result) throw new Exception($connection->error);

            $numOfUsers = $result->num_rows;
            if($numOfUsers > 0)
            {
                $succeeded = false;
                $_SESSION['e_username'] = "Ta nazwa użytkownika jest już zajęta";
            }

            if($succeeded)
            {
                if($connection->query("INSERT INTO users VALUES(NULL,'$username','$pass1')"))
                {
                    $_SESSION['signedUp'] = true;
                    header('Location: welcome.php');
                }
                else
                {
                    throw new Exception($connection->error);
                }
            }

            $connection->close();
        }
    }
    catch(Exception $e)
    {
        echo 'Błąd serwera <br>';
    }

  }


