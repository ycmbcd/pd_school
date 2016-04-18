<!-- <html>
<head>
<title>【页面取消】转运日本（中国）</title>
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
					html += '<tr class="mouse_hover" onclick="change_goods(\''+json.t_code+'\',\''+json.goods_code+'\',\''+json.a_repo+'\')\"><td><input type="checkbox" class="checkbox in_repo" name="goods_id" value="'+json.id+'" /></td><td>'+json.ss_type+'</td><td><input name="goods_code" readonly type="text" class="to_japan readonly_btn" value="'+json.goods_code+'" style="width:200px;" /></td><td><input name="a_repo" readonly class="a_repo to_japan readonly_btn" type="text" value="'+json.a_repo+'" /></td><td class="send_num" style="width:100px;"><input class=\"arrow_down\" type=\"button\" value=\"-\" /><input class=\"text_num_input to_japan\" type=\"text\" name=\"send_num\" value=\"0\" /><input class=\"arrow_up\" type=\"button\" value=\"+\" /></td><td style="width:40px;"><input type="text" readonly  class="send_day readonly_btn to_japan" name="send_day" value="" /></td></tr>';
				})
				  html = '<tr class="title_bg"><td><input id="check_all" type="checkbox" class="checkall" value="" /></td><td>分类</td><td>商品代码</td><td>库存</td><td>转运数</td><td>转运日期</td></tr>'+html;
				$("#page_data").html(html);
				all_sss();
				//赋日期
	var myDate = new Date();
	var today = myDate.toLocaleDateString().replace("/","-");
	today = today.replace("/","-");
	$(".send_day").val(today);
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
//计算加载
function all_sss(){
	//全选、多选框
	$("#check_all").click(function(){
		var status=$(this).attr("checked");
		if(status=="checked"){
			$(".checkbox").attr("checked","true");
			$(".checkbox").addClass("check_me");
			$(".checkbox").closest("tr").addClass("ul_repo");
		}else{
			$(".checkbox").removeAttr("checked");
			$(".checkbox").removeClass("check_me");
			$(".checkbox").closest("tr").removeClass("ul_repo");
		}
	})
	$(".checkbox").click(function(){
		var status=$(this).attr("checked");
		if(status=="checked"){
			$(this).addClass("check_me");
			$(this).closest("tr").addClass("ul_repo");
		}else{ 
			$(this).removeClass("check_me");
			$(this).closest("tr").removeClass("ul_repo");
		}
		var num=$(".checkbox").length;
		var s_num=$(".checkbox:checked").length;
		if(num==s_num){
			$("#check_all").attr("checked","true");
		}else{
			$("#check_all").removeAttr("checked");
		}
	})
	//转运-
	$(".send_num .arrow_down").each(function(i){
		$(this).click(function(){
			var key = $(".text_num_input").eq(i).val();
			key=key-0;
			if(key>0){
				key=key-1;
				$(".send_num .text_num_input").eq(i).val(key);
			}else{
				$(".send_num .text_num_input").eq(i).val(0);
			}
		})
	})
	//转运+
	$(".send_num .arrow_up").each(function(i){
		$(this).click(function(){
			var key = $(".text_num_input").eq(i).val();
			key=key-0
			var	a_repo= $(".a_repo").eq(i).val();
			a_repo=a_repo-0;
			if(key<a_repo){
				key=key+1;
				$(".send_num .text_num_input").eq(i).val(key);
			}else{
				key=a_repo
				$(".send_num .text_num_input").eq(i).val(key);
			}
		})
	})
	//转运失去焦点
	$(".send_num .text_num_input").each(function(i){
		$(this).focus(function(){
			var key=$(this).val("");
		})
		$(this).blur(function(){
			var key=$(this).val();
			var isnan=isNaN(key);
			if(key<0){
				$(".txt_msg").html("不能是负数！");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				$(this).val(0);
				return false;
			}
			if(isnan==true){
				$(".txt_msg").html("请输入数字！");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				$(this).val(0);
				return false;
			}
			var	a_repo= $(".a_repo").eq(i).val();
			a_repo=a_repo-0;
			if(key>a_repo){
				$(".txt_msg").html("数值溢出！");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				$(this).val(0);
				$(".rel_num").find("input").eq(i).val(0);
				$(".back_goods .text_num_input").eq(i).val(0);
			}
			if(key==""){
				$(this).val(0);
			}
		})
	})
}
//修改商品类型
function change_goods(a,b,c){
	$(".inner_box").stop(true,true).fadeIn(100,function(){
		$(".inner_alert").stop(true,true).fadeIn(200);
		$("#c_code").val(a);
		$("#c_goods_code").val(b);
		$("#c_a_repo").val(c);
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
//转运
function to_japan(){
	var send_num = $(".check_me").length;
	if(send_num=="0"){
		$(".txt_msg").html("请勾选订单！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
		return false;
	}else{	
		$(".ul_repo").each(function(i) {
			var s_num = $(".ul_repo").eq(i).find(".text_num_input").val();
			if(s_num=="0"){
				alert("【警告】勾选错误，部分可能转运！")
				//location.reload();
				return false;
			}else{
				var to_japan = $(this).find(".to_japan").serialize();
				$.ajax({
					type:"POST",
					contentType:"application/x-www-form-urlencoded;charset=utf-8",
					url:"china_2.php",
					beforeSend:function(){
					$(".juhua").show();
					},
					data: "toto_japan=ok&"+to_japan,
					success:function(data){
						//alert(data)
						if(data=="ok"){
								location.reload(); 
						}else{

							alert("【见谅】系统计算错误，请手动检查转运数目及中国库存！");
						}
						
					} 
				})
			}
		});
	}
}
</script>
{/literal}
<style>
.add_list input{
	width:200px;
	border:1px solid #a9a9a9;
	}
</style>
</head>
<body>
<div class="kuang">
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list">
<div id="key_autosearch" style="left:83px;"></div>
	<ul>
        <li>商品代码 <input class="add_listkey autosearch ml10" placeholder="智能匹配" onKeyUp="autosearch()" id="search_code" type="text" /></li>
        <li class="ml10">分 类 
        <select class="input_key ml10" name="cc_ss_type" id="cc_ss_type" onChange="change_page(1,$(this).val())" style="width:200px;">
       		<option value="0" >所有分类</option>
        	{foreach $role as $se}
            <option value="{$se.ss_type}">{$se.ss_type}</option>
            {/foreach}
		</select>
        </li>
        <li class="ml10"><div onClick="change_page(1,$('#cc_ss_type').val())" class="btn_green">搜 索</div></li>
        <div class="clear"></div>
    </ul>
</div>
<div class="all_num f_right">【合计】<span id="all_num">{$all_num}</span> 种</div>

<table class="s_table bg_table" id="page_data" style="width:900px;">
</table>

<div id="now_page">1</div>
<div class="ok_bar">
	<div class="btn_green f_left ml10" onClick="to_japan()">转 运</div>
      <div class="clear"></div>
</div>
<div class="page_bar"></div>
</div><!--/kuang-->

<div class="tips" style="margin-top:60px;">
【说明】输入部分商品代码进行模糊搜索；<br>&nbsp;
点击编码进行该商品的修改和删除操作。</div>
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
 -->