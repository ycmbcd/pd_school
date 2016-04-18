<html>
<head>
<title>权限分配</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
{literal}
<script>
//删除警告
function del_role(e){
	$(".delete_group").attr("href","sys_3.php?del="+e);
	$("#warning_text").html("是否删除工种：【"+e+"】");
}
//全选、多选框
$("document").ready(function(){
	$(".check_type").each(function(){
		$(this).click(function(){
			var ss = $(this).attr('name');
			var status=$(this).attr("checked");
			if(status=="checked"){
				$(this).parent().parent().find(".xxx").css({"background":"url(/images/close_1.png)"});
				$(this).addClass("check_me");
				$("."+ss).attr("checked","true");
				$("."+ss).next().css({"background":"url(/images/close_1.png)"})
				$("."+ss).addClass("check_me");
			}else{
				$(this).parent().parent().find(".xxx").css({"background":"#eee"})
				$(this).removeClass("check_me");
				$("."+ss).removeAttr("checked");
				$("."+ss).next().css({"background":"#eee"})
				$("."+ss).removeClass("check_me");
			}
		})
	})
	$(".c_box").each(function(){
		$(this).click(function(){
			var status=$(this).attr("checked");
			if(status=="checked"){
				$(this).addClass("check_me");
				$(this).next().css({"background":"url(/images/close_1.png)"});
			}else{
				$(this).removeClass("check_me");
				$(this).next().css({"background":"#eee"});
			}
		})
	})
})

//提交权限
function cannot(){
	var y_key=[];
	var user_type=$("#user_type").val();
	if(user_type=="0"){
		$(".txt_msg").html("请选择工种！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
		return false;
	}else{
		$(".check_me").each(function(){
			y_key.push($(this).val());
		})
		$.ajax({
			url:"sys_4.php",
			type:"GET",
			data:"cannot="+y_key+"&user_type="+user_type,
			success:function(data){
				if(data=="ok"){
					$(".txt_msg").html("权限分配成功！");
					$(".msg").css({"width":"400px","margin-left":"-200px","background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				}
			}
		})	
	}
}
//获取权限值
function get_cantdo(){
	var user_type=$("#user_type").val();
	$(".cantdo input").parent().parent().find(".xxx").css({"background":"#eee"});
	$(".cantdo input").removeClass("check_me");
	$(".cantdo input").next().css({"background":"#eee"});
	$(".cantdo input").removeAttr("checked");
	$.ajax({
		url:"sys_4.php",
		type:"GET",
		data:"get_cantdo="+user_type,
		dataType:"json",
		success:function(data){
			var str=new String();
			var arr=new Array();
			str = data[0].cantdo;
			arr=str.split(',');
			for(var i=0;i<arr.length;i++)
			{
				var ss = arr[i];
				$("#"+ss).parent().parent().find(".xxx").css({"background":"url(/images/close_1.png)"});
				$("#"+ss).addClass("check_me");
				$("#"+ss).attr("checked","true");
				$("#"+ss).next().css({"background":"url(/images/close_1.png)"});
			}
		}
	})
}
</script>
<style>
.user_list li{
	width: 170px;
	height:30px;
	font-size:16px;
	color:#000;
	line-height:30px;}
.t_use{
	font-size:20px !important;
	color:#3389d4 !important
}
.bgbox{
	float: left;
	height: 15px;
	width: 15px;
	margin-top: 7px;
	border: 1px solid #939393;
}
.cantdo input{
	display: none;
}
</style>
{/literal}
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list">

	<ul>
    	<li class="ml10">选择工种： 
        <select id="user_type" onChange="get_cantdo()" class="add_userkey user_group" name="u_group" style="width:100px;">
        	<option value="0">请选择...</option> 
        	{foreach $role as $se}
            <option value="{$se.u_group}">{$se.u_group}</option>
            {/foreach}
		</select>
        </li>
        <div class="clear"></div>
    </ul>
</div>
<div class="user_list f_left cantdo">
	<label><div class="xxx bgbox"></div><li class="t_use"><input type="checkbox" class="check_type" name="check_2" id="btn_7" value="btn_7" />&nbsp;物料管理</li></label>
	<label><li><input type="checkbox" class="check_2 c_box" id="pro_1" value="pro_1" /><div class="bgbox"></div>&nbsp;新品编入</li></label>
    <label><li><input type="checkbox" class="check_2 c_box" id="pro_2" value="pro_2" /><div class="bgbox"></div>&nbsp;物料操作</li></label>  
    <label><li><input type="checkbox" class="check_2 c_box" id="pro_3" value="pro_3" /><div class="bgbox"></div>&nbsp;自定义分类</li></label>  
</div>
<div class="user_list f_left cantdo">
	<label><div class="xxx bgbox"></div><li class="t_use"><input type="checkbox" class="check_type" name="check_4" id="btn_1" value="btn_1" />&nbsp;采购入仓</li></label>
	<label><li><input type="checkbox" class="check_4 c_box" id="add_1" value="add_1" /><div class="bgbox"></div>&nbsp;商品采购（中国）</li></label>
	<label><li><input type="checkbox" class="check_4 c_box" id="add_1_1" value="add_1_1" /><div class="bgbox"></div>&nbsp;导入采购单（中国）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_2" value="add_2" /><div class="bgbox"></div>&nbsp;采购审核（中国）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_2_1" value="add_2_1" /><div class="bgbox"></div>&nbsp;采购清单（中国）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_2_2" value="add_2_2" /><div class="bgbox"></div>&nbsp;即将发货（中国）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_3" value="add_3" /><div class="bgbox"></div>&nbsp;采购入库（中国）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_4" value="add_4" /><div class="bgbox"></div>&nbsp;商品采购（日本）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_4_1" value="add_4_1" /><div class="bgbox"></div>&nbsp;导入采购单（日本）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_5" value="add_5" /><div class="bgbox"></div>&nbsp;采购审核（日本）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_6_1" value="add_6_1" /><div class="bgbox"></div>&nbsp;采购清单（日本）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_6_2" value="add_6_2" /><div class="bgbox"></div>&nbsp;即将发货（日本）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_7" value="add_7" /><div class="bgbox"></div>&nbsp;采购入库（日本）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_8" value="add_8" /><div class="bgbox"></div>&nbsp;采购日志（中国）</li></label>
    <label><li><input type="checkbox" class="check_4 c_box" id="add_9" value="add_9" /><div class="bgbox"></div>&nbsp;采购日志（日本）</li></label>
</div>
<div class="user_list f_left cantdo">
	<label><div class="xxx bgbox"></div><li class="t_use"><input type="checkbox" class="check_type" name="check_3" id="btn_2" value="btn_2" />&nbsp;中国仓库</li></label>
	<label><li><input type="checkbox" class="check_3 c_box" id="china_1" value="china_1" /><div class="bgbox"></div>&nbsp;库存操作（中国）</li></label>
	<label><li><input type="checkbox" class="check_3 c_box" id="china_2" value="china_2" /><div class="bgbox"></div>&nbsp;转运日本（中国）</li></label>
	<label><li><input type="checkbox" class="check_3 c_box" id="china_5" value="china_5" /><div class="bgbox"></div>&nbsp;批量转运（中国）</li></label>
	<label><li><input type="checkbox" class="check_3 c_box" id="china_2_1" value="china_2_1" /><div class="bgbox"></div>&nbsp;转运审核（中国）</li></label>
	<label><li><input type="checkbox" class="check_3 c_box" id="china_2_2" value="china_2_2" /><div class="bgbox"></div>&nbsp;打印（中国）</li></label>
	<label><li><input type="checkbox" class="check_3 c_box" id="china_3" value="china_3" /><div class="bgbox"></div>&nbsp;转运在途（中国）</li></label>   
    <label><li><input type="checkbox" class="check_3 c_box" id="china_4" value="china_4" /><div class="bgbox"></div>&nbsp;库存告急（中国）</li></label>  
</div>
<div class="user_list f_left cantdo">
	<label><div class="xxx bgbox"></div><li class="t_use"><input type="checkbox" class="check_type" name="check_5" id="btn_3" value="btn_3" />&nbsp;日本仓库</li></label>
	<label><li><input type="checkbox" class="check_5 c_box" id="japan_1" value="japan_1" /><div class="bgbox"></div>&nbsp;运送在途（日本）</li></label>
	<label><li><input type="checkbox" class="check_5 c_box" id="japan_1_1" value="japan_1_1" /><div class="bgbox"></div>&nbsp;扫码收货（日本）</li></label>
	<label><li><input type="checkbox" class="check_5 c_box" id="japan_2" value="japan_2" /><div class="bgbox"></div>&nbsp;转运入库（日本）</li></label>
	<label><li><input type="checkbox" class="check_5 c_box" id="japan_3" value="japan_3" /><div class="bgbox"></div>&nbsp;库存操作（日本）</li></label>  
    <label><li><input type="checkbox" class="check_5 c_box" id="japan_4" value="japan_4" /><div class="bgbox"></div>&nbsp;库存告急（日本）</li></label>   
    <label><li><input type="checkbox" class="check_5 c_box" id="japan_5" value="japan_5" /><div class="bgbox"></div>&nbsp;销量统计（日本）</li></label>   
</div>
<div class="user_list f_left cantdo">
	<label><div class="xxx bgbox"></div><li class="t_use"><input type="checkbox" class="check_type" name="check_6" id="btn_4" value="btn_4" />&nbsp;发货</li></label>
	<label><li><input type="checkbox" class="check_6 c_box" id="send_1" value="send_1" /><div class="bgbox"></div>&nbsp;中国发货</li></label>
	<label><li><input type="checkbox" class="check_6 c_box" id="send_2" value="send_2" /><div class="bgbox"></div>&nbsp;日本发货</li></label>   
	<label><li><input type="checkbox" class="check_6 c_box" id="send_3" value="send_3" /><div class="bgbox"></div>&nbsp;中国发货日志</li></label>
	<label><li><input type="checkbox" class="check_6 c_box" id="send_4" value="send_4" /><div class="bgbox"></div>&nbsp;日本发货日志</li></label>  
	<label><li><input type="checkbox" class="check_6 c_box" id="send_5" value="send_5" /><div class="bgbox"></div>&nbsp;发货模板</li></label>  
	<label><li><input type="checkbox" class="check_6 c_box" id="send_6" value="send_6" /><div class="bgbox"></div>&nbsp;中国退单</li></label>  
	<label><li><input type="checkbox" class="check_6 c_box" id="send_7" value="send_7" /><div class="bgbox"></div>&nbsp;日本退单</li></label>  
	<label><li><input type="checkbox" class="check_6 c_box" id="send_8" value="send_8" /><div class="bgbox"></div>&nbsp;佐川MAIL便</li></label>  
	<label><li><input type="checkbox" class="check_6 c_box" id="send_9" value="send_9" /><div class="bgbox"></div>&nbsp;佐川宅配便</li></label>  
</div>
<div class="clear"></div>
<div class="user_list f_left cantdo">
	<label><div class="xxx bgbox"></div><li class="t_use"><input type="checkbox" class="check_type" name="check_7" id="btn_5" value="btn_5" />&nbsp;统计报表</li></label>
	<label><li><input type="checkbox" class="check_7 c_box" id="table_1" value="table_1" /><div class="bgbox"></div>&nbsp;库存报表</li></label>
	<label><li><input type="checkbox" class="check_7 c_box" id="table_2" value="table_2" /><div class="bgbox"></div>&nbsp;入库统计（中国）</li></label>
	<label><li><input type="checkbox" class="check_7 c_box" id="table_2_1" value="table_2_1" /><div class="bgbox"></div>&nbsp;入库统计（日本）</li></label>
	<label><li><input type="checkbox" class="check_7 c_box" id="table_3_1" value="table_3_1" /><div class="bgbox"></div>&nbsp;出库统计（中国）</li></label>
	<label><li><input type="checkbox" class="check_7 c_box" id="table_3" value="table_3" /><div class="bgbox"></div>&nbsp;出库统计（日本）</li></label>
	<label><li><input type="checkbox" class="check_7 c_box" id="table_4" value="table_4" /><div class="bgbox"></div>&nbsp;入库明细（中国）</li></label>
	<label><li><input type="checkbox" class="check_7 c_box" id="table_4_1" value="table_4_1" /><div class="bgbox"></div>&nbsp;入库明细（日本）</li></label>
	<label><li><input type="checkbox" class="check_7 c_box" id="table_5" value="table_5" /><div class="bgbox"></div>&nbsp;出库日结（中国）</li></label>
	<label><li><input type="checkbox" class="check_7 c_box" id="table_5_1" value="table_5_1" /><div class="bgbox"></div>&nbsp;出库日结（日本）</li></label>
	<label><li><input type="checkbox" class="check_7 c_box" id="table_6" value="table_6" /><div class="bgbox"></div>&nbsp;出库图表（中国）</li></label>
	<label><li><input type="checkbox" class="check_7 c_box" id="table_7" value="table_7" /><div class="bgbox"></div>&nbsp;出库图表（日本）</li></label>   
	<label><li><input type="checkbox" class="check_7 c_box" id="table_8" value="table_8" /><div class="bgbox"></div>&nbsp;退单统计（中国）</li></label>   
	<label><li><input type="checkbox" class="check_7 c_box" id="table_9" value="table_9" /><div class="bgbox"></div>&nbsp;退单统计（日本）</li></label>   
</div>
<div class="user_list f_left cantdo">
	<label><div class="xxx bgbox"></div><li class="t_use"><input type="checkbox" class="check_type" name="check_1" id="btn_6" value="btn_6" />&nbsp;系统设置</li></label>
	<label><li><input type="checkbox" class="check_1 c_box" id="sys_1" value="sys_1" /><div class="bgbox"></div>&nbsp;密码修改</li></label>
    <label><li><input type="checkbox" class="check_1 c_box" id="sys_2" value="sys_2" /><div class="bgbox"></div>&nbsp;工号操作</li></label>
    <label><li><input type="checkbox" class="check_1 c_box" id="sys_3" value="sys_3" /><div class="bgbox"></div>&nbsp;自定义工种</li></label>
    <label><li><input type="checkbox" class="check_1 c_box" id="sys_4" value="sys_4" /><div class="bgbox"></div>&nbsp;权限分配</li></label>
    <label><li><input type="checkbox" class="check_1 c_box" id="sys_5" value="sys_5" /><div class="bgbox"></div>&nbsp;系统日志</li></label>
</div>
<div class="clear"></div>
<div class="ok_bar">
	<div class="btn_yes auto" onClick="cannot()">确 定</div>
</div>
<div class="tips">【说明】<br />
&nbsp;&nbsp;勾选代表不能访问该栏目。<br />

</div>
</body>
</html>