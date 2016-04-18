<html>
<head>
<title>物料操作</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/pages.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="/style/pages.css"/>
{literal}
<script>
$(document).keypress(function(e) {  

    // 回车键事件  
       if(e.which == 13) {  
   			change_page(1,0); 
       }  
});
//分页
$(function(){
	var all_num = $("#all_num").html();
    $(".page_bar").pagination({
        items: all_num,
        itemsOnPage: 10,
        cssStyle: 'light-theme'
    });
});
function cut(all_num){
    $(".page_bar").pagination({
        items: all_num,
        itemsOnPage: 10,
        cssStyle: 'light-theme'
    });
}
//分页json
$("document").ready(function() {
	//默认第一页
	change_page(1,0);
	//空点消失
	$(".inner_box,.cancel").bind("click",function(){
		$(".inner_alert").stop(true,true).fadeOut(200);
		$(".inner_box").stop(true,true).fadeOut(200);
	})
});
function change_page(to_page,ss_type){
	$("#key_autosearch").hide();
	var to_page = to_page;
	$("#now_page").html(to_page);
	var search_code = $('#search_code').val();
	ss_type=encodeURIComponent(ss_type);
	search_code=encodeURIComponent(search_code);
	$.ajax({
			type:"GET",
			url:"search.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			data:"change_page="+ss_type+"&to_page="+to_page+"&search_code="+search_code,
			dataType:"json",
			success:function(data){
				$("#page_data").empty();
				var html = "";
				$.each(data,function(index,json){
					html += '<tr class="pointer mouse_hover" onclick="change_goods(\''+json.t_code+'\',\''+json.goods_code+'\',\''+json.ss_type+'\')\"><td>'+json.ss_type+'</td><td style="width:300px;">'+json.t_code+'</td><td style="width:300px;">'+json.goods_code+'</td><td class="tagr">'+json.a_repo+'</td><td class="tagr">'+json.b_repo+'</td></tr>';
				})
				html = '<tr class="title_bg"><td>分类</td><td>条形码</td><td>商品代码</td><td>中国仓库</td><td>日本仓库</td></tr>'+html;
				$("#page_data").html(html);
				$("#page_data tr:even").css('background','#dedede'); //表格变色
            },
			error: function(){
              //请求出错处理
                  alert("Error!");
            }
	})
	$.ajax({
		url:"search.php",
		type:"GET",
		data:"all_num&to_page="+to_page+"&search_code="+search_code+"&ss_type="+ss_type,
			success:function(data){
					$("#all_num").html(data);	//返回总数
					cut(data);
            }
	})
}

//修改商品类型
function change_goods(a,b,c){
	$(".inner_box").stop(true,true).fadeIn(100,function(){
		$(".inner_alert").stop(true,true).fadeIn(200);
		$("#c_code").val(a);
		$("#c_goods_code").val(b);
		$("#c_ss_type").val(c);
		$("#o_code").val(a);
	});
}
//智能搜索提示

function autosearch(){
	$("#key_autosearch").show();
	$("#key_autosearch").html("");
	var search_code = $('#search_code').val();
	search_code=encodeURIComponent(search_code);
	if(search_code==""){
		return false;
	}
	$.ajax({
		url:"search.php",
		type:"GET",
		data:"autosearch&search_code="+search_code,
		dataType:"json",
		success:function(data){
			var ycmbcd="";
			$.each(data,function(index,json){
				//alert(json.goods_code.length())
				ycmbcd+='<li class="can_use" onclick="send_key(\''+json.goods_code+'\')">'+json.goods_code+'</li>';
			})
			$("#key_autosearch").html(ycmbcd);
		}
	})	
}
function send_key(e){
	$('#search_code').val(e);
	change_page(1,$("#cc_ss_type").val());
	$("#key_autosearch").hide();
}
function show_confirm(){
	var r=confirm("【警告】 删除后库存将摧毁 !");
	if (r==true){
		del_goodstype();
	}else{
	}
}
//弹框修改商品类型
function inner_change_goods(){
	var now_page = $('#now_page').html();
	var o_code = $('#o_code').val();
	var c_code = $('#c_code').val();
	var c_goods_code = $('#c_goods_code').val();
	var c_ss_type = $('#c_ss_type').val();
	if(c_code=="" || c_goods_code==""){
		alert("请输入完整！");
		return false;
	}else{
		$.ajax({
			type:"GET",
			url:"pro_2.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			data:"o_code="+encodeURIComponent(o_code)+"&c_code="+encodeURIComponent(c_code)+"&c_goods_code="+encodeURIComponent(c_goods_code)+"&c_ss_type="+encodeURIComponent(c_ss_type),
			success:function(data){
				if(data=="ok"){
					change_page(now_page,$("#cc_ss_type").val());
					$(".inner_alert").stop(true,true).fadeOut(200);
					$(".inner_box").stop(true,true).fadeOut(200);
				}else{
					$(".txt_msg").html("已存在！");
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
					$(".juhua").hide();
				}    
	        }
		})
	}
}
</script>
{/literal}
</head>
<body>
<div class="kuang">
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list">
<div id="key_autosearch" style="left:14px;"></div>
	<ul>
        <li><input class="add_listkey autosearch ml10" placeholder="商品代码" onKeyUp="autosearch()" id="search_code" type="text" /></li>
        <li class="ml10">
        <select class="input_key autotype" name="cc_ss_type" id="cc_ss_type" onChange="change_page(1,$(this).val())">
       		<option value="0" >所有分类</option>
        	{foreach $role as $se}
            <option value="{$se.ss_type}">{$se.ss_type}</option>
            {/foreach}
		</select>
        </li>
        <li class="ml10"><div onClick="change_page(1,$('#cc_ss_type').val())" class="btn_gray">搜 索</div></li>
        <div class="clear"></div>
    </ul>
</div>
<div class="all_num f_right">【合计】<span id="all_num">{$all_num}</span> 种</div>
<table class="s_table bg_table" id="page_data">
</table>

<div id="now_page">1</div>

<div class="page_bar"></div>
</div><!--/kuang-->
<div class="inner_box"></div>
<div class="inner_alert" style="height:268px;">
<div class="inner_close cancel"></div>
	<ul class="ul_list">
    <input type="hidden" id="o_code" name="o_code" value="" />
    	<li>条形码 <input class="input_key" id="c_code" type="text" value="" name="c_code" /></li>
        <li>商品代码 <input class="input_key" id="c_goods_code" type="text" value="" name="c_goods_code" /></li>
        <li>分 类 
        <select class="input_key" name="c_ss_type" id="c_ss_type" style="width:200px;">
        	{foreach $role as $se}
            <option value="{$se.ss_type}">{$se.ss_type}</option>
            {/foreach}
		</select>
        </li>
    </ul>
    <div class="clear"></div>
    <div class="ok_bar" style="margin-top:30px;">
        <div class="btn_green f_left border_green" onClick="inner_change_goods()">确 定</div>
        <div class="btn_red f_left border_red" onClick="show_confirm()" style="margin-left:17px;">删 除</div>
        <div class="btn_blue f_right cancel border_blue">取 消</div>
    </div>
</div>
<div class="tips" style="margin-top:60px;">
【说明】输入部分商品代码进行智能搜索；<br>&nbsp;
点击编码进行该商品属性的修改和删除操作。<br>&nbsp;
注意：删除商品物料后其库存将一并摧毁。</div>
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
</body>
</html>
