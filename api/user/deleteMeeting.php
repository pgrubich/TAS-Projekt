<?php
session_start();

include_once '../config/database.php';
include_once '../objects/User.php';

$meeting = new User($_SESSION['login'],$conn);

if(isset($_POST['name'])) {
    $meeting->meeting_creator = $_SESSION['login'];
    $meeting->meeting_date = $_POST['date'];
    $meeting->meeting_name = $_POST['name'];

    try{
        $meeting->deleteMeeting();
        header('Location: ../../Kalendarz/index.php');
    }
    catch (PDOException $e){
        echo $e->getMessage();
    }
}