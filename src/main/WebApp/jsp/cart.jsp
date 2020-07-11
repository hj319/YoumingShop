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
                <h1>购物车</h1>
                <ul>
                    <li><a href="index">首页</a></li>
                    <li>购物车</li>
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
                                    <th>产品图片</th>
                                    <th>产品名称</th>
                                    <th>单价</th>
                                    <th>数量</th>
                                    <th>总价</th>
                                    <th  style="text-align:center;"><input type="checkbox" id="checkAll" style="width:20px;height:30px;"/></th>
                                </tr>
                            </thead>
                            <tbody>
	                            <c:forEach items="${pageInfo.list }" var="cart">
	                                <tr>
	                                    <td>
	                                        <div class="pa-cart-img">
	                                        	<input type="hidden" value="${cart.product.img}" class="CartImg"/>
	                                            <img src="/imgUrl/product/${cart.product.img}" alt="image" class="img-fluid"/>
	                                        </div>
	                                    </td>
	                                    <td>
	                                        ${cart.product.pname }
	                                    </td>
	                                    <td>￥${cart.product.discountPrice }</td>
	                                    <td>
	                                        <div class="pa-cart-quantity">
	                                            <button onclick="subtract(this)"></button>
	                                            <input type="number" value="${cart.num }" min="1"/>
	                                            <button onclick="add(this)"></button>
	                                            <input type="hidden" value="${cart.id }"/>
	                                        </div>
	                                    </td>
	                                    <td>￥${cart.total }</td>
	                                    <td style="text-align:center;">
	                                    	<input type="checkbox" name="id" value="${cart.id }" class="check" style="width:20px;height:30px;" onclick="sub()"/>
	                                    	<input type="hidden" value="${cart.pid }"/>
	                                    </td>
	                                </tr>
                                </c:forEach>
                                <tr>
                               		<td colspan="3">
	                               		<div id="div_pagination_bottom">
								            <nav aria-label="Page navigation">
								                <ul class="pagination">
								                     <li>
								                         <a href="${pageContext.request.contextPath }/getCartList?currpage=${pageInfo.pageNum-1}"
								                           aria-label="Previous">
								                             <span aria-hidden="true">&laquo;</span>
								                         </a>
								                     </li>
								                     <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
								                         <c:if test="${page_Num == pageInfo.pageNum }">
								                             <li class="active"><a href="#" style="margin-top: 7px;">${ page_Num}</a></li>
								                        </c:if>
								                         <c:if test="${page_Num != pageInfo.pageNum }">
								                            <li>
								                                 <a style="margin-top: 7px;" href="${pageContext.request.contextPath }/getCartList?currpage=${ page_Num}">${ page_Num}</a>
								                            </li>
								                        </c:if>
								                     </c:forEach>
								                    <li>
								                        <a href="${pageContext.request.contextPath }/getCartList?currpage=${pageInfo.pageNum+1}"
								                            aria-label="Next">
								                             <span aria-hidden="true">&raquo;</span>
								                         </a>
								                    </li>
								                </ul>
								            </nav>
								        </div>
                               		</td>
                                    <td  class="pa-cart-total">
                                        <p>小计:</p>
                                    </td>
                                    <td class="pa-cart-total-price">
                                        <p class="subtotal"></p>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="3"><a href="${pageContext.request.contextPath}/shop" class="pa-btn">继续购物</a></td>
                                    <td colspan="3" class="pa-cart-update"><button class="pa-btn" onclick="deleteAll()">移出购物车</button></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="pa-garnd-total">
                            <p>
                                <span>运费</span>
                                <span>￥20</span>
                            </p>
                            <p>
                                <span>消费税</span>
                                <span>18%</span>
                            </p>
                            <p>
                                <span>付款总额:</span>
                                <span class="totalprice"></span>
                            </p>
                            <a href="javascript:void()" class="pa-btn"  onclick="storeAll()">进行结算</a>
                        </div>
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
		sub();
		//第一个复选框被勾选，则发生改变
		$("#checkAll").change(function(e){
			//prop方法获得复选框当前是选中还是没有选中的状态
			var check=$(this).prop("checked");//返回boolean值
			//把值赋值到其他的复选框里
			$(".check").prop("checked",check);
			sub();
		});
	});
	//下订单，批量存放信息的方法
	function storeAll(){
		var checkss=false;
		//获取复选框节点
		$("input[name='id']").each(function(){
			if(this.checked==true){
				checkss=true;
			}
		});
		if(checkss){
			var con=confirm("您是否确认结算？");
			if(con==false) return false;
			//获取name为id的文本框对象
			var obj_all=document.getElementsByName("id");
			var check_all=[];//存放订单详情的数组
			var check_id=[];//存放订单详情id的数组
			var check_img=[];//存放订单图片的数组
			
			for(i in obj_all){
				if(obj_all[i].checked){
					check_all.push($(obj_all[i]).parents("td").prev().text().substring(1));//总价
					check_all.push($(obj_all[i]).next().val());//pid 产品编号
					check_all.push($(obj_all[i]).parent().prev().prev().find("input").eq(0).val());//订单数量
					check_all.push($(obj_all[i]).parents("tr").find("td").eq(1).text());//产品名称
					check_all.push($(obj_all[i]).parents("tr").find("td").eq(2).text().substring(1));//产品单价
					check_id.push($(obj_all[i]).val());
					check_img.push($(obj_all[i]).parents("tr").find("td").eq(0).find("input").val());//产品图片
					/* check_all.push($(obj_all[i]).val()); */
					/* alert(check_all][i]); */
				}	
			} 
			//异步请求
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/order/storeAll",
				data:{"c":""+check_all,"id":""+check_id,"img":""+check_img},
				dataType:"text",
				success:function(data){
					if(data.result="true"){
						alert("下单成功");
						location.href="${pageContext.request.contextPath}/order/checkout";
					}
				}
			});
		}else{
			alert("请选择需要结算的商品");
		}
	}
	
	//减数量的方法
	function subtract(obj){
		//商品数量
		var count=parseInt($(obj).next().val());
		count--;
		/* alert(count); */
		//此类商品单价
		var dprice=parseFloat($(obj).parents("td").prev().text().substring(1));
		/* alert(dprice); */
		//此类商品总价
		var cprice= count*dprice;
		/* alert(cprice); */
		if(count<=0){
			return;
		}
		$(obj).parents("td").next().text("￥"+cprice);
		$(obj).next().val(count);
		//获得更新的产品编号
		var id=parseInt($(obj).next().next().next().val());
		/* alert(id); */
		//使用ajax实现数据更新
		$.post("${pageContext.request.contextPath}/updateCart",
				{id:id,num:count,total:cprice},function(data){
			if(data.result="true"){
				/* alert("更新成功"); */
			}
			sub();
		});
	}
	//加数量的方法
	function add(obj){
		var count=parseInt($(obj).prev().val());
		count++;
		/* alert(count); */
		//此商品单价
		var dprice=parseFloat($(obj).parents("td").prev().text().substring(1));
		/* alert(dprice); */
		//此商品总价
		var cprice=count*dprice;
		/* alert(cprice); */
		$(obj).parents("td").next().text("￥"+cprice);
		$(obj).prev().val(count);
		//获得更新的产品编号
		/* var pid = parseInt($(obj).parents("td").next().next().find("input").val()); */
		var id=parseInt($(obj).next().val());
		/* alert(id); */
		//使用ajax
		$.post("${pageContext.request.contextPath}/updateCart",
				{id:id,num:count,total:cprice},function(data){
			if(data.result="true"){
				/* alert("更新成功"); */
			}
			sub();
		});
	}
	//计算总价的方法
	function sub(){
		var yechecks=false;
		var yeprice=0;
		var totalprice=0;
		$("input[name='id']").each(function(){
			if(this.checked==true){
				//已勾选
				yechecks=true;
			}
		});
		/* alert(yechecks); */
		if(yechecks){
			var yeobj=document.getElementsByName("id");
			for ( var i in yeobj) {
				if(yeobj[i].checked){
					yeprice+=parseFloat($(yeobj[i]).parents("tr").find("td").eq(4).text().substring(1));
				}
			}
		}
		totalprice=parseInt(yeprice*1.18);
		$(".totalprice").text("￥"+totalprice);
		$(".subtotal").text("￥"+yeprice);
	}
	
	//移出购物车的方法，批量删除的方法
	function deleteAll(){
		//默认复选框为空
		var checks=false;
		//获取复选框节点
		$("input[name='id']").each(function(){
			if(this.checked==true){
				//已勾选
				checks=true;
			}
		});
		if(checks){
			var con=confirm("您确认要移出购物车吗？");
			if(con==false) return false;//不做处理
			//将复选框定义成对象
			var obj=document.getElementsByName("id");
			var check_con=[];//数组存放id
			//遍历，往对象中添加勾选的id
			for(i in obj){
				if(obj[i].checked)//是否勾选
					//push()方法在数组末尾添加元素
					check_con.push(obj[i].value);
			}
			/* alert(check_con); */
			//异步请求，删除操作
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/deleteCartAll",
				data:{"c":""+check_con},
				dataType:"text",
				success:function(data){
					if(data=="true"){
						alert("移出成功！");
						location.reload();
					}
				}	
			});
		}else{
			return false;
		}
		
		//
	}
</script>
<%@include file="/jsp/common/foot.jsp" %>
