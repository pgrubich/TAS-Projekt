<?php
session_start();
if((!isset($_SESSION['loggedIn'])) || !($_SESSION['loggedIn'])) {

    echo "Brak zalogowanych użytkowników.";
    exit();
}


header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/Database.php';
include_once '../objects/User.php';


$database = new Database();
$db = $database->getConnection();

$user = new User($db,$_SESSION['login']);

$statement = $user->read1();
$num = $statement->rowCount();
$logged_user["user"] = array();
$logged_user["events"] = array();

if($num>0){

    while($row = $statement->fetch(PDO::FETCH_ASSOC)){

        extract($row);

        $user_record = array(
            "login" => $login,
            "signup_date" =>  $signup_date
        );

        array_push($logged_user["user"],$user_record);
    }

} else {

    echo json_encode(
        array("message" => "Nie znaleziono użytkownika."),
        JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
    );
}

$statement = $user->read2();
$num = $statement->rowCount();

if($num>0){

    while($row = $statement->fetch(PDO::FETCH_ASSOC)){

        extract($row);

        $user_record = array(
            "meeting_creator" => $meeting_creator,
            "meeting_name" => $meeting_name,
            "meeting_desc" => $meeting_desc,
            "meeting_date" => $meeting_date,
            "meeting_time" => $meeting_time,
            "meeting_place" => $meeting_place,
        );

        array_push($logged_user["events"],$user_record);
    }

} else {

    echo json_encode(
        array("message" => "Nie znaleziono wydarzenia."),
        JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
    );
}

$statement = $user->read3();
$num = $statement->rowCount();

if($num>0){

    while($row = $statement->fetch(PDO::FETCH_ASSOC)){

        extract($row);

        $user_record = array(
            "task_name" => $task_name,
            "task_deadline_day" => $task_deadline_day,
            "task_deadline_time" => $task_deadline_time,
            "task_desc" => $task_desc,
            "task_status" => $task_status
        );

        array_push($logged_user["events"],$user_record);

    }

    echo json_encode($logged_user,JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

} else {

    echo json_encode(
        array("message" => "Nie znaleziono wydarzenia."),
        JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
    );
}

