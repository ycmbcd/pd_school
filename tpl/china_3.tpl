<html>
<head>
<title>运送在途（中国）</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>

{literal}
<script type="text/javascript">
$(document).ready(function(){
  //获取html里面的now_id
  var now_id=$("#now_id").html();
  $("#s_jp_id").val(now_id);
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
<span id="now_id" style="display:none;">{$now_id|default:""}</span> 
<div class="add_list">
  <ul>
      <li>
      <select id="s_jp_id" class="add_listkey " onChange="window.location='/right/china_3.php?c_jp_id='+$(this).val()" style="width:250px;">
          <option>请选择订单号...</option>
          {foreach $jp_id as $se}
            <option value="{$se.jp_id}">{$se.jp_id}</option>
            {/foreach}
    </select>
      </li>
      <div class="clear"></div>
  </ul>
</div>
<div class="table_list" style="width:765px;">
	<ul>
      <li class="title_table" style="width:40px;">流水号</li>
      <li class="title_table" style="width:260px;">商品代码</li>
      <li class="title_table" style="width:100px;">发货数</li>
      <li class="title_table" style="width:100px;">转运日期</li>
      <li class="title_table" style="width:160px;">转运单号</li>
      <div class="clear"></div>
    </ul>
    {foreach $s_jp_id|default:"-" as $se}
  	<ul>
      <li style="width:40px;" class="x_num tagc">^_^</li>
      <li style="width:260px;">{$se.goods_code|default:'-'}</li>
      <li style="width:100px;">{$se.send_num|default:'-'}</li>
      <li style="width:100px;">{$se.send_day|default:'-'}</li>
      <li style="width:160px;">{$se.jp_id|default:'-'}</li>
      <div class="clear"></div>
  	</ul>
    {/foreach}
</div>
<div class="tips">
【说明】只能看不能点。
</div>
</body>
</html>
