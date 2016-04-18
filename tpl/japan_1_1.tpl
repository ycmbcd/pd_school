<html>
<head>
<title>扫码收货（日本）</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/pages.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="/style/pages.css"/>
{literal}
<script>
$(document).ready(function(e) {
    $("#scan_code").focus();
});
$(document).keypress(function(e) {  
    // 回车键事件  
       if(e.which == 13) {  
   			receive_japan(); 
       }  
});
function receive_japan(){
	var	scan_code=$("#scan_code").val();
	$.ajax({
		type:"GET",
		url:"japan_1_1.php",
		beforeSend:function(){
			$(".juhua").show();
		},
		data: "scan_code="+scan_code,
		success:function(data){
			if(data=="empty" || data=="error"){
				$(".txt_msg").html("没有此订单！");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				$("#scan_code").focus();
				$("#scan_code").val("");
			}else{
				$(".txt_msg").html("收货完成，请入库！");
				$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200,function(){
					location.reload();
				});
			}    
		} 
	})
}
</script>
{/literal}
<style>
.add_list input{
	width:200px;
	border:1px solid #333;
	}
</style>
</head>
<body>
<div class="kuang">
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list">
	<ul>
        <li><input class="add_listkey autosearch" placeholder="请扫码..." id="scan_code" type="text" /></li>
        <div class="clear"></div>
    </ul>
</div>
</div><!--/kuang-->
<div class="tips" style="margin-top:60px;">
【说明】扫入条码进行收货。</div>
</body>
</html>
