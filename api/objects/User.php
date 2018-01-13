<?php


class User
{
    private $conn;
  //  private $table_name = "users";

    public $login;
    public $signup_date;
    public $meeting_creator;
    public $meeting_name;
    public $meeting_desc;
    public $meeting_date;
    public $meeting_time;
    public $meeting_place;
    public $task_name;
    public $task_deadline_day;
    public $task_deadline_time;
    public $task_desc;
    public $task_status;

    public function __construct($db,$l)
    {
        $this->conn = $db;
        $this->login = $l;
    }

    function read1(){

        $query1 = "SELECT u.login, u.signup_date
                   FROM users u 
                   WHERE u.login = '$this->login'";

        $statement1 = $this->conn->prepare($query1);
        $statement1->execute();

        return $statement1;
    }

    function read2(){

        $query2 = "SELECT m.meeting_creator, m.meeting_name, m.meeting_desc, m.meeting_date, m.meeting_time, m.meeting_place
                   FROM users u 
                   left join meetings m 
                   ON u.login = m.meeting_creator
                   WHERE u.login = '$this->login'";

        $statement2 = $this->conn->prepare($query2);
        $statement2->execute();

        return $statement2;
    }

    function read3(){

        $query3 = "SELECT t.task_name, t.task_deadline_day, t.task_deadline_time, t.task_desc, t.task_status
                   FROM users u
                   left join tasks t
                   ON u.login = t.task_creator
                   WHERE u.login = '$this->login'";

        $statement3 = $this->conn->prepare($query3);
        $statement3->execute();

        return $statement3;
    }
}
