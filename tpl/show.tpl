{include file="head.tpl" sitename="- ANTO库存管理系统 -"}
{literal}
<script type="text/javascript">
//nav切换
$(document).ready(function() {
	//权限判断
	$.ajax({
		url:"show.php",
		type:"GET",
		data:"cannot",
		dataType:"json",
		success:function(data){
		 var cantdostr = data[0].cantdo;
		 var cantdoarr = cantdostr.split(",");
		 for(i=0;i<cantdoarr.length;i++){
		 	$("#"+cantdoarr[i]).remove();
		 }
		 
		}
	})
	//鼠标右键取消
	$(document).bind("contextmenu",function(e){
		$(".right_menu").remove();
		return false;
	})	
		//默认第一个选中
		//$("#btn_0").addClass("onbg_nav")
		//默认left_1显示
		$(".leftbar").css({
			"display":"none"	
		})
		$("#left_0").css({
			"display":"block"	
		})
		//nav hover 事件
		$(".btn").hover(function(){
				if($(this).hasClass("onbg_nav")){	
				}else{
					$(this).addClass("hover_nav")
				}
			},function(){
				$(this).removeClass("hover_nav")
			}
		);
		//nav 点击事件
		$(".btn").click(function(){
			$(this).removeClass("hover_nav")
			$(".btn").removeClass("onbg_nav")
			$(this).addClass("onbg_nav")
			var left_num = $(this).attr("name");
			$(".leftbar").stop(true,true).fadeOut(200,function(){
				$(".leftbar").css({
					"display":"none"	
				})	
			});
			$("#"+left_num).stop(true,true).fadeIn(300,function(){
				$("#"+left_num).css({
					"display":"block"	
				})	
			});
		})
		//leftbar hover 事件
		$(".leftbar li").hover(function(){
				$(this).addClass("leftbar_hover")
			},function(){
				$(this).removeClass("leftbar_hover")
			}
		);
		//leftbar 点击事件
		$(".leftbar li").click(function(){
			var tag_id = $(this).attr('id');	//此处id为对应right_page文件名
			$("#right_page").stop(true,true).fadeOut(200,function(){
				$("#right_page").attr("src","./right/"+tag_id+".php");
			});
			$("#right_page").fadeIn(600);
			$(".leftbar li").removeClass("leftbar_checked")
			$(this).addClass("leftbar_checked")
		})
    });
	//退出
		function logout(){
			$.ajax({
			url:"show.php",
			type:"GET",
			data:"logout",
			success:function(data){
				window.location='index.php';
			}
		})
	}
</script>
{/literal}
<div class="bg_nav">
	<div class="nav auto">
    	<div id="btn_7" class="btn" name="left_7">物料管理</div>
        <div id="btn_1" class="btn" name="left_1">采购入仓</div>
        <div id="btn_2" class="btn" name="left_2">中国仓库</div>
        <div id="btn_3" class="btn" name="left_3">日本仓库</div>
        <div id="btn_4" class="btn" name="left_4">发货</div>
        <div id="btn_5" class="btn" name="left_5">统计报表</div>
        <div id="btn_6" class="btn" name="left_6">系统设置</div>
        <div style="background:#c2c2c2;width:1px;float:left;height:40px;"></div>
        <div class="clear"></div>
    </div>
</div>
<div class="show_bg">
	<div class="show_box">
		<div class="show_left f_left">
        	<ul id="left_7" class="leftbar">
	        	<li id="pro_1">新品编入</li>
                <li id="pro_2">物料操作</li>
                <li id="pro_3">自定义分类</li>
	        </ul>
	    	<ul id="left_1" class="leftbar">
	        	<li id="add_1">商品采购（中国）</li>
	        	<li id="add_1_1">导入采购单（中国）</li>
	            <li id="add_2">采购审核（中国）</li>
                <li id="add_2_1">采购清单（中国）</li>
                <li id="add_2_2">即将发货（中国）</li>
	            <li id="add_3">采购入库（中国）</li>
                <li id="add_4">商品采购（日本）</li>
                <li id="add_4_1">导入采购单（日本）</li>
	            <li id="add_5">采购审核（日本）</li>
                <li id="add_6_1">采购清单（日本）</li>
                <li id="add_6_2">即将发货（日本）</li>
	            <li id="add_7">采购入库（日本）</li>
	            <li id="add_8">采购日志（中国）</li>
	            <li id="add_9">采购日志（日本）</li>
	        </ul>
	        <ul id="left_2" class="leftbar">
	        	<li id="china_1">库存操作（中国）</li>
	            <li id="china_5">批量转运（中国）</li>
                <li id="china_2_1">转运审核（中国）</li>
                <li id="china_2_2">打印（中国）</li>
                <li id="china_3">转运在途（中国）</li>
                <li id="china_4">库存告急（中国）</li>
	        </ul>
	        <ul id="left_3" class="leftbar">
	        	<li id="japan_1">运送在途（日本）</li>
                <li id="japan_1_1">扫码收货（日本）</li>
                <li id="japan_2">转运入库（日本）</li>
	            <li id="japan_3">库存操作（日本）</li>
                <li id="japan_4">库存告急（日本）</li>
                <li id="japan_5">销量统计（日本）</li>
	        </ul>
            <ul id="left_4" class="leftbar">
	        	<li id="send_0">订单格式化</li>
	        	<li id="send_1">中国发货</li>
                <li id="send_2">日本发货</li>
                <li id="send_3">中国发货日志</li>
                <li id="send_4">日本发货日志</li>
                <li id="send_5">发货模板</li>
                <li id="send_6">中国退单</li>
                <li id="send_7">日本退单</li>
                <li id="send_8">佐川MAIL便(中)</li>
                <li id="send_9">佐川宅配便(中)</li>
                <li id="send_10">佐川MAIL便(日)</li>
                <li id="send_11">佐川宅配便(日)</li>
	        </ul>
            <ul id="left_5" class="leftbar">
	        	<li id="table_1">库存报表</li>
                <li id="table_2">入库统计（中国）</li>
                <li id="table_2_1">入库统计（日本）</li>
                <li id="table_3_1">出库统计（中国）</li>
	            <li id="table_3">出库统计（日本）</li>
                <li id="table_4">入库明细（中国）</li>
                <li id="table_4_1">入库明细（日本）</li>
                <li id="table_5">出库日结（中国）</li>
                <li id="table_5_1">出库日结（日本）</li>
                <li id="table_6">出库图表（中国）</li>
                <li id="table_7">出库图表（日本）</li>
                <li id="table_8">退单统计（中国）</li>
                <li id="table_9">退单统计（日本）</li>
	        </ul>
            <ul id="left_6" class="leftbar">
	        	<li id="sys_1">密码修改</li>
	            <li id="sys_2">工号操作</li>
                <li id="sys_3">自定义工种</li>
                <li id="sys_4">权限分配</li>
                <li id="sys_5">系统日志</li>
	        </ul>
	    </div>
	    <div class="show_right f_right eee">
	    	<iframe id="right_page" scrolling="auto" frameborder="0" src="./welcome.html" name="right"></iframe>
	    </div>
	    <div style="clear:both;"></div>
	</div>
</div>
<div style="height:100px; background:#F7F7F7;">
</div>
</body>
</html>