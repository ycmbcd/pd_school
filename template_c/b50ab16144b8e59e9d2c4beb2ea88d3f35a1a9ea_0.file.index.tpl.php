<?php /* Smarty version 3.1.24, created on 2016-03-23 03:32:34
         compiled from "F:/wamp/www/school/tpl/index.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:470756f20042280f49_13671265%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b50ab16144b8e59e9d2c4beb2ea88d3f35a1a9ea' => 
    array (
      0 => 'F:/wamp/www/school/tpl/index.tpl',
      1 => 1455809684,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '470756f20042280f49_13671265',
  'has_nocache_code' => false,
  'version' => '3.1.24',
  'unifunc' => 'content_56f200422c35d7_79743248',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_56f200422c35d7_79743248')) {
function content_56f200422c35d7_79743248 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '470756f20042280f49_13671265';
echo $_smarty_tpl->getSubTemplate ("head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('sitename'=>"ANTO-Repo"), 0);
?>

<?php echo '<script'; ?>
 type="text/javascript">
//天气模块
    $(document).ready(function(){
        $(".toper_right").html("<iframe allowtransparency='true' frameborder='0' width='565' height='98' scrolling='no' src='http://tianqi.2345.com/plugin/widget/index.htm?s=2&z=3&t=1&v=0&d=3&bd=0&k=&f=&q=1&e=1&a=1&c=54511&w=565&h=98&align=center'></iframe>");
    })
	$(document).keypress(function(e) {  
    // 回车键事件  
       if(e.which == 13) {  
   			check_login(); 
       }  
	}); 

<?php echo '</script'; ?>
>

<div style="border:2px solid #666;"></div>
<div class="auto login_box">
    <table>
        <tr>
            <td class="login_txt">
                <img src="/images/login_user.png" />   
            </td>
            <td><input autofocus="autofocus" tabindex="1" class="login_input" type="text" id="u_num" name="u_num" /></td>
            <td rowspan="3" align="center"><input tabindex="-1" class="login_btn" type="button"  onclick="check_login()" value="" /></td>
        </tr>
        <tr style="height:10px;"></tr>
        <tr>
            <td class="login_txt">
                <img src="/images/login_pwd.png" />
            </td>
            <td><input class="login_input" tabindex="2" type="password" id="u_pwd" name="u_pwd" /></td>
        </tr>
        <tr style="height:20px;"></tr>
    </table>
</div>
<?php echo $_smarty_tpl->getSubTemplate ("foot.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0);

}
}
?>