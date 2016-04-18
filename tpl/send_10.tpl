<html>
<head>
<title>佐川_mail_JP</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/calendar.js" ></script> 
<script>
$(document).ready(function(e) {
    //赋入库日期
	var myDate = new Date();
	var today = myDate.toLocaleDateString().replace("/","-");
	today = today.replace("/","-");
	$("#start_day,#end_day").val(today);
});
function check_date(){
	var s_day = $("#start_day").val();
	var e_day = $("#end_day").val();
	if(s_day =="" || e_day ==""){
		$(".txt_msg").html("请选择日期！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
	}else{
		down(s_day,e_day);
	}	
}
function down(s,e){
	$.ajax({
			type:"GET",
			url:"send_10.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			data:"down&s="+s+"&e="+e,
			success:function(data){
				if(data=="ok"){
					window.location="/down/JP_zuochuan_mail.xlsx";
				}
            },
			error: function(){
              //请求出错处理
                  alert("Error!");
            }
	})
}
</script>
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list">
<div id="key_autosearch"></div>
	<ul>
        <li><span class="title_list">选择日期：</span></li>
        <li><input id="start_day" class="add_listkey" onClick="SelectDate(this,'yyyy-MM-dd')" readonly type="text" /> -</li>
        <li><input id="end_day" class="add_listkey" onClick="SelectDate(this,'yyyy-MM-dd')" readonly type="text" /></li>
        <li class="ml10"><div class="btn_green auto" onClick="check_date()">生 成</div></li>
        <div class="clear"></div>
    </ul>
</div>
<div class="tips">
【说明】日期为导入发货单日期。<br>
&nbsp;&nbsp;如果有退单，会在该条记录最后一行标出。
</div>
</body>
</html>