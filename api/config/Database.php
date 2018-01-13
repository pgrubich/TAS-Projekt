<?php

class Database
{
    private $host = "localhost";
    private $dbUser = "root";
    private $dbPassword = "";
    private $dbName = "tas-calendar";
    public $conn;

    public function getConnection()
    {
        $this->conn = null;

        try{
            $this->conn = new PDO("mysql:host=".$this->host.";dbname=".$this->dbName, $this->dbUser, $this->dbPassword);
            $this->conn->exec("set names utf8");
        } catch(PDOException $exception){
            echo "Connection error: ".$exception->getMessage();
        }

        return $this->conn;

    }
}
