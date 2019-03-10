<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
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
<link href="<%=basePath%>static/css/recommendShow/base.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath%>static/css/recommendShow/home.css" type="text/css" rel="stylesheet" />

<!-- <script src="static/base/jquery-3.1.1.min.js" type="text/javascript"></script> -->
<script type="text/javascript" src="<%=basePath%>static/js/recommendShow/ad.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/recommendShow/banner.js"></script>

<script type="text/javascript">

</script>
</head>
<body>
<!-- 	<body> -->
<!-- <div style="height:100px;"></div> -->
<div class="aui-content-max">
	<div class="aui-sale-time">
		<a href="javascript:;" class="aui-sale-time-link">
			<div class="aui-sale-title">优惠体验</div>
			<div class="aui-sale-second">LICKSO & SUPPORT</div>
			<div class="aui-sale-icon-sd"></div>
			<div class="aui-sale-ends">本场限时特惠</div>
			<!-- <div class="aui-sale-count">
				<div class="aui-sale-count-item">
					<span id="hour_show">00时</span>
				</div>
				<div class="aui-sale-count-item">
					<span id="minute_show">00分</span>
				</div>
				<div class="aui-sale-count-item">
					<span id="second_show">00秒</span>
				</div>
			</div> -->
		</a>
	</div>
	<div class="aui-content-box">
		<div class="prev">
			<a href="javascript:void(0)">
				<img src="<%=basePath%>/static/img/recommendShow/prev.png" alt="">
			</a>
		</div>
		<div class="aui-content-box-ovf">
			<div class="aui-content-box-list">
				<ul>
					<li>
						<a href="#">
							<div class="aui-content-item-img">
								<img src="<%=basePath%>/static/img/recommendShow/pd1.jpg" alt="">
							</div>
							<p class="aui-content-item-name">家杰 洗刷刷 免手洗平板拖把拖布 家用擦木地板瓷砖旋转墩布 洗脱合一自刷洗拖把桶 3块布 JJ-A18</p>
							<div class="aui-content-price">
								<span class="aui-content-price-new">
									<i>¥</i>
									<span>109.90</span>
								</span>
								<span class="aui-content-price-origin">
									<i>¥</i>
									<span>229.90</span>
								</span>
							</div>
						</a>
					</li>
					<%-- <li>
						<a href="#">
							<div class="aui-content-item-img">
								<img src="<%=basePath%>/static/img/recommendShow/pd2.jpg" alt="">
							</div>
							<p class="aui-content-item-name">魅族 PRO 6 Plus 4GB+64GB 公开版 香槟金 移动联通4G手机 双卡双待</p>
							<div class="aui-content-price">
								<span class="aui-content-price-new">
									<i>¥</i>
									<span>109.90</span>
								</span>
								<span class="aui-content-price-origin">
									<i>¥</i>
									<span>229.90</span>
								</span>
							</div>
						</a>
					</li> --%>
					<li>
						<a href="#">
							<div class="aui-content-item-img">
								<img src="<%=basePath%>/static/img/recommendShow/pd3.jpg" alt="">
							</div>
							<p class="aui-content-item-name">小米MIX2 全面屏游戏手机 8GB+128GB 全陶瓷尊享版 黑色 全网通4G手机 双卡双待</p>
							<div class="aui-content-price">
								<span class="aui-content-price-new">
									<i>¥</i>
									<span>109.90</span>
								</span>
								<span class="aui-content-price-origin">
									<i>¥</i>
									<span>229.90</span>
								</span>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="aui-content-item-img">
								<img src="<%=basePath%>/static/img/recommendShow/pd4.jpg" alt="">
							</div>
							<p class="aui-content-item-name">双面屏阅读大屏手机 4+64G黑色 4G全网通 双卡双待手机</p>
							<div class="aui-content-price">
								<span class="aui-content-price-new">
									<i>¥</i>
									<span>109.90</span>
								</span>
								<span class="aui-content-price-origin">
									<i>¥</i>
									<span>229.90</span>
								</span>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="aui-content-item-img">
								<img src="<%=basePath%>/static/img/recommendShow/pd5.jpg" alt="">
							</div>
							<p class="aui-content-item-name">家杰 洗刷刷 免手洗平板拖把拖布 家用擦木地板瓷砖旋转墩布 洗脱合一自刷洗拖把桶 3块布 JJ-A18</p>
							<div class="aui-content-price">
								<span class="aui-content-price-new">
									<i>¥</i>
									<span>109.90</span>
								</span>
								<span class="aui-content-price-origin">
									<i>¥</i>
									<span>229.90</span>
								</span>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="aui-content-item-img">
								<img src="<%=basePath%>/static/img/recommendShow/pd6.jpg" alt="">
							</div>
							<p class="aui-content-item-name">魅族 PRO 6 Plus 4GB+64GB 公开版 香槟金 移动联通4G手机 双卡双待</p>
							<div class="aui-content-price">
								<span class="aui-content-price-new">
									<i>¥</i>
									<span>109.90</span>
								</span>
								<span class="aui-content-price-origin">
									<i>¥</i>
									<span>229.90</span>
								</span>
							</div>
						</a>
					</li>
					<%-- <li>
						<a href="#">
							<div class="aui-content-item-img">
								<img src="<%=basePath%>/static/img/recommendShow/pd7.jpg" alt="">
							</div>
							<p class="aui-content-item-name">小米MIX2 全面屏游戏手机 8GB+128GB 全陶瓷尊享版 黑色 全网通4G手机 双卡双待</p>
							<div class="aui-content-price">
								<span class="aui-content-price-new">
									<i>¥</i>
									<span>109.90</span>
								</span>
								<span class="aui-content-price-origin">
									<i>¥</i>
									<span>229.90</span>
								</span>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="aui-content-item-img">
								<img src="<%=basePath%>/static/img/recommendShow/pd8.jpg" alt="">
							</div>
							<p class="aui-content-item-name">双面屏阅读大屏手机 4+64G黑色 4G全网通 双卡双待手机</p>
							<div class="aui-content-price">
								<span class="aui-content-price-new">
									<i>¥</i>
									<span>109.90</span>
								</span>
								<span class="aui-content-price-origin">
									<i>¥</i>
									<span>229.90</span>
								</span>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="aui-content-item-img">
								<img src="<%=basePath%>/static/img/recommendShow/pd9.jpg" alt="">
							</div>
							<p class="aui-content-item-name">双面屏阅读大屏手机 4+64G黑色 4G全网通 双卡双待手机</p>
							<div class="aui-content-price">
								<span class="aui-content-price-new">
									<i>¥</i>
									<span>109.90</span>
								</span>
								<span class="aui-content-price-origin">
									<i>¥</i>
									<span>229.90</span>
								</span>
							</div>
						</a>
					</li> --%>
				</ul>
			</div>
		</div>
		<div class="next">
			<a href="javascript:void(0)">
				<img src="<%=basePath%>/static/img/recommendShow/next.png" alt="">
			</a>
		</div>
	</div>
	<div class="aui-small-ad">
		<div class="example2">
			<ul>
				<li>
					<img src="<%=basePath%>/static/img/recommendShow/ad2.jpg" alt="2">
				</li>
				<li>
					<img src="<%=basePath%>/static/img/recommendShow/ad1.jpg" alt="1">
				</li>
				<li>
					<img src="<%=basePath%>/static/img/recommendShow/ad3.jpg" alt="3">
				</li>
			</ul>
			<ol>
				<li></li>
				<li></li>
				<li></li>
			</ol>
		</div>
	</div>
</div>
<!-- <script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/banner.js"></script>
<script type="text/javascript" src="js/ad.js"></script> -->
<script type="text/javascript">
	

	//商品滚动
	$(function(){

		$(".next a").click(function(){ nextscroll() });

		function nextscroll(){

			var vcon = $(".aui-content-box-list ");

			var offset = ($(".aui-content-box-list li").width())*-1;

			vcon.stop().animate({left:offset},"slow",function(){

				var firstItem = $(".aui-content-box-list ul li").first();

				vcon.find("ul").append(firstItem);

				$(this).css("left","0px");

				circle()

			});

		};

		function circle(){

			var currentItem = $(".aui-content-box-list ul li").first();

			var currentIndex = currentItem.attr("index");

			$(".circle li").removeClass("circle-cur");

			$(".circle li").eq(currentIndex).addClass("circle-cur");

		}


		$(".prev a").click(function(){

			var vcon = $(".aui-content-box-list ");

			var offset = ($(".aui-content-box-list li").width()*-1);

			var lastItem = $(".aui-content-box-list ul li").last();

			vcon.find("ul").prepend(lastItem);

			vcon.css("left",offset);

			vcon.animate({left:"0px"},"slow",function(){

				circle()

			})

		});


	});

	var intDiff = parseInt(600000);//倒计时总秒数量

	function timer(intDiff){
		window.setInterval(function(){

			var day=0,

				hour=0,

				minute=0,

				second=0;//时间默认值

			if(intDiff > 0){

				day = Math.floor(intDiff / (60 * 60 * 24));

				hour = Math.floor(intDiff / (60 * 60)) - (day * 24);

				minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);

				second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);

			}

			if (minute <= 9) minute = '0' + minute;

			if (second <= 9) second = '0' + second;


			$('#hour_show').html('<s id="h"></s>'+hour+'时');

			$('#minute_show').html('<s></s>'+minute+'分');

			$('#second_show').html('<s></s>'+second+'秒');

			intDiff--;

		}, 1000);

	}


	$(function(){

		timer(intDiff);

	});

	//ad自动滚动
	$(function(){
		$(".example2").luara({width:"194",height:"275",interval:3500,selected:"seleted",deriction:"left"});

	});


</script>


<!-- </body> -->
</body>
</html>