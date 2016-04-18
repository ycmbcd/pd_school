<html>
<head>
<title>销量统计（日本）</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/pages.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="/style/pages.css"/>
{literal}
<script>
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
					  html += '<tr class="mouse_hover"><td>'+json.ss_type+'</td><td style="width:100px;">'+json.t_code+'</td><td style="width:220px;">'+json.goods_code+'</td><td style="width:100px;">'+json.b_repo+'</td><td>'+json.b_1+'</td><td>'+json.b_10+'</td><td>'+json.b_30+'</td><td>'+json.send_jp+'</td><td>'+json.ch_to_jp+'</td><td>'+json.b_warning+'</td></tr>';
				})
				  html = '<tr class="title_bg"><td>分类</td><td>条形码</td><td>商品代码</td><td style=\"padding-right:10px;\">库存</td><td>昨日</td><td>10日内</td><td>30日内</td><td>采购在途</td><td>转运在途</td><td>阈值</td></tr>'+html;
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
</script>
{/literal}
<style>
.add_list input{
	width:200px;
	border:1px solid #A9A9A9;
	}
</style>
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
        <select class="input_key" name="cc_ss_type" id="cc_ss_type" onChange="change_page(1,$(this).val())" style="width:100px;">
       		<option value="0" >所有分类</option>
        	{foreach $role as $se}
            <option value="{$se.ss_type}">{$se.ss_type}</option>
            {/foreach}
		</select>
        </li>
        <li class="ml10"><div onClick="change_page(1,$('#cc_ss_type').val())" class="btn_gray">搜 索</div></li>
        <li><a href="japan_5.php?hi_call"><div class="btn_blue ml10">运 算</div></a></li>
        <div class="clear"></div>
    </ul>
</div>
<div class="all_num f_right">【合计】<span id="all_num">{$all_num}</span> 种</div>
<table class="s_table bg_table" id="page_data">
</table>

<div id="now_page">1</div>

<div class="page_bar"></div>
</div><!--/kuang-->

<div class="tips" style="margin-top:60px;">
【说明】阈值 = 库存 - 10日内 + 采购在途 + 转运在途<br>&nbsp;&nbsp;注：本统计只统计日本的出库情况。
<br>&nbsp;&nbsp;点击【运算】将计算从现在起到某一时刻的出库量。</div>
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
