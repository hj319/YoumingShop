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
                <h1>结算</h1>
                <ul>
                    <li><a href="index.html">购物车</a></li>
                    <li>结算</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- breadcrumb end -->
    <!-- checkout start -->
    <div class="pa-checkout spacer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="pa-bill-form">
                        <form>
                            <label class="pa-bill-title">
                                结算明细
                            </label>
                            
                            <label>
                                <span>联系电话</span>
                                <input type="text" value="" class="phone"/>
                                <span></span>
                            </label>
                            <label>
                                <span>收货地址</span>
                                <input type="text" value="" class="address"/>
                                <span></span>
                            </label>
                            <label>
                                <select class="delivery">
									  <option value ="">请选择快递公司</option>
									  <option value ="中通快递">中通快递</option>
									  <option value="圆通快递">圆通快递</option>
									  <option value="申通快递">申通快递</option>
								</select>
								<span></span>
                            </label>
                           
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="pa-bill-detail">
                        <p class="pa-bill-title">订单详细信息</p>
                        <table>
                            <thead>
                                <tr>
                                    <th>产品名称</th>
                                    <th>价格</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${ordlist }" var="o">
	                                <tr>
	                                    <td>${o.comName }</td>
	                                    <td>$${o.comPrice }</td>
	                                </tr>
                                </c:forEach>
                              
                                <tr class="pa-checkout-total">
                                    <td>累计</td>
                                    <td class="zheng">$${orders.totalPrice }</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="pa-place-order-btn">
                            <button class="pa-btn" onclick="addOrder()">下订单</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- checkout end -->
    <!-- footer start -->
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
	$(function(){
		$(".zheng").text("$"+parseInt($(".zheng").text().substring(1)));
		$(".phone").focus(function(){
			if($(".phone").val()==""){
            	$(".phone").next().text("请输入电话号码").css("color","red");
            }
		});
		$(".phone").blur(function(){
			if (isPhoneNo($.trim($(".phone").val())) == true) {
				$(".phone").next().text("输入正确").css("color","green");
            }else if($(".phone").val()==""){
            	$(".phone").next().text("请输入电话号码").css("color","red");
            }
			else{
            	$(".phone").next().text("电话号码格式有误").css("color","red");
            }
		});
		$(".address").focus(function(){
			if($(".address").val()==""){
            	$(".address").next().text("请输入收货地址").css("color","red");
            }
		});
		$(".address").blur(function(){
			if($(".address").val()==""){
            	$(".address").next().text("请输入收货地址").css("color","red");
            }else{
            	$(".address").next().text("输入成功").css("color","green");
            }
		});
		$(".delivery").focus(function(){
			if($(".delivery").val()==""){
            	$(".delivery").next().text("请选择快递公司").css("color","red");
            }
		});
		$(".delivery").blur(function(){
			if($(".delivery").val()==""){
            	$(".delivery").next().text("请选择快递公司").css("color","red");
            }else{
            	$(".delivery").next().text("选择成功").css("color","green");
            }
		});
		
	});
	// 验证手机号
	function isPhoneNo(phone) {
	    var pattern = /^1[34578]\d{9}$/;
	    return pattern.test(phone);
	}
	//下订单，批量插入
	function addOrder(){
		if($(".phone").val()==null || $(".phone").val()==""){
			$(".phone").next().text("请输入电话号码").css("color","red");
			return ;
		}
		if(isPhoneNo($.trim($(".phone").val())) == false){
        	$(".phone").next().text("电话号码格式有误").css("color","red");
        	return;
		}
		if($(".address").val()==null || $(".address").val()==""){
			$(".address").next().text("请输入收货地址").css("color","red");
			return ;
		}
		if($(".delivery").val()==null || $(".delivery").val()==""){
			$(".delivery").next().text("请选择快递公司").css("color","red");
			return ;
		}
		var con=confirm("是否确定下单？");
		if(con==false) return;
		//异步请求，下订单，传收货地址和电话
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/order/addOrder",
			data:{"uphone":$(".phone").val(),"uaddress":$(".address").val(),"delivery":$(".delivery").val()},
			dataType:"text",
			success:function(data){
				if(data.result="true1"){
					alert("添加成功");
							       
					location.href="${pageContext.request.contextPath}/order/getOrderList";
				}
			}
			
		});
		
	}
</script>
<!-- main wrapper end -->
<%@include file="/jsp/common/foot.jsp" %>
   