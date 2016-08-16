<?php
//开启session
header("Content-Type: text/html;charset=utf-8");
session_start();
require_once("tpl.class.php");
require_once 'PdoMySQL.class.php';



$smarty->display("index.tpl");






	
?>