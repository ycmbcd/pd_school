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