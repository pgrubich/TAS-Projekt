<?php

require_once 'connect.php';

try{
    $conn = new PDO("mysql:host=".$host.";dbname=".$dbName.";charset=".$charset, $dbUser, $dbPassword,
        [
            PDO::ATTR_EMULATE_PREPARES => false ,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

} catch(PDOException $e) {
    echo $e->getMessage();
    exit('Database error');
}