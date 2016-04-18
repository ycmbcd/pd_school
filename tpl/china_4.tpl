<html>
<head>
<title>库存告急（中国）</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
<script type="text/javascript" src="/js/calendar.js" ></script> 
{literal}
<script>
$(document).ready(function(){
  $("#cc_ss_type").val($("#now_type").text());
})
function change_yu(){
  $('#c_form').submit();
}
</script>
{/literal}
</head>
<body>
<div id="now_type" style="display:none;">{$now_type|default:0}</div>
<div class="add_list">
  <ul>
    <form id="c_form">
        <li class="ml10">
        <select class="input_key ml10" name="cc_ss_type" id="cc_ss_type" onChange="change_yu()" style="width:100px;">
          <option value="0" >所有分类</option>
          {foreach $role as $se}
            <option value="{$se.ss_type}">{$se.ss_type}</option>
            {/foreach}
    </select>
        </li>
        <div class="clear"></div>
    </ul>
    </form>
</div>
<div class="table_list" style="width:684px;margin-left:64px;">
  <ul>
      <li class="title_table" style="width:100px;">分类</li>
      <li class="title_table" style="width:300px;">商品代码</li>
      <li class="title_table" style="width:100px;">中国库存</li>
      <li class="title_table" style="width:100px;">中国阈值</li>
      <div class="clear"></div>
    </ul>
    {foreach $resu as $se}
    <ul>
      <li style="width:100px;">{$se.ss_type}</li>
      <li style="width:300px;">{$se.goods_code}</li>
      <li style="width:100px;">{$se.a_repo}</li>
      <li style="width:100px;">{$se.a_warning}</li>
      <div class="clear"></div>
    </ul>
    {/foreach}
</div>
<div class="tips">
【说明】列出低于阈值的商品（从少到多排列）。
<br>&nbsp;&nbsp;请补仓。
</div>
</body>
</html>
