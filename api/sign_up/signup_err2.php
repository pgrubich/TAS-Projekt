<?php

if(isset($_SESSION['e_password']))
{
    echo $_SESSION['e_password'].'<br>';
    unset($_SESSION['e_password']);
}
