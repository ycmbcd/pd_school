<html>
<head>
<title>导入物料单</title>
<meta charset="utf8" />
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<style>

</style>
</head>
<body style="padding-top:180px;color:#586781;">
<div style="width:100%;background:#eee;position:fixed;top:0px;left:0px;color:#000;">
  <div style="margin-left:50px;margin-top:40px;padding-bottom:10px;">
    <div style="width:200px;">
      <div class="f_left" style="font-size:16px;height:30px;line-height:30px;padding-right:6px;">生成物料单：</div>
      <div class="btn_red f_left" onclick="window.location='/demo/goods_type.xlsx';">生 成</div>
      <div class="clear"></div>
    </div>
    <div style="margin-top:10px;">
      <form action="pro_4.php" method="post" enctype="multipart/form-data">
      <input class="scan_file" type="file" name="file" value="浏览" style="width:200px;background:#eee;margin-right:6px;" />
      <input class="btn_green" type="submit" value="导 入" name="uploads" />
      </form>
    </div>
  </div>
</div>
</body>
</html>
