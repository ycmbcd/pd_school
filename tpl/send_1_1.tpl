<html>
<head>
<title>待发货（中国）- Repo</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/warning.js"></script>
{literal}
<script>
$(document).ready(function(){
  //冻结状态
  $('.pause_me').each(function(){
    var status = $(this).val();
    if(status=="8"){
      $(this).parent().addClass("pause_color");
    }
  })
  //日期筛选赋值
  var cc_a=$("#cc_a").val();
  $("#a_date").val(cc_a);
  var cc_b=$("#cc_b").val();
  $("#b_date").val(cc_b);
  //change_date();
  //默认mi_li隐藏
  $(".ms_li").hide();
  //big_show
  $(".table_list li").each(function(){
    $(this).hover(function(){
      var ss = $(this).text();
      $("#big_show").text(ss);
    })
  })
  //选择
  $(".checkbox").click(function(){
    var status=$(this).attr("checked");
    var s_value = $(this).val();
    if(status=="checked"){
      //传值给后台修改为选中状态
      $.ajax({
        type:"GET",
        url:"send_1_1.php",
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
        url:"send_1_1.php",
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
  //筛选日期
  function change_date(){
    var a_date = $("#a_date").val();
    var b_date = $("#b_date").val();
    window.location.href="/right/send_1_1.php?change_date=yes&a_date="+a_date+"&b_date="+b_date;
     $("#a_date").val("a_date");
     $("#b_date").val("b_date");
  }
  //判断日期还是选择状态
  function choice_type(){
    var ss = $("#choice_type option:selected").text();
    if(ss=="选择"){
      //隐藏
      $("#data_bar").hide(500);
      $(".ms_li").show(100);
    }else{
      $("#data_bar").show(500);
      $(".ms_li").hide(100);
      //传值给后台清除原来已经选择过的
      $.ajax({
        type:"GET",
        url:"send_1_1.php",
        data:"s_clear",
        success:function(data){
          if(data=="ok"){
          }else {
            alert("系统出错，请联系管理员！");
          }
        }
      })
      //清除选中
      $(".checkbox").removeAttr("checked");
    }
  }
//发货
function import_send(){
  var u_state = $("#choice_type").val();
  var a_date = $("#a_date").val();
  var b_date = $("#b_date").val();
  if(u_state=="导入日期"){
    var send = "by_date";
  }else if(u_state=="选择"){
   var send = "by_choice";
  }else{
    alert("系统出错，请联系管理员！");
    return false;
  }
  
  $.ajax({
      type:"GET",
      url:"send_1_1.php",
      data:"import_send="+send+"&a_date="+a_date+"&b_date="+b_date,
      success:function(data){
        if(data=="ok"){
          $(".txt_msg").html("全部订单发货完成！");
          $(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
          $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200,function(){
            location.reload();
          });
        }else if(data=="cut"){
          $(".txt_msg").html("任务完成，有冻结！");
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
//转移
function import_change(){
  var u_state = $("#choice_type").val();
  var a_date = $("#a_date").val();
  var b_date = $("#b_date").val();
  if(u_state=="导入日期"){
    var send = "by_date";
  }else if(u_state=="选择"){
   var send = "by_choice";
  }else{
    alert("系统出错，请联系管理员！");
    return false;
  }
  
  $.ajax({
      type:"GET",
      url:"send_1_1.php",
      data:"import_change="+send+"&a_date="+a_date+"&b_date="+b_date,
      success:function(data){
        if(data=="ok"){
          $(".txt_msg").html("转移完成！");
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
//删除警告
function del_again(){
  $("#warning_text").html("确认执行删除吗 ？");
}
//删除
function import_del(){
    var u_state = $("#choice_type").val();
    var a_date = $("#a_date").val();
    var b_date = $("#b_date").val();
    if(u_state=="导入日期"){
      var send = "by_date";
    }else if(u_state=="选择"){
      var send = "by_choice";
    }else{
      alert("系统出错，请联系管理员！");
      return false;
    }
    
    $.ajax({
        type:"GET",
        url:"send_1_1.php",
        data:"import_del="+send+"&a_date="+a_date+"&b_date="+b_date,
        success:function(data){
          if(data=="ok"){
            $(".txt_msg").html("删除完成！");
            $(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
            $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200,function(){
              location.reload();
            });
          }else{
            alert("系统出错，请联系管理员！");
          }
        }
    })
}
</script>
{/literal}
<style>
.pause_color{
  color: blue !important;
}
#top_bar{
  height:40px;
  position: fixed;
  top:0;
  width: 100%;
  line-height: 40px;
  background: #3D3F42;
  color:#FFF;
}
#big_show{
  color:#CF0;
  width:600px;
  height: 40px;
  font-size: 16px;
  overflow: hidden;
  text-overflow:ellipsis;
  padding-left: 20px;
  white-space:nowrap;
}
.table_list li{
  display:block;
  white-space:nowrap;
  height: 22px !important;
  line-height: 22px !important;
  overflow:hidden;
  text-overflow:ellipsis;}
.data_select{
  margin-top: 10px;
}
.btn_green,.btn_red,.btn_blue{
  height:24px !important;
  width:80px !important;
  margin-top: 6px !important;
  line-height: 24px !important;
}
.checkbox{
  height:22px;
  width:14px;
}
.msg {
  width: 300px;
  height: 100px;
  line-height: 100px;
  border: 2px solid #C33;
  background: #F66;
  position: fixed;
  top: 60px;
  margin-top: 50px;
  left: 50%;
  margin-left: -150px;
  color: #FFF;
  /* display: none; */
  z-index: 10;
}
#warning_box {
  margin-left: -150px;
}
.ms_li{
  width:14px !important;
}
</style>
</head>
<body>
<div class="msg">
  <div class="txt_msg"></div>
</div>
<div id="top_bar">
  <div id="big_show" class="f_left">- 安藤库存管理系统 - 中国发货单</div>
  <div class="f_right">
    <div class="f_left">
      <select onchange="choice_type()" id="choice_type" class="data_select" style="margin-right:5px;">
        <option value="导入日期">导入日期</option>
        <option value="选择">选择</option>
      </select>
    </div>
    <div id="data_bar" class="f_left">
      <div class="f_left">
        <input type="hidden" id="cc_a" value="{$cc_a}">
        <select class="data_select" id="a_date" onchange="change_date()">
          {foreach $a_day|default:'-' as $see}
                <option value="{$see.import_day}">{$see.import_day|default:'-'}</option>
          {/foreach}
        </select>
      </div>
      <div class="f_left">&nbsp;- &nbsp;</div>
      <div class="f_left">
        <input type="hidden" id="cc_b" value="{$cc_b}">
        <select class="data_select" id="b_date" onchange="change_date()">
          {foreach $b_day|default:'-' as $see}
                <option value="{$see.import_day}">{$see.import_day|default:'-'}</option>
          {/foreach}
        </select>
      </div>
    </div>
    <div class="btn_green f_left ml10" onclick="import_send()">发 货</div>
    <div class="btn_blue f_left ml10" onclick="import_change()">中→日</div>
    <div class="btn_red f_right ml10 is_del" style="margin-right: 10px !important;" onclick="del_again()">删 除</div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
</div>

<div class="table_list" style="width:1197px;margin-top:60px;">
  <ul>
    <label><li class="ms_li title_table"></li></label> 
      <li class="title_table" style="width:70px;">导入日期</li>
      <li class="title_table" style="width:120px;">注文番号</li>
      <li class="title_table" style="width:50px;">お客様管理ナンバ-</li>
      <li class="title_table" style="width:140px;">品名</li>
      <li class="title_table" style="width:40px;">数量</li>
      <li class="title_table" style="width:80px;">お届け先電話番号</li>
      <li class="title_table" style="width:60px;">お届け先郵便番号</li>
      <li class="title_table" style="width:80px;">お届け先住所</li>
      <li class="title_table" style="width:70px;">お届け先名称</li>
      <li class="title_table" style="width:70px;">配達日</li>
      <li class="title_table" style="width:80px;">配達指定時間帯</li>
      <li class="title_table" style="width:50px;">代引金額</li>
      <div class="clear"></div>
    </ul>
    {foreach $resu|default:'-' as $se}
    <ul>
      <label><li class="ms_li"><input type="checkbox" class="checkbox" value="{$se.id}" /></li></label>
      <li style="width:70px;">{$se.import_day|default:'-'}</li>
      <li style="width:120px;">{$se.order_id|default:'-'}</li>
      <li style="width:50px;">{$se.oms_id|default:'-'}</li>
      <li style="width:140px;">{$se.goods_code|default:'-'}</li>
      <li style="width:40px;">{$se.out_num|default:'-'}</li>
      <li style="width:80px;">{$se.who_tel|default:'-'}</li>
      <li style="width:60px;">{$se.who_post|default:'-'}</li>
      <li style="width:80px;">{$se.who_house|default:'-'}</li>
      <li style="width:70px;">{$se.who_name|default:'-'}</li>
      <li style="width:70px;">{$se.send_day|default:'-'}</li>
      <li style="width:80px;">{$se.send_time|default:'-'}</li>
      <li style="width:50px;">{$se.due_money|default:'-'}</li>
      <input type="hidden" value="{$se.status}" class="pause_me">
      <div class="clear"></div>
    </ul>
    {/foreach}
</div>

<div class="tips">
【说明】<br>
&nbsp;&nbsp;&nbsp;&nbsp;1.选择日期区间，点击【发货】；<br>
&nbsp;&nbsp;&nbsp;&nbsp;2.如果订单内有商品缺货，则该单会暂留(蓝色)；<br>
&nbsp;&nbsp;&nbsp;&nbsp;3.点击【日→中】将所选商品转入中国仓库进行发货操作。
</div>
<!--删除弹窗-->
<div id="warning_box">
    <div id="warning_text"></div>
    <div>
        <div id="yes_del" onclick="import_del()" class="btn_red">确 定</div>
        <div id="no_del" class="btn_blue">取 消</div>
        <div class="clear"></div>
    </div>
</div>
<div id="shade"></div>
<!--/删除弹窗-->
</body>
</html>
