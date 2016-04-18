<html>
<head>
<title>新品编入</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
{literal}
<script>
$("document").ready(function(){
	$("#add_code").blur(function(){
		check_addcode();
	})
})
$(document).keypress(function(e) {  
    // 回车键事件  
       if(e.which == 13) {  
   			add_goodstype(); 
       }  
});
//物料重复检测
function check_addcode(){
	var check_code = $('#add_code').val();
	$.ajax({
		type:"POST",
		url:"pro_1.php",
		beforeSend:function(){
			$(".juhua").show();
		},
		data:"check_code="+encodeURIComponent(check_code),
		success:function(data){
			if(data=="has"){
				$(".txt_msg").html("存在此【条形码】");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
				$("#add_code").focus();
				return false;
			}else{
				//没事儿
			}    
        }
	})
}
//物料管理-新品编入
function add_goodstype(){
	var ss_type = $("#ss_type").val();
	var add_code = $("#add_code").val();
	var goods_code = $("#goods_code").val();
	var goods_color = $("#goods_color").val();
	var goods_style = $("#goods_style").val();
	if(ss_type=="0"){
		$(".txt_msg").html("请选择分类！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
		$("#add_code").focus();
		return false;
	}else if (add_code=="" || goods_code==""){
		$(".txt_msg").html("请输入完整！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
		return false;
	}else{
		var add_goodstype = $(".add_listkey").serialize();
		$.ajax({
		type:"POST",
		url:"pro_1.php",
		beforeSend:function(){
			$(".juhua").show();
		},
		data: add_goodstype,
		success:function(data){
			if(data=="ok"){
				$(".juhua").hide();
				location.reload();
			}else if(data=="has"){
				$(".txt_msg").html("存在此【商品代码】");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
				$("#goods_code").focus();
				return false;
			}else{
				$(".txt_msg").html("新建失败！");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
				$(".juhua").hide();
			}    
        }
	})
	}
}
</script>
{/literal}
<style>
.add_list li{
	float:inherit;
	height:44px;
	width:370px;}
.add_list input{
	width:300px;
	}
.code{
	background:url(../images/code.png) no-repeat right;
	background-color:#FFF;}
</style>
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list">
	<ul>
    	<li><span class="title_list"></span>
        <select class="add_listkey" name="ss_type" id="ss_type" style="width:100px;">
        	<option value="0" >选择分类</option>
        	{foreach $role as $se}
            <option value="{$se.ss_type}">{$se.ss_type}</option>
            {/foreach}
		</select>
        </li>
    	<li><input class="add_listkey" placeholder="商品代码 ★" id="goods_code" type="text" name="goods_code" /></li>
    	<li><input class="add_listkey code" placeholder="条形码 ★" id="add_code" type="text" name="add_code" /></li>
        <li><div onClick="add_goodstype()" class="btn_green f_left">添 加</div></li>
        <div class="clear"></div>
    </ul>
</div>
<div class="tips">
【说明】扫入条形码和商品代码进行物料录入。<br/>
【重要】请不要录入英文的 ' 和 ; 。<br/>
&nbsp;&nbsp;两码必须都是唯一的且不为空。</div>
</body>
</html>
