<html>
<head>
<title>自定义工种</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
<script>
//删除警告
function del_role(e){
	$(".delete_group").attr("href","sys_3.php?del="+e);
	$("#warning_text").html("是否删除工种：【"+e+"】");
}
</script>
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list">

	<ul>
    	<li>工种： <input class="add_listkey" type="text" name="new_group" id="new_group" /></li>
        <li class="ml10"><div id="add_user_ok" onClick="new_group()" class="btn_green">添 加</div></li>
        <div class="clear"></div>
    </ul>
</div>
<div class="user_list">
	<table class="s_table">
    	<tr>
        	<td>工 种</td>
            <td>删 除</td>
        </tr>
    {foreach $role as $se}
    	<tr id="change_{$se.u_group}">
        	<td><input readonly class="user_group readonly" value="{$se.u_group}" name="change_group" /></td>
            <td><div class="btn_red is_del" onClick="del_role('{$se.u_group}')">删 除</div></td>
        </tr>
    {/foreach}
    </table>
</div>
<!---弹窗---->
<div id="warning_box">
    <div id="warning_text"></div>
    <div>
        <a class="delete_group" href="#"><div id="yes_del" class="btn_red">确 定</div></a>
        <div id="no_del" class="btn_blue">取 消</div>
        <div class="clear"></div>
    </div>
</div>
<div id="shade"></div>
<!---/弹窗---->
<div class="tips">【说明】<br />
&nbsp;&nbsp;请到《工种授权》分配工种权限。<br />

</div>
</body>
</html>