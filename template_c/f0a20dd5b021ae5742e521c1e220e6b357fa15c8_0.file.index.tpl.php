<?php /* Smarty version 3.1.24, created on 2016-08-03 11:06:54
         compiled from "tpl/index.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:606057a1b42e3bed88_24160516%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f0a20dd5b021ae5742e521c1e220e6b357fa15c8' => 
    array (
      0 => 'tpl/index.tpl',
      1 => 1470215212,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '606057a1b42e3bed88_24160516',
  'has_nocache_code' => false,
  'version' => '3.1.24',
  'unifunc' => 'content_57a1b42e3e9d05_12345797',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_57a1b42e3e9d05_12345797')) {
function content_57a1b42e3e9d05_12345797 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '606057a1b42e3bed88_24160516';
?>
<!doctype html>
<html>
<head></head>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" >
<link href="style/basic.css" rel="stylesheet" type="text/css" >
<link href="style/index.css" rel="stylesheet" type="text/css" >
<body style="background: url(images/bg_1_1920.jpg) center -100px no-repeat;" >

<div class="container">
	<div class="row">
		<div id="login" class="col-lg-offset-4 col-lg-4" >
			<form class="navbar-form navbar-left" >
				<div class="form-group">
					<!--name-->
					<input id="username" name="username" class="form-control" placeholder="请输入用户名"><br />
					<input id="password" name="password" class="form-control" placeholder="请输入用户名">
				</div>
				<div>
					<input type="button" id="login_btn" class="btn btn-default" value="登入" />
					<a href="newuser.html"><input type="button" class="btn btn-default" value="注册" /></a>
				</div>
				
			</form>	
		</div>
	</div>
</div>







<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="myModal_login_error" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">      
      <div class="modal-body txt_center">
		用户名或密码错误
      </div>     
    </div>
  </div>
</div>


<?php echo '<script'; ?>
 src="js/jquery.js" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="js/bootstrap.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="js/ajax.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
>
$(function(){
	//$('#myModal_2').modal('show');
})
<?php echo '</script'; ?>
>
</body>
</html>
<?php }
}
?>