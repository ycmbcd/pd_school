<html>
<head>
<title>采购入库（中国）</title>
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
  //low_num,bad_num 焦点
  $(".bad_num,.low_num").each(function(){
    $(this).focus(function(){
      var ss = $(this).val();
      $("#ycm_key").val(ss);
      $(this).val("");
    });
    $(this).blur(function(){
      var key = $(this).val();
      if(key==""){
        $(this).val($("#ycm_key").val());
      }
    })
  })
})
//修改low_num
function change_low(e){
  var money_key = $("#money_"+e).text();
  var xx_key = $("#xx_"+e).text();
  var yy_key = $("#yy_"+e).val();
  var zz_key = $("#zz_"+e).val();
  var isnan=isNaN(yy_key);
  if(isnan==true){
    $(".txt_msg").html("请输入数字！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#yy_"+e).val(0);
    yy_key =0;
  }
  //判断小数点
  var reg = /.*\..*/;
  var dian=reg.test(yy_key);
  if(dian==true){
    $(".txt_msg").html("不能是小数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#yy_"+e).val(0);
    yy_key =0;
  }
  if(yy_key<0){
    $(".txt_msg").html("请输入正数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#yy_"+e).val(0);
    yy_key =0;
  }
  cha = xx_key - yy_key -zz_key;
  if(cha<0){
    $(".txt_msg").html("超出发货数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#yy_"+e).val(0);
    yy_key =0;
  }
  change_all(e,money_key,xx_key,yy_key,zz_key);
}

//修改bad_num
function change_bad(e){
  var money_key = $("#money_"+e).text();
  var xx_key = $("#xx_"+e).text();
  var yy_key = $("#yy_"+e).val();
  var zz_key = $("#zz_"+e).val();
  var isnan=isNaN(zz_key);
  if(isnan==true){
    $(".txt_msg").html("请输入数字！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#zz_"+e).val(0);
    zz_key =0;
  }
  //判断小数点
  var reg = /.*\..*/;
  var dian=reg.test(zz_key);
  if(dian==true){
    $(".txt_msg").html("不能是小数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#zz_"+e).val(0);
    zz_key =0;
  }
  if(zz_key<0){
    $(".txt_msg").html("请输入正数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#zz_"+e).val(0);
    zz_key =0;
  }
  cha = xx_key - yy_key -zz_key;
  if(cha<0){
    $(".txt_msg").html("超出发货数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#zz_"+e).val("0");
    zz_key =0;
  }
  change_all(e,money_key,xx_key,yy_key,zz_key);
}
//传值计算
function change_all(e,mm,xx,yy,zz){
  $.ajax({
    type:"GET",
    url:"add_3.php",
    beforeSend:function(){
    $(".juhua").show();
    },
    dataType:"json",
    data: "change_all="+e+"&in_money="+mm+"&in_num="+xx+"&low_num="+yy+"&bad_num="+zz,
    success:function(data){
      $.each(data,function(index,json){
        $("#ok_"+e).text(json.ok_num);
        $("#all_"+e).text(json.all_money);
      })
    }
  })
}
//筛选订单
function change_order(){
	var order_id = $("#order_select").val();
  if(order_id=="0"){
    window.location.href="/right/add_3.php";
  }else{
    window.location.href="/right/add_3.php?change_order="+order_id;    
  }

}
//入库
function in_repo(){
  //检测订单
  var order_select=$("#order_select").val();
	$.ajax({
		type:"GET",
		url:"add_3.php",
		beforeSend:function(){
		$(".juhua").show();
		},
		data: "in_repo="+order_select,
		success:function(data){
			if(data=="ok"){
				$(".txt_msg").html("入库完成！");
				$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0,function(){
          self.location="/right/add_3.php";
        });
			}else if(data=="0"){
				$(".txt_msg").html("不能偷懒哦！");
        $(".msg").stop(true,true).show(200).delay(1000).fadeOut(0)
				return false;
			}else{
        alert("系统错误，请联系管理员！");
        return false;
      }    
		} 
	})
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
  width:600px;
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
#warning_box {
  margin-left: -150px;
}
.low_num,.bad_num{
	width:38px;
	height: 18px;
	border:1px solid #52ACB8;
  color:#52ACB8;
	text-align: right;
	padding-right:4px;
  margin-left: 1px;
  margin-top: 2px;
}
.low_num:hover,.bad_num:hover{
  background: #52ACB8;
  color:#FFF;
}
</style>
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<input type="hidden" id="ycm_key" />
<div id="top_bar">
  <div id="big_show" class="f_left">- 安藤库存管理系统 - 采购入库（中国）</div>
  <div class="f_right">
    <div id="order_bar" class="f_left">
		<div class="f_left">
		<input type="hidden" id="new_order" value="{$new_order}">
			<select class="data_select add_userkey" id="order_select" onchange="change_order()">
					<option value="0">请选择订单号...</option>
			  {foreach $order_select as $sle}
			        <option value="{$sle.order_id}">{$sle.order_id}</option>
			  {/foreach}
			</select>
		</div>
    </div>
    <div class="btn_blue f_left ml10 mr10 border_blue" onClick="in_repo()">入 库</div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
</div>
<div class="table_list" style="width:1092px;margin-top:40px;margin-left:0px;">
	<ul style="position:fixed;">
      <li class="title_table" style="width:40px;">流水号</li>
      <li style="width:300px;" class="title_table">商品代码</li>
      <li style="width:40px;" class="title_table">单价</li>
      <li style="width:40px;" class="title_table">采购数</li>
      <li style="width:40px;" class="title_table">发货数</li>
      <li style="width:40px;" class="title_table">次品/算钱</li>
      <li style="width:40px;" class="title_table">退回/退钱</li>
      <li style="width:40px;" class="title_table">入仓数</li>
      <li style="width:70px;" class="title_table">总额</li>
      <li style="width:40px;" class="title_table">采购商</li>
      <li style="width:70px;" class="title_table">采购日期</li>
      <li class="title_table">物流单号</li>
      <div class="clear"></div>
    </ul>
    <ul style="height:23px;">
    	
    </ul>
    {foreach $resu|default:'-' as $se}
  	<ul>
      <li style="width:40px;text-align:center;" class="x_num">^_^</li>
      <li style="width:300px;" class="mouse_hover">{$se.goods_code|default:'-'}</li>
      <li style="width:40px;" class="mouse_hover tagr" id="money_{$se.id}">{$se.in_money|default:'-'}</li>
      <li style="width:40px;" class="mouse_hover tagr">{$se.need_num|default:'-'}</li>
      <li style="width:40px;" id="xx_{$se.id}" class="mouse_hover tagr">{$se.in_num|default:'-'}</li>
      <li style="width:40px;">
      	  <input class="low_num" id="yy_{$se.id}" onchange="change_low({$se.id})" type="text" value="{$se.low_num|default:'-'}" />
      </li>
      <li style="width:40px;">
      	  <input class="bad_num" id="zz_{$se.id}" onchange="change_bad({$se.id})" type="text" value="{$se.bad_num|default:'-'}" />
      </li>
      <li style="width:40px;" class="mouse_hover tagr" id="ok_{$se.id}">{$se.ok_num|default:'-'}</li>
      <li style="width:70px;" class="mouse_hover tagr" id="all_{$se.id}">{$se.all_money|default:'-'}</li>
      <li style="width:40px;" class="mouse_hover">{$se.in_who|default:'-'}</li>
      <li style="width:70px;" class="mouse_hover">{$se.in_day|default:'-'}</li>
      <li class="mouse_hover">{$se.ems|default:'-'}</li>
      <div class="clear"></div>
  	</ul>
    {/foreach}
</div>
<div class="tips">
【说明】
<br>&nbsp;&nbsp;总额 = ( 发货数 - 退回数 ) × 单价；
<br />&nbsp;&nbsp;入仓数 = 发货数 - 次品数 - 退回数；
<br />&nbsp;&nbsp;为确保安全，只能逐个订单入库。
</body>
</html>
