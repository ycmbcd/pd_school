<html>
<head>
<title>中国退单</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
<script type="text/javascript" src="/js/calendar.js" ></script> 

{literal}
<script>
$(function(){
  //锁定
  $(".back_list").each(function(){
    var ss=$(this).find(".back_status").text();
    if (ss =="已退单" || ss == "已丢弃"){
      $(this).find(".ms_li").text("—")
    };
  })
  //选择
  $(".checkbox").click(function(){
    var status=$(this).attr("checked");
    var s_value = $(this).val();
    if(status=="checked"){
      //传值给后台修改为选中状态
      $.ajax({
        type:"GET",
        url:"send_6.php",
        data:"s_value="+s_value,
        success:function(data){
          if(data=="ok"){
          }else {
            alert("系统出错，请联系管理员！");
          }
        }
      })
    }else{ 
      //传值给后台修改为未选中状态
      $.ajax({
        type:"GET",
        url:"send_6.php",
        data:"b_value="+s_value,
        success:function(data){
          if(data=="ok"){
          }else {
            alert("系统出错，请联系管理员！");
          }
        }
      })
    }
  })
})
function back_goods(){
  var order_id = $("#oooddd").val();
  $.ajax({
    type:"GET",
    url:"send_6.php",
    data:"back_goods="+order_id,
    success:function(data){
      if(data=="ok"){
        window.location='send_6.php?order_id='+$('#order_id').val();
      }else {
        alert("系统出错，请联系管理员！");
      }
    }
  })
}
function ignore_goods(){
  var order_id = $("#oooddd").val();
  $.ajax({
    type:"GET",
    url:"send_6.php",
    data:"ignore_goods="+order_id,
    success:function(data){
      if(data=="ok"){
        window.location='send_6.php?order_id='+$('#order_id').val();
      }else {
        alert("系统出错，请联系管理员！");
      }
    }
  })
}
</script>
{/literal}
<style>
.table_list li{
  display:block;
  white-space:nowrap;
  height: 22px !important;
  line-height: 22px !important;
  overflow:hidden;
  text-overflow:ellipsis;}
.add_list li{
  width:292px;}
.add_list input{
  width:200px;
  border:1px solid #333;
  }
#repo_box{
  font-size:30px;
  position:fixed;
  right:30px;
  top:30px;}
.checkbox{
  height:22px;
  width:30px;
}
</style>
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list">
	<ul>
      <li><span class="title_list">注文番号：</span> <input class="add_listkey" value="{$order_id}" placeholder="请输入..." id="order_id" type="text" /><input type="hidden" value="{$order_id}" id="oooddd"></li>
      <li><div class="btn_green" onclick="window.location='send_6.php?order_id='+$('#order_id').val();">搜 索</div></li>
      <div class="clear"></div>
    </ul>
</div>
<div id="back_info" style="display:none;">
  <div class="table_list" style="width:980px;margin-top:60px;">
    <ul>
      <label><li class="ms_li title_table"></li></label> 
        <li class="title_table" style="width:70px;">导入日期</li>
        <li class="title_table" style="width:120px;">注文番号</li>
        <li class="title_table" style="width:80px;">お客様管理ナンバ-</li>
        <li class="title_table" style="width:140px;">品名</li>
        <li class="title_table" style="width:40px;">数量</li>
        <li class="title_table" style="width:70px;">配達日</li>
        <li class="title_table" style="width:100px;">配達指定時間帯</li>
        <li class="title_table" style="width:80px;">代引金額</li>
        <li class="title_table" style="width:50px;">状态</li>
        <div class="clear"></div>
      </ul>
      {foreach $resu as $se}
      <ul class="back_list">
        <label><li class="ms_li"><input type="checkbox" class="checkbox" value="{$se.id}" /></li></label>
        <li style="width:70px;">{$se.import_day}</li>
        <li style="width:120px;">{$se.order_id}</li>
        <li style="width:80px;">{$se.oms_id}</li>
        <li style="width:140px;">{$se.goods_code}</li>
        <li style="width:40px;">{$se.out_num}</li>
        <li style="width:70px;">{$se.send_day}</li>
        <li style="width:100px;">{$se.send_time}</li>
        <li style="width:80px;">{$se.due_money}</li>
        <li style="width:50px;" class="back_status">{$se.back_status|replace:"NULL":"可操作"}</li>
        <input type="hidden" value="{$se.status}" class="pause_me">
        <div class="clear"></div>
      </ul>
      {/foreach}
  </div>
  <div style="margin:30px 0 0 40px;font-size:16px;line-height:24px;">
        <div style="color:#E0001F;font-weight:bold;border-bottom:2px solid #3389D4;width:600px;">客人信息</div>
        <div style="height:6px;"></div>
        <div><span style="color:#E0001F;">电话:</span> {$who_tel}</div>
        <div><span style="color:#E0001F;">邮编:</span> {$who_post}</div>
        <div><span style="color:#E0001F;">地址:</span> {$who_house}</div>
        <div><span style="color:#E0001F;">姓名:</span> {$who_name}</div>
  </div>
  <div class="ok_bar">
    <div class="btn_yes auto f_left" style="margin-right:20px;" onclick="ignore_goods()">丢 弃</div><!--/实际是退订单中的商品-->
    <div class="btn_no auto f_left" onclick="back_goods()">退 单</div>
    <div class="clear"></div>
  </div>
</div>
<div class="tips">
【说明】搜索注文番号进行退单。</div>
<!---提示弹窗-->
<div id="warning_box">
    <div id="warning_text"></div>
    <div>
        <div id="no_del" class="btn_red" style="margin-right:110px;">确 定</div>
        <div class="clear"></div>
    </div>
</div>
<div id="shade"></div>
<!---/提示弹窗-->
</body>
</html>
