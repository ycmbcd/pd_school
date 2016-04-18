<html>
<head>
<title>库存报表</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script>
function down_goodstype(){
	$.ajax({
			type:"GET",
			url:"table_1.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			data:"down_goodstype",
			success:function(data){
				if(data=="ok"){
					window.location="/down/ANTO_Repo.xlsx";
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
<div class="ok_bar">
	<div class="btn_green auto" onClick="down_goodstype()">生 成</div>
</div>
<div class="tips">
【说明】点击生成，导出表单。</div>
</body>
</html>