<?php
//开启session
session_start();
require_once("tpl.class.php");
require_once("db.php");

if(isset($_POST['u_name'])){
	$u_name = $_POST['u_name'];
	$u_password = $_POST['u_password'];	
	$db = new DB();
	$sql = "select * from anto_school where name='{$u_name}' and password='{$u_password}';";
	$res = $db->execute($sql);
	if(empty($res)){
		echo 0;
		return false;
	}else{
		//查询员工姓名和工号
		$db = new DB();
		$sql = "select * from anto_school where name='{$u_name}';";
		$res = $db->execute($sql);
		foreach($res as $value);
		$u_name = $value['name'];		
		$_SESSION['u_name'] = $u_name;
		echo $u_name ;
		return false;
		//写入日志！！！
	}	
	return false;
}

if(isset($_POST['aaa'])){
	$db = new DB();
	$sql = "select * from anto_school;";
	$res = $db->execute($sql);  //执行搜口语句并返回结果集
	$restojson = json_encode($res);
	echo $restojson;		
	return false;
}



	
$smarty->display("index.tpl");
	
?>