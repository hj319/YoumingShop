<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Pure Ayurveda - Responsive HTML Template</title>
		<link rel="stylesheet" href="${ctx }/assets/css/Site.css" />
		<link rel="stylesheet" href="${ctx }/assets/css/zy.all.css" />
		<link rel="stylesheet" href="${ctx }/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/assets/css/amazeui.min.css" />
		<link rel="stylesheet" href="${ctx }/assets/css/admin.css" />
				
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css">
    <link rel="shortcut icon" href="${ctx}/assets/images/logo.ico" type="image/x-icon">
	</head>
	<body>
			<!-- content start -->
	<div class="am-cf admin-main" style="padding-top: 0px;">
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body" style="background: url(${pageContext.request.contextPath }/assets/images/banner.jpg)">
				<div class="am-g" style="margin-left: 100px;">
					<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
					</div>
					<div class="am-u-sm-12 am-u-md-4 am-u-md-pull-4"
						style="padding-top: 30px;">
						<form class="am-form am-form-horizontal" method="post" action="${pageContext.request.contextPath }/registerUser" enctype="multipart/form-data">
							<div class="am-form-group">
								<label for="uname" class="am-u-sm-3 am-form-label">用户名：</label>
								<div class="am-u-sm-9">
									<input type="text" id="uname" required placeholder="用户名" name="uname">
									<small>输入你的用户名...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="uname" class="am-u-sm-3 am-form-label">默认头像：</label>
								<div class="am-u-sm-9">
									<img src="/imgUrl/headImage/user (5).png" class="img-circle" style=" height:50px;width:50px;border-radius: 40%;">
									<small>登录后可修改头像...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="uname" class="am-u-sm-3 am-form-label">用户邮箱：</label>
								<div class="am-u-sm-9">
									<input type="text" id="uemail" required placeholder="用户邮箱" name="uemail">
									<small id="email">输入你的邮箱...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="uphone" class="am-u-sm-3 am-form-label">密码：</label>
								<div class="am-u-sm-9">
									<input type="password" id="upassword" required placeholder="密码" name="upassword">
									<small>输入你的密码...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="uphone" class="am-u-sm-3 am-form-label">确认密码：</label>
								<div class="am-u-sm-9">
									<input type="password" id="upassword1" required placeholder="确认密码" name="upassword1">
									<small id="password">再次输入你的密码...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="uname" class="am-u-sm-3 am-form-label">用户电话：</label>
								<div class="am-u-sm-9">
									<input type="text" id="uphone" required placeholder="用户电话" name="uphone" />
									<small>输入你的电话...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="uname" class="am-u-sm-3 am-form-label">用户地址：</label>
								<div class="am-u-sm-9">
									<input type="text" id="uaddress" required placeholder="用户地址" name="uaddress">
									<small>输入你的地址...</small>
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<!-- <input type="submit" class="am-btn am-btn-success" value="注册" onclick="reg()"/> -->
									<button class="am-btn am-btn-success" id="addUser" onclick="reg()" type="submit">注册</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<footer class="admin-content-footer">
			<hr>
			<p class="am-padding-left"></p>
			</footer>
		</div>
		<!-- content end -->
	</div>
		<!-- end-->
	<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/SmoothScroll.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/swiper.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
	$(function() {
	    //验证邮箱
	    $('#uemail').blur(function() {
	        var uemail = $('#uemail').val();
	        var re = /^\w+@[0-9a-z]+\.[a-z]+$/i;
	        if(uemail.length != 0 && re.test(uemail)) {
	        	$('#email').html("邮箱格式正确");
	        	$('#email').css("color","green");
	        } else {
	        $('#email').html("请输入邮箱或邮箱格式不正确");
	        $('#email').css("color","red");
	        }
	    });
	    $('#upassword1').blur(function() {
	        var  password1= $('#upassword').val();
	        var  password2= $('#upassword1').val();
	        if(password2.length != 0 && password2 == password1) {
	        	$('#password').html("两次密码一致");
	        	$('#password').css("color","green");
	        } else {
	        $('#password').html("请输入密码或两次密码不一致");
	        $('#password').css("color","red");
	        }
	    });
	});
	</script>
	</body>
	
</html>
