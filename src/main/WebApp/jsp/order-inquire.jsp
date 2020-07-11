<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@include file="/jsp/common/head.jsp"%>
<section>
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
    <!-- top header start -->
    
    <!-- top header end -->
    <!-- main header start -->
   	
    <!-- main header end -->
    <!-- breadcrumb start -->
    <div class="pa-breadcrumb">
        <div class="container-fluid">
            <div class="pa-breadcrumb-box">
                <h1>订单查询</h1>
                <ul>
                    <li><a href="index.html">主页</a></li>
                    <li>订单查询</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- breadcrumb end -->
    <!-- product single start -->
    
    <div class="pa-product-single spacer-top" >
    	
	    <div class="pa-banner-search" style="width:40%;margin:auto;">
	    	<select class="kuaidi">
			  <option value ="">请选择快递公司</option>
			  <option value ="ZTO">中通快递</option>
			  <option value="opel">Opel</option>
			  <option value="audi">Audi</option>
			</select>
           <input type="text" placeholder="请输入订单号" style="width:55%;"/>
           <button class="ding" onclick="sousuo()">搜索</button>
	   	</div>
        <div class="container" >
        
            <div class="row" >
                <div class="col-lg-8">
                    <div class="row"style="margin:auto;" >
                    
                        
                        
                        <div class="col-sm-7" style="margin:auto;">
                        	
	                            <div class="pa-prod-content" >
	                            
	                            
	                                <c:forEach items="${sclist }" var="s">
		                                <p>
		                                	<span>快递名称:${s }</span>
		                                </p>
	                                </c:forEach>
	                                <c:forEach items="${lclist }" var="l">
		                                <p>
		                                	<span>快递单号:${l }</span> 
		                                </p>
	                                </c:forEach>
	                                <c:forEach items="${oiqlist }" var="o">
		                                <p>
		                                	<span>${o }</span> 
		                                </p>
	                                </c:forEach>
	                                
	                            </div>
	                        
                        </div>
                       
                        <div class="col-md-12">    
                            <div class="pa-prod-content">
                                <div class="pa-prod-count">
                                    
                                    <a href="${pageContext.request.contextPath}/shop" class="pa-btn">继续购物</a>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <!-- product start -->
                    
                    <!-- product end -->
                </div>
                
            </div>
        </div>
    </div>
    <!-- product single end -->
    <!-- footer start -->
    
    <!-- footer end -->
    <!-- copyright start -->
    
    <!-- signup end -->
    <!-- forgot start -->
    
    <!-- forgot end -->
</div>
</section>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/SmoothScroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/swiper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<script type="text/javascript">
	function sousuo(){
		//订单号
		var dingdan=$(".ding").prev().val();
		//快递公司
		var kuaidi=$(".kuaidi").val();
		$.post("${pageContext.request.contextPath}/instantList",{expNo:dingdan,expCode:kuaidi},function(data){
			if(data.result="false"){
				alert("查询成功");	
				location.reload();
			}
		});
	}
</script>
<%@include file="/jsp/common/foot.jsp" %>