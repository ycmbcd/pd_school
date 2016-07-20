<?php
//开启session
header("Content-Type: text/html;charset=utf-8");
session_start();
require_once("tpl.class.php");
require_once 'PdoMySQL.class.php';
$db = new PdoMySQL();
// 登入
if(isset($_POST['username'])){
	$username = $_POST['username'];
	$password = $_POST['password'];
	$username = str_replace('\'','', $username);
	$password = str_replace('\'','', $password);
	$sql = "select * from anto_school where name='{$username}' and password='{$password}';";
	$res = $db->getAll($sql);
	if(empty($res)){
		echo 0;
		return false;
	}else{
		//查询员工姓名和工号
		$sql = "select * from anto_school where name='{$username}';";
		$res = $db->getAll($sql);
		foreach($res as $value);
		$username = $value['name'];		
		$_SESSION['username'] = $username;
		echo "ok" ;
		return false;
		//写入日志！！！
	}	
	return false;
}





	
$smarty->display("index.tpl");
	
?>