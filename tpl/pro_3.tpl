<html>
<head>
<title>自定义分类</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
<script>
{literal}
//添加自定义分类
function new_type(){
	var new_type = $("#new_type").val();
	$.ajax({
		type:"POST",
		url:"pro_3.php",
		beforeSend:function(){
			$(".juhua").show();
		},
		data: "new_type="+encodeURIComponent(new_type),
		success:function(data){
			if(data=="ok"){
				$(".juhua").hide();
				$(".txt_msg").html("成功新建一个分类！");
				$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200,function(){
					location.reload();
				});
			}else{
				$(".txt_msg").html("新建失败！");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				$(".juhua").hide();
			}    
        }
	})
}
//删除警告
function del_ss_type(e){
	$(".delete_type").attr("href","pro_3.php?del="+e);
	$("#warning_text").html("确定删除分类："+e);
}
</script>
{/literal}
<style type="text/css">
.is_del {
  height: 20px !important;
  line-height: 20px;
  width: 60px !important;
  font-size: 14px;
  margin-top: 1px;
  border-radius: 20px;
}
</style>
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list">
	<ul>
    	<li><input placeholder="新建分类 ★" class="add_listkey" type="text" id="new_type" /></li>
        <li class="ml10"><div id="add_user_ok" onClick="new_type()" class="btn_green">添 加</div></li>
        <div class="clear"></div>
    </ul>
</div>
<div class="add_list">
	<table class="s_table">
    	<tr>
        	<td>分 类</td>
            <td>删 除</td>
        </tr>
    {foreach $role as $se}
    	<tr id="change_{$se.ss_type}">
        	<td><input readonly class="readonly" value="{$se.ss_type}" name="ss_type" /></td>
            <td><div class="btn_red is_del" onClick="del_ss_type('{$se.ss_type}')">删 除</div></td>
        </tr>
    {/foreach}
    </table>
</div>
<!--弹窗-->
<div id="warning_box">
    <div id="warning_text"></div>
    <div>
        <a class="delete_type" href="#"><div id="yes_del" class="btn_red border_red">确 定</div></a>
        <div id="no_del" class="btn_blue border_blue">取 消</div>
        <div class="clear"></div>
    </div>
</div>
<div id="shade"></div>
<!--/弹窗-->
<div class="tips">【说明】<br />
&nbsp;&nbsp;删除工种会影响到物料的分类。<br />
&nbsp;&nbsp;误删后添加上即可。

</div>
</body>
</html>