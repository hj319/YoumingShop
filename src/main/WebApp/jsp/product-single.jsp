﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@include file="/jsp/common/head.jsp"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
                <h1>商品详情</h1>
                <ul>
                    <li><a href="index">首页</a></li>
                    <li>商品详情</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- breadcrumb end -->
    <!-- product single start -->
    <div class="pa-product-single spacer-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                <c:forEach items="${list }" var="p">
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="pa-prod-thumb-img">
                                <img src="/imgUrl/product/${p.img }" alt="image" class="img-fluid"/>
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="pa-prod-content">
                                <h2 class="pa-prod-title">${p.pname }</h2>
                                <p class="pa-prod-price"><span >价格: <del>￥ ${p.originalPrice }</del></span> ￥ ${p.discountPrice } <span class="pa-offer-price">25% off</span></p>
                                <a href="#" class="pa-prod-category"><span>分类:</span> ${p.productType.typeName }</a>
                                <ul>
                                    <li><span>
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="-38 0 512 512.00142">
                                            <path d="M 435.488281 138.917969 L 435.472656 138.519531 C 435.25 133.601562 435.101562 128.398438 435.011719 122.609375 C 434.59375 94.378906 412.152344 71.027344 383.917969 69.449219 C 325.050781 66.164062 279.511719 46.96875 240.601562 9.042969 L 240.269531 8.726562 C 227.578125 -2.910156 208.433594 -2.910156 195.738281 8.726562 L 195.40625 9.042969 C 156.496094 46.96875 110.957031 66.164062 52.089844 69.453125 C 23.859375 71.027344 1.414062 94.378906 0.996094 122.613281 C 0.910156 128.363281 0.757812 133.566406 0.535156 138.519531 L 0.511719 139.445312 C -0.632812 199.472656 -2.054688 274.179688 22.9375 341.988281 C 36.679688 379.277344 57.492188 411.691406 84.792969 438.335938 C 115.886719 468.679688 156.613281 492.769531 205.839844 509.933594 C 207.441406 510.492188 209.105469 510.945312 210.800781 511.285156 C 213.191406 511.761719 215.597656 512 218.003906 512 C 220.410156 512 222.820312 511.761719 225.207031 511.285156 C 226.902344 510.945312 228.578125 510.488281 230.1875 509.925781 C 279.355469 492.730469 320.039062 468.628906 351.105469 438.289062 C 378.394531 411.636719 399.207031 379.214844 412.960938 341.917969 C 438.046875 273.90625 436.628906 199.058594 435.488281 138.917969 Z M 384.773438 331.523438 C 358.414062 402.992188 304.605469 452.074219 220.273438 481.566406 C 219.972656 481.667969 219.652344 481.757812 219.320312 481.824219 C 218.449219 481.996094 217.5625 481.996094 216.679688 481.820312 C 216.351562 481.753906 216.03125 481.667969 215.734375 481.566406 C 131.3125 452.128906 77.46875 403.074219 51.128906 331.601562 C 28.09375 269.097656 29.398438 200.519531 30.550781 140.019531 L 30.558594 139.683594 C 30.792969 134.484375 30.949219 129.039062 31.035156 123.054688 C 31.222656 110.519531 41.207031 100.148438 53.765625 99.449219 C 87.078125 97.589844 116.34375 91.152344 143.234375 79.769531 C 170.089844 68.402344 193.941406 52.378906 216.144531 30.785156 C 217.273438 29.832031 218.738281 29.828125 219.863281 30.785156 C 242.070312 52.378906 265.921875 68.402344 292.773438 79.769531 C 319.664062 91.152344 348.929688 97.589844 382.246094 99.449219 C 394.804688 100.148438 404.789062 110.519531 404.972656 123.058594 C 405.0625 129.074219 405.21875 134.519531 405.453125 139.683594 C 406.601562 200.253906 407.875 268.886719 384.773438 331.523438 Z M 384.773438 331.523438 "></path>
                                            <path d="M 217.996094 128.410156 C 147.636719 128.410156 90.398438 185.652344 90.398438 256.007812 C 90.398438 326.367188 147.636719 383.609375 217.996094 383.609375 C 288.351562 383.609375 345.59375 326.367188 345.59375 256.007812 C 345.59375 185.652344 288.351562 128.410156 217.996094 128.410156 Z M 217.996094 353.5625 C 164.203125 353.5625 120.441406 309.800781 120.441406 256.007812 C 120.441406 202.214844 164.203125 158.453125 217.996094 158.453125 C 271.785156 158.453125 315.546875 202.214844 315.546875 256.007812 C 315.546875 309.800781 271.785156 353.5625 217.996094 353.5625 Z M 217.996094 353.5625 "></path>
                                            <path d="M 254.667969 216.394531 L 195.402344 275.660156 L 179.316406 259.574219 C 173.449219 253.707031 163.9375 253.707031 158.070312 259.574219 C 152.207031 265.441406 152.207031 274.953125 158.070312 280.816406 L 184.78125 307.527344 C 187.714844 310.460938 191.558594 311.925781 195.402344 311.925781 C 199.246094 311.925781 203.089844 310.460938 206.023438 307.527344 L 275.914062 237.636719 C 281.777344 231.769531 281.777344 222.257812 275.914062 216.394531 C 270.046875 210.523438 260.535156 210.523438 254.667969 216.394531 Z M 254.667969 216.394531 "></path>
                                            </svg>
                                    </span>质量100% </li>
                                    <li><span>
                                        <svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="m336 336c-5.519531 0-10 4.480469-10 10s4.480469 10 10 10 10-4.480469 10-10-4.480469-10-10-10zm0 0"/><path d="m200 326c-5.515625 0-10-4.484375-10-10s4.484375-10 10-10c3.542969 0 7.28125 1.808594 10.816406 5.226562 3.96875 3.839844 10.300782 3.738282 14.140625-.234374 3.839844-3.96875 3.734375-10.296876-.234375-14.136719-5.074218-4.914063-10.152344-7.691407-14.722656-9.207031v-11.648438c0-5.523438-4.476562-10-10-10s-10 4.476562-10 10v11.71875c-11.640625 4.128906-20 15.246094-20 28.28125 0 16.542969 13.457031 30 30 30 5.511719 0 10 4.484375 10 10s-4.488281 10-10 10c-4.273438 0-8.886719-2.6875-12.988281-7.566406-3.550781-4.226563-9.859375-4.773438-14.085938-1.21875-4.230469 3.554687-4.773437 9.863281-1.222656 14.089844 5.347656 6.359374 11.632813 10.789062 18.296875 13.023437v11.671875c0 5.523438 4.476562 10 10 10s10-4.476562 10-10v-11.71875c11.636719-4.128906 20-15.246094 20-28.28125 0-16.542969-13.457031-30-30-30zm0 0"/><path d="m120 166c5.523438 0 10-4.476562 10-10v-40c0-5.523438-4.476562-10-10-10s-10 4.476562-10 10v40c0 5.523438 4.476562 10 10 10zm0 0"/><path d="m472 236v-80c0-27.570312-22.429688-50-50-50h-56v-76c0-16.542969-13.457031-30-30-30h-186c-16.542969 0-30 13.457031-30 30v36h-30c-16.542969 0-30 13.457031-30 30v10h-10c-27.570312 0-50 22.429688-50 50v306c0 27.570312 22.429688 50 50 50h306c24.144531 0 44.347656-17.203125 48.992188-40h17.007812c27.570312 0 50-22.429688 50-50v-26h10c16.542969 0 30-13.457031 30-30v-90c0-22.054688-17.945312-40-40-40zm20 40c0 11.046875-8.953125 20-20 20v-40c11.027344 0 20 8.972656 20 20zm-70-150c16.542969 0 30 13.457031 30 30v140h-46v-60c0-24.144531-17.203125-44.347656-40-48.992188v-61.007812zm-282-96c0-5.515625 4.484375-10 10-10h186c5.515625 0 10 4.484375 10 10v156h-46v-90c0-16.542969-13.457031-30-30-30h-130zm100 156v-100h30c5.515625 0 10 4.484375 10 10v90zm-60 0v-100h40v100zm-100-90c0-5.515625 4.484375-10 10-10h70v100h-80zm-30 30h10v60h-7.859375c-16.527344 0-32.140625-11.96875-32.140625-30 0-16.542969 13.457031-30 30-30zm306 366h-306c-16.542969 0-30-13.457031-30-30v-266.617188c8.941406 6.660157 20.171875 10.617188 32.140625 10.617188h303.859375c16.542969 0 30 13.457031 30 30v60h-70c-16.542969 0-30 13.457031-30 30v40c0 16.542969 13.457031 30 30 30h70v66c0 16.542969-13.457031 30-30 30zm96-70c0 16.542969-13.457031 30-30 30h-16v-56h46zm30-46h-166c-5.515625 0-10-4.484375-10-10v-40c0-5.515625 4.484375-10 10-10h156c7.136719 0 13.984375-1.867188 20-5.355469v55.355469c0 5.515625-4.484375 10-10 10zm0 0"/><path d="m422 336h-46c-5.523438 0-10 4.476562-10 10s4.476562 10 10 10h46c5.523438 0 10-4.476562 10-10s-4.476562-10-10-10zm0 0"/></svg>
                                    </span>货到付款</li>
                                    <li><span>
                                        <svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="m212 367h89c33.085938 0 60-26.914062 60-60v-43.402344c9.128906-1.851562 16-9.921875 16-19.597656v-70c0-11.046875-8.953125-20-20-20h-201c-11.046875 0-20 8.953125-20 20v70c0 9.675781 6.871094 17.746094 16 19.597656v43.402344c0 33.085938 26.914062 60 60 60zm89-40h-89c-11.027344 0-20-8.972656-20-20v-41h46v8c0 11.046875 8.953125 20 20 20s20-8.953125 20-20v-8h43v41c0 11.027344-8.972656 20-20 20zm-125-133h161v30h-161zm-176-60v-48c0-11.046875 8.953125-20 20-20s20 8.953125 20 20v32.535156c19.679688-30.890625 45.8125-57.316406 76.84375-77.445312 41.4375-26.878906 89.554688-41.089844 139.15625-41.089844 68.378906 0 132.667969 26.628906 181.019531 74.980469 48.351563 48.351562 74.980469 112.640625 74.980469 181.019531 0 11.046875-8.953125 20-20 20s-20-8.953125-20-20c0-119.101562-96.898438-216-216-216-75.664062 0-145.871094 40.15625-184.726562 104h26.726562c11.046875 0 20 8.953125 20 20s-8.953125 20-20 20h-48c-27.570312 0-50-22.429688-50-50zm512 244v47c0 11.046875-8.953125 20-20 20s-20-8.953125-20-20v-33.105469c-19.789062 31.570313-46.289062 58.542969-77.84375 79.011719-41.4375 26.882812-89.554688 41.09375-139.15625 41.09375-68.339844 0-132.464844-26.644531-180.5625-75.023438-48-48.285156-74.4375-112.554687-74.4375-180.976562 0-11.046875 8.953125-20 20-20s20 8.953125 20 20c0 119.101562 96.449219 216 215 216 75.667969 0 145.871094-40.15625 184.726562-104h-26.726562c-11.046875 0-20-8.953125-20-20s8.953125-20 20-20h49c27.570312 0 50 22.429688 50 50zm0 0"/></svg>
                                    </span>10天退货</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-12">    
                            <div class="pa-prod-content">
                                <div class="pa-prod-count">
                                    <div class="pa-cart-quantity">
                                        <button class="pa-sub"></button>
                                        <input type="number" id="1" value="1" min="1" max="3">
                                        <button class="pa-add"></button>
                                    </div>
                                    <button class="pa-btn addCart">加入购物车</button>
                                    <input type="hidden" value="${p.pid }" class="pid">
                                    <input type="hidden" value="${p.originalPrice }" class="originalPrice">
                                    <input type="hidden" value="${p.discountPrice }" class="discountPrice">
                                </div>
                                <p>${p.describe }</p>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="col-lg-8">
					 <div class="pa-blog-comnt">
                        <h2 class="pa-cmnt-title">用户评论</h2>
                        <ul  id="add">
                        <c:forEach items="${message }" var="m">
                            <li id="add">
                                <div class="pa-cmnt-box">
                                    <div class="pa-cmnt-img">
                                       <img src="/imgUrl/headImage/${m.user.headImage }" alt="image" class="img-fluid"/>
                                    </div>
                                    <div class="pa-cmnt-content">
                                        <h3>${m.user.uname }</h3>
                                        <p>
	                                        <span class="pa-cmnt-date"><fmt:formatDate value="${m.mtime }" type="date" pattern="yyyy-MM-dd HH:mm"/></span>
                                        </p>
                                        <p>${m.mcontent }</p>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                        <div class="pa-cmnt-form">
                            <form id="saveForm">
                            	<c:forEach items="${list }" var="p">
                            		<input type="hidden" value="${p.pid }" name="pid" id="pid"/>
                            	</c:forEach>
                                <textarea placeholder="输入你的评论" name="mcontent" id="mcontent"></textarea>
                                <button class="pa-btn" type="submit" onclick="add()">评论</button>
                            </form>
                        </div>
                    </div>
                </div>
                </div>
                <div class="col-lg-4">
                    <div class="pa-product-sidebar">
                        <div class="pa-widget pa-product-widget">
                            <h2 class="pa-sidebar-title">相关产品</h2>
                            <ul>
                            <c:forEach items="${list1 }" var="pr" begin="0" end="5">
                                <li id="add">
                                    <div class="pa-pro-wid-img">
                                        <img src="/imgUrl/product/${pr.img }" alt="image" class="img-fluid"/>
                                    </div>
                                    <div class="pa-pro-wid-content">
                                        <h4><a href="productSingle?pid=${pr.pid }">${pr.pname }</a></h4>
                                        <p id="prodes">${pr.describe }</p>
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
    <!-- product single end -->
</body>

<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-3.4.1.js"></script>
<script type="text/javascript" >
/* $(function(){
	show();
}); */
	function show(){ 
	$.get("${pageContext.request.contextPath}/getMessage",function(re){
		$(re).each(function(){
		 $("#add").append($('<li>'
	               	+'<div class="pa-cmnt-box">'
	                +'<div class="pa-cmnt-img">'
	                +'<img src="${pageContext.request.contextPath }/assets/images/user.jpg" alt="image" class="img-fluid"/>'
	                +'</div>'
	                +'<div class="pa-cmnt-content">'
	                +'<h3>'+this.user.uname+'</h3>'
	                +'<p>'
	                +'<span class="pa-cmnt-date">'+this.mtime +'</span>'
	                +'</p>'
	                +'<p>'+this.mcontent+'</p>'
	                +' </div>'
	                +'</div>'
	             +' </li>')); 
			});
	});
} 
 function add(){
		$.post("${pageContext.request.contextPath}/AddProMessage",
				$("#saveForm").serialize(),function(data){
			// 转换json数据
			var res = eval('('+data+')');
			if(data.code==1){
				 show();
				 //window.location.reload();
			}
		}); 
}
 $(".addCart").click(function(){
	// var iddd=$("#1").val();
	 /* alert(iddd);
	 return; */
		var con=confirm("您确认添加到购物车？");
		if(con==false) return false;
		var pid=$(this).next().val();
		var originalPrice=$(this).next().next().val();
		var discountPrice=$(this).next().next().next().val();
		var iddd=$("#1").val();
		//alert(pid,originalPrice,discountPrice);
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath }/addCart",
			data:{"pid":pid,"originalPrice":originalPrice,"discountPrice":discountPrice,"iddd":iddd},
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
</script>
</html>
<%@include file="/jsp/common/foot.jsp" %>