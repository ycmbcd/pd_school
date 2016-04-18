<html>
<head>
<title>批量转运（中国）</title>
<meta charset="utf8" />
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
{literal}
<script>
function start_import(){
  $(".juhua").show();
  $(".inner_box").show();
}
  function makeup(){
    $.ajax({
        type:"GET",
        url:"china_5.php",
        data:"makeup",
        success:function(data){
          if(data=="ok"){
            window.location="/down/to_JP_import.xlsx";
          }else{            
            alert("系统出错，请联系管理员！");
          }
              },
        error: function(){
                //请求出错处理
                    alert("Error!");
              }
    })
  }
</script>
{/literal}
<style>

</style>
</head>
<div class="juhua"></div>
<body style="padding-top:180px;color:#586781;">
<div style="width:100%;background:#eee;position:fixed;top:0px;left:0px;color:#000;">
  <div style="margin-left:50px;margin-top:40px;padding-bottom:10px;">
    <div style="width:200px;">
      <div class="f_left" style="font-size:16px;height:30px;line-height:30px;padding-right:6px;">生成转运单：</div>
      <div class="btn_blue f_left" onClick="makeup()">生 成</div>
      <div class="clear"></div>
    </div>
    <div style="margin-top:10px;">
      <form action="china_5.php" method="post" enctype="multipart/form-data">
      <input class="scan_file" type="file" name="file" value="浏览" style="width:200px;background:#eee;margin-right:6px;" />
      <input class="btn_green" type="submit" value="导 入" onclick="start_import()" name="uploads" />
      </form>
    </div>
  </div>
</div>
<div class="tips">
【说明】<br>
&nbsp;&nbsp;&nbsp;&nbsp;1.点击生成，生成转运单；<br>
&nbsp;&nbsp;&nbsp;&nbsp;2.填写完转运单，选择文件导入系统；<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.导入后，数据进入“ 转运审核(中国）”。<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.如果转运数大于库存数，系统将智能转运全部的库存数而不会减成负数。<br><br>
【重要】<br>
&nbsp;&nbsp;&nbsp;&nbsp;文件导入有严格的限制：必须由本页面导出的【转运单】为模板填写，<br>
&nbsp;&nbsp;【转运数】要填写完整且必须为大于 “0” 的数字，否则该条数据将不被导入。
</div>
<div class="inner_box"></div>
</body>
</html>
