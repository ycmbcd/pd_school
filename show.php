<?php
//开启session
session_start();
require_once("tpl.class.php");
require_once("db.php");
echo $_SESSION['u_name'];




?>
