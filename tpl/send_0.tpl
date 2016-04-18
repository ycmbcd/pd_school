<html>
<head>
<title>订单格式化</title>
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
    <div class="mt10">
      <form action="send_0.php" method="post" enctype="multipart/form-data">
      <input class="scan_file" type="file" name="file" value="浏览" style="width:200px;background:#eee;margin-right:6px;" />
      <input class="btn_blue" type="submit" onclick="start_import()" value="格式化" name="uploads" />
      </form>
    </div>
     <div class="btn_gray f_left" style="margin-top:30px;width:100px !important;" onClick="self.location='send_0_1.php'; ">别名管理</div>
     <div class="btn_gray f_left" style="margin-top:30px;margin-left:40px;width:100px !important;" onClick="self.location='send_0_2.php'; ">套装管理</div>
     <div class="clear"></div>
  </div>
</div>
<div class="tips">
【说明】<br>
&nbsp;&nbsp;&nbsp;&nbsp;1.发货前首先请把OMS系统导出的表单导入此系统；<br>
&nbsp;&nbsp;&nbsp;&nbsp;2.待系统转好格式再进行发货操作；<br>
</div>
<div class="inner_box"></div>
</body>
</html>
