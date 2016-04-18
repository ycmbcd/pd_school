<html>
<head>
<title>发货（中国）</title>
<meta charset="utf8" />
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript">
function start_import(){
  $(".juhua").show();
  $(".inner_box").show();
}
</script>
</head>
<div class="juhua"></div>
<body style="padding-top:180px;color:#586781;">
<div style="width:100%;background:#eee;position:fixed;top:0px;left:0px;color:#000;">
  <div style="margin-left:50px;margin-top:40px;padding-bottom:10px;">
    <div style="margin-top:10px;">
      <form action="send_1.php" method="post" enctype="multipart/form-data">
      <input class="scan_file" type="file" name="file" value="浏览" style="width:200px;background:#eee;margin-right:6px;" />
      <input class="btn_green" type="submit" onclick="start_import()" value="导 入" name="uploads" />
      </form>
    </div>
    <div style="margin-top:10px;">
      <div class="f_left" style="font-size:16px;height:30px;line-height:30px;padding-right:6px;">
      待发货：</div>
      <div class="btn_blue f_left" onClick="window.open('send_1_1.php'); ">查 看</div>
      <div class="clear"></div>
    </div>
  </div>
</div>
<div class="tips">
【说明】<br>
&nbsp;&nbsp;&nbsp;&nbsp;1.从OMS系统下载发货单并格式化后；<br>
&nbsp;&nbsp;&nbsp;&nbsp;2.选择文件导入系统；<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.导入后，点击查看进行【发货】操作。<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.如果导入数据有误，修改.xlsx文件后重新导入即可。<br>
&nbsp;&nbsp;&nbsp;&nbsp;5.Excel文件最后一列不要出现空格，否则会报“无此商品”。<br><br>
【重要】<br>
&nbsp;&nbsp;&nbsp;&nbsp;文件导入有严格的限制，必须为发货模板格式。<br>
&nbsp;&nbsp;&nbsp;&nbsp;导入后的数据，系统会自动将全角字符转换为半角字符，英文逗号、分号、单引号都会替换成日文对应的符号。<br>
</div>
<div class="inner_box"></div>
</body>
</html>
