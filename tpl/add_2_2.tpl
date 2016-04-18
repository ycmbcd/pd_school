<html>
<head>
<title>即将发货（中国）</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
{literal}
<script>

$("document").ready(function(){
  //x_num序号
  $(".x_num").each(function(){
    var xx=$(".x_num").index(this)+1;
    $(this).text(xx);
  })
})
</script>
{/literal}
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="table_list" style="width:969px;">
	<ul>
      <li class="title_table" style="width:40px;">流水号</li>
      <li class="title_table" style="width:110px;">采购单号</li>
      <li class="title_table" style="width:300px;">商品代码</li>
      <li class="title_table" style="width:60px;">采购单价</li>
      <li class="title_table" style="width:60px;">采购数目</li>
      <li class="title_table" style="width:60px;">采购商</li>
      <li class="title_table" style="width:70px;">采购日期</li>
      <li class="title_table" style="width:40px;">备注1</li>
      <li class="title_table" style="width:40px;">备注2</li>
      <div class="clear"></div>
    </ul>
    {foreach $resu as $se}
  	<ul>
      <li style="width:40px;text-align:center;" class="x_num">→_→</li>
      <li style="width:110px;">{$se.order_id}</li>
      <li style="width:300px;">{$se.goods_code}</li>
      <li class="tagr" style="width:60px;">{$se.in_money}</li>
      <li class="tagr" style="width:60px;">{$se.need_num}</li>
      <li style="width:60px;">{$se.in_who}</li>
      <li style="width:70px;">{$se.in_day}</li>
      <li style="width:40px;">{$se.other_1}</li>
      <li style="width:40px;">{$se.other_2}</li>
      <div class="clear"></div>
  	</ul>
    {/foreach}
</div>
<div style="height:60px;"></div>
</body>
</html>
