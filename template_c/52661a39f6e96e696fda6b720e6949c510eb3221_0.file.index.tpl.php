<?php /* Smarty version 3.1.24, created on 2016-04-12 05:06:02
         compiled from "tpl/index.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:32236570c661a9100b2_39761068%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '52661a39f6e96e696fda6b720e6949c510eb3221' => 
    array (
      0 => 'tpl/index.tpl',
      1 => 1459480418,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '32236570c661a9100b2_39761068',
  'has_nocache_code' => false,
  'version' => '3.1.24',
  'unifunc' => 'content_570c661a93b041_24325527',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_570c661a93b041_24325527')) {
function content_570c661a93b041_24325527 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '32236570c661a9100b2_39761068';
?>
<!doctype html>
<html>
<head></head>
<body>
<?php echo '<script'; ?>
 src="js/jquery.js" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="js/ajax.js"><?php echo '</script'; ?>
>
<div id="login_box" >
	<form>
		<input type="text" name="u_name" />
		<input type="password" name="u_password" />
		<input type="button" value="登录" onclick="pd_login()" >
	</form>
</div>
<div>
	<input type="button" id="aaa" onclick="aaa()" value="ok" />
</div>
<div id="aaashow" ></div>
</body>
</html><?php }
}
?>