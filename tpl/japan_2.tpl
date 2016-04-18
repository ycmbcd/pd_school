<html>
<head>
<title>日本入库</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>

{literal}
<script type="text/javascript">
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

//修改bad_num
function change_bad(e){
  var send_key = $("#send_"+e).text();
  var bad_key = $("#bad_"+e).val();
  var isnan=isNaN(bad_key);
  if(isnan==true){
    $(".txt_msg").html("请输入数字！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#bad_"+e).val(0);
    bad_key =0;
  }
  //判断小数点
  var reg = /.*\..*/;
  var dian=reg.test(bad_key);
  if(dian==true){
    $(".txt_msg").html("不能是小数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#bad_"+e).val(0);
    bad_key =0;
  }
  if(bad_key<0){
    $(".txt_msg").html("请输入正数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#bad_"+e).val(0);
    bad_key =0;
  }
  cha = send_key - bad_key;
  if(cha<0){
    $(".txt_msg").html("超出发货数！");
    $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
    $("#bad_"+e).val(0);
    bad_key =0;
  }
  change_all(e,send_key,bad_key);
}

//传值计算
function change_all(e,send_key,bad_key){
  $.ajax({
    type:"GET",
    url:"japan_2.php",
    beforeSend:function(){
    $(".juhua").show();
    },
    dataType:"json",
    data: "change_all="+e+"&send_num="+send_key+"&bad_num="+bad_key,
    success:function(data){
      $.each(data,function(index,json){
        $("#receive_"+e).text(json.receive_num);
      })
    }
  })
}

//筛选订单
function change_order(){
	var jp_id = $("#order_select").val();
  if(jp_id=="0"){
    window.location.href="/right/japan_2.php";
  }else{
    window.location.href="/right/japan_2.php?change_order="+jp_id;    
  }

}

//入库
function in_repo(){
  //检测订单
  var order_select=$("#order_select").val();
	$.ajax({
		type:"GET",
		url:"japan_2.php",
		beforeSend:function(){
		$(".juhua").show();
		},
		data: "in_repo="+order_select,
		success:function(data){
			if(data=="ok"){
				$(".txt_msg").html("入库完成！");
				$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(0,function(){
          self.location='japan_2.php'; 
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
  background: #3d3f42;
  color:#fff;
}
#big_show{
  color:#cf0;
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
  border: 2px solid #c33;
  background: #f66;
  position: fixed;
  top: 60px;
  margin-top: 50px;
  left: 50%;
  margin-left: -150px;
  color: #fff;
  /* display: none; */
  z-index: 10;
}
#warning_box {
  margin-left: -150px;
}
.low_num,.bad_num{
	width:38px;
	height: 18px;
	border:1px solid #52acb8;
  color:#52acb8;
	text-align: right;
	padding-right:4px;
  margin-left: 1px;
  margin-top: 2px;
}
.low_num:hover,.bad_num:hover{
  background: #52acb8;
  color:#fff;
}
</style>
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<input type="hidden" id="ycm_key" />
<div id="top_bar">
  <div id="big_show" class="f_left">- 安藤库存管理系统 -（中→日）</div>
  <div class="f_right">
    <div id="order_bar" class="f_left">
		<div class="f_left">
		<input type="hidden" id="new_order" value="{$new_order}">
			<select class="data_select add_userkey" id="order_select" onchange="change_order()">
					<option value="0">请选择转运单号...</option>
			  {foreach $order_select as $sle}
			        <option value="{$sle.jp_id}">{$sle.jp_id}</option>
			  {/foreach}
			</select>
		</div>
    </div>
    <div class="btn_blue f_left ml10 mr10 border_blue" onclick="in_repo()">入 库</div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
</div>
<div class="table_list" style="width:938px;margin-top:40px;margin-left:0px;">
	<ul style="position:fixed;">
		<li class="title_table" style="width:40px;">流水号</li>
		<li style="width:300px;" class="title_table">商品代码</li>
		<li style="width:60px;" class="title_table">发货数</li>
		<li style="width:40px;" class="title_table">损坏数</li>
		<li style="width:60px;" class="title_table">入仓数</li>
		<li style="width:70px;" class="title_table">发货日期</li>
		<li style="width:100px;" class="title_table">备注1</li>
		<li style="width:100px;" class="title_table">备注2</li>
		<div class="clear"></div>
    </ul>
    <ul style="height:23px;">
    	
    </ul>
    {foreach $resu|default:'-' as $se}
  	<ul>
      <li style="width:40px;text-align:center;" class="x_num">^_^</li>
      <li style="width:300px;" class="mouse_hover">{$se.goods_code|default:'-'}</li>
      <li style="width:60px;" class="mouse_hover tagr" id="send_{$se.id}">{$se.send_num|default:'-'}</li>
      <li style="width:40px;">
      	  <input class="bad_num" id="bad_{$se.id}" onchange="change_bad({$se.id})" type="text" value="{$se.bad_num|default:'-'}" />
      </li>
      <li style="width:60px;" id="receive_{$se.id}">{$se.receive_num|default:'-'}</li>
      <li style="width:70px;" class="mouse_hover">{$se.send_day|default:'-'}</li>
      <li style="width:100px;" class="mouse_hover">{$se.other_1|default:'-'}</li>
      <li style="width:100px;" class="mouse_hover">{$se.other_2|default:'-'}</li>
      <div class="clear"></div>
  	</ul>
    {/foreach}
</div>
<div class="tips">
【说明】选择订单进行入库操作。<br/>&nbsp;&nbsp;如未收到，损坏数 = 发货数。</div>
</body>
</html>
