<?php
if(isset($_SESSION['e_username']))
{
    echo $_SESSION['e_username'].'<br>';
    unset($_SESSION['e_username']);
}
?>