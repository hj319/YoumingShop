<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>悠茗铺子</title>
<style type="text/css">
#re_right{
    width: 150px;
    float: right;
    margin-top: -75px;
}
</style>
<!-- 引入bootstrap的资源信息 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/loginstyle.css">
<link rel="shortcut icon" href="${ctx}/assets/images/logo.ico" type="image/x-icon">
</head>
<body>
<div class="materialContainer">
	<div class="box">
		<div class="title" >登录</div>
		<form action="${pageContext.request.contextPath }/dologin" method="post">
		<div class="input">
			<label for="name">用户名</label>
			<input type="text" name="uname" value="" id="name">
			<span class="spin"></span>
		</div>
		<div class="input">
			<label for="pass">密码</label>
			<input type="password" name="upassword" value="" id="pass">
			<span class="spin"></span>
		</div>
	<div class="input">
			<label for="reregname">验证码</label>
			<input type="text" name="code" value="" id="reregname"/>
					<div id="re_right">
				        <a href="javascript:changeImg();"><img id="codeImg" src=""/>看不清</a>
			        </div>
			<span class="spin"></span>
		</div> 
		<div class="button login">
			<button type="submit">
				<span>登录</span>
				<i class="fa fa-check"></i>
			</button>
		</div>
		</form>
		<a href="${pageContext.request.contextPath }/jsp/updatePwd.jsp" class="pass-forgot">忘记密码？</a>
		<a href="register.jsp" class="pass-forgot">注册一个新账号</a>
	</div>
</div>
<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/loginindex.js"></script>
<script type="text/javascript">
$(function(){
	changeImg();
 });
    // 定义一个当src发生改变时就到后台去获得一个随机的验证码
	function changeImg() {
		// 获得验证码图片元素 使用JavaScript获得
		var img = document.getElementById("codeImg");
		// 当src的路径发生改变，都会到后台去请求一次
		// new Date().getTime() 避免浏览器不去后台请求数据，因为有缓存
		img.src="${pageContext.request.contextPath}/CodeImg?"+new Date().getTime();
	}	
</script>
</body>
</html>