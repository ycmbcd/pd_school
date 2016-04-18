<html>
<head>
<title>出库图表（中国）</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script type="text/javascript" src="/js/calendar.js" ></script> 
<script>
$(document).ready(function(e) {
    //赋入库日期
	var myDate = new Date();
	var today = myDate.toLocaleDateString().replace("/","-");
	today = today.replace("/","-");
	$("#start_day,#end_day").val(today);
});
//智能搜索提示

function autosearch(i){
	$("#key_autosearch_"+i).show();
	$("#key_autosearch_"+i).html("");
	var search_code = $('#search_code'+i).val();
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
				ycmbcd+="<li class='can_use' onclick=send_key(\'"+json.goods_code+"\',\'"+i+"\')>"+json.goods_code+"</li>";
			})
			$("#key_autosearch_"+i).html(ycmbcd);
		}
	})	
}
function send_key(e,i){
	$('#search_code'+i).val(e);
	$("#key_autosearch_"+i).hide();
}

function check_date(){
	var s_day = $("#start_day").val();
	var e_day = $("#end_day").val();
	if(s_day =="" || e_day ==""){
		$(".txt_msg").html("请选择日期！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
	}else{
		show_plan(s_day,e_day);
	}	
}

function show_plan(s,e){
	var s = $("#start_day").val();
	var e = $("#end_day").val();
	var search_code1 = $("#search_code1").val();
	var search_code2 = $("#search_code2").val();
	var search_code3 = $("#search_code3").val();
	var search_code4 = $("#search_code4").val();
	var search_code5 = $("#search_code5").val();
	$.ajax({
			type:"GET",
			url:"table_6.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			dataType:"json",
			data:"show&s="+s+"&e="+e+"&search_code1="+search_code1+"&search_code2="+search_code2+"&search_code3="+search_code3+"&search_code4="+search_code4+"&search_code5="+search_code5,
			success:function(data){
				tubiao(data)
            },
			error: function(){
              //请求出错处理
                  alert("系统错误!");
            }
	})
}
</script>
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="add_list">
<div id="key_autosearch_1" style="left:318px !important;"></div>
<div id="key_autosearch_2" style="left:532px !important;"></div>
<div id="key_autosearch_3" style="top:69px;left:14px !important;"></div>
<div id="key_autosearch_4" style="top:69px;left:228px !important;"></div>
<div id="key_autosearch_5" style="top:69px;left:442px !important;"></div>
	<ul>
        <li><span class="title_list">选择日期：</span></li>
        <li><input id="start_day" class="add_listkey" onClick="SelectDate(this,'yyyy-MM-dd')" readonly type="text" /> -</li>
        <li><input id="end_day" class="add_listkey" onClick="SelectDate(this,'yyyy-MM-dd')" readonly type="text" /></li>
        <li class="ml10"><input type="text" id="search_code1" class="add_listkey autosearch" onKeyUp="autosearch(1)" style="width:200px;" placeholder="商品1" /></li>
        <li class="ml10"><input type="text" id="search_code2" class="add_listkey autosearch" onKeyUp="autosearch(2)" style="width:200px;" placeholder="商品2" /></li>
        <div class="clear"></div>
    </ul>
    <ul style="margin-top:10px;">
        <li class="ml10"><input type="text" id="search_code3" class="add_listkey autosearch" onKeyUp="autosearch(3)" style="width:200px;" placeholder="商品3" /></li>
        <li class="ml10"><input type="text" id="search_code4" class="add_listkey autosearch" onKeyUp="autosearch(4)" style="width:200px;" placeholder="商品4" /></li>
        <li class="ml10"><input type="text" id="search_code5" class="add_listkey autosearch" onKeyUp="autosearch(5)" style="width:200px;" placeholder="商品5" /></li>
        <li class="ml10"><div class="btn_green auto" onClick="check_date()">图 表</div></li>
        <div id="ycm"></div>
        <div class="clear"></div>
    </ul>
</div>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="height:400px;margin-top:40px;"></div>
    <!-- ECharts单文件引入 -->
    {literal}
    <script src="/js/echarts-all.js"></script>
    <script type="text/javascript">
	function tubiao(data){
	 /* var data = [
       {"goods_code":"\u6d4b\u8bd5\u5546\u54c11","all_out_num":"100","out_day":"2015-07-22"},
       {"goods_code":"\u6d4b\u8bd5\u5546\u54c12","all_out_num":"20","out_day":"2015-07-22"},
       {"goods_code":"\u6d4b\u8bd5\u5546\u54c12","all_out_num":"20","out_day":"2015-07-23"},
       {"goods_code":"\u6d4b\u8bd5\u5546\u54c13","all_out_num":"30","out_day":"2015-07-23"},
       {"goods_code":"\u6d4b\u8bd5\u5546\u54c15","all_out_num":"10","out_day":"2015-07-24"},
       {"goods_code":"\u6d4b\u8bd5\u5546\u54c12","all_out_num":"20","out_day":"2015-07-24"},
       {"goods_code":"\u6d4b\u8bd5\u5546\u54c13","all_out_num":"56","out_day":"2015-07-24"},
       {"goods_code":"\u6d4b\u8bd5\u5546\u54c13","all_out_num":"30","out_day":"2015-07-25"},
       {"goods_code":"\u6d4b\u8bd5\u5546\u54c14","all_out_num":"36","out_day":"2015-07-30"}];*/
       var sleng = data.length;
       var out_num = "";
       var out_day = []; // 出货日期
       var goods_code = []; 
       var all_out_num = [];
       var out_day = [];
       var out_day_lin = []; 
       var goods_code_lin = [];
       var order =[];
       for(i=0;i<sleng;i++){
                goods_code_lin.push(data[i].goods_code);
                all_out_num.push(data[i].all_out_num);
                out_day_lin.push(data[i].out_day);
            // 获取不重复的的产品
            if($.inArray(data[i].goods_code,goods_code)<0){
                goods_code.push(data[i].goods_code);
            }
            // 获取不重复的的日期
            if($.inArray(data[i].out_day,out_day)<0){
                out_day.push(data[i].out_day);
            }
            // 获取产品序列
            var aaa = $.inArray(goods_code_lin[i],goods_code)
            order.push(aaa);                 
       };
       var ddd=[];
       for(i=0;i<goods_code.length;i++){
            ddd[i]=new Object();
            ddd[i].type='line';
            ddd[i].name=goods_code[i];
            ddd[i].data=[];
            for(a=0;a<out_day.length;a++){
                ddd[i].data.push(0);
            }
            for(j=0;j<sleng;j++){
                // 获取序列日期中  确ding是哪天
                n = $.inArray(out_day_lin[j],out_day);
                if(i==order[j]){
                    ddd[i].data.splice(n,1,all_out_num[j])
                }
            }                            
       }
        // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('main')); 
        
        var option = {
			toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
            tooltip: {
                show: true
            },
            legend: {
                data:goods_code
            },
            xAxis : [
                {
                    type : 'category',
                    data : out_day
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : ddd
        };

        // 为echarts对象加载数据 
        myChart.setOption(option); 
	}
    </script>
    {/literal}
<div class="tips">
【说明】输入商品代码查看出库走势（中国日结）。
<br>&nbsp;&nbsp;最多支持5种商品。</div>
</body>
</html>