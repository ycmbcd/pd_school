<!doctype html>
<html>
<head></head>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" >
<link href="style/basic.css" rel="stylesheet" type="text/css" >
<link href="style/index.css" rel="stylesheet" type="text/css" >
<body style="background: url(images/bg_1_1920.jpg) center -100px no-repeat;" >

<div class="container">
	<div class="row">
		<div id="login" class="col-lg-offset-4 col-lg-4" >
			<form class="navbar-form navbar-left" >
				<div class="form-group">
					<!--name-->
					<input id="username" name="username" class="form-control" placeholder="请输入用户名"><br />
					<input id="password" name="password" class="form-control" placeholder="请输入用户名">
				</div>
				<div>
					<input type="button" id="login_btn" class="btn btn-default" value="登入" />
					<a href="newuser.html"><input type="button" class="btn btn-default" value="注册" /></a>
				</div>
				
			</form>	
		</div>
	</div>
</div>







<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="myModal_login_error" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">      
      <div class="modal-body txt_center">
		用户名或密码错误
      </div>     
    </div>
  </div>
</div>


<script src="js/jquery.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/ajax.js"></script>
<script>
$(function(){
	//$('#myModal_2').modal('show');
})
</script>
</body>
</html>
