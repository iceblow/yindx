<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
	<div class="main">
		<!-- 背景 -->
		<img src="../images/login_bg.png" class="background">
		<!-- 主页内容 -->
		<div class="mainWrapper">
			<!-- 标题 -->
			<div class="title">智慧安防管理平台登录</div>
			<!-- 登录框 -->
			<div class="loginBox">
				<div class="inputBox">
					<img src="../images/login_user.png" class="icon">
					<img src="../images/login_shuxian1X28.png" class="line">
					<input class="ipt" id="username" type="text">
<!-- 					<span class="spanholder">请输入用户名或手机号</span> 	 -->
				</div>
				<div class="inputBox inputBoxBottom">
					<img src="../images/login_password.png" class="icon">
					<img src="../images/login_shuxian1X28.png" class="line">
					<input class="ipt" id="password" type="password">
					<span class="spanholder">请输入密码</span> 	
				</div>
				<!-- 记住 -->
				<div class="rememberBox">
					<img src="../images/noselect.png" class="normalP">记住密码
				</div>
				<!-- 登录 -->
				<div class="loginBtn" onclick="login()">登录</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>	
	<script type="text/javascript">
		$(document).ready(function(){
			//记住密码
			$('.normalP').click(function() {
				if($(this).attr('src') == '../images/noselect.png'){
					$(this).attr('src','../images/selecting.png');
				} else {
					$(this).attr('src','../images/noselect.png');
				}				
			});
			//input在ie8下placeholder的兼容写法
			$('#username').focusout(function(e){
				if (this.value == '') {	
					this.value = '请输入用户名或手机号';
					$(this).css('color','#c3c3c3');
				}
			});
			$('#username').focusin(function(e){
				if (this.value == '请输入用户名或手机号') {
					this.value = '';
					$(this).css('color','#000');
				}
			});
			$('#password').focusout(function(e){
				if (this.value == '') {	
					$('.spanholder').show();
				}
			});
			$('#password').focusin(function(e){
				$('.spanholder').hide();
			});
			$('.spanholder').click(function(){
				$('.spanholder').hide();
				$('#password').focus();
			});
			$('#password').css('color','#000');
			$('#username').focusout();
			$('#password').focusout();
		});
		
		function login(){
// 			alert(111);
			var username = $("#username").val();
			if(!username){
				alert("请输入用户名");
				return;
			}
			var password = $("#password").val();
			if(!password){
				alert("请输入密码");
				return;
			}
			$.ajax({
				url:'./login',
				data:{loginid:username,password:password},
				type:'post',
				dataType:'json',
				success:function(msg){
					var data = eval("("+msg+")");
// 					console.log(eval("("+msg+")").code);
					if(data.code==0){
						alert(data.message);
					}else{
						alert("登录成功！");
						location.href = '../equipment/equipment';
					}
				}
			})
		}
	</script>
</body>
</html>