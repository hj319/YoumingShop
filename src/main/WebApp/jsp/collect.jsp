<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/jsp/common/head.jsp"%>
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
                <h1>我的收藏</h1>
                <ul>
                    <li><a href="${pageContext.request.contextPath }/index">首页</a></li>
                    <li>我的收藏</li>
                </ul>
            </div>
        </div>
    </div>
    <div  class="big">
		<div class="col">
			<div class="pa-blog-sidebar">
			<!-- 收藏商品 start -->
				<div class="pa-widget pa-shop-category">
					<h2 class="pa-sidebar-title">收藏的商品</h2>
					<ul>
					<c:forEach items="${pro }" var="p">
						<li>
							<div class="pa-pro-wid-img" style="width: 15%;height: 80px;">
       							<img src="/imgUrl/product/${p.product.img }" alt="image" class="img-fluid" style="width: 80px;height: 80px;">
							</div>
							<div class="pa-pro-wid-content" style="width: 85%; float: right;margin-top: -65px;">
								<h4><a href="productSingle?pid=${p.pid }">${p.product.pname }</a></h4>
								<h4>${p.product.describe }</h4>
								</div>
							<div class="toolbar-btn-action">
								<a href="delProCol?pid=${p.pid }"><button class="btn btn-w-md btn-round btn-primary">取消收藏</button></a>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<!-- 收藏商品end -->
				<!-- 收藏博客 start -->
				<div class="pa-widget pa-shop-category">
					<h2 class="pa-sidebar-title">收藏的博客</h2>
					<ul>
						<c:forEach items="${blog }" var="b">
						<li>
 							<div class="pa-pro-wid-content">
								<h4><a href="findByBid?bid=${b.bid }">${b.blog.btitle }</a></h4>
								<a href="delCol?bid=${b.bid }"><button class="btn btn-w-md btn-round btn-primary">取消收藏</button></a>
							</div>
						</li>
                        </c:forEach>
					</ul>
				</div>
				<!-- 收藏博客 end -->
			</div>
		</div>
    </div>
    </div>
</body>
</html>
<%@include file="/jsp/common/foot.jsp" %>