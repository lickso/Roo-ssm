<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%-- <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  --%> 
<%-- <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<link href="<%=basePath%>static/css/bottom/style.css" rel="stylesheet" />

<%-- <script type="text/javascript" src="<%=basePath%>static/js/bottom/script.js"></script> --%>
<script type="text/javascript">
$(document).ready(function () {


	$(".official-plat ul li:first-child").hover(function () {
		$(".weixin").show();
		$(".weibo").hide();
	});
	$("li[title='点击打开官方微博']").hover(function () {
		$(".weixin").hide();
		$(".weibo").show();
	});

	//href="#a_null"的统一设置为无效链接
	$("a[href='#a_null']").click(function () {
		return false;
	});


});

//波浪动画
$(function () {
	var marqueeScroll = function (id1, id2, id3, timer) {
		var $parent = $("#" + id1);
		var $goal = $("#" + id2);
		var $closegoal = $("#" + id3);
		$closegoal.html($goal.html());
		function Marquee() {
			if (parseInt($parent.scrollLeft()) - $closegoal.width() >= 0) {
				$parent.scrollLeft(parseInt($parent.scrollLeft()) - $goal.width());
			}
			else {
				$parent.scrollLeft($parent.scrollLeft() + 1);
			}
		}

		setInterval(Marquee, timer);
	}
	var marqueeScroll1 = new marqueeScroll("marquee-box", "wave-list-box1", "wave-list-box2", 20);
	var marqueeScroll2 = new marqueeScroll("marquee-box3", "wave-list-box4", "wave-list-box5", 40);
});

</script>
</head>
<body>
<div style="margin-top: 20px"></div>

<!-- footer -->
<%-- <div class="wave-box">

	<div class="marquee-box marquee-up" id="marquee-box">
		<div class="marquee">
			<div class="wave-list-box" id="wave-list-box1">
				<ul>
					<li><img height="60" alt="波浪" src="<%=basePath%>static/img/bottom/wave_02.png"></li>
				</ul>
			</div>
			<div class="wave-list-box" id="wave-list-box2">
				<ul>
					<li><img height="60" alt="波浪" src="<%=basePath%>static/img/bottom/wave_02.png"></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="marquee-box" id="marquee-box3">
		<div class="marquee">
			<div class="wave-list-box" id="wave-list-box4">
				<ul>
					<li><img height="60" alt="波浪" src="<%=basePath%>static/img/bottom/wave_01.png"></li>
				</ul>
			</div>
			<div class="wave-list-box" id="wave-list-box5">
				<ul>
					<li><img height="60" alt="波浪" src="<%=basePath%>static/img/bottom/wave_01.png"></li>
				</ul>
			</div>
		</div>
	</div>

</div> --%>
<div class="bottom-footer">
	<div class="auto clearfix">

		<!-- footer主要-->
		<div class="five-superiority">
			<ul class="five-superiority-list clearfix">
				<li class="compensate_ico">
					<a href="#compensate">
						<span class="superiority-icon"></span>
						<span>需求索赔</span>
					</a>
				</li>
				<li class="retreat_ico">
					<a href="#refund">
						<span class="superiority-icon"></span>
						<span>项目退款</span>
					</a>
				</li>
				<li class="technology_ico">
					<a class="superiority-text" href="#afterService">
						<span class="superiority-icon"></span>
						<span>需求追加</span>
					</a>
				</li>
				<li class="prepare_ico">
					<a href="#ico">
						<span class="superiority-icon"></span>
						<span>网络备案</span>
					</a>
				</li>
				<li class="service_ico">
					<a href="#secret">
						<span class="superiority-icon"></span>
						<span>VIP尊享</span>
					</a>
				</li>
			</ul>
		</div>

		<div class="footer-floor1">
			<div class="footer-list">
				<ul>
					<li class="flist-title">产品与服务</li>
					<li><a href="#"><strong>个性相册</strong></a></li>
					<li><a href="#"><strong>电商服务</strong></a></li>
					<li><a href="#"><strong>LOGO优选</strong></a></li>
					<li><a href="#"><strong>企业策划</strong></a></li>
				</ul>
				<ul>
					<li class="flist-title">优选设计</li>
					<li><a href="#">电商设计</a></li>
					<li><a href="#">海报设计</a></li>
					<li><a href="#">LOGO设计</a></li>
					<li><a href="#">文案设计</a></li>
				</ul>
				<!-- <ul>
					<li class="flist-title">技术支持</li>
					<li><a href="#" target="user/">美工设计</a></li>
					<li><a href="http://icp.niaoyun.com/">备案中心</a></li>
					<li><a href="#">LOGO设计</a></li>
					<li><a href="">策划设计</a></li>
					<li><a href="#">IT设计</a></li>
					<li><a href="#">咨询中心</a></li>
				</ul> -->
				<ul>
					<li class="flist-title">关于我们</li>
					<li><a href="#">公司简介</a></li>
					<li><a href="#">新闻动态</a></li>
					<li><a href="#">加入我们</a></li>
					<!-- <li><a href="#">服务协议</a></li> -->
					<li><a href="#">联系我们</a></li>
				</ul>
				<ul class="flist-4">
					<li class="flist-title">友情链接</li>
					<li><a href="#">lickso</a></li>
					<li><a href="#">木公益</a></li>
					<li><a href="#">立森网</a></li>
					<li><a href="#">庚号网</a></li>
				</ul>
				<div class="clear-float"></div>
			</div>
			<div class="footer-right">
				<div class="telephone" title="服务热线">
				<!-- <div class="tel-number">服务热线</div> -->
					<!-- <span></span> -->
					<div class="tel-number">185-4125-0124</div>
				</div>
				<!-- <div class="official-plat">
					<p class="weixin" style="background-image: "><span id="wx-corner"></span></p>

					<p class="weibo" style="background-image: "><span id="wb-corner"></span></p>
					<ul>
						<li><a href="#a_null"><span class="weixin-logo"></span>公司官方微信</a></li>
						<li title="点击打开官方微博"><a href="#" target="_blank"><span class="weibo-logo"></span>公司官方微博</a></li>
						<li title="点击打开官方客服"><a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=XXXXXXXX&amp;aty=0&amp;a=0&amp;curl=&amp;ty=1"><span class="qq-logo"></span>公司官方客服</a></li>
					</ul>
				</div> -->
			</div>
			<div class="clear-float"></div>
		</div>
	</div>
</div>
<!-- footer end -->

<!-- <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p></p>
<p></p>
</div> -->
</body>
</html>