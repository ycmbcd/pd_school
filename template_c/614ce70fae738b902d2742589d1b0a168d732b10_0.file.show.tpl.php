<?php /* Smarty version 3.1.24, created on 2016-05-27 09:18:31
         compiled from "tpl/show.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:210065747f4c7d87434_24856305%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '614ce70fae738b902d2742589d1b0a168d732b10' => 
    array (
      0 => 'tpl/show.tpl',
      1 => 1464333352,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '210065747f4c7d87434_24856305',
  'has_nocache_code' => false,
  'version' => '3.1.24',
  'unifunc' => 'content_5747f4c7dcd942_85447318',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5747f4c7dcd942_85447318')) {
function content_5747f4c7dcd942_85447318 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '210065747f4c7d87434_24856305';
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
<div>
	<input type="button" id="bbb" onclick="bbb()" value="bbb" />
</div>
<div id="aaashow" ></div>
</body>
</html><?php }
}
?>