<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>悠茗铺子</title>
		<link rel="stylesheet" href="${ctx }/assets/css/Site.css" />
		<link rel="stylesheet" href="${ctx }/assets/css/zy.all.css" />
		<link rel="stylesheet" href="${ctx }/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/assets/css/amazeui.min.css" />
		<link rel="stylesheet" href="${ctx }/assets/css/admin.css" />
		<link rel="shortcut icon" href="${ctx }/assets/images/logo.ico" type="image/x-icon">
	</head>
	<body>
			<div class="am-cf admin-main" style="padding-top: 0px;">
			<!-- content start -->
			
	<div class="am-cf admin-main" style="padding-top: 0px;">
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body" style="background: url(${pageContext.request.contextPath }/assets/images/banner.jpg)">
				
				<div class="am-g" style="margin-top: 200px;margin-left: 200px;">
					<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
						
					</div>
					<div class="am-u-sm-12 am-u-md-6 am-u-md-pull-4"
						style="padding-top: 30px;">
						<form class="am-form am-form-horizontal"
							action="${pageContext.request.contextPath }/updatePsw" method="post">
						
							<div class="am-form-group">
								<label for="uname" class="am-u-sm-3 am-form-label">
								用户名：</label>
								<div class="am-u-sm-9">
									<input type="text" id="uname" required
										placeholder="用户名" name="uname">
										<small>需要找回的用户名...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="upassword" class="am-u-sm-3 am-form-label">
								新密码：</label>
								<div class="am-u-sm-9">
									<input type="password" id="upassword" required
										placeholder="新密码" name="upassword">
										<small>新密码...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="upassword" class="am-u-sm-3 am-form-label">
								确认密码：</label>
								<div class="am-u-sm-9">
									<input type="password" id="upassword1" required
										placeholder="密码" name="upassword1">
										<small id="password">再次输入你的密码...</small>
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<input type="submit" class="am-btn am-btn-success" value="修改" />
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
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
	$(function() {
	    
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
</html>

