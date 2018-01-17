<?php
session_start();

if((!isset($_POST['login'])) || (!isset($_POST['password']))) {

  header('Location: ../index.php');
  exit();
}

$conn = require_once "../config/database.php";

    $login = $_POST['login'];
    $password = $_POST['password'];

    $query = $conn->prepare("SELECT* FROM users WHERE login= :lgin");
    $query -> bindValue(':lgin', $login, PDO::PARAM_STR);
    $query -> execute();

    $user = $query->fetch();

        if ($user && $password == $user['password']) {
            $_SESSION['loggedIn'] = true;
            $_SESSION['login'] = $user['login'];

            unset($_SESSION['error']);
            header('Location: ../../Kalendarz/index.php');
        } else {
            $_SESSION['error'] = '<span style="color:red">Nieprawidłowy login lub hasło</span>';
            header('Location: ../index.php');
        }




