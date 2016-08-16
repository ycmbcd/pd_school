// 登入

$(document).ready(function(){
	$("#login_btn").click(function(){
		var msg = $("#login form input").serialize();		
		$.ajax({
			url:"log_in.php",
			type:"POST",
			data:msg,
			//dataType:"json",
			success:function(data){
				if(data=="ok"){
					window.location='show.php';
				}else{
					$('#myModal_login_error').modal('show');
					setTimeout(function(){
						$('#myModal_login_error').modal('hide');
					},2000)
				}
				
			},
			error:function(){
				alert("ajax没有连接到");
			}
		})
	})
});


// 导出全部数据  接受数据位json格式 课直接使用
function aaa(){
	$.ajax({
        type: "post",
        url: 'show.php',        
        data:"aaa=1",
        dataType: "json",  //指接受php传回的数据类型
        success: function (result) {     
            $.each(result,function(index,json){
            	$("#aaashow").append($("<div>"+"no."+(index+1)+json.name+"</div>"))
            })
        },
        error: function () {
           alert("ajax连接错误");
        }
    });
}
// 接收数据位字符串格式  再进行转换
function bbb(){
	$.ajax({
        type: "post",
        url: 'show.php',        
        data:"bbb=1",
        //dataType: "json",  //指接受php传回的数据类型
        success: function (result) {    
        	var obj = $.parseJSON(result)
        	alert(obj[1].name)
        },
        error: function () {
           alert("ajax连接错误");
        }
    });
}