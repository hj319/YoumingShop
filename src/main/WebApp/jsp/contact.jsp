<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/jsp/common/head.jsp"%>
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
<div class="pa-main-wrapper">
    <!-- main header start -->
   
    <!-- main header end -->
    <!-- breadcrumb start -->
    <div class="pa-breadcrumb">
        <div class="container-fluid">
            <div class="pa-breadcrumb-box">
                <h1>账户信息</h1>
                <ul>
                    <li><a href="${pageContext.request.contextPath }/index">家</a></li>
                    <li>账户信息</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- breadcrumb end -->
    <!-- contact start -->
    <div class="pa-contact spacer-top">
    <div class="container">
    
            <div class="row"> 
               <div class="col-md-7">
               <c:if test="${empty loginUser.headImage }" var="isMo">
                     <img src="/imgUrl/headImage/user (5).png" class="img-circle" class="img-circle" style="margin-top:100px; height:400px;width:400px;border-radius: 40%;">
               </c:if> 
                  <c:if test="${!isMo }">
                    <img src="/imgUrl/headImage/${loginUser.headImage }" class="img-circle" style="margin-top:100px; height:400px;width:400px;border-radius: 40%;">
                 </c:if>
                    <div class="pa-contact-map">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="pa-contact-form">
                        <form id="submitForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/updateUser">
                            <input type="text" placeholder="${loginUser.uname }" readonly="readonly" id="full_name" class="require" value="${loginUser.uname }" name="uname"/>
                         <input type="hidden" value="${loginUser.uid }" name="uid"> 
                            <c:forEach items="${ulist }" var="u">
                            <p>修改邮箱：</p>
                            <input type="text"  name="uemail" id="email" class="require" data-valid="email" data-error="Email should be valid." value="${u.uemail }"/>
                            <p>修改个人头像：</p>
                            <input type="file" name="headImage" id="fileUp" class="btn_file" style="padding-top: 7px;background-color: white;width: 66%"/>
                             <c:if test="${empty loginUser.headImage }" var="isMo">
                                  <img src="/imgUrl/headImage/user (5).png" class="img-circle" class="img-circle" style=" height:50px;width:50px;">
                            </c:if> 
                          <c:if test="${!isMo}">
                            <img  id="stu_pic" width="50" height="50" src="/imgUrl/headImage/${u.headImage }">
                          </c:if>
                           <p>修改地址：</p>
                           <input type="text"  name="uaddress" id="subject" class="require" value="${u.uaddress }"/>
                            <p>修改电话号码：</p>
                            <input type="text"  name="uphone" id="subject" class="require" value="${u.uphone }"/>
                             </c:forEach>
                            <button type="submit"  class="pa-btn submitForm">提交修改</button>
                            <div class="response"></div>
                        </form>
                    </div>
                </div>
         </div> 
        </div>
    </div>
    <!-- contact end -->
    <!-- contact detail start -->
    <div class="pa-contact-detail">
        <div class="container">
        <c:forEach items="${ulist}" var="u">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="pa-contact-box">
                        <h4>居住地址</h4>
                        <p>${u.uaddress }</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="pa-contact-box">
                        <h4>联系方式</h4>
                        <p>${u.uphone }</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="pa-contact-box">
                        <h4>电子邮箱</h4>
                        <p>${u.uemail }</p>
                    </div>
                </div>
            </div>
           </c:forEach>
        </div>
    </div>
    <!-- contact detail end -->
    <!-- footer start -->
</div>
<!-- main wrapper end -->
<%@include file="/jsp/common/foot.jsp" %>
   <script type="text/javascript">
 //选择好图片之后及时显示图片
   $(document).off('change',"fileUp").on('change','#fileUp',function(){
   	$('#stu_pic').attr('src',URL.createObjectURL($(this)[0].files[0]));
   });
   //上传图片的方法
   $(".btn_file").on("change",function(){
   //	alert("进入方法");
   	var crowd_file=$('#fileUp')[0].files[0];
   	var formData=new FormData();
   	formData.append("crowd_file",$('#fileUp')[0].files[0]);
   	//alert(crowd_file);
   	$.ajax({
   		url:'${pageContext.request.contextPath}/uploadHeadImage',
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
  /*  //修改个人信息
   var btn_save = function() {
	   alert("进入修改方法");
	   $.post("${pageContext.request.contextPath}/updateUser",$("#submitForm").serialize(),function(data1){
		   
	   }
   } */
   
   </script>
</body>
</html>