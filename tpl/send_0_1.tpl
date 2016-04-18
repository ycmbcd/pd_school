<html>
<head>
<title>别名管理</title>
<meta charset="utf8" />
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
{literal}
<script type="text/javascript">
//智能搜索提示
function autosearch(){
  $("#key_autosearch").show();
  $("#key_autosearch").html("");
  var search_code = $('#search_code').val();
  search_code=encodeURIComponent(search_code);
  if(search_code==""){
    return false;
  }
  $.ajax({
    url:"search.php",
    type:"GET",
    data:"autosearch&search_code="+search_code,
    dataType:"json",
    success:function(data){
      var ycmbcd="";
      $.each(data,function(index,json){
        //alert(json.goods_code.length())
         ycmbcd+='<li class="can_use" onclick="send_key(\''+json.goods_code+'\')">'+json.goods_code+'</li>';
      })
      $("#key_autosearch").html(ycmbcd);
    }
  })  
}
function send_key(e){
  $('#search_code').val(e);
  $("#key_autosearch").hide();
  show_new(e);
}

//展示别名
  function show_new(e){
    $.ajax({
      url:"send_0_1.php",
      type:"GET",
      data:"show_new_name="+e,
      dataType:"json",
      success:function(data){
        $("#show_new_name").html("");
        var ycmbcd="";
        $.each(data,function(index,json){
          ycmbcd+='<tr><td style="font-size:16px;">'+json.new_name+'</td><td><div class="btn_red ml10" onclick="del_new_name(\''+json.id+'\',\''+e+'\')">删除</div></td></tr>';
        })
        ycmbcd='<table class="s_table"><tr><td>已有别名</td><td>操作</td></tr>'+ycmbcd+'</table>';
        $("#show_new_name").html(ycmbcd);
      }
    })
  }

//删除别名
function del_new_name(e,f){
  $.ajax({
      url:"send_0_1.php",
      type:"GET",
      data:"del_new_name="+e,
      success:function(data){
        if(data=="ok"){
          $(".txt_msg").html("删除成功！");
          $(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
          $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
          show_new(f);
        }else{
          alert('系统出错，请联系管理员！');
        }
      }
    })
}

//别名表
function down(){
  $.ajax({
      url:"send_0_1.php",
      type:"GET",
      data:"down",
      success:function(data){
        if(data=="ok"){
          window.location="/down/new_name.xlsx";
        }else{
          alert('系统出错，请联系管理员！');
        }
      }
    })
}
//新增别名
function new_name(){
  var goods_code=$("#search_code").val()
  var new_name=$("#new_name").val()
  if(goods_code==""){
    alert("请输入商品代码！");
    $("#search_code").focus();
    return false;
  }
  if(new_name==""){
    alert("请输入新别名！");
    $("#new_name").focus();
    return false;
  }
  $.ajax({
      type:"GET",
      url:"send_0_1.php",
      data:"goods_code="+goods_code+"&new_name="+new_name,
      success:function(data){
        if(data=="no_goods_code"){
          alert('无此商品代码！');
          return false;
        }
        if(data=="has_new_name"){
          alert('已经存在此别名/套装名，请起其他的名字！');
          return false;
        }
        if(data=="ok"){
          $(".txt_msg").html("操作成功！");
          $(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
          $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
          $("#new_name").val('').focus();
          show_new(goods_code)
          return false;
        }else{            
          alert("系统出错，请联系管理员！");
          return false;
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
<style type="text/css">
.add_listkey{
  width:300px;
}
.btn_red {
  height: 20px !important;
  line-height: 20px;
  width: 60px !important;
  font-size: 14px;
  margin-top: 1px;
  border-radius: 20px;
}

</style>
</head>
<div class="msg">
  <div class="txt_msg"></div>
</div>
<body>
<div id="key_autosearch" style="left:50px;top:69px"></div>
  <div style="margin-left:50px;margin-top:40px;padding-bottom:10px;">
    <input class="add_listkey autosearch" placeholder="商品代码" id="search_code" type="text" onKeyUp="autosearch()">
    <input class="add_listkey ml10" placeholder="新别名" id="new_name" type="text">
    <input class="btn_green ml10" type="submit" onclick="new_name()" value="新 增" />
    <input class="btn_gray ml10" onclick="down()" value="别名表" />
  </div>
  <div id="show_new_name" style="margin: 20px 0 40px 50px;">
  </div>

<div class="tips">
【说明】<br>
&nbsp;&nbsp;&nbsp;&nbsp;1.【警告】别名和套装名不能相同！！！<br>
&nbsp;&nbsp;&nbsp;&nbsp;2. 输入关键字，点击相关商品代码将会显示其所有别名，可删除操作。<br>
</div>
<div class="inner_box"></div>
</body>
</html>
