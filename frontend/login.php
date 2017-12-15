<?php
session_start();

if((!isset($_POST['login'])) || (!isset($_POST['password'])))
{
  header('Location: index.php');
  exit();
}

require_once "connect.php";
mysqli_report(MYSQLI_REPORT_STRICT);

try
{
    $connection = new mysqli($host, $dbUser, $dbPassword, $dbName);

    if ($connection->connect_errno != 0)
    {
        throw new Exception(mysqli_connect_errno());
    }
    else {
        $login = $_POST['login'];
        $password = $_POST['password'];

        $login = htmlentities($login, ENT_QUOTES, "UTF-8");


        if ($result = $connection->query(sprintf
        ("SELECT* FROM users WHERE login='%s'",
            mysqli_real_escape_string($connection, $login)))) {
            $numOfUsers = $result->num_rows;

            if ($numOfUsers > 0) {
                $row = $result->fetch_assoc();

                if (password_verify($password, $row['password'])) {
                    $_SESSION['loggedIn'] = true;
                    $_SESSION['login'] = $row['login'];

                    unset($_SESSION['error']);
                    $result->close();
                    header('Location:calendar.php');
                } else {
                    $_SESSION['error'] = '<span style="color:red">Nieprawidłowy login lub hasło</span>';
                    header('Location: index.php');
                }
            } else {
                $_SESSION['error'] = '<span style="color:red">Nieprawidłowy login lub hasło</span>';
                header('Location: index.php');
            }
        }

        $connection->close();
    }
}
catch(Exception $e)
{
    echo 'Błąd serwera <br>';
}
?>
