
$("document").ready(function(){
	$("tr").css("background-color","#B2E0FF !important");
	// //右键功能
	// $(document).bind("contextmenu",function(e){
	// 	//获取鼠标位置
	// 	x=e.screenX;
	// 	y=e.screenY;
	// 	x=x-366;
	// 	y=y-266;
	// 	$(".right_menu").remove();
	// 	$("body").append($('<div class="right_menu"></div>')); 
	// 	$(".right_menu").append($('<ul><li onclick="reloadme()">刷新</li><li onclick="parent.logout()" style="border-bottom:none;">退出</li></ul>')); 
	// 	$(".right_menu").show();
	// 	$(".right_menu").css({left:x+"px",top:y+"px"});
	// 	return false; 
	// })
	//空点击事件
	$("body").click(function(){
		$(".right_menu").hide();
	})
})

//-------------------功能------------------------
//局部刷新
function reloadme(){
	location.reload();
}
//登录验证
function check_login(){
	var u_num = $("#u_num").val().toString();
	var u_pwd = $("#u_pwd").val().toString();
	if(u_num == ""){
		$(".txt_msg").html("请输入工号！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
		$("#u_num").focus();
	}else if(u_pwd == ""){
		$(".txt_msg").html("请输入密码！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
		$("#u_pwd").focus();
	}else{
		//序列化表单值
		var login_key = $(".login_input").serialize();
		$.ajax({
			type:"POST",
			url:"index.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			data: login_key,
			success:function(data){
				if(data=="go"){
					window.location='show.php';
					$(".juhua").hide();
				}else{
					$(".txt_msg").html("用户名或密码不正确！");
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
					$(".login_input").val("");
					$(".juhua").hide();
					$("#u_num").focus();
				}    
            } 
		})
	}
}
//验证账户提示
function change_me(){
	var new_name = $("#new_name").val();
	var old_pwd = $("#old_pwd").val();
	var new_pwd = $("#new_pwd").val();
	var re_pwd = $("#re_pwd").val();
	if(new_name==""){
		$("#tip_new_name").show();
	}else{
		$("#tip_new_name").hide();
	}
	if(old_pwd!=="" && old_pwd.length<6){
		$("#tip_old_pwd").show();
	}else{
		$("#tip_old_pwd").hide();
	}
	if(new_pwd!=="" && new_pwd.length<6){
		$("#tip_new_pwd").show();
	}else{
		$("#tip_new_pwd").hide();
	}
	if(re_pwd!=="" && re_pwd.length<6){
		$("#tip_re_pwd").html("重复密码！");
		$("#tip_re_pwd").show();
		$("#tip_re_pwd").css({
			"color":"red"
		})
	}else if(re_pwd.length>=6 && re_pwd!==new_pwd){
		$("#tip_re_pwd").html("密码不匹配！");
		$("#tip_re_pwd").show();
		$("#tip_re_pwd").css({
			"color":"red"
		})
	}else if(re_pwd.length>=6 && re_pwd===new_pwd){
		$("#tip_re_pwd").html("OK");
		$("#tip_re_pwd").show();
		$("#tip_re_pwd").css({
			"color":"green"
		})
	}else{
		$("#tip_re_pwd").hide();
	}
}
function check_change_me(){
	var u_num = $("#u_num").val();
	var new_name = $("#new_name").val();
	var old_pwd = $("#old_pwd").val();
	var new_pwd = $("#new_pwd").val();
	var re_pwd = $("#re_pwd").val();
	if(old_pwd.length>=6 && new_pwd.length>=6 && new_pwd===re_pwd){
		$.ajax({
			type:"POST",
			url:"sys_1.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			data:{change_all:"go",u_num:u_num,new_name:new_name,new_pwd:new_pwd,old_pwd:old_pwd},
			success:function(data){
				if(data=="ok"){
					$(".txt_msg").html("信息修改成功，请重新登录！");
					$(".msg").css({"width":"400px","margin-left":"-200px","background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
					$(".msg").stop(true,true).show(200).delay(2000).fadeOut(200,function(){
						window.open("/show.php?logout","_top");
						$(".juhua").hide();
					});
				}else{
					$(".txt_msg").html("原始密码不正确！");
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
					$("#old_pwd").val("");
					$("#old_pwd").focus();
					$(".juhua").hide();
				}
            }
		})
	}/*else if(new_name!=="" && old_pwd.length>=6 && new_pwd=="" && re_pwd==""){
		$.ajax({
			type:"POST",
			url:"sys_1.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			data:{change_name:"go",u_num:"1000",new_name:new_name,old_pwd:old_pwd},
			success:function(data){
				if(data=="ok"){
					$(".txt_msg").html("名字修改成功！");
					$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200,function(){
						window.open("/show.php","_top");
						$(".juhua").hide();
					});
				}else{
					$(".txt_msg").html("原始密码不正确！");
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
					$("#old_pwd").val("");
					$("#old_pwd").focus();
					$(".juhua").hide();
				}
            }
		})
	}*/else{
		$(".txt_msg").html("输入有误！");
		$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
		return false;
	}
}
//添加员工
function add_user(){
	var user_key = $(".add_listkey").serialize();
	$.ajax({
		type:"POST",
		url:"sys_2.php",
		beforeSend:function(){
			$(".juhua").show();
		},
		data: user_key,
		success:function(data){
			alert(data)
			if(data=="ok"){
				$(".juhua").hide();
				$(".txt_msg").html("添加成功！");
				$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200,function(){
					location.reload();
				});
			}else{
				$(".txt_msg").html("添加错误！");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				$(".juhua").hide();
			}    
        } 
	})
}
//管理员账户修改
function change_user(u_num){
	change_num = "change_"+u_num;
	var change_info = $("#"+change_num+" "+".change_userkey").serialize();
	$.ajax({
		type:"POST",
		url:"sys_2.php",
		beforeSend:function(){
			$(".juhua").show();
		},
		data: change_info,
		success:function(data){
			if(data=="ok"){
				$(".juhua").hide();
				$(".txt_msg").html("修改成功！");
				$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200,function(){
					location.reload();
				});
			}else{
				$(".txt_msg").html("修改失败！");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				$(".juhua").hide();
			}    
        }
	})
}
//添加自定义工种
function new_group(){
	var new_group = $("#new_group").serialize();
	$.ajax({
		type:"POST",
		url:"sys_3.php",
		beforeSend:function(){
			$(".juhua").show();
		},
		data: new_group,
		success:function(data){
			if(data=="ok"){
				$(".juhua").hide();
				$(".txt_msg").html("成功新建一个工种！");
				$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200,function(){
					location.reload();
				});
			}else{
				$(".txt_msg").html("新建失败！");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				$(".juhua").hide();
			}    
        }
	})
}

//物料重复检测
function check_addcode(){
	var check_code = $('#add_code').val();
	$.ajax({
		type:"POST",
		url:"pro_1.php",
		beforeSend:function(){
			$(".juhua").show();
		},
		data:"check_code="+check_code,
		success:function(data){
			if(data=="has"){
				$("#warning_text").html("已经存在此【条形码】！");
				$("#add_code").focus();
				alertme();
			}else{
				//没事儿
			}    
        }
	})
}


//弹框修改B库存
function inner_change_b_repo(){
	var now_page = $('#now_page').html();
	var o_code = $('#o_code').val();
	var c_b_repo = $('#c_b_repo').val();
	var c_b_warning = $('#c_b_warning').val();
	if(c_b_repo==""){
		alert("请输入完整！");
		return false;
	}else{
		$.ajax({
			type:"GET",
			url:"japan_3.php",
			beforeSend:function(){
				$(".juhua").show();
			},
			data:"o_code="+o_code+"&c_b_repo="+c_b_repo+"&c_b_warning="+c_b_warning,
			success:function(data){
				if(data=="ok"){
					change_page(now_page,0);
					$(".inner_alert").stop(true,true).fadeOut(200);
					$(".inner_box").stop(true,true).fadeOut(200);
				}else{
					$(".txt_msg").html("修改失败！");
					$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
					$(".juhua").hide();
				}    
	        }
		})
	}
}
//删除商品类型
function del_goodstype(){
	var now_page = $('#now_page').html();
	var o_code = $('#o_code').val();
	$.ajax({
		type:"GET",
		url:"pro_2.php",
		beforeSend:function(){
			$(".juhua").show();
		},
		data:"del="+o_code,
		success:function(data){
			if(data=="ok"){
				$(".txt_msg").html("删除成功！");
				$(".msg").css({"background":"#DDFFDE","border-color":"#60BE8F","color":"#000"});
				$(".msg").stop(true,true).show(200).delay(500).fadeOut(200);
				$(".juhua").hide();
				$(".inner_alert").stop(true,true).fadeOut(200);
				$(".inner_box").stop(true,true).fadeOut(200);
				change_page(now_page,0);
			}else{
				$(".txt_msg").html("删除失败！");
				$(".msg").stop(true,true).show(200).delay(1000).fadeOut(200);
				$(".juhua").hide();
			}    
        }
	})
}
