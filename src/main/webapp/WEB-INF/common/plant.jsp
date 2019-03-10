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
<!-- <link href="static/css/search/base.css" type="text/css" rel="stylesheet" /> -->

<!-- <script src="static/base/jquery-3.1.1.min.js" type="text/javascript"></script> -->
<link href="<%=basePath%>static/css/plant/css.css" rel="stylesheet" />
<link href="<%=basePath%>static/css/plant/style.css" rel="stylesheet" />
<!-- <script type="text/javascript" src="static/js/plant/jquery.js"></script> -->
<script type="text/javascript" src="<%=basePath%>static/js/plant/jquery.SuperSlide.js"></script>
<style type="text/css">
div,ul,li,a,span,img{margin:0;padding:0;}
li{list-style:none;}
#slider{width:790px;height:340px;margin:0% auto;position:relative;}
.slider_list li{position:absolute;display:none;}
.slider_list li:first-child{display:block;}
.slider_icon{position:absolute;z-index:1;left:40%;bottom:20px;font-size:0;padding:4px 8px;border-radius:12px;background-color:hsla(0,0%,100%,.3);}
.slider_icon i{display:inline-block;width:12px;height:12px;border-radius:50%;margin:0 5px;}
.btn{background:#fff;}
.arrow{display:none;width:30px;height:60px;background-color:rgba(0,0,0,.2);position:absolute;top:50%;margin-top:-30px;}
.prve{left:0;}
.next{right:0;}
.arrow span{display:block;width:10px;height:10px;border-bottom:2px solid #fff;border-left:2px solid #fff;}
.slider_left{margin:25px 0 0 10px;transform:rotate(45deg);}
.slider_right{margin:25px 0 0 5px;transform:rotate(-135deg);}
.arrow:hover{background:#444;}
#slider:hover .arrow{display:block;}
.btn_act{background:#db192a;}
</style>

<script type="text/javascript">
$(function(){
	var count = 0;
	var $li = $("#slider>ul>li");
	$(".next").click(function(){
		count++;				
		if(count == $li.length){
			count =0;
		}
		$li.eq(count).fadeIn().siblings().fadeOut();
		$(".slider_icon i").eq(count).addClass("btn_act").siblings().removeClass('btn_act');
		console.log(count);
	});
	$(".prve").click(function(){
		count--;
		if(count == -1){
			count = $li.length-1;
		}
		console.log(count);
		$li.eq(count).fadeIn().siblings().fadeOut();
		$(".slider_icon i").eq(count).addClass("btn_act").siblings().removeClass('btn_act');
	});
	$(".slider_icon i").mouseenter(function(){
		$(this).addClass('btn_act').siblings().removeClass("btn_act");
		$li.eq($(this).index()).fadeIn().siblings().fadeOut();
		count = $(this).index();
	});
});
</script>
</head>
<body>
<div class="div-max">
<div class="div">
	<div class="div001">
		<div class="div01">
			<p>LOGO</p><br/>
			<p>量身定制首选</p>
		</div>
		<div class="div02">
			<ul>
			   <li><div style = "width:100%;height:30px;background:red;"><a href="#">世界十大未解之迷</a></li>
			   <li><a href="#">三国演义</a></li>
			   <li><a href="#">The Dream World</a></li>
			</ul>
		</div>
	</div>
	<div class="div002">
		<div class="div21">
			<a href="#"><img src="<%=basePath%>/static/img/plant/logo/img/dapai.png" style = "width:100%;height:100%;"/></a>
		</div>
		<div class="div22">
			<a href="#"><img src="<%=basePath%>/static/img/plant/logo/img/jinxaun.png" style = "width:100%;height:100%;"/></a>
		</div>
	</div>
	<div class="div003">
		<div id="slider">
	<ul class="slider_list">
		<li><a href="#"><img src="<%=basePath%>/static/img/plant/logo/img/59e5df51Na34c52da.jpg"></a></li>
		<li><a href="#"><img src="<%=basePath%>/static/img/plant/logo/img/59e6f772Nde97ca5e.jpg"></a></li>
		<li><a href="#"><img src="<%=basePath%>/static/img/plant/logo/img/59e8ab7dN48b529e7.jpg"></a></li>
		<li><a href="#"><img src="<%=basePath%>/static/img/plant/logo/imag/59e89be7N0031c258.jpg"></a></li>
		<li><a href="#"><img src="<%=basePath%>/static/img/plant/logo/img/59e980a2Nc4314079.jpg"></a></li>
		<li><a href="#"><img src="<%=basePath%>/static/img/plant/logo/img/59ed6dd8Ncaee86ed.jpg"></a></li>
		<li><a href="#"><img src="<%=basePath%>/static/img/plant/logo/img/59e99072N4baea8f3.jpg"></a></li>
		<li><a href="#"><img src="<%=basePath%>/static/img/plant/logo/img/598abe52Nb1c8cfe4.jpg"></a></li>
	</ul>
	<div class="slider_icon">
		<i class="btn btn_act"></i>
		<i class="btn"></i>
		<i class="btn"></i>
		<i class="btn"></i>
		<i class="btn"></i>
		<i class="btn"></i>
		<i class="btn"></i>
		<i class="btn"></i>
	</div>
	<a href="javascript:;" class="arrow prve">
		<span class="slider_left"></span>
	</a>
	<a href="javascript:;" class="arrow next">
		<span class="slider_right"></span>
	</a>
</div>
	</div>
	<div class="div004">
		<div class="tmall-ad" style="margin:0px auto">
  <div class="tempWrap" style="overflow:hidden; position:relative; width:200px">
    <ul class="fCs-con" style="width: 600px; position: relative; overflow: hidden; padding: 0px; margin: 0px; left: 0px;">
      <li style="float: left; width: 200px;"><a href="#"><img src="<%=basePath%>/static/img/plant/logo/images/1.jpg"></a></li>
      <li style="float: left; width: 200px;"><a href="#"><img src="<%=basePath%>/static/img/plant/logo/images/2.jpg"></a></li>
      <li style="float: left; width: 200px;"><a href="#"><img src="<%=basePath%>/static/img/plant/logo/images/3.jpg"></a></li>
    </ul>
  </div>
<ul class="fCs-nav">
<li class="fCs-nav1 on" style="width: 160px; display: list-item;"><a href="#" target="_blank">保暖内衣 全场包邮</a><s></s></li>
<li class="fCs-nav2" style="width: 140px; display: list-item;"><a href="#" target="_blank">冬季新品 火热抢购</a><s></s></li>
<li class="fCs-nav3" style="width: 140px; display: list-item;"><a href="#" target="_blank">男款棉衣精选包邮</a><s></s></li>
</ul>
</div>
	</div>
</div>
</div>


<script type="text/javascript">jQuery(".tmall-ad").slide({ titCell:".fCs-nav li", mainCell:".fCs-con", effect:"left",delayTime:500,easing:"easeInOutQuad",startFun:function(i){ jQuery(".tmall-ad .fCs-nav li").eq(i).animate({"width":160},200).siblings().animate({"width":140},200) }});</script>
</body>
</html>