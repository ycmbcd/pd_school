<?php
//开启session
session_start();
require_once("tpl.class.php");
require_once("db.php");



if(isset($_POST['ttt'])){
	echo $_SESSION['u_name'];
}


if(isset($_POST['aaa'])){
	$db = new DB();
	$sql = "select * from anto_school;";
	$res = $db->execute($sql);  //执行搜口语句并返回结果集
	$restojson = json_encode($res);
	echo $restojson;
	return false;
}

if(isset($_POST['bbb'])){
	$db = new DB();
	$sql = "select * from anto_school;";
	$res = $db->execute($sql);  //执行搜口语句并返回结果集
	$restojson = json_encode($res);
	echo $restojson;
	return false;
}

$smarty->display("show.tpl");

?>
