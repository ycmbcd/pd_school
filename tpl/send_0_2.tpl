<html>
<head>
<title>套装管理</title>
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
      $("#key_autosearch").css("top","114px");
      $("#key_autosearch").html(ycmbcd);
    }
  })  
}
function send_key(e){
  $('#search_code').val(e);
  $("#key_autosearch").hide();
}

//智能检索套装名提示
function auto_pack(){
  var search_code = $('#pack_goods').val();
  search_code=encodeURIComponent(search_code);
  $("#key_autosearch").show();
  $("#key_autosearch").html("");
  $.ajax({
    url:"send_0_2.php",
    type:"GET",
    data:"autopack&search_code="+search_code,
    dataType:"json",
    success:function(data){
      var ycmbcd="";
      $.each(data,function(index,json){
         ycmbcd+='<li class="can_use" onclick="send_key2(\''+json.new_name+'\')">'+json.new_name+'</li>';
      })
      $("#key_autosearch").css("top","70px");
      $("#key_autosearch").html(ycmbcd);
    }
  })  
}
function send_key2(e){
  $('#pack_goods').val(e);
  $("#key_autosearch").hide();
  show_pack(e)
}

//展示套装名
  function show_pack(e){  
    $.ajax({
      url:"send_0_2.php",
      type:"GET",
      data:"show_pack="+e,
      dataType:"json",
      success:function(data){
        $("#show_pack").html("");
        var ycmbcd="";
        $.each(data,function(index,json){
          ycmbcd+='<tr><td style="font-size:16px;">'+json.goods_code+'</td><td><div class="btn_red ml10" onclick="del_new_name(\''+json.id+'\',\''+e+'\')">删除</div></td></tr>';
        })
        ycmbcd='<table class="s_table"><tr><td>已含商品</td><td>操作</td></tr>'+ycmbcd+'</table>';
        $("#show_pack").html(ycmbcd);
      }
    })
  }

//删除别名
function del_new_name(e,f){
  $.ajax({
      url:"send_0_2.php",
      type:"GET",
      data:"del_new_name="+e,
      success:function(data){
        if(data=="ok"){
          $(".txt_msg").html("删除成功！");
          $(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
          $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
          show_pack(f);
        }else{
          alert('系统出错，请联系管理员！');
        }
      }
    })
}

//套装表
function down(){
  $.ajax({
      url:"send_0_2.php",
      type:"GET",
      data:"down",
      success:function(data){
        if(data=="ok"){
          window.location="/down/pack_name.xlsx";
        }else{
          alert('系统出错，请联系管理员！');
        }
      }
    })
}

//新增别名
function pack_goods(){
  var goods_code=$("#search_code").val()
  var pack_goods=$("#pack_goods").val()
  if(goods_code==""){
    alert("请输入商品代码！");
    $("#search_code").focus();
    return false;
  }
  if(pack_goods==""){
    alert("请输入新套装！");
    $("#pack_goods").focus();
    return false;
  }
  $.ajax({
      type:"GET",
      url:"send_0_2.php",
      data:"goods_code="+goods_code+"&pack_goods="+pack_goods,
      success:function(data){
        if(data=="no_goods_code"){
          alert('无此商品代码！');
          return false;
        }
        if(data=="has_goods_code"){
          alert('已包含此商品！');
          return false;
        }
        if(data=="ok"){
          $(".txt_msg").html("操作成功！");
          $(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
          $(".msg").stop(true,true).show(200).delay(1000).fadeOut(0);
          $("#search_code").val('').focus();
          show_pack(pack_goods)
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
<div id="key_autosearch" style="left:50px;"></div>
  <div style="margin-left:50px;margin-top:40px;">
    <input id="pack_goods" class="add_listkey" placeholder="套装名" onkeyup="auto_pack()" type="text" />
    <input class="btn_green ml10" type="submit" onclick="pack_goods()" value="确 定" />
    <input class="btn_gray ml10" onclick="down()" value="套装表" />
  </div>
  <div style="margin-left:40px;margin-top:15px;">
    <input id="search_code" class="add_listkey ml10 autosearch" onKeyUp="autosearch()" placeholder="新增商品" type="text">
  </div>
  <div id="show_pack" style="margin: 20px 0 40px 50px;">
  </div>

<div class="tips">
【说明】<br>
&nbsp;&nbsp;&nbsp;&nbsp;1.【警告】套装名和别名不能相同！！！<br>
&nbsp;&nbsp;&nbsp;&nbsp;2. 输入关键字，点击相关商品代码将会显示其所有套装，可删除操作。<br>
</div>
<div class="inner_box"></div>
</body>
</html>
