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

    <!-- main header end -->
    <!-- breadcrumb start -->
    <div class="pa-breadcrumb">
        <div class="container-fluid">
            <div class="pa-breadcrumb-box">
                <h1>博客详情</h1>
                <ul>
                    <li><a href="index.jsp">家</a></li>
                    <li>博客详情</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- breadcrumb end -->
    <!-- blog single start -->
    <div class="pa-blog-single spacer-top spacer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                <c:forEach items="${flist }" var="blog">
                    <div class="pa-blog-box">
                        <img src="/imgUrl/blog/${blog.bimg }" alt="image" class="img-fluid" width="750px">
                        <div class="pa-blog-title">
                            <a href="#" class="pa-blog-category">${blog.user.uname }</a>
                            <h2>${blog.btitle }</h2>
                            <a href="#" class="pa-blog-date"><fmt:formatDate value="${blog.createTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></a>
                            <p>${blog.bcontent }</p>
                        </div>
                        <div class="pa-blog-view">
                            <ul>
                                <li>
                                    <a href="#">		
                                    		<img src="${pageContext.request.contextPath}/assets/images/collect01.png" style="width: 25px;height: 25px;" class="collect">
                                                <input type="hidden" value="${blog.bid }" class="bid"> 
                                                   </a>
                                </li>
                                <li>
                                    <a href="#"><i class="fas fa-eye"></i> ${blog.bview }</a>
                                </li>
                                <li>
                                    <a href="#"><i class="fas fa-share-alt"></i>分享</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="pa-blog-comnt">
                        <h2 class="pa-cmnt-title">最新评论</h2>
                       <ul>
                          <c:forEach items="${clist}" var="comm">
                            <li id="add">
                                <div class="pa-cmnt-box">
                                    <div class="pa-cmnt-img">
                                         <img src="/imgUrl/headImage/${comm.user.headImage }" alt="image" class="img-fluid"/>
                                    </div>
                                    <div class="pa-cmnt-content">
                                        <h3>${comm.user.uname }</h3>
                                        <p><span class="pa-cmnt-date"></span><span class="pa-cmnt-time"><fmt:formatDate value="${comm.utime }" type="date" pattern="yyyy-MM-dd HH:mm"/></span></p>
                                        <p>${comm.ucontent }</p>
                                    </div>
                                </div>
                                
                            </li>
                            </c:forEach>
                        </ul> 
                        <div class="pa-cmnt-form">
                         <h2 class="pa-cmnt-title">添加评论</h2>
                            <form id="saveForm">
                                 <c:forEach items="${flist }" var="b">
                                <input type="hidden" value="${b.bid }" name="bid" id="bid">
                                </c:forEach>
                                 <textarea placeholder="博客内容" name="ucontent" id="ucontent"></textarea>
                                <button class="pa-btn" type="submit" onclick="add()">发布评论</button>
                            </form>
                        </div>
                    </div>
                </div>
               <div class="col-lg-4">
                    <div class="pa-blog-sidebar">
                        <div class="pa-widget pa-shop-category">
                            <h2 class="pa-sidebar-title">最新博客信息</h2>
                            <ul>
                                <c:forEach items="${blist }" var="blog">
                                <li><a href="findByBid?bid=${blog.bid }">${blog.btitle }<span>${blog.bshare }</span></a></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="pa-widget pa-product-widget">
                            <h2 class="pa-sidebar-title">推荐阅读</h2>
                            <ul>
                             <c:forEach items="${blist }" var="blog">
                                <li>
                                    <div class="pa-pro-wid-img">
                                         <img src="/imgUrl/blog/${blog.bimg }"  alt="image" class="img-fluid">
                                    </div>
                                    <div class="pa-pro-wid-content">
                                        <h4><a href="findByBid?bid=${blog.bid }">${blog.btitle }</a></h4>
                                        <p>${blog.bmajor }</p>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="pa-widget pa-tag">
                            <h2 class="pa-sidebar-title">博客热词</h2>
                            <ul>
                                <c:forEach items="${blist }" var="blog">
                                 <li><a href="javascript:;">${blog.blogType.tname }</a></li>
                                </c:forEach>
                            </ul>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- blog single end -->
    <!-- footer start -->
   
    <!-- forgot end -->
</div>
<!-- main wrapper end -->
<%@include file="/jsp/common/foot.jsp" %>
    <script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/SmoothScroll.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/swiper.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
    function show(){ 
    	$.get("${pageContext.request.contextPath}/getComm",function(re){
    		$(re).each(function(){
    		 $("#add").append($('<li>'
    	               	+'<div class="pa-cmnt-box">'
    	                +'<div class="pa-cmnt-img">'
    	                +'<img src="${pageContext.request.contextPath }/assets/images/user.jpg" alt="image" class="img-fluid"/>'
    	                +'</div>'
    	                +'<div class="pa-cmnt-content">'
    	                +'<h3>'+this.user.uname+'</h3>'
    	                +'<p>'
    	                +'<span class="pa-cmnt-date">'+this.utime +'</span>'
    	                +'</p>'
    	                +'<p>'+this.ucontent+'</p>'
    	                +' </div>'
    	                +'</div>'
    	             +' </li>')); 
    			});
    	});
    } 
     function add(){
    		$.post("${pageContext.request.contextPath}/AddComm",
    				$("#saveForm").serialize(),function(data){
    			// 转换json数据
    			//var res = eval('('+data+')');
    			if(data.code==1){
    				alert("评论成功！");
    				show();
    				 
    			}
    		}); 
    		
     }
     $(function(){
     	$(".pa-blog-box").each(function(){
     		var box = $(this);
     			 $.ajax({
     	        	        url:" ${pageContext.request.contextPath}/getBlogCollect",
     	        	        type: 'get',
     	        	        data: {bid:$(box).find(".bid").val()}, 
     	        	        async: false, // 同步
     	        	        success: function (data) {
     	        	        	if(data.res==1){
     	                			$(box).find(".collect").attr("src","${pageContext.request.contextPath}/assets/images/collect02.png");
     	                		}else{
     	                			$(box).find(".collect").attr("src","${pageContext.request.contextPath}/assets/images/collect01.png");
     	                		}            
     	        	     }
     	        	}) ;
     	});
     });
     	
    $(".collect").click(function(){
     	var bid=$(this).next().val();
     	var a=$(this).attr('src');
     	var b="/YoumingShop/assets/images/collect02.png";
     	 if(a==b){
     		//删除
     		$.get("${pageContext.request.contextPath}/delBlogCollect",{bid:bid}
     		,function(data){
     		// 转换json数据
     		//var res = eval('('+data+')');
     		if(data.del==1){
     			$(this).attr("src","${pageContext.request.contextPath}/assets/images/collect02.png");
     			window.location.reload();
     		}
     		}); 
     	}else{
     		$.get("${pageContext.request.contextPath}/insertBlogCollect",{bid:bid}
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
</body>
</html>