// 用户登入
function pd_login(){
	var login_msg = $("#login_box form").serialize();	
	$.ajax({
        type: "post",
        url: 'index.php',        
        data:login_msg,
        success: function (result) {
            if(result=="0"){
            	alert("输入不正确");
            }else{
            	location.href="show.php";
            }
        },
        error: function () {
           alert("ajax连接错误");
        }
    });
}
// 导出全部数据
function aaa(){
	$.ajax({
        type: "post",
        url: 'index.php',        
        data:"aaa=1",
        dataType: "json",  //指接受php传回的数据类型
        success: function (result) {         	
            $.each(result,function(index,json){
            	$("#aaashow").append($("<div>"+json.name+"</div>"))
            })
        },
        error: function () {
           alert("ajax连接错误");
        }
    });
}
