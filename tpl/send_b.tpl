<html>
<head>
<title>日本发货</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
<script type="text/javascript" src="/js/calendar.js" ></script> 

{literal}
<style>#calendarPanel{position:fixed;}</style>
<script>
$("document").ready(function(){
	//赋入库日期
	var myDate = new Date();
	var today = myDate.toLocaleDateString().replace("/","-");
	today = today.replace("/","-");
	$(".out_day").val(today);
	//焦点
	$("#goods_code").focus();
})
$(document).keypress(function(e) {  
    // 回车键事件  
       if(e.which == 13) {  
   			check_order(); 
       }  
});
//智能搜索提示
function auto_tcode(){
  $("#key_autosearch").show();
  $("#key_autosearch").css({left:"389px"});
  $("#key_autosearch").html("");
  var search_code = $('#t_code').val();
  search_code=encodeURIComponent(search_code);
  if(search_code==""){
    return false;
  }
  $.ajax({
    url:"search.php",
    type:"GET",
    data:"auto_tcode&search_code="+search_code,
    dataType:"json",
    success:function(data){
      var ycmbcd="";
      $.each(data,function(index,json){
        //alert(json.goods_code.length())
        ycmbcd+='<li class="can_use" onclick="send_key(\''+json.t_code+'\',\''+json.goods_code+'\',\''+json.b_repo+'\')">'+json.t_code+'</li>';
      })
      $("#key_autosearch").html(ycmbcd);
	  
    }
  })  
}
function autosearch(){
  $("#key_autosearch").show();
  $("#key_autosearch").css({left:"83px"});
  $("#key_autosearch").html("");
  var search_code = $('#goods_code').val();
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
        ycmbcd+='<li class="can_use" onclick="send_key(\''+json.t_code+'\',\''+json.goods_code+'\',\''+json.b_repo+'\')">'+json.goods_code+'</li>';
      })
      $("#key_autosearch").html(ycmbcd);
    }
  })  
}
function send_key(a,b,c){
  $('#t_code').val(a);
  $('#goods_code').val(b);
  $('#repo').html(c);
  $("#key_autosearch").hide();
}
//检测值
function check_order(){
  var goods_code=$("#goods_code").val();
  var t_code=$("#t_code").val();
  $.ajax({
    url:"send_2.php",
    type:"GET",
    data:"checkgoods="+goods_code+"&t_code="+t_code,
    success:function(data){
      if(data=="no"){
        $(".txt_msg").html("没有此商品！");
        $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
        return false;
      }else{
        add_order();
      }
    }
  })
}
//添加值
function add_order(){
  var goods_code=$("#goods_code").val();
  var t_code=$("#t_code").val();
  var out_num=$("#out_num").val();
  var out_day=$("#out_day").val();
  goods_code=encodeURIComponent(goods_code);
  t_code=encodeURIComponent(t_code);
  if(goods_code=="" || t_code=="" || out_num=="" || out_day==""){
		$(".txt_msg").html("请输入完整！");
	  $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
	}else{
		var out_list = $(".add_listkey").serialize();
	  $.ajax({
		url:"send_2.php",
		type:"GET",
		data:out_list,
		success:function(data){
				  $(".txt_msg").html("添加成功！");
				  $(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
				  $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200,function(){
					location.reload(); 
				  });
		}
	  })
	}
}
//检测b仓数
function check_b(){
	var out_num=$("#out_num").val();
	if(out_num<0){
		$(".txt_msg").html("请输入正数！");
        $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
		$("#out_num").val("").focus();
        return false;
	}
	var isnan=isNaN(out_num);
	if(isnan==true){
		$(".txt_msg").html("请输入数字！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
		$("#out_num").val("").focus();
        return false;
	}
	var goods_code=$("#goods_code").val();
	$.ajax({
		url:"send_2.php",
		type:"GET",
		data:"check_b="+out_num+"&goods_code="+encodeURIComponent(goods_code),
		success:function(data){
			if(data=="no"){
				 $(".txt_msg").html("库存不足！");
				 $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				 $("#out_num").val("");
				 $("#out_num").focus();
			}else{
			}
		}
	  })
	}
</script>
{/literal}
<style>
.add_list li{
	width:292px;}
.add_list input{
	width:200px;
	border:1px solid #333;
	}
.code{
	background:url(../images/code.png) no-repeat right;
	background-color:#FFF;}
#repo_box{
	font-size:30px;
	position:fixed;
	right:30px;
	top:30px;}
</style>
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div id="repo_box">日本库存：<span id="repo">*</span></div>
<div class="add_list">
	<ul>
      <li><span class="title_list">商品代码</span> <input class="add_listkey autosearch" name="goods_code" onKeyUp="autosearch()" placeholder="必须输入..." id="goods_code" type="text" /></li>
      <li><span class="title_list ml10">条形码</span> <input class="add_listkey code" name="t_code" id="t_code" placeholder="必须输入..." onKeyUp="auto_tcode()" type="text" /></li>
      <div id="key_autosearch" style="z-index:1;margin-left:1px;"></div>
      <div class="clear"></div>
    </ul>
</div>
<div class="add_list">
  <ul>
      <li><span class="title_list">订单号</span> <input class="add_listkey" name="order_id" type="text" id="order_id" /></li>
      <li><span class="title_list ml10">物流单号</span> <input class="add_listkey" type="text" name="ems" id="EMS" /></li>
      <div class="clear"></div>
  </ul>
</div>
<div class="add_list">
  <ul>
  	  <li><span class="title_list">出库数目</span> <input class="add_listkey" onBlur="check_b()" type="text" placeholder="必须输入..." name="out_num" id="out_num" /></li>
      <li><span class="title_list ml10">出库日期</span> <input class="add_listkey out_day" placeholder="必须输入..." name="out_day" onClick="SelectDate(this,'yyyy-MM-dd')" readonly type="text" id="in_day" /></li>
      <div class="clear"></div>
  </ul>
</div>
<div class="add_list">
  <ul>
      <li><span class="title_list">备注 1</span> <input class="add_listkey" name="other_1" type="text" id="other_1" /></li>
      <li><span class="title_list ml10">备注 2</span> <input class="add_listkey" name="other_2" type="text" id="other_2" /></li>
      <div class="clear"></div>
  </ul>
</div>
<div class="add_list">
  <ul>
      <li><div onClick="check_order()" style="margin-left:240px;" class="btn_green">发 货</div></li>
      <div class="clear"></div>
  </ul>
</div>
<div class="tips">
【说明】添加信息进行发货。</div>
<!---提示弹窗-->
<div id="warning_box">
    <div id="warning_text"></div>
    <div>
        <div id="no_del" class="btn_red" style="margin-right:110px;">确 定</div>
        <div class="clear"></div>
    </div>
</div>
<div id="shade"></div>
<!---/提示弹窗-->
</body>
</html>
