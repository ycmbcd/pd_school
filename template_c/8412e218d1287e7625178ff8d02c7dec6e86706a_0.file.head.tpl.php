<?php /* Smarty version 3.1.24, created on 2016-03-23 03:31:10
         compiled from "tpl/head.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:1875156f1ffee80bc47_11168145%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8412e218d1287e7625178ff8d02c7dec6e86706a' => 
    array (
      0 => 'tpl/head.tpl',
      1 => 1455809684,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1875156f1ffee80bc47_11168145',
  'variables' => 
  array (
    'sitename' => 0,
    'u_name' => 0,
    'u_num' => 0,
    'u_group' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.24',
  'unifunc' => 'content_56f1ffee81f4d0_43607331',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_56f1ffee81f4d0_43607331')) {
function content_56f1ffee81f4d0_43607331 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '1875156f1ffee80bc47_11168145';
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf8" />
<title><?php echo $_smarty_tpl->tpl_vars['sitename']->value;?>
</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<?php echo '<script'; ?>
 type="text/javascript" src="/js/jquery.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 type="text/javascript" src="/js/js.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
>
$(document).ready(function(){
	//随机换壁纸
	var snum = parseInt(3*Math.random());
	snum = snum-0;
	surl = "url('/images/bg"+snum+".jpg') no-repeat center center fixed"
	$("body").css("background",surl);
})
<?php echo '</script'; ?>
>
</head>
<body>
<div class="toper">
	<div class="w1300 auto">
        <div class="toper_left f_left">
        	<img src="/images/anto.jpg" />
        </div>
        <div class="f_left toper_title">ANTO RESPOSITORY SYSTEM <span style="font-size:14px;">（v1.0 | Alpha10.9）</span></div>
        <div class="toper_right f_right">
        	<div class="f_left">
                <div class="toper_name"><img style="margin-bottom:-3px;margin-right:6px;" src="/images/login_user.png" /><?php echo $_smarty_tpl->tpl_vars['u_name']->value;?>
</div>
            </div>
            <div class="f_left">
                <div class="toper_name"><img style="margin-bottom:-3px;margin-right:6px;" src="/images/login_num.png" /><?php echo $_smarty_tpl->tpl_vars['u_num']->value;?>
</div>
            </div>
            <div class="f_left">
                <div class="toper_name"><img style="margin-bottom:-3px;margin-right:6px;" src="/images/login_group.png" /><?php echo $_smarty_tpl->tpl_vars['u_group']->value;?>
</div>
            </div>
            <div class="f_left">
                <a href="show.php?logout"><div class="toper_out"></div></a>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="msg msg_fix">
	<div class="txt_msg"></div>
</div>
<div class="juhua"></div><?php }
}
?>