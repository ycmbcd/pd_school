<html>
<head>
<title>采购清单（日本）</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>

{literal}
<script>

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
	//big_show
	$(".table_list li").each(function(){
		$(this).hover(function(){
		  var ss = $(this).text();
		  $("#big_show").text(ss);
		})
	})
})

//筛选订单
function change_order(){
  var order_id = $("#order_select").val();
  if(order_id=="0"){
    window.location.href="/right/add_6_1.php";
  }else{
    window.location.href="/right/add_6_1.php?change_order="+order_id;    
  }

}

//修改发货数
function change_can_num(e){
	var cai_key = $("#cai_"+e).text();
	var send_key = $("#send_"+e).val();
  if(send_key==""){
    $("#send_"+e).val(cai_key);
    send_key = cai_key;
  }
 	var isnan=isNaN(send_key);
  if(isnan==true){
    $(".txt_msg").html("请输入数字！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
    $("#send_"+e).val(cai_key);
    send_key = cai_key;
  }
  //判断小数点
  var reg = /.*\..*/;
  var dian=reg.test(send_key);
  if(dian==true){
    $(".txt_msg").html("不能是小数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
    $("#send_"+e).val(cai_key);
    send_key = cai_key;
  }
  if(send_key<0){
    $(".txt_msg").html("请输入正数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
    $("#send_"+e).val(cai_key);
    send_key = cai_key;
  }
  cha = cai_key - send_key;
  if(cha<0){
    $(".txt_msg").html("超出发货数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
    $("#send_"+e).val(cai_key);
    send_key = cai_key;
  }
  change_all(e,send_key);
}

//传值
function change_all(e,send_key){
  $.ajax({
    type:"GET",
    url:"add_6_1.php",
    data: "change_all="+e+"&send_key="+send_key,
    success:function(data){
      if(data=="ok"){

      }else{
        $(".txt_msg").html("系统出错！");
        $(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
      }
    }
  })
}
//发货
function send_start(){
	var ems=$("#ems").val();
  var order_id=$("#order_select").val();
	if(order_id=="0"){
		$(".txt_msg").html("请选择订单号！");
		$(".msg").css({"background":"#F66","border-color":"#C33","color":"#FFF"});
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
		return false;
	}else if(ems==""){
    $(".txt_msg").html("请填写快递单号！");
    $(".msg").css({"background":"#F66","border-color":"#C33","color":"#FFF"});
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
    return false;
  }else{
		$.ajax({
			type:"GET",
			url:"add_6_1.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			data: "send_cai=1"+"&ems="+ems+"&order_id="+order_id,
			success:function(data){
				if(data=="ok"){
					$(".txt_msg").html("发货完成！");
					$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200,function(){
            self.location="/right/add_6_1.php";
					});
				}else{
					$(".txt_msg").html("系统出错！");
					$(".msg").css({"background":"#F66","border-color":"#C33","color":"#FFF"});
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
					self.location="/right/add_6_1.php";
				}    
			} 
		})
	}
}
</script>
{/literal}
<style>
.pause_color{
  color: blue !important;
}
#top_bar{
  height:40px;
  position: fixed;
  top:0;
  width: 100%;
  line-height: 40px;
  background: #3D3F42;
  color:#FFF;
}
#big_show{
  color:#CF0;
  width:400px;
  height: 40px;
  font-size: 16px;
  overflow: hidden;
  text-overflow:ellipsis;
  padding-left: 20px;
  white-space:nowrap;
}
.table_list li{
  display:block;
  white-space:nowrap;
  height: 22px !important;
  line-height: 22px !important;
  overflow:hidden;
  text-overflow:ellipsis;}
.data_select{
  margin-top: 10px;
}
.btn_green,.btn_red,.btn_blue{
  height:24px !important;
  width:80px !important;
  margin-top: 6px !important;
  line-height: 24px !important;
}
.checkbox{
  height:22px;
  width:30px;
}
.msg {
  width: 300px;
  height: 100px;
  line-height: 100px;
  border: 2px solid #C33;
  background: #F66;
  position: fixed;
  top: 60px;
  margin-top: 50px;
  left: 50%;
  margin-left: -150px;
  color: #FFF;
  /* display: none; */
  z-index: 10;
}
</style>
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div id="top_bar">
  <div id="big_show" class="f_left">- 安藤库存管理系统 - 采购清单（日本）</div>
  <div class="f_right">
    <div id="order_bar" class="f_left">
  		<div class="f_left">
  		<input type="hidden" id="new_order" value="{$new_order}">
  			<select class="data_select add_userkey" id="order_select" onchange="change_order()">
  					<option value="0">请选择订单</option>
  			  {foreach $order_select as $sle}
  			        <option value="{$sle.order_id|upper}">{$sle.order_id|upper}</option><!--这里大写-->
  			  {/foreach}
  			</select>
  		</div>
      <div class="f_left ml10">
        <input class="add_listkey" style="width:200px;height:24px;margin-top:8px;font-size:12px;" placeholder="请输入快递公司和单号 ★" id="ems" type="text" />
      </div>
  		<div class="clear"></div>
    </div>
    <div class="btn_blue f_left ml10 mr10 border_blue" onClick="send_start()">发 货</div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
</div>
<div class="table_list" style="width:999px;">
	<ul>
    <li class="title_table" style="width:40px;">流水号</li>
      <li class="title_table" style="width:300px;">商品代码</li> 
      <li class="title_table" style="width:80px;">采购单价</li>
      <li class="title_table" style="width:80px;">采购数目</li>
      <li class="title_table" style="width:80px;">发货数</li>
      <li class="title_table" style="width:50px;">采购商</li>
      <li class="title_table" style="width:50px;">备注1</li>
      <li class="title_table" style="width:50px;">备注2</li>
      <li class="title_table" style="width:80px;">采购日期</li>
      <div class="clear"></div>
    </ul>
    {foreach $resu|default:'-' as $se}
  	<ul>
      <li style="width:40px;" class="x_num tagc">请等待</li>
      <li style="width:300px;">{$se.goods_code|default:'-'}</li>
      <li style="width:80px;">{$se.in_money|default:'-'}</li>
      <li style="width:80px;" id="cai_{$se.id}">{$se.need_num|default:'-'}</li>
      <li style="width:80px;"><input class="add_listkey" id="send_{$se.id}" type="text" style="width:80px;height:20px;margin-top:1px;" value="{$se.in_num|default:'-'}" onchange="change_can_num('{$se.id}')" /></li>
      <li style="width:50px;">{$se.in_who|default:'-'}</li>
      <li class="big_show" style="width:50px;">{$se.other_1|default:'-'}</li>
      <li class="big_show" style="width:50px;">{$se.other_2|default:'-'}</li>
      <li style="width:80px;">{$se.in_day|default:'-'}</li>
      <div class="clear"></div>
  	</ul>
    {/foreach}
</div>
</body>
</html>
