<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%
	String basePath = request.getContextPath()+"/";
%>
<%@ page isELIgnored="false" %>
<%@ include file="../head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- <link href="<%=basePath%>static/css/search/base.css" type="text/css" rel="stylesheet" /> -->

<link type="text/css" rel="stylesheet" href="<%=basePath%>/static/css/showProdList/base.css" />

<script type="text/javascript" src="<%=basePath%>static/js/showProdList/common.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/showProdList/quick_links.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/showProdList/ieBetter.js"></script>

<script src="<%=basePath%>static/js/showProdList/parabola.js" type="text/javascript"></script>

<script type="text/javascript">
	$(".quick_links_panel li").mouseenter(function(){
		$(this).children(".mp_tooltip").animate({left:-92,queue:true});
		$(this).children(".mp_tooltip").css("visibility","visible");
		$(this).children(".ibar_login_box").css("display","block");
	});
	$(".quick_links_panel li").mouseleave(function(){
		$(this).children(".mp_tooltip").css("visibility","hidden");
		$(this).children(".mp_tooltip").animate({left:-121,queue:true});
		$(this).children(".ibar_login_box").css("display","none");
	});
	$(".quick_toggle li").mouseover(function(){
		$(this).children(".mp_qrcode").show();
	});
	$(".quick_toggle li").mouseleave(function(){
		$(this).children(".mp_qrcode").hide();
	});

// 元素以及其他一些变量
var eleFlyElement = document.querySelector("#flyItem"), eleShopCart = document.querySelector("#shopCart");
var numberItem = 0;
// 抛物线运动
var myParabola = funParabola(eleFlyElement, eleShopCart, {
	speed: 400, //抛物线速度
	curvature: 0.0008, //控制抛物线弧度
	complete: function() {
		eleFlyElement.style.visibility = "hidden";
		eleShopCart.querySelector("span").innerHTML = ++numberItem;
	}
});
// 绑定点击事件
if (eleFlyElement && eleShopCart) {
	
	[].slice.call(document.getElementsByClassName("btnCart")).forEach(function(button) {
		button.addEventListener("click", function(event) {
			// 滚动大小
			var scrollLeft = document.documentElement.scrollLeft || document.body.scrollLeft || 0,
			    scrollTop = document.documentElement.scrollTop || document.body.scrollTop || 0;
			eleFlyElement.style.left = event.clientX + scrollLeft + "px";
			eleFlyElement.style.top = event.clientY + scrollTop + "px";
			eleFlyElement.style.visibility = "visible";
			
			// 需要重定位
			myParabola.position().move();			
		});
	});
}
</script>


</head>
<body id="home" style="height:1000px;">
<!--左侧产品parabola.js控制-->
<div class="main">
    <div id="plist">
        <ul>
        	
        	<c:forEach items="${requestScope.rtnObject}" var="u">
        		<li>
                <div class="lh_wrap">
                    <div class="p-img"><a href="<%=basePath%>common/showProd.action?id=${u.id}"><img src="<%=basePath%>${u.artdesign_ImgresourceList[0].url}" width="240" height="180"></a></div>
                    <div class="p-name"><a href="#">${u.product_Artdesign.title}</a></div>
                    <div class="p-price"><strong>${u.product_Artdesign.price}币</strong><span id="p200"></span></div>
                    <div class="extra"><a href="#">赏析${u.product_Artdesign.viewcount}次</a></div>
                    <div class="btns">
                    
                    	<!-- <input type="button" class="add_cart_large btnCart" value="加入购物车"/>
                    	<input type="button" class="add_cart_small btnCart" value="关注"/> -->
                    	
                    	<%-- <a href="<%=basePath%>common/showProd.action?id=${u.id}">加入购物车</a> --%>
                    	
                    	
                    	<%-- <a href="<%=basePath%>get_index.jsp?number=<%=number %>">到达get_index</a> --%>
                    	
                    	<!-- <input href="javascript:;" class="add_cart_small btnCart">关注</input> -->
                        <!-- <input href="javascript:;" class="add_cart_small btnCart">关注</input> -->
                    	
                        <!-- <a href="javascript:;" class="add_cart_large btnCart">加入购物车</a>
                        <a href="javascript:;" class="add_cart_small btnCart">关注</a> -->
                        <!-- <a class="btn-compare">
                            <input id="147" onClick="Compare.add(this, 147,'入驻商家测试商品3','1', 'images/201408/thumb_img/147_thumb_G_1409275114094.jpg', '￥300', '￥360')" type="checkbox">
                            <label for="147">对比</label>
                        </a> -->
                    </div>
                </div>
            	</li>
        		
        		
      			<%-- ${u.id}<br/> --%>
   			</c:forEach>
        	
        	<%-- <c:forEach items="${requestScope.rtnObject}"var="u"> --%>
      			<%-- ${requestScope.rtnObject.id} --%>
        	
            <%-- <li>
                <div class="lh_wrap">
                    <div class="p-img"><a href="#"><img alt="入驻商家测试商品3" src="<%=basePath%>/static/img/carousel/slides/slide3.jpg" title="入驻商家测试商品3" width="240" height="240"></a></div>
                    <div class="p-name"><a href="#" title="入驻商家测试商品3">入驻商家测试商品3</a></div>
                    <div class="p-price"><strong>￥300</strong><span id="p200"></span></div>
                    <div class="extra"><a href="#">已售出0件</a></div>
                    <div class="btns">
                        <a href="javascript:;" class="add_cart_large btnCart">加入购物车</a>
                        <a href="javascript:;" class="add_cart_small btnCart">关注</a>
                        <a class="btn-compare">
                            <input id="147" onClick="Compare.add(this, 147,'入驻商家测试商品3','1', '<%=basePath%>/static/img/carousel/slides/slide3.jpg', '￥300', '￥360')" type="checkbox">
                            <label for="147">对比</label>
                        </a>
                    </div>
                </div>
            </li> --%>
           
        </ul>
    </div>
    <div id="flyItem" class="fly_item"><img src="<%=basePath%>/static/img/showProdList/item-pic.jpg" width="40" height="40"></div>
</div>

<!--右侧贴边导航quick_links.js控制-->
<%-- <div class="mui-mbar-tabs">
	<div class="quick_link_mian">
		<div class="quick_links_panel">
			<div id="quick_links" class="quick_links">
				<li>
					<a href="#" class="my_qlinks"><i class="setting"></i></a>
					<div class="ibar_login_box status_login">
						<div class="avatar_box">
							<p class="avatar_imgbox"><img src="<%=basePath%>/static/img/showProdList/no-img_mid_.jpg" /></p>
							<ul class="user_info">
								<li>用户名：sl19931003</li>
								<li>级&nbsp;别：普通会员</li>
							</ul>
						</div>
						<div class="login_btnbox">
							<a href="#" class="login_order">我的订单</a>
							<a href="#" class="login_favorite">我的收藏</a>
						</div>
						<i class="icon_arrow_white"></i>
					</div>
				</li>
				<li id="shopCart">
					<a href="#" class="message_list" ><i class="message"></i><div class="span">购物车</div><span class="cart_num">0</span></a>
				</li>
				<li>
					<a href="#" class="history_list"><i class="view"></i></a>
					<div class="mp_tooltip" style=" visibility:hidden;">我的资产<i class="icon_arrow_right_black"></i></div>
				</li>
				<li>
					<a href="#" class="mpbtn_histroy"><i class="zuji"></i></a>
					<div class="mp_tooltip">我的足迹<i class="icon_arrow_right_black"></i></div>
				</li>
				<li>
					<a href="#" class="mpbtn_wdsc"><i class="wdsc"></i></a>
					<div class="mp_tooltip">我的收藏<i class="icon_arrow_right_black"></i></div>
				</li>
				<li>
					<a href="#" class="mpbtn_recharge"><i class="chongzhi"></i></a>
					<div class="mp_tooltip">我要充值<i class="icon_arrow_right_black"></i></div>
				</li>
			</div>
			<div class="quick_toggle">
				<li>
					<a href="#"><i class="kfzx"></i></a>
					<div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
				</li>
				<li>
					<a href="#none"><i class="mpbtn_qrcode"></i></a>
					<div class="mp_qrcode" style="display:none;"><img src="<%=basePath%>/static/img/showProdList/weixin_code_145.png" width="148" height="175" /><i class="icon_arrow_white"></i></div>
				</li>
				<li><a href="#top" class="return_top"><i class="top"></i></a></li>
			</div>
		</div>
		<div id="quick_links_pop" class="quick_links_pop hide"></div>
	</div>
</div> --%>


<!--[if lte IE 8]>
<script src="js/ieBetter.js"></script>
<![endif]-->



<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';clear:both;">
</div>
</body>
</html>