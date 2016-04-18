<!DOCTYPE html>
<html>
<head>
<meta charset="utf8" />
<title>{$sitename}</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/js.js"></script>
<script>
$(document).ready(function(){
	//随机换壁纸
	var snum = parseInt(3*Math.random());
	snum = snum-0;
	surl = "url('/images/bg"+snum+".jpg') no-repeat center center fixed"
	$("body").css("background",surl);
})
</script>
</head>
<body>
<div class="toper">
	<div class="w1300 auto">
        <div class="toper_left f_left">
        	<img src="/images/anto.jpg" />
        </div>
        <div class="f_left toper_title">ANTO RESPOSITORY SYSTEM <span style="font-size:14px;">（v1.0 | Alpha10.9）</span></div>
        <div class="toper_right f_right">
        	<div class="f_left">
                <div class="toper_name"><img style="margin-bottom:-3px;margin-right:6px;" src="/images/login_user.png" />{$u_name}</div>
            </div>
            <div class="f_left">
                <div class="toper_name"><img style="margin-bottom:-3px;margin-right:6px;" src="/images/login_num.png" />{$u_num}</div>
            </div>
            <div class="f_left">
                <div class="toper_name"><img style="margin-bottom:-3px;margin-right:6px;" src="/images/login_group.png" />{$u_group}</div>
            </div>
            <div class="f_left">
                <a href="show.php?logout"><div class="toper_out"></div></a>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="msg msg_fix">
	<div class="txt_msg"></div>
</div>
<div class="juhua"></div>