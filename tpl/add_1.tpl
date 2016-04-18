<html>
<head>
<title>商品采购（中国）</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>

{literal}
<script>
$("document").ready(function(){	
  //判断数字
  check_num();
	//赋入库日期
	var myDate = new Date();
	var today = myDate.toLocaleDateString().replace("/","-");
	today = today.replace("/","-");
	$(".in_day").val(today);

  list_up()
  list_close()
})
$(document).keypress(function(e) {  
    // 回车键事件  
       if(e.which == 13) {  
   			return false;
       }  
});

// 添加行
function add_line(){
	var add_html = $('#sub_box').html()+"<div style=\"float:left;margin:5px 0 0 5px;\" class=\"list_sub\" onclick=\"$(this).parent().remove()\"><img src=\"../images/sub.png\"></div><div class=\"clear\"></div>";
	add_html="<ul class=\"add_list_ul add_must\" >"+add_html+"</ul>";
	$("#add_list_box").append(add_html);
	//赋入库日期
	var myDate = new Date();
	var today = myDate.toLocaleDateString().replace("/","-");
	today = today.replace("/","-");
	$(".in_day").val(today);
  //判断数字
  check_num();
}
function auto_alert(e,f){
  $("#key_autosearch").show();
  $("#key_autosearch").css({left:"10px",top:(e+32)+"px"});
  $("#key_autosearch").html("");
  if(f==""){
    return false;
  }
  $.ajax({
    url:"search.php",
    type:"GET",
    data:"autosearch&search_code="+f,
    dataType:"json",
    success:function(data){
      var ycmbcd="";
      $.each(data,function(index,json){
        ycmbcd+='<li class="can_use" onclick="send_key(\''+json.goods_code+'\')">'+json.goods_code+'</li>';
      })
      $("#key_autosearch").html(ycmbcd);
    }
  })  
}
function send_key(b){
  $('.nowkey').val(b);
  $("#key_autosearch").hide();
  $('.autosearch').removeClass('nowkey');
}

//数字判断
function check_num(){
  $(".in_money,.need_num").each(function(i){
    $(this).focus(function(){
      var key=$(this).val("");
    })
    $(this).blur(function(){
      var key=$(this).val();
      var isnan=isNaN(key);
      if(key<0){
        $(".txt_msg").html("不能是负数！");
        $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
        $(this).val("").focus();
        return false;
      }
      if(isnan==true){
        $(".txt_msg").html("请输入数字！");
        $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
        $(this).val("").focus();
        return false;
      }
      if(key==""){
        $(this).val("").focus();
      }
      if(key==null){
        $(this).val("").focus();
      }
    })
  })
}

//点击采购判断非空（检验信息完整性）
function check_order(){
  var status="";
  $(".goods_code,.in_money,.need_num").each(function(i){
    var key = $(".goods_code,.in_money,.need_num").eq(i).val();
      if(key ==""){
        status=0;
        $(".txt_msg").html("请填写完整！");
        $(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
        return false;
      }else{
        status=1;
      }
  })
  check_num()
  if(status=="1"){
    //验证完毕可以采购
    add_go();
  }
}

//采购
function add_go(){
    $(".add_must").each(function(i) {
      var  add_listkey = $(this).find(".add_listkey").serialize();
      $.ajax({
        type:"GET",
        url:"add_1.php",
        beforeSend:function(){
        $(".juhua").show();
        },
        data: "add_go&"+add_listkey,
        success:function(data){
          if(data=="ok"){
            $(".juhua").hide();
            $(".txt_msg").html("采购申请成功！");
            $(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
            $(".msg").stop(true,true).show(200).delay(1000).fadeOut(0,function(){
              location.reload();
            });  
          }
        } 
      })
    });
}

function list_up(){
  $(".list_up_btn").each(function(i){
     $(this).click(function(){
       var fstr = $(".add_must").eq(0).find("input").eq(0).val();
       if(fstr!=""){
          add_line();
       }       
       $(this).parent().parent().addClass("uping");
       var goods_code = $(".uping").find('input').eq(1).val()
       var in_who = $(".uping").find('input').eq(2).val()
       var in_money = $(".uping").find('input').eq(3).val()
       var need_num = $(".uping").find('input').eq(4).val()
       var other_1 = $(".uping").find('input').eq(6).val()
       var other_2 = $(".uping").find('input').eq(7).val()
       var list_close_id= $(".uping").find('input').eq(0).val()
      
       $(".add_must:last").find("input").eq(0).val(goods_code);
       $(".add_must:last").find("select").eq(0).val(in_who);
       $(".add_must:last").find("input").eq(1).val(in_money);
       $(".add_must:last").find("input").eq(2).val(need_num);
       $(".add_must:last").find("input").eq(4).val(other_1);
       $(".add_must:last").find("input").eq(5).val(other_2);
       del_sback(list_close_id);
       $(".uping").remove();
     })
  })
}
function del_sback(i){
  //  后台删除 此行
       $.ajax({
          url:"add_1.php",
          type:"GET",
          data:"del_sback="+i,
          success:function(data){
            //理论上不会出问题
          }
       })
}
function list_close(){
        $(".list_close_btn").click(function(){
          var list_close_id= $(this).parent().parent().find('input').eq(0).val()
          del_sback(list_close_id);
          $(this).parent().parent().remove()       
        })
}

</script>
{/literal}
<style>
#add_list_box li{
	height: 30px;
  line-height: 30px;
  font-size: 14px;
}
.add_listkey{
  font-size: 12px;
}
#add_list_box ul{
	background: #eee;
}
.add_list{
  position: relative;
  width:1059px;
	margin-left:30px;
}
.add_list input{
	width:200px;
  height: 24px;
	border:1px solid #a9a9a9;
	}
#add_list_box .add_list_ul input,#add_list_box .add_list_ul select{
	width:99%;
	margin:3px 0 3px 0;
}
.code{
	background:url(../images/code.png) no-repeat right;
	background-color:#FFF;}
#key_autosearch{
  position: absolute;
}
.can_use{
  height: 30px !important;
}
</style>
</head>
<body>

<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list table_list" id="add_list_box">
  <div id="key_autosearch"></div>
	<ul> 
      <li class="title_table" style="width:302px;">商品代码</li>
      <li class="title_table" style="width:100px;">采购商</li>
      <li class="title_table" style="width:110px;">采购单价</li>
      <li class="title_table" style="width:100px;">采购数目</li>      
      <li class="title_table" style="width:100px;">采购日期</li>
      <li class="title_table" style="width:80px;">备注1</li>
      <li class="title_table" style="width:80px;">备注2</li>
      <div class="clear"></div>
    </ul>
    <ul class="add_list_ul add_must" id="sub_box" style="background:#eee;height:32px;">    
      <li style="width:302px;">
      	<input class="add_listkey autosearch goods_code" name="goods_code" placeholder="必填 ★" 
        onblur="$.ajax({
    url:'add_1.php',
    type:'GET',
    data:'checkgoods='+$(this).val(),
    success:function(data){
      if(data=='no'){
        $('.nowkey').val('').focus();
      }
    }
  })
  " onKeyUp="$(this).addClass('nowkey'),auto_alert($(this).position().top,$(this).val())" type="text" />
      </li>
      <li style="width:100px;">
      	<select class="in_who add_listkey" name="in_who" style="height:24px;width:98px;border:1px solid #a9a9a9;">
        	{foreach $in_who as $se}
            <option value="{$se.u_name}">{$se.u_name}</option>
            {/foreach}
	   </select>
      </li>
      <li style="width:110px;">
      	<input class="add_listkey in_money" name="in_money" placeholder="必填 ★" type="text" />
      </li>
      <li style="width:100px;">
      	<input class="add_listkey need_num" name="need_num" placeholder="必填 ★" type="text" />
      </li>
      <li style="width:100px;">
      	<input class="add_listkey in_day readonly" name="in_day"  readonly type="text" />
      </li>    
      <li style="width:80px;">
      	<input class="add_listkey other_1" name="other_1" placeholder="可选" type="text" />
      </li>
      <li style="width:80px;">
      	<input class="add_listkey other_2" name="other_2" placeholder="可选" type="text" />
      </li>
       
  	</ul>
  	<div class="clear"></div>  
</div>
<div onclick="add_line()" style="margin-left:1055px;width:30px;">
	<img src="../images/add.png">
</div>
<div class="add_list">
  <ul>
      <li><div onClick="check_order()" style="margin-left:450px;" class="btn_green">采 购</div></li>
      <div class="clear"></div>
  </ul>
</div>
<!--撤回商品-->
<div style="background:#eee;font-size:18px;margin:20px 0 -20px 30px;">撤回商品：</div>
<div class="add_list table_list" id="add_list_box">
  <div id="key_autosearch"></div>
  <ul> 
      <li class="title_table" style="width:202px;">商品代码</li>
      <li class="title_table" style="width:140px;">采购商</li>
      <li class="title_table" style="width:110px;">采购单价</li>
      <li class="title_table" style="width:100px;">采购数目</li>      
      <li class="title_table" style="width:100px;">采购日期</li>
      <li class="title_table" style="width:100px;">备注1</li>
      <li class="title_table" style="width:100px;">备注2</li>
      <div class="clear"></div>
    </ul>
    {foreach $back_goods as $sa}  
    <ul class="add_list_ul list_back" id="sub_box" style="background:#eee;height:32px;"> <!--此行不要加add_must类-->
      <li style="width:202px;">
        <input class="back_id" type="hidden" value="{$sa.id}">
        <input class="add_listkey readonly" name="b_goods_code" readonly="readonly" type="text" value="{$sa.goods_code}" />
      </li>
      <li style="width:140px;">
        <input class="add_listkey readonly" name="b_in_who" readonly="readonly" type="text" value="{$sa.in_who}" />
      </li>
      <li style="width:110px;">
        <input class="add_listkey readonly" name="b_in_money" readonly="readonly" type="text" value="{$sa.in_money}" />
      </li>
      <li style="width:100px;">
        <input class="add_listkey readonly" name="b_need_num" readonly="readonly" type="text" value="{$sa.need_num}" />
      </li>
      <li style="width:100px;">
        <input class="add_listkey readonly" name="b_in_day" readonly="readonly" type="text" value="{$sa.in_day}" />
      </li>    
      <li style="width:100px;">
        <input class="add_listkey readonly" name="b_other_1" readonly="readonly" type="text" value="{$sa.other_1}" />
      </li>
      <li style="width:100px;">
        <input class="add_listkey readonly" name="b_other_2" readonly="readonly" type="text" value="{$sa.other_2}" />
      </li>
    <div style="width:1200px;">
        <div class="list_up_btn pointer" style="float:left;width:30px;margin:5px 0 0 5px;"><img src="../images/up.png"></div>
        <div class="list_close_btn pointer" style="float:left;width:30px;margin-top:5px;"><img src="../images/del.png"></div>
    </div>  
    </ul>
    
    {/foreach}
    <div class="clear"></div>  
</div>
<div class="tips">
【说明】添加信息进行采购，<br/>&nbsp;&nbsp;若没有商品请到【物料管理】添加，<br/>【重要】为确保采购商品统一性，请在输入后的代码提示中选取商品代码进行物料匹配（否则匹配失败！），<br/>&nbsp;&nbsp;没有的商品代码将变成空。</div>
</body>
</html>
