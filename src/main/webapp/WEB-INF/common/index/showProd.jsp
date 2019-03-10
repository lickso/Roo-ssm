<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%
	String basePath = request.getContextPath()+"/";
%>
<%@ include file="../head.jsp"%>
<%@ page isELIgnored="false" %>
<%-- <%@ include file="../rightBar.jsp"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="<%=basePath%>/static/css/showProd/shouye.css" />
<%-- <script type="text/javascript" src="<%=basePath%>static/base/jquery-1.7.min.js"></script> --%>

<%-- <script src="<%=basePath%>static/base/jquery-1.8.3.min.js" type="text/javascript"></script> --%>
<script src="<%=basePath%>static/js/showProd/modernizr-custom-v2.7.1.min.js" type="text/javascript"></script>

<script type="text/javascript">


$(document).ready(function(){
	var $miaobian=$('.Xcontent08>div');
	var $huantu=$('.Xcontent06>img');
	var $miaobian1=$('.Xcontent26>div');
	$miaobian.mousemove(function(){miaobian(this);});
	$miaobian1.click(function(){miaobian1(this);});
	function miaobian(thisMb){
		for(var i=0; i<$miaobian.length; i++){
			$miaobian[i].style.borderColor = '#dedede';
		}
		thisMb.style.borderColor = '#cd2426';
	
		$huantu[0].src = thisMb.children[0].src;
	}
	function miaobian1(thisMb1){
		for(var i=0; i<$miaobian1.length; i++){
			$miaobian1[i].style.borderColor = '#dedede';
		}
	//		thisMb.style.borderColor = '#cd2426';
		$miaobian.css('border-color','#dedede');
		thisMb1.style.borderColor = '#cd2426';
		$huantu[0].src = thisMb1.children[0].src;
	}
	
	$(".Xcontent33").click(function(){
		var value=parseInt($('.input').val())+1;
		$('.input').val(value);
	})
	
	$(".Xcontent32").click(function(){	
		var num = $(".input").val()
		if(num>0){
			$(".input").val(num-1);
		}			
	})
	

	$(".hrefOrderConfirm").click(function(){
		//alert("<%=basePath%>direct/orderconfirm.action");
		//var link=$(".hrefOrderConfirm").attr("<%=basePath%>direct/orderconfirm.action");
		 //触发href连接
		 //window.location.href=link;
		
		 
		  var user='<%=session.getAttribute("user")%>'; 
		  if(user=="null"||user=="")
		  {
			  alert("您还未登陆，请先登录！");
			  window.location.href="<%=basePath%>direct/index.action";
			  //window.location.href="loginCheck.html";
			  return false;
		  }else{
			  //alert("您还未登陆，请先登录！");
			  window.location.href="<%=basePath%>user/orderconfirm.action?productId="+document.getElementById("productId").value+"&number="+document.getElementById("number").value;
			  return false;
		  }
	})
	
	
	//商品点击收藏
	$(".collection").click(function(){
		//alert("<%=basePath%>direct/orderconfirm.action");
		//var link=$(".hrefOrderConfirm").attr("<%=basePath%>direct/orderconfirm.action");
		 //触发href连接
		 //window.location.href=link;
		
		 
		  var user='<%=session.getAttribute("user")%>'; 
		  if(user=="null"||user=="")
		  {
			  alert("您还未登陆，请先登录！");
			  window.location.href="<%=basePath%>direct/index.action";
			  //window.location.href="loginCheck.html";
			  return false;
		  }else{
			  //已经登录，进行用户收藏
			  var productid = $('#productId').val();
			  
			  var data = '{"params":{"productid":'+productid+'}}';
			  
			  //var data = 
			  collection(data);
			  //alert(productid);
			  return false;
		  }
	})
	
})

function collection(data){
	$.ajax({
		type: "post",
		async: true,
        url: "<%=basePath%>user/userProductCollection.action",
        contentType: "application/json; charset=utf-8",
        data: data,
        dataType: "json",
        success: function (message) {
        	if(message.rtnCode == '1'){
        		alert("收藏成功！");
        	}else{
        		alert("收藏失败！");
        	}
        	return true;
        },
        error: function (message) {
            alert("环境异常！");
            return false;
        }
	});
}
</script>



</head>
<body>

<div class="Xcontent">
	<ul class="Xcontent01">
		<div class="Xcontent06">
			<c:if test="${not empty requestScope.rtnObject.artdesign_ImgresourceList[0]}"> 
				 <img src="<%=basePath%>${requestScope.rtnObject.artdesign_ImgresourceList[0].url}">
				 <%-- <div class="Xcontent07"><img class="item-img" src="<%=basePath%>${requestScope.rtnObject.artdesign_ImgresourceList[0].url}"></div> --%>
			</c:if> 
			<%-- <img src="<%=basePath%>/static/img/showProd/X1.png"> --%>
		</div>
		<ol class="Xcontent08">
			
			<c:if test="${not empty requestScope.rtnObject.artdesign_ImgresourceList[0]}"> 
				 <div class="Xcontent07"><img class="item-img" src="<%=basePath%>${requestScope.rtnObject.artdesign_ImgresourceList[0].url}"></div>
			</c:if> 
			<c:if test="${not empty requestScope.rtnObject.artdesign_ImgresourceList[0]}"> 
				 <div class="Xcontent09"><img class="item-img" src="<%=basePath%>${requestScope.rtnObject.artdesign_ImgresourceList[1].url}"></div>
			</c:if>
			<c:if test="${not empty requestScope.rtnObject.artdesign_ImgresourceList[0]}"> 
				 <div class="Xcontent10"><img class="item-img" src="<%=basePath%>${requestScope.rtnObject.artdesign_ImgresourceList[2].url}"></div>
			</c:if>
			<c:if test="${not empty requestScope.rtnObject.artdesign_ImgresourceList[0]}"> 
				 <div class="Xcontent11"><img class="item-img" src="<%=basePath%>${requestScope.rtnObject.artdesign_ImgresourceList[3].url}"></div>
			</c:if>
			<c:if test="${not empty requestScope.rtnObject.artdesign_ImgresourceList[0]}"> 
				 <div class="Xcontent12"><img class="item-img" src="<%=basePath%>${requestScope.rtnObject.artdesign_ImgresourceList[4].url}"></div>
			</c:if>

		</ol>
		<ol class="Xcontent13">
			<div class="Xcontent14"><a href="#"><p>${requestScope.rtnObject.product_Artdesign.title}</p></a></div>
			<div class="Xcontent15"><img src="<%=basePath%>/static/img/showProd/X11.png"></div>
			<div class="Xcontent16"><p>信息描述</p></div>
			<div class="Xcontent17">
				<input class="productId" style="display:none;" name="productId" id="productId" value="${requestScope.rtnObject.product_Artdesign.id}"></input>
				<p class="Xcontent18">售价</p>
				<p class="Xcontent19">B<span>${requestScope.rtnObject.product_Artdesign.price}</span></p>
				<div class="Xcontent20">
					<p class="Xcontent21">促销</p>
					<img src="<%=basePath%>/static/img/showProd/X12.png">
					<p class="Xcontent22">优惠${requestScope.rtnObject.product_Artdesign.discount}</p>
				</div>
				<div class="Xcontent23">
					<p class="Xcontent24">服务</p>
					<p class="Xcontent25">3次无条件修改&nbsp;&nbsp;&nbsp;&nbsp;       1次 设计修改建议&nbsp;&nbsp;&nbsp;&nbsp;        返积分200B</p>
				</div>
				
			</div>
			<%-- <div class="Xcontent26">
				<p class="Xcontent27">颜色</p>
				<div class="Xcontent28"><img  src="<%=basePath%>/static/img/showProd/X14.png"></div>
					<div class="Xcontent29"><img  src="<%=basePath%>/static/img/showProd/X1.png"></div>
			</div> --%>
			<div class="Xcontent30">
				<p class="Xcontent31">数量</p>
				<div class="Xcontent32"><img src="<%=basePath%>/static/img/showProd/X15.png"></div>
				<form><input class="input" id="number" name="number"  value="1"></input></form>
				<div class="Xcontent33"><img src="<%=basePath%>/static/img/showProd/16.png"></div>
			</div>
			<div class="Xcontent34"><a class="collection" href="#"><img src="<%=basePath%>/static/img/showProd/X17.png"></a></div>
			<div class="Xcontent35"><a class="hrefOrderConfirm" id="hrefOrderConfirm"><img src="<%=basePath%>/static/img/showProd/X18.png"></a></div>
		</ol>
	</ul>
</div>

</body>
</html>