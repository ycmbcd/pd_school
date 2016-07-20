<?php /* Smarty version 3.1.24, created on 2016-07-20 10:49:06
         compiled from "tpl/index.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:14155578f3b0291a323_16770950%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f0a20dd5b021ae5742e521c1e220e6b357fa15c8' => 
    array (
      0 => 'tpl/index.tpl',
      1 => 1469004475,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14155578f3b0291a323_16770950',
  'has_nocache_code' => false,
  'version' => '3.1.24',
  'unifunc' => 'content_578f3b029cde40_37258627',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_578f3b029cde40_37258627')) {
function content_578f3b029cde40_37258627 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '14155578f3b0291a323_16770950';
?>
<!doctype html>
<html>
<head></head>
<link href="style/basic.css" rel="stylesheet" type="text/css" >
<link href="style/index.css" rel="stylesheet" type="text/css" >
<body>
<form id="login" >
	<label for="username" >name</label><input id="username" name="username" />
	<br />
	<label for="password" >password</label><input id="password" name="password" />
	<input type="button" id="login_btn" class="btn btn-default" value="登入" />
	<a href="newuser.html" ><input type="button" class="btn btn-default" value="注册" /></a>
</form>


<?php echo '<script'; ?>
 src="js/jquery.js" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="js/ajax.js"><?php echo '</script'; ?>
>
</body>
</html>
<?php }
}
?>