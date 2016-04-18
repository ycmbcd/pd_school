<html>
<head>
<title>工号操作</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
<script>
$("document").ready(function(){
	//赋值
	$(".key_group").each(function(){
		var key = $(this).val();
		$(this).prev(".user_group").val(key);
	})
})
//删除警告
function del_num(i_num){
	$(".delete_user").attr("href","sys_2.php?del="+i_num);
	$("#warning_text").html("是否删除【"+i_num+"】号员工");
}
</script>
</head>
<body>
<div class="kuang">
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_user">
	<ul>
    	<li>工号： <input class="add_listkey" style="background:#EEEEEE; border:1px solid #A9A9A9;" type="text" readonly value="{$new_num}" name="add_num" /></li>
        <li class="ml10">姓名： <input class="add_listkey" type="text" value="" name="u_name" /></li>
        <li class="ml10">密码： <input class="add_listkey" type="text" value="123456" name="u_pwd" /></li>
        <li class="ml10">工种：  
        <select class="add_listkey user_group" name="u_group" style="width:100px;">
        	{foreach $role as $se}
            <option value="{$se.u_group}">{$se.u_group}</option>
            {/foreach}
		</select>
        </li>
        <li class="ml10"><div id="add_user_ok" onClick="add_user()" class="btn_green">添 加</div></li>
        <div class="clear"></div>
    </ul>
</div>
<div class="user_list">
	<table class="s_table">
    	<tr>
        	<td>工 号</td>
            <td>姓 名</td>
            <td>密 码</td>
            <td>工 种</td>
            <td>修 改</td>
            <td>删 除</td>
        </tr>
    {foreach $resu as $se}
    	<tr id="change_{$se.u_num}">
        	<td><input readonly class="change_userkey readonly" value="{$se.u_num}" name="change_num" /></td>
            <td><input class="change_userkey" value="{$se.u_name}" name="u_name" /></td>
            <td><input type="password" class="change_userkey" value="{$se.u_pwd}" name="u_pwd" /></td>
            <td>
            <select class="change_userkey user_group" name="u_group" style="width:100px;">
            		<option value="">-</option>
            	{foreach $role as $see}
            		<option value="{$see.u_group}">{$see.u_group}</option>
            	{/foreach}
			</select>
            <input type="hidden" class="key_group" value="{$se.u_group}" />
            </td>
            <td><div class="btn_blue" onClick="change_user('{$se.u_num}')">修 改</div></td>
            <td><div class="btn_red is_del" onClick="del_num('{$se.u_num}')">删 除</div></td>
        </tr>
    {/foreach}
    </table>
</div>
</div>
<!--删除弹窗-->
<div id="warning_box">
    <div id="warning_text"></div>
    <div>
        <a class="delete_user" href="#"><div id="yes_del" class="btn_red">确 定</div></a>
        <div id="no_del" class="btn_blue">取 消</div>
        <div class="clear"></div>
    </div>
</div>
<div id="shade"></div>
<!--/删除弹窗-->
<div class="tips">【说明】<br />
&nbsp;&nbsp;此页面只有管理员以上级别可以更改；<br />
&nbsp;&nbsp;请到《自定义工种》添加工种；<br />
&nbsp;&nbsp;密码要求大于等于6位，否则无法登录。
</div>

</body>
</html>