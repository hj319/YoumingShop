<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>悠茗铺子</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="shortcut icon" href="${ctx}/assets/images/logo.ico" type="image/x-icon">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pagination.css">
</head>
<body>
    <!-- main header start -->
    <div class="pa-main-header pa-head-three">
        <div class="container-fluid">
            <div class="row"> 
                <div class="col-md-3 col-6">
                    <div class="pa-logo">
                        <a href="index"><img src="${pageContext.request.contextPath }/assets/images/logo.png" alt="image" class="img-fluid"/></a>
                    </div>
                </div>
                <div class="col-md-9 col-6">
                    <div class="pa-nav-bar" style="margin-top: 10px;">
                        <div class="pa-menu">
                            <ul s>
                            	<li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                                <li><a href="${pageContext.request.contextPath}/shop">购物</a></li>
                                <li><a href="${pageContext.request.contextPath}/getBlogList">博客</a></li>
                                <li><a href="${pageContext.request.contextPath}/jsp/about.jsp">关于/联系我们</a></li>
                                
                            </ul>
                        </div>
                        <div class="pa-head-icon">
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath }/getCartList"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <g>
                                        <path d="M507.519,116.384C503.721,111.712,498.021,109,492,109H129.736l-1.484-13.632l-0.053-0.438C121.099,40.812,74.583,0,20,0
                                            C8.954,0,0,8.954,0,20s8.954,20,20,20c34.506,0,63.923,25.749,68.512,59.928l23.773,218.401C91.495,327.765,77,348.722,77,373
                                            c0,0.167,0.002,0.334,0.006,0.5C77.002,373.666,77,373.833,77,374c0,33.084,26.916,60,60,60h8.138
                                            c-2.034,5.964-3.138,12.355-3.138,19c0,32.532,26.467,59,59,59s59-26.468,59-59c0-6.645-1.104-13.036-3.138-19h86.277
                                            c-2.034,5.964-3.138,12.355-3.138,19c0,32.532,26.467,59,59,59c32.533,0,59-26.468,59-59c0-32.532-26.467-59-59-59H137
                                            c-11.028,0-20-8.972-20-20c0-0.167-0.002-0.334-0.006-0.5c0.004-0.166,0.006-0.333,0.006-0.5c0-11.028,8.972-20,20-20h255.331
                                            c35.503,0,68.084-21.966,83.006-55.962c4.439-10.114-0.161-21.912-10.275-26.352c-10.114-4.439-21.912,0.161-26.352,10.275
                                            C430.299,300.125,411.661,313,392.331,313h-240.39L134.09,149h333.308l-9.786,46.916c-2.255,10.813,4.682,21.407,15.495,23.662
                                            c1.377,0.288,2.75,0.426,4.104,0.426c9.272,0,17.59-6.484,19.558-15.92l14.809-71C512.808,127.19,511.317,121.056,507.519,116.384
                                            z M399,434c10.477,0,19,8.523,19,19s-8.523,19-19,19s-19-8.523-19-19S388.523,434,399,434z M201,434c10.477,0,19,8.524,19,19
                                            c0,10.477-8.523,19-19,19s-19-8.523-19-19S190.523,434,201,434z"></path>
                                    </g>
                                    </svg>
                                    <!-- <span></span> --></a>
                                </li>
                                <li class="pa-user-login" data-toggle="modal" data-target="#loginModel"> </li>
                                 <c:if test="${empty loginUser}" var="isNull">
                                    <li><a href="${ctx }/jsp/login.jsp"><img src="/imgUrl/headImage/user (5).png" class="img-circle" class="img-circle" style=" height:30px;width:30px;border-radius: 50%;"></a></li>
                                </c:if>
                                <c:if test="${!isNull}">
                                	<c:if test="${empty loginUser.headImage }" var="isMo">
                                       <img src="/imgUrl/headImage/user (5).png" class="img-circle" class="img-circle" style=" height:30px;width:30px;border-radius: 50%;">
                                   </c:if> 
                                    <c:if test="${!isMo }">
                                    <li><img src="/imgUrl/headImage/${loginUser.headImage }" class="img-circle" style=" height:30px;width:30px;border-radius: 50%;"></li>
                                    </c:if>
                                     <li  class="pa-menu-child">${loginUser.uname }
	                                    <ul class="pa-submenu">
	                                    	<li><a href="${pageContext.request.contextPath}/findByUid?uid=${loginUser.uid }">账号信息</a></li>
	                                	 	<li><a href="${pageContext.request.contextPath}/getCartList">购物车</a> </li>
	                                        <li><a href="${pageContext.request.contextPath}/order/getOrderList">订单</a></li>
	                                        <li><a href="${pageContext.request.contextPath}/jsp/order-inquire.jsp">订单查询</a></li>
	                                    	<li><a  href="${pageContext.request.contextPath}/Collect">我的收藏</a></li>
	                                    	 <li><a href="${pageContext.request.contextPath}/getInfo?uid=${loginUser.uid }">我的消息</a></li>
	                                	 	<li><a style="color: black; text-decoration: none;" href="${ctx }/outLogin">退出</a></li>
	                                	 </ul>
                                	 </li>
                                 </c:if>
                             </ul>
                            <div class="pa-toggle-nav">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>