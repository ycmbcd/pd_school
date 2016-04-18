<?php /* Smarty version 3.1.24, created on 2016-04-01 05:20:04
         compiled from "tpl/index.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:1280656fde8e4459082_42270185%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4455cbf7a7eafe1f5853911bfb89347d331524ba' => 
    array (
      0 => 'tpl/index.tpl',
      1 => 1459480418,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1280656fde8e4459082_42270185',
  'has_nocache_code' => false,
  'version' => '3.1.24',
  'unifunc' => 'content_56fde8e4484019_20592277',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_56fde8e4484019_20592277')) {
function content_56fde8e4484019_20592277 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '1280656fde8e4459082_42270185';
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