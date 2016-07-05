<?php /* Smarty version 3.1.24, created on 2016-05-03 04:01:02
         compiled from "tpl/show.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:287465728065e6fb106_06556820%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd05c2dec51c60de06dea9f13d0a3d818b778807e' => 
    array (
      0 => 'tpl/show.tpl',
      1 => 1462240646,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '287465728065e6fb106_06556820',
  'has_nocache_code' => false,
  'version' => '3.1.24',
  'unifunc' => 'content_5728065e71e392_98502400',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5728065e71e392_98502400')) {
function content_5728065e71e392_98502400 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '287465728065e6fb106_06556820';
?>
<!doctype html>
<html>
<head></head>
<?php echo '<script'; ?>
 src="js/jquery.js" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="js/ajax.js"><?php echo '</script'; ?>
>
<body>
<div>
	<input type="button" id="aaa" onclick="aaa()" value="ok" />
</div>
<div id="aaashow" ></div>
</body>
</html><?php }
}
?>