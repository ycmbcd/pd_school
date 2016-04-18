<html>
<head>
<title>查看导入采购单（日本）</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
{literal}
<script>
  function import_cai(){
    $.ajax({
        type:"GET",
        url:"add_4_2.php",
        data:"import_cai",
        success:function(data){
          if(data=="ok"){
            $(".txt_msg").html("申请采购成功！");
            $(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
            $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200,function(){
              location.reload();
            });
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
<body>
<div class="msg">
  <div class="txt_msg"></div>
</div>
<div class="ok_bar" style="position:fixed;top:0px;background:#eee;margin-top:0px;width:1000px;padding:7px 0 7px 41px;">
  <div class="btn_green f_left" onclick="import_cai()">申 请</div>
  <div class="order_box">本次采购申请单号：{$order_id|default:"^_^"}</div>
      <div class="clear"></div>
</div>
<div class="table_list" style="width:968px;margin-top:46px;">
  <ul>
    <label><li class="ms_li title_table">ID</li></label> 
      <li class="title_table" style="width:300px;">商品代码</li>
      <li class="title_table" style="width:80px;">采购单价</li>
      <li class="title_table" style="width:80px;">采购数目</li>
      <li class="title_table" style="width:80px;">采购商</li>
      <li class="title_table" style="width:80px;">备注1</li>
      <li class="title_table" style="width:80px;">备注2</li>
      <li class="title_table" style="width:80px;">采购日期</li>
      <div class="clear"></div>
    </ul>
    {foreach $resu as $se}
    <ul>
      <label><li class="ms_li tagc">{$se.id}</li></label>
      <li style="width:300px;">{$se.goods_code}</li>
      <li style="width:80px;" class="tagr">{$se.in_money}</li>
      <li style="width:80px;" class="need_num tagr">{$se.need_num}</li>
      <li style="width:80px;">{$se.in_who}</li>
      <li class="big_show" style="width:80px;">{$se.other_1}</li>
      <li class="big_show" style="width:80px;">{$se.other_2}</li>
      <li style="width:80px;">{$se.in_day}</li>
      <div class="clear"></div>
    </ul>
    {/foreach}

</div>
<div style="height:60px;"></div>
</body>
</html>
