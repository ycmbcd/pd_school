<html>
<head>
<title>系统日志</title>
<link href="/style/index.css" rel="stylesheet" type="text/css" />
<link href="/style/warning.css" rel="stylesheet" type="text/css" />
{literal}
<style>
.clog ul{
    padding:10px 0;
    border-bottom: 1px dashed #333;
}
.clog li{
    font-size: 14px;
    border:1px solid #333;
    padding:0px 10px 0px 10px;
    margin-right: 30px;
    background: #FFF;
    color: #000;
}
.clog li:hover{
    background: #3D3F42;
    color: #FFF;
}
</style>
{/literal}
</head>
<body>
<div class="add_list clog">
	<ul>
    	<a href="sys_5.php?show_goods_type"><li>物料日志</li></a>
    	<a href="sys_5.php?del_goods_type"><li>清空</li></a>
    	<a href="/log/goods_type.txt" download="goods_type.txt"><li>下载</li></a>
    	<div class="clear"></div>
    </ul>
    <ul>
    	<a href="sys_5.php?show_add_CH"><li>中国采购日志</li></a>
    	<a href="sys_5.php?del_add_CH"><li>清空</li></a>
    	<a href="/log/add_CH.txt" download="add_CH.txt"><li>下载</li></a>
    	<div class="clear"></div>
    </ul>
    <ul>
    	<a href="sys_5.php?show_add_JP"><li>日本采购日志</li></a>
    	<a href="sys_5.php?del_add_JP"><li>清空</li></a>
    	<a href="/log/add_JP.txt" download="add_JP.txt"><li>下载</li></a>
    	<div class="clear"></div>
    </ul>
    <ul>
        <a href="sys_5.php?show_repo_CH"><li>中国仓库日志</li></a>
        <a href="sys_5.php?del_repo_CH"><li>清空</li></a>
        <a href="/log/repo_CH.txt" download="repo_CH.txt"><li>下载</li></a>
        <div class="clear"></div>
    </ul>
    <ul>
        <a href="sys_5.php?show_repo_JP"><li>日本仓库日志</li></a>
        <a href="sys_5.php?del_repo_JP"><li>清空</li></a>
        <a href="/log/repo_JP.txt" download="repo_JP.txt"><li>下载</li></a>
        <div class="clear"></div>
    </ul>
    <ul>
        <a href="sys_5.php?show_send_JP"><li>转运日本日志</li></a>
        <a href="sys_5.php?del_send_JP"><li>清空</li></a>
        <a href="/log/send_JP.txt" download="send_JP.txt"><li>下载</li></a>
        <div class="clear"></div>
    </ul>
    <ul>
        <a href="sys_5.php?show_out_CH"><li>中国发货日志</li></a>
        <a href="sys_5.php?del_out_CH"><li>清空</li></a>
        <a href="/log/out_CH.txt" download="out_CH.txt"><li>下载</li></a>
        <div class="clear"></div>
    </ul>
    <ul>
        <a href="sys_5.php?show_out_JP"><li>日本发货日志</li></a>
        <a href="sys_5.php?del_out_JP"><li>清空</li></a>
        <a href="/log/out_JP.txt" download="out_JP.txt"><li>下载</li></a>
        <div class="clear"></div>
    </ul>
</div>
</body>
</html>