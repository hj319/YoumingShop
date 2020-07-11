<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/jsp/common/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/images/logo.ico" type="image/x-icon">
    <style type="text/css">
       .big{
          padding-top: 70px;
          padding-left: 300px;
          padding-bottom: 100px;
          
       }
       .col{
          width: 70%;
       }
       .btn{
           margin-left: 550px;
           background-color: #51acaa;
       }
       #imgG{
           float: right;
           margin-top: -350px;
       }
    </style>
</head>
<body>
	<div class="pa-main-wrapper">
    <!-- main header start -->
   
    <!-- main header end -->
    <!-- breadcrumb start -->
    <div class="pa-breadcrumb">
        <div class="container-fluid">
            <div class="pa-breadcrumb-box">
                <h1>我的消息</h1>
                <ul>
                    <li><a href="${pageContext.request.contextPath }/index">首页</a></li>
                    <li>我的消息</li>
                </ul>
            </div>
        </div>
    </div>
    <div  class="big">
		<div class="col">
			<%-- <div class="pa-blog-sidebar">
			<!-- 消息start -->
				<div class="pa-widget pa-shop-category">
					<h2 class="pa-sidebar-title">我的消息</h2>
					<ul>
					<c:forEach items="${info}" var="i"> 
						<li>
 							<div class="pa-pro-wid-content">
								<h4>我的留言：</h4>
								<p>${i.ititle }</p>
								<h4>我的回复：</h4>
								<p>${i.reply }</p>
							</div>
						</li>
					 </c:forEach>
					</ul>
				</div>
				<!-- 消息end -->
			</div> --%>
			       <div class="pa-blog-comnt">
                        <h2 class="pa-cmnt-title">我的消息</h2>
                       <ul>
                          <c:forEach items="${info}" var="i"> 
                            <li id="add">
                                <div class="pa-cmnt-box">
                                    <div class="pa-cmnt-img">
                                         <img src="/imgUrl/headImage/${i.user.headImage }" alt="image" class="img-fluid"/>
                                    </div>
                                    <div class="pa-cmnt-content">
                                        <h3>${i.ititle }</h3>
                                            <p><span class="pa-cmnt-date"></span><span class="pa-cmnt-time"><fmt:formatDate value="${i.sendTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></span></p>
                                        <p>${i.infor }</p>
                                    </div>
                                </div>
                                 <ul>
                                    <li>
                                        <div class="pa-cmnt-box">
                                            <div class="pa-cmnt-img">
                                                <!-- <img src="assets/images/user.jpg" alt="image" class="img-fluid"/> -->
                                                <p>客服：</p>
                                            </div>
                                            <div class="pa-cmnt-content">
                                                <p>${i.reply }</p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            </c:forEach>
                        </ul> 
                    </div>
		</div>
    </div>
    </div>
</body>
</html>
<%@include file="/jsp/common/foot.jsp" %>