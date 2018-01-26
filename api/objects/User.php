<?php


class User
{

  //  private $table_name = "users";
    public $login;
    public $meeting_creator;
    public $meeting_name;
    public $meeting_desc;
    public $meeting_date;
    public $meeting_time;
    public $meeting_place;
    public $task_creator;
    public $task_name;
    public $task_deadline_day;
    public $task_deadline_time;
    public $task_desc;
    public $task_status;
    private $db;



    public function __construct($l,$conn)
    {
        //require_once '../config/database.php';
        $this-> db = $conn;
        $this->login = $l;
    }

    function read1(){

        $query1 = "SELECT u.login
                   FROM users u 
                   WHERE u.login = ?";

        $statement1 = $this->db->prepare($query1);
        $statement1->execute([$this->login]);

        return $statement1;
    }

    function read2(){

        $query2 = "SELECT m.meeting_creator, m.meeting_name, m.meeting_desc, m.meeting_date, m.meeting_time, m.meeting_place
                   FROM users u 
                   left join meetings m 
                   ON u.login = m.meeting_creator
                   WHERE u.login = ?";

        $statement2 = $this->db->prepare($query2);
        $statement2->execute([$this->login]);

        return $statement2;
    }

    function read3(){

        $query3 = "SELECT t.task_name, t.task_deadline_day, t.task_deadline_time, t.task_desc, t.task_status
                   FROM users u
                   left join tasks t
                   ON u.login = t.task_creator
                   WHERE u.login = ?";

        $statement3 = $this->db->prepare($query3);
        $statement3->execute([$this->login]);

        return $statement3;
    }

    function createMeeting(){

        $query = "INSERT INTO meetings (meeting_id,meeting_creator,meeting_name,meeting_desc,meeting_date,meeting_time,meeting_place)
                  VALUES (:id,:creator,:name,:description,:date,:time,:place)";

        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':id', NULL, PDO::PARAM_NULL);
        $stmt->bindValue(':creator', $this->meeting_creator, PDO::PARAM_STR);
        $stmt->bindValue(':name', $this->meeting_name, PDO::PARAM_STR);
        $stmt->bindValue(':description', $this->meeting_desc, PDO::PARAM_STR);
        $stmt->bindValue(':date', $this->meeting_date, PDO::PARAM_STR);
        $stmt->bindValue(':time', $this->meeting_time, PDO::PARAM_STR);
        $stmt->bindValue(':place', $this->meeting_place, PDO::PARAM_STR);

        $stmt->execute();
        if($stmt){
            return true;
        }
        else {
            return false;
        }
    }

    function createTask(){

        $query = "INSERT INTO tasks (task_id,task_creator,task_name,task_deadline_day,task_deadline_time,task_desc,task_status)
                  VALUES (:id,:creator,:name,:day,:time,:description,:status)";

        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':id', NULL, PDO::PARAM_NULL);
        $stmt->bindValue(':creator', $this->task_creator, PDO::PARAM_STR);
        $stmt->bindValue(':name', $this->task_name, PDO::PARAM_STR);
        $stmt->bindValue(':day', $this->task_deadline_day, PDO::PARAM_STR);
        $stmt->bindValue(':time', $this->task_deadline_time, PDO::PARAM_STR);
        $stmt->bindValue(':description', $this->task_desc, PDO::PARAM_STR);
        $stmt->bindValue(':status', $this->task_status, PDO::PARAM_STR);

        $stmt->execute();
        if($stmt){
            return true;
        }
        else {
            return false;
        }
    }

}
