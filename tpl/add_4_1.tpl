<html>
<head>
<title>导入采购单（日本）</title>
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
        url:"add_4_1.php",
        data:"makeup",
        success:function(data){
          if(data=="ok"){
            window.location="/down/japan_import.xlsx";
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
</head>
<div class="juhua"></div>
<body style="padding-top:180px;color:#586781;">
<div style="width:100%;background:#eee;position:fixed;top:0px;left:0px;color:#000;">
  <div style="margin-left:50px;margin-top:40px;padding-bottom:10px;">
    <div style="width:200px;">
      <div class="f_left" style="font-size:16px;height:30px;line-height:30px;padding-right:6px;">生成采购单：</div>
      <div class="btn_blue f_left" onClick="makeup()">生 成</div>
      <div class="clear"></div>
    </div>
    <div style="margin-top:10px;">
      <form action="add_4_1.php" method="post" enctype="multipart/form-data">
      <input class="scan_file" type="file" name="file" value="浏览" style="width:200px;background:#eee;margin-right:6px;" />
      <input class="btn_green" type="submit" value="导 入" onclick="start_import()" name="uploads" />
      </form>
    </div>
    <div style="margin-top:10px;">
      <div class="f_left" style="font-size:16px;height:30px;line-height:30px;padding-right:6px;">
      已经导入：</div>
      <div class="btn_gray f_left" onClick="self.location='add_4_2.php'; ">查 看</div>
      <div class="clear"></div>
    </div>
  </div>
</div>
  <div class="tips">
【说明】<br>
&nbsp;&nbsp;&nbsp;&nbsp;1.点击生成，生成采购单；<br>
&nbsp;&nbsp;&nbsp;&nbsp;2.填写完采购单，选择文件导入系统；<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.导入后，点击查看进行采购申请操作。<br>
&nbsp;&nbsp;&nbsp;&nbsp;4.如果导入数据有误，修改.xlsx文件后重新导入即可。<br><br>
【重要】<br>
&nbsp;&nbsp;&nbsp;&nbsp;文件导入有严格的限制，必须由本页面导出的【采购单】为模板填写，【采购商】、<br>&nbsp;&nbsp;&nbsp;&nbsp;【采购单价】、【采购数目】都要填写完整且【采购商】必须为系统内所包含的采购<br>&nbsp;&nbsp;&nbsp;&nbsp;商、【采购单价】和【采购数目】必须为大于 “0” 的数字，否则该条数据将不被导入。
<div class="inner_box"></div>
</div>
</body>
</html>
