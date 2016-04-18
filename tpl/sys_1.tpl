<html>
<head>
<title>密码修改</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script>
$(document).keypress(function(e) {  
    // 回车键事件  
       if(e.which == 13) {  
   			check_change_me(); 
       }  
}); 
</script>
</head>
<body>
<div class="msg">
	<div class="txt_msg"></div>
</div>
<div class="change_me auto" onKeyUp="change_me()">
    <ul>
        <li><div>我的工号：</div><input  type="text" id="u_num" value="{$u_num}" readonly class="w1_txt readonly" /></li>
        <li><div>我的名字：</div><input class="w1_txt readonly" type="text" id="new_name" value="{$u_name}" readonly /><span id="tip_new_name">请输入姓名!</span></li>
        <li><div>原始密码：</div><input class="w1_txt" type="password" id="old_pwd" /><span id="tip_old_pwd">原始密码大于6位!</span></li>
        <li><div>新的密码：</div><input class="w1_txt" type="password" id="new_pwd"  /><span id="tip_new_pwd">新密码大于6位!</span></li>
        <li><div>重复密码：</div><input class="w1_txt" type="password" id="re_pwd"  /><span id="tip_re_pwd"></span></li>
        <div class="clear"></div>
    </ul>
</div>
<div class="ok_bar">
	<div class="btn_yes auto" onClick="check_change_me()">确 定</div>
</div>
<div class="tips">
【修改密码】全部输入，点击确定。</div>
</body>
</html>