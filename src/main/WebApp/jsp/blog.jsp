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
    <!-- main header start -->
    <!-- main header end -->
    <!-- breadcrumb start -->
    <div class="pa-breadcrumb">
        <div class="container-fluid">
            <div class="pa-breadcrumb-box">
                <h1>博客</h1>
                <ul>
                    <li><a href="index">家</a></li>
                    <li>博客</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- breadcrumb end -->
    <!-- blog start -->
    <div class="pa-blog-page spacer-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                       <c:forEach items="${pageInfo.list }" var="blog">
                        <div class="col-md-6">
                            <div class="pa-blog-box">
                                <img src="/imgUrl/blog/${blog.bimg }" alt="image" class="img-fluid">
                                <div class="pa-blog-title">
                                    <a href="findByBid?bid=${blog.bid }" class="pa-blog-category">${blog.user.uname }</a>
                                    <h2><a href="findByBid?bid=${blog.bid }" >${blog.btitle }</a></h2>
                                    <a href="findByBid?bid=${blog.bid } class="pa-blog-date"><fmt:formatDate value="${blog.createTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></a>
                                </div>
                                <div class="pa-blog-view">
                                    <ul>
                                        <li>
                                            <a href="#"> 
                                            	<img src="${pageContext.request.contextPath}/assets/images/collect01.png" style="width: 20px;height: 20px;" class="collect">
                                                <input type="hidden" value="${blog.bid }" class="bid"> 
                                                    </a>
                                        </li>
                                        <li>
                                            <a href=""><i class="fas fa-eye"></i> ${blog.bview }</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fas fa-share-alt"></i>分享</a>
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
					                         <a href="${pageContext.request.contextPath}/getBlogList?currpage=${pageInfo.pageNum-1}"
					                           aria-label="Previous">
					                             <span aria-hidden="true">&laquo;</span>
					                         </a>
					                     </li>
					                     <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
					                         <c:if test="${page_Num == pageInfo.pageNum }">
					                             <li class="active"><a href="#" style="margin-top:7px;" >${ page_Num}</a></li>
					                        </c:if>
					                         <c:if test="${page_Num != pageInfo.pageNum }">
					                            <li>
					                                 <a style="margin-top:7px;" href="${pageContext.request.contextPath}/getBlogList?currpage=${page_Num}">${page_Num}</a>
					                            </li>
					                        </c:if>
					                     </c:forEach>
					                    <li>
					                        <a href="${pageContext.request.contextPath}/getBlogList?currpage=${pageInfo.pageNum+1}"
					                            aria-label="Next">
					                             <span aria-hidden="true">&raquo;</span>
					                         </a>
					                    </li>
					                </ul>
					            </nav>
					        </div>
		           		<!--分页-->
                    <!-- 增加博客 -->
                    <div class="pa-cmnt-form">
                         <h2 class="pa-cmnt-title">发布博客</h2>
                           <form  id="submitForm" >
                                                       博客标题：
                         <input type="text" placeholder="输入你的博客标题" name="btitle">
                                博客图片：
                         <input type="file" class="btn_file" id="fileUp" name="bimg" style="padding-top: 9px;width: 30%;">
                         <img id="stu_pic" width="50" height="50">
                                <p>    
							    博客类型： <select name="tid" required id="btype">
								      </select>  
								</p>
                                <textarea placeholder="博客内容" name="bcontent"></textarea>
                                <input class="pa-btn" type="submit" onclick="btn_save()" value="发布博客信息">
                            </form>
                        </div>
                    <!-- 增加博客结束 -->
                </div>
                <div class="col-lg-4">
                    <div class="pa-blog-sidebar">
                        <div class="pa-widget pa-shop-category">
                            <h2 class="pa-sidebar-title">最新博客信息</h2>
                            <ul>
                               <c:forEach items="${pageInfo.list }" var="blog">
                                <li><a href="findByBid?bid=${blog.bid }">${blog.btitle }<span>${blog.bshare }</span></a></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="pa-widget pa-product-widget">
                            <h2 class="pa-sidebar-title">推荐阅读</h2>
                            <ul>
                            <c:forEach items="${pageInfo.list }" var="blog" begin="0" end="4">
                                <li>
                                    <div class="pa-pro-wid-img">
                                        <img src="/imgUrl/blog/${blog.bimg }" alt="image" class="img-fluid">
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
                            <c:forEach items="${pageInfo.list }" var="blog">
                                <li><a href="getBlogList?tid=${blog.tid }">${blog.blogType.tname }</a></li>
                            </c:forEach>
                            </ul>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- blog end -->
    <!-- footer start -->
  
</div>
<!-- main wrapper end -->
<%@include file="/jsp/common/foot.jsp" %>
    <script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/SmoothScroll.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/swiper.min.js"></script>
    <script src="${pageContext.request.contextPath }/assets/js/custom.js"></script>
    <script type="text/javascript">
        $(function(){
        	//获得所有的分类信息
        	$.get("${pageContext.request.contextPath}/getTypeList",function(data){
        		//将数据设置到页面上去，遍历json数据
        		$("#btype").append("<option value='0'>请选择分类</option> ");
        		$(data).each(function(){
        			 var option="<option value='"+this.tid+"'>"+this.tname+"</option>";
        			 //将创建的新行添加到里面去
        			 $("#btype").append(option);
        		});
        	});
        });
        //选择好图片之后及时显示图片
        $(document).off('change',"fileUp").on('change','#fileUp',function(){
        	$('#stu_pic').attr('src',URL.createObjectURL($(this)[0].files[0]));
        });
        //上传图片的方法
        $(".btn_file").on("change",function(){
        	//alert("进入方法");
        	var crowd_file=$('#fileUp')[0].files[0];
        	var formData=new FormData();
        	formData.append("crowd_file",$('#fileUp')[0].files[0]);
        	//alert(crowd_file);
        	$.ajax({
        		url:'${pageContext.request.contextPath}/uploadFile',
        		type:'post',
        		dataType:"json",
        		data:formData,
        		async:false,
        		cache:false,
        		contentType:false,
        		processData:false,
        		success:function(data){
        			 if(data.result>0){
        				 alert("上传成功");
        			 }else{
        				 alert("上传失败");
        			 }
        		}
        	});
        });
        //增加博客
        var btn_save = function() {
 			$.ajax({
 				url: "${pageContext.request.contextPath}/saveBlog",
 				data:$("#submitForm").serialize(),
 				success: function(data) {
 					if(data.result > 0) {
 					alert("增加成功！");
 					location.href="${pageContext.request.contextPath}/getBlogList"
 						
 					}
 				},
 			     error:function(t){
 				  alert(t);
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