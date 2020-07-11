<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@include file="/jsp/common/head.jsp"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pure Ayurveda - Responsive HTML Template</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css">
   <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/images/logo.ico" type="image/x-icon">
	 <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css" />
	  <style type="text/css">
         #prodes{
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
     }	
    </style>
</head>
<body>
<!-- pre loader start -->
<div class="pa-preloader">
    <div class="pa-ellipsis">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<!-- pre loader end -->    
<!-- main wrapper start -->
<div class="pa-main-wrapper">
    <!-- breadcrumb start -->
    <div class="pa-breadcrumb">
        <div class="container-fluid">
            <div class="pa-breadcrumb-box">
                <h1>购物</h1>
                <ul>
                    <li><a href="index">首页</a></li>
                    <li>购物</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- breadcrumb end -->
    <!-- product start -->
    <div class="pa-product-shop spacer-top spacer-bottom">
        <div class="container" >
            <div class="row">
                <div class="col-lg-8 order-lg-last">
                    <div class="row">
                    <c:forEach items="${pageInfo.list }" var="p">
                        <div class="col-sm-6" >
                            <div class="pa-product-box">
                                <div class="pa-product-img">
                                    <img src="/imgUrl/product/${p.img }" alt="image" class="img-fluid" style="width:200px; height: 200px;"/>
                                </div>
                                <div class="pa-product-content">
                                    <h4><a href="productSingle?pid=${p.pid }">${p.pname }</a></h4>
                                    <p><del>￥ ${p.originalPrice }</del>￥ ${p.discountPrice }</p>
                                </div>
                                <div class="pa-product-cart">
                                    <ul>
                                        <li>
                                        
                                            <a href="javascript:void()" class="addCart">
                                             <input type="hidden" value="${p.pid }" class="pid">
                                              <input type="hidden" value="${p.originalPrice }" class="originalPrice">
                                              <input type="hidden" value="${p.discountPrice }" class="discountPrice">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 469.333 469.333">
                                                    <g>
                                                        <path d="M434.979,42.667H85.333c-1.053,0-2.014,0.396-3.001,0.693l-8.594-28.241C71.005,6.138,62.721,0,53.333,0H10.667
                                                            C4.776,0,0,4.776,0,10.667V32c0,5.891,4.776,10.667,10.667,10.667h26.865l66.646,219.01l-24.891,29.039
                                                            c-9.838,11.477-14.268,27.291-9.74,41.713c5.791,18.445,22.07,30.237,40.839,30.237H416c5.891,0,10.667-4.776,10.667-10.667
                                                            v-21.333c0-5.891-4.776-10.667-10.667-10.667H110.385l33.813-39.448c0.85-0.992,1.475-2.112,2.12-3.219h206.703
                                                            c16.533,0,31.578-9.548,38.618-24.507l74.434-158.17c2.135-4.552,3.26-9.604,3.26-14.615v-3.021
                                                            C469.333,58.048,453.952,42.667,434.979,42.667z"/>
                                                        <circle cx="128" cy="426.667" r="42.667"/>
                                                        <circle cx="384" cy="426.667" r="42.667"/>
                                                    </g>
                                                </svg>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">      
                                                    <img src="${pageContext.request.contextPath}/assets/images/collect01.png" style="width: 25px;height: 25px;" class="collect">
                                                    <input type="hidden" value="${p.pid }" class="pid">
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        </div>
                        <!--分页-->
		           		<div id="div_pagination_bottom">
					            <nav aria-label="Page navigation">
					                <ul class="pagination" style="float:right">
					                     <li>
					                         <a href="${pageContext.request.contextPath}/shop?currpage=${pageInfo.pageNum-1}"
					                           aria-label="Previous">
					                             <span aria-hidden="true">&laquo;</span>
					                         </a>
					                     </li>
					                     <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
					                         <c:if test="${page_Num == pageInfo.pageNum }">
					                             <li class="active"><a href="#" style="margin-top:7px;">${ page_Num}</a></li>
					                        </c:if>
					                         <c:if test="${page_Num != pageInfo.pageNum }">
					                            <li>
					                                 <a style="margin-top:7px;"  href="${pageContext.request.contextPath}/shop?currpage=${ page_Num}">${ page_Num}</a>
					                            </li>
					                        </c:if>
					                     </c:forEach>
					                    <li>
					                        <a href="${pageContext.request.contextPath}/shop?currpage=${pageInfo.pageNum+1}"
					                            aria-label="Next">
					                             <span aria-hidden="true">&raquo;</span>
					                         </a>
					                    </li>
					                </ul>
					            </nav>
					        </div>
		           		<!--分页-->
                </div>
                <div class="col-lg-4">
                    <div class="pa-product-sidebar">
                        <div class="pa-widget pa-search">
                        	<form action="shop" method="get">
	                            <input type="text" name="pname">
	                            <button class="pa-btn" type="submit">搜索</button>
                            </form>
                        </div>
                        <div class="pa-widget pa-shop-category">
                            <h2 class="pa-sidebar-title">分类</h2>
                            <ul>
                            <c:forEach items="${list1 }" var="t">
                                <li><a href="shop?tid=${t.tid }"> ${t.typeName }</a></li>
                             </c:forEach>
                             </ul>
                        </div>
                        <div class="pa-widget pa-product-widget">
                            <h2 class="pa-sidebar-title">推荐商品</h2>
                            <ul>
                            <c:forEach items="${pageInfo.list }" var="p" begin="0" end="5">
                                <li>
                                    <div class="pa-pro-wid-img">
                                        <img src="/imgUrl/product/${p.img }" alt="image" class="img-fluid"/>
                                    </div>
                                    <div class="pa-pro-wid-content">
                                        <h4><a href="productSingle?pid=${p.pid }">${p.pname }</a></h4>
                                        <p id="prodes">${p.describe }</p>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>      
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- product end -->
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-3.4.1.js"></script>
<script type="text/javascript" >
$(".addCart").click(function(){
	var con=confirm("您确认添加到购物车？");
	if(con==false) return false;
	var pid=$(this).find(".pid").val();
	var originalPrice=$(this).find(".originalPrice").val();
	var discountPrice=$(this).find(".discountPrice").val();
	$.ajax({
		type:"GET",
		url:"${pageContext.request.contextPath }/addCart",
		data:{"pid":pid,"originalPrice":originalPrice,"discountPrice":discountPrice},
		dataType:"text",
		success:function(data){
			if(data=="true"){
				alert("该商品已添加到购物车！");
			}if(data=="login"){
				alert("添加失败！请登录！");
				location.href="${pageContext.request.contextPath}/jsp/login.jsp";
			}
		}
	})
})
$(".col-sm-6").mouseover(function () {
	var pid=$(this).find(".pid").val();
	var box = $(this);
	$.get("${pageContext.request.contextPath}/getCollect",{pid:pid}
			,function(data){
		if(data.res==1){
			$(".collect").attr("src","${pageContext.request.contextPath}/assets/images/collect02.png");
		}else{
			$(".collect").attr("src","${pageContext.request.contextPath}/assets/images/collect01.png");
		}
	}); 
});
$(".collect").click(function(){
	var pid=$(this).next().val();
	var a=$(".collect").attr("src");
	var b="/YoumingShop/assets/images/collect02.png";
	if(a==b){
		//删除
		$.get("${pageContext.request.contextPath}/delCollect",{pid:pid}
		,function(data){
		// 转换json数据
		//var res = eval('('+data+')');
		if(data.del==1){
			$(this).attr("src","${pageContext.request.contextPath}/assets/images/collect02.png");
			window.location.reload();
		}
		}); 
	}else{
		$.get("${pageContext.request.contextPath}/insertCollect",{pid:pid}
		,function(data){
		// 转换json数据
		//var res = eval('('+data+')');
		if(data.ins==1){
			$(this).attr("src","${pageContext.request.contextPath}/assets/images/collect01.png");
			window.location.reload();
		}
		}); 
	}
}) 
</script>
</html>
<%@include file="/jsp/common/foot.jsp" %>