<html>
<head>
<title>打印（中国）</title>
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
	//获取html里面的now_id
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
});
function print_code(){
	var now_id=$("#now_id").html();
	if(now_id==""){
		$(".txt_msg").html("请选择订单！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
		return false;
	}else{
		var win=window.open("/myclass/codeMaker/index.php?now_id="+now_id);        //打开一个空页面 
		//win.moveTo(100,100)                            //移动到指定位置 
		//win.location=document.all.myframe.src;         //指定页面的内容 
		win.print();                              //打印页面 
	}
}
function print_order(){
		var now_id=$("#now_id").html();
		if(now_id==""){
			$(".txt_msg").html("请选择订单！");
			$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
			return false;
		}
		window.open("china_2_2_1.php?c_jp_id="+now_id);
}
</script>

{/literal}

</head>
<body style="height:auto;">
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list">
  <ul>
  	  <li>
      <select id="s_jp_id" class="add_listkey " onChange="window.location='/right/china_2_2.php?c_jp_id='+$(this).val()" style="width:250px;">
      		<option>请选择订单号...</option>
        	{foreach $jp_id as $se}
            <option value="{$se.jp_id}">{$se.jp_id}</option>
            {/foreach}
	  </select>
      </li>
      <div class="clear"></div>
	</ul>
</div>
<div class="ok_bar" style="width:210px;height:50px;margin-left:60px;">
	<div class="btn_blue f_left" style="width:90px !important;" onclick="print_order()">订单打印</div>
    <div class="btn_blue f_right" style="width:90px !important;" onClick="print_code()">条码打印</div>
</div>
<!--startprint-->
<div style="display:none;padding-left:10px;margin-bottom:-30px;font-size:18px;">
<span>操作人：{$u_name}</span>
<span style="padding-left:30px;font-size:18px;">工号：{$u_num}</span>
<span style="padding-left:30px;">转运单号：<span id="now_id">{$now_id|default:""}</span></span>
</div>
<div class="table_list" style="width:574px;">
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
</div>
<div style="height:200px;"></div>
<!--endprint-->

<iframe id="print_code" style="position:absolute;top:50px;right:0px;width:460px;height:140px;" scrolling="auto" frameborder="0" src="">
</iframe>
</body>
</html>
