<html>
<head>
<title>转运单（CH）</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
<script type="text/javascript" src="/js/calendar.js" ></script> 
<script language="javascript" src="/js/jquery.PrintArea.js"></script> <!--打印-->
{literal}
<script>
$(document).ready(function(e) {
   	var now_id=$("#now_id").html();
	$("#s_jp_id").val(now_id);
	if(now_id==""){
	}else{
		$("#print_code").attr("src","/myclass/codeMaker/index.php?now_id="+now_id);
	}
	//x_num序号
	$(".x_num").each(function(){
		var xx=$(".x_num").index(this)+1;
		$(this).html(xx);
	})
	//赋日期
	var myDate = new Date();;
	today = myDate.toLocaleString( );
	$(".send_day").html(today);
});
function print_order(){
		$(".ok_bar").hide();
		window.print()
		$(".ok_bar").show();
}
</script>
<style>
.table_list li{
	font-size:10px !important;
	height:24px !important;
	line-height:24px !important;}
</style>
{/literal}

</head>
<body style="height:auto;">
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="ok_bar" style="width:210px;height:80px;">
	<div class="btn_blue f_left" onClick="print_order()">打 印</div>
</div>
<!--startprint-->
<div style="padding-left:15px;margin-bottom:-30px;font-size:16px;">
<span>操作人：{$u_name}</span>
<span style="padding-left:20px;">工号：{$u_num}</span>
<span style="padding-left:20px;">转运单号：<span id="now_id">{$now_id|default:""}</span></span>
<div>出库时间：<span class="send_day"></span></div>
</div>
<div class="table_list" style="width:574px;margin-left:10px;">
	<ul>
      <li class="title_table" style="width:30px;">序号</li>
      <li class="title_table" style="width:260px;">商品代码</li>
      <li class="title_table" style="width:100px;">发货数</li>
      <li class="title_table" style="width:100px;">转运日期</li>
      <div class="clear"></div>
    </ul>
    {foreach $s_jp_id|default:"" as $se}
  	<ul>
    	<li class="x_num" style="width:30px;"></li>
      <li style="width:260px;">{$se.goods_code|default:""}</li>
      <li style="width:100px;">{$se.send_num|default:""}</li>
      <li style="width:100px;">{$se.send_day|default:""}</li>
      <div class="clear"></div>
  	</ul>
    {/foreach}
    <div style="margin-bottom:20px;">
    - End -
    </div>
</div>
<!--endprint-->
<iframe id="print_code" style="width:460px;height:140px;margin-left:30px;" scrolling="auto" frameborder="0" src="">

</body>
</html>
