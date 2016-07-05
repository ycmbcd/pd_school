<?php /* Smarty version 3.1.24, created on 2016-07-04 05:23:08
         compiled from "tpl/index.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:61985779d69c6537f4_74883177%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f0a20dd5b021ae5742e521c1e220e6b357fa15c8' => 
    array (
      0 => 'tpl/index.tpl',
      1 => 1467602563,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '61985779d69c6537f4_74883177',
  'has_nocache_code' => false,
  'version' => '3.1.24',
  'unifunc' => 'content_5779d69c67e788_49977089',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5779d69c67e788_49977089')) {
function content_5779d69c67e788_49977089 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '61985779d69c6537f4_74883177';
?>
<!doctype html>
<html>
<head></head>
<link href="style/basic.css" rel="stylesheet" type="text/css" >
<link href="style/index.css" rel="stylesheet" type="text/css" >
<body>
<div id="login_box" class="auto"  >
	<form>
		<input type="text" name="u_name" />
		<input type="password" name="u_password" />
		<input type="button" value="登录" onclick="pd_login()" >
	</form>
</div>


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