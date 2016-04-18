<html>
<head>
<title>转运审核</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>

{literal}
<script>
//全选、多选框
$("document").ready(function(){
	//x_num序号
	$(".x_num").each(function(){
		var xx=$(".x_num").index(this)+1;
		$(this).text(xx);
	})
	//order_bar
	$("#choice_type").val("订单号");
	var new_order=$("#new_order").val();
	$("#order_select").val(new_order);
	//全选
	$("#check_all").click(function(){
		var status=$(this).attr("checked");
		if(status=="checked"){
			$(".checkbox").attr("checked","true");
			$(".checkbox").addClass("check_me");
			$.ajax({
				type:"GET",
				url:"china_2_1.php",
				beforeSend:function(){
					$(".juhua").show();
				},
				data: "check_all=1",
				success:function(data){
					if(data=="ok"){
						
					}else{
						$(".txt_msg").html("系统错误！");
						$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
					}    
				} 
			})
		}else{
			$(".checkbox").removeAttr("checked");
			$(".checkbox").removeClass("check_me");
			$.ajax({
				type:"GET",
				url:"china_2_1.php",
				beforeSend:function(){
					$(".juhua").show();
				},
				data: "check_all=0",
				success:function(data){
					if(data=="ok"){
						
					}else{
						$(".txt_msg").html("系统错误！");
						$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
					}    
				} 
			})
		}
	})
	//单选
	$(".checkbox").each(function(){
		$(this).click(function(){
			var status=$(this).attr("checked");
			var s_val=$(this).val();
			if(status=="checked"){
				$(this).addClass("check_me");
				$.ajax({
					type:"GET",
					url:"china_2_1.php",
					beforeSend:function(){
						$(".juhua").show();
					},
					data: "check_one="+s_val,
					success:function(data){
						if(data=="ok"){
							
						}else{
							$(".txt_msg").html("系统错误！");
							$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
						}    
					} 
				})
			}else{ 
				$(this).removeClass("check_me");
				$.ajax({
					type:"GET",
					url:"china_2_1.php",
					beforeSend:function(){
						$(".juhua").show();
					},
					data: "remove_one="+s_val,
					success:function(data){
						if(data=="ok"){
							
						}else{
							$(".txt_msg").html("系统错误！");
							$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
						}    
					} 
				})
			}
			var num=$(".checkbox").length;
			var s_num=$(".checkbox:checked").length;
			if(num==s_num){
				$("#check_all").attr("checked","true");
			}else{
				$("#check_all").removeAttr("checked");
			}
		})
	})
})

//筛选订单
function change_order(){
	var order_id = $("#order_select").val();
  if(order_id=="0"){
    window.location.href="/right/china_2_1.php";
  }else{
    window.location.href="/right/china_2_1.php?change_order="+order_id;    
  }

}

//审核通过
function go_pass(){
	var check_num=$(".checkbox:checked").length;
	var jp_id = $("#order_select").val(); 
	if(check_num==0){
		$(".txt_msg").html("请勾选订单！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
	}else{
		$.ajax({
			type:"GET",
			url:"china_2_1.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			data: "go_pass=1&jp_id="+jp_id,
			success:function(data){
				if(data=="ok"){
					$(".txt_msg").html("审核完成，等待发货！");
					$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0,function(){
						 window.location.href="/right/china_2_1.php";
					});
				}else{
					$(".txt_msg").html("系统错误！");
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				}    
			} 
		})
	}
	
}
//撤回
function go_back(){
	var check_num=$(".checkbox:checked").length; 
	var jp_id = $("#order_select").val(); 
	if(check_num==0){
		$(".txt_msg").html("请勾选订单！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
	}else{
		$.ajax({
			type:"GET",
			url:"china_2_1.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			data: "go_back=1&jp_id="+jp_id,
			success:function(data){
				if(data=="ok"){
					$(".txt_msg").html("已撤回！");
					$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0,function(){
						location.reload();
					});
				}else{
					$(".txt_msg").html("系统错误！");
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				}    
			} 
		})
	}
	
}
</script>
{/literal}

</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="table_list" style="width:675px;margin-top:71px;">
	<ul style="position:fixed;margin-top:-24px;">
    <label><li class="ms_li title_table"><input id="check_all" type="checkbox" class="checkall" value="" /></li></label> 
      <li class="title_table" style="width:40px;">流水号</li>
      <li class="title_table" style="width:330px;">商品代码</li>
      <li class="title_table" style="width:100px;">转运数</li>
      <li class="title_table" style="width:80px;">转运日期</li>
      <div class="clear"></div>
    </ul>
    {foreach $resu|default:'-' as $se}
  	<ul>
      <label><li class="ms_li"><input type="checkbox" class="checkbox {$se.send_day}" value="{$se.id}" /></li></label>
      <li style="width:40px;" class="x_num tagc">^_^</li>
      <li style="width:330px;">{$se.goods_code|default:'-'}</li>
      <li style="width:100px;" class="tagr">{$se.send_num|default:'-'}</li>
      <li style="width:80px;">{$se.send_day|default:'-'}</li>
      <div class="clear"></div>
  	</ul>
    {/foreach}
</div>
<div class="ok_bar" style="position:fixed;top:0px;background:#eee;margin-top:0px;width:1000px;padding:7px 0 7px 41px;">
	<div class="btn_green f_left" onClick="go_pass()">批 准</div>
      <div class="btn_red f_left ml10" onClick="go_back()">撤 回</div>
      <div class="order_box">
		<input type="hidden" id="new_order" value="{$new_order}">
			<select class="data_select add_listkey" id="order_select" onchange="change_order()">
					<option value="0">请选择订单号...</option>
			  {foreach $order_select as $sle}
			        <option value="{$sle.jp_id|upper}">{$sle.jp_id}</option><!--审核后提交大写值-->
			  {/foreach}
			</select>
		</div>
      <div class="clear"></div>
</div>
<div class="tips">
【说明】选择订单，勾选商品进行操作。
<br />&nbsp;&nbsp;撤回后，转运数将返回中国仓库中。</div>
</body>
</html>
