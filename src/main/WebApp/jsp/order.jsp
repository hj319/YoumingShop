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
    
    <!-- main header end -->
    <!-- breadcrumb start -->
    <div class="pa-breadcrumb">
        <div class="container-fluid">
            <div class="pa-breadcrumb-box">
                <h1>订单</h1>
                <ul>
                    <li><a href="index.html">主页</a></li>
                    <li>订单</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- breadcrumb end -->
    <!-- cart start -->
    <div class="pa-cart spacer-top spacer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="pa-cart-box">
                        <table>
                            <thead>
                                <tr>
                                	<th>订单详情</th>
                                    <th>买家名称</th>
                                    <th>买家电话</th>
                                    <th>买家地址</th>
                                    <th>商品位置</th>
                                    <th>支付状态</th>
                                    <th>总金额</th>
                                    <th  style="text-align:center;"><a href=""><input type="checkbox" id="checkAll" style="width:20px;height:30px;"/></a></th>
                                </tr>
                            </thead>
                            <tbody>
                               <c:forEach items="${orderSelect }" var="order">
	                                <tr>
	                                    <td>
	                                        <div class="pa-cart-img">
	                                            <a href="${pageContext.request.contextPath}/orderdetails/getOrderDetailsList?oid=${order.oid}">详情</a>
	                                        </div>
	                                    </td>
	                                    <td>
	                                        ${order.uname}
	                                    </td>
	                                    <td>${order.uphone }</td>
	                                    <td>${order.uaddress }</td>
	                                    <td>${order.orderStatus }</td>
	                                    <td>${order.payStatus }</td>
	                                    <td>￥${order.totalPrice }</td>
	                                    <td style="text-align:center;">
	                                        <input type="checkbox" name="id" value="${order.oid }" class="check" style="width:20px;height:30px;"/>
	                                        
	                                    </td>
	                                </tr>
	                            </c:forEach>
	                            
                                <tr>
                                    <td colspan="4"><a href="${pageContext.request.contextPath}/shop" class="pa-btn">继续购物</a></td>
                                    <td colspan="4" class="pa-cart-update"><button class="pa-btn" onclick="deleteOrderAll()">退单</button></td>
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- cart end -->
    <!-- footer start -->
    
    <!-- footer end -->
    <!-- copyright start -->
    
    <!-- forgot end -->
</div>
</section>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/SmoothScroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/swiper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
	
	//change判断 第一个复选框状态
	$("#checkAll").change(function(){
		//获取到这个值
		var check=$(this).prop("checked");
		//将值赋给其他复选框
		$(".check").prop("checked",check);
	});
	
	//批量删除
	function deleteOrderAll(){
		//默认复选框为false
		var checks=false;
		//获得复选框节点，遍历复选框
		$("input[name='id']").each(function(){
			//判断该文本框是否已勾选
			if(this.checked==true){
				checks=true;
			}
		});
		if(checks){
			var con=confirm("你是否确认退单？");
			if(con==false) return;
			//将复选框定义成对象
			var obj=document.getElementsByName("id");
			//定义数组 用来存放需要删除的id
			var check_order=[];
			//遍历对象，把勾选的id存放到数组中
			for(i in obj){
				//是否勾选
				if(obj[i].checked){
					//添加到数组中
					check_order.push(obj[i].value);
				}
			}
			//异步请求，传入需要删除的id
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/order/deleteOrderAll",
				data:{"s":""+check_order},
				dataType:"text",
				success:function(data){
					if(data=="true"){
						alert("退单成功");
						location.reload();
					}
				}
			});
		}
	}
</script>
<%@include file="/jsp/common/foot.jsp" %>
