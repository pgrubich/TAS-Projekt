<?php
session_start();

include_once '../config/database.php';
include_once '../objects/User.php';

$task = new User($_SESSION['login'],$conn);

if(isset($_POST['name'])) {
    $task->task_creator = $_SESSION['login'];
    $task->task_deadline_day = $_POST['date'];
    $task->task_name = $_POST['name'];

    try{
        $task->deleteTask();
        header('Location: ../../Kalendarz/index.php');
    }
    catch (PDOException $e){
        echo $e->getMessage();
    }
}