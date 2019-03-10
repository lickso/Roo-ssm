<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%-- <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>
<%-- <%@ page isELIgnored="false" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/carousel/style.css" media="screen" />

<script type="text/javascript" language="javascript">


$(function(){
	getCarousel();
 	setInterval(getCarousel,600000);
});

function getCarousel(){
	/* var myDate = new Date();
	alert(myDate.toLocaleDateString()); */
	//alert(myDate);
	append();
	var data = {};
	$.ajax({
		type: "post",
		async: false,
        url: "<%=basePath%>outshow/indexCarouselShow.action",
        contentType: "application/json; charset=UTF-8",
        data: data,
        dataType: "json",
        success: function (message) {
        	var dataObj = message.CarouselList;
        	
        	var html = '<div class="fullwidthbanner-container"><div class="fullwidthbanner"><ul>';
        					
								
        	
			for(var i=0;i<dataObj.length;i++){
				var li = '<li data-transition="3dcurtain-horizontal" data-slotamount="15" data-masterspeed="300">';
				li+='<img src="' + <%=basePath%> + dataObj[i].imgurl +'" alt=""/></li>'
				html+=li;
            } 
			
        	
        	html+='</ul></div></div>';
        	
        	//alert(html);
        	$("#wrapper").html(html);
			 
        	
								 
        },
        error: function (message) {
            alert("fail");
        }
	});
	
	function append() {
		var head = document.getElementsByTagName('HEAD').item(0);
		var script = document.createElement("script"); 
		script.src = "<%=basePath%>static/js/carousel/banner.js";
		script.type="text/javascript";
		script.charset="UTF-8";
		head.appendChild(script);
	}
	
	/* $("#wrapper").append("fdsadfsa"); */
}
</script>

<script src="<%=basePath%>static/base/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>static/js/carousel/jquery.banner.revolution.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/carousel/banner.js"></script>





</head>
<body>
<%-- <div id="wrapper">
	<div class="fullwidthbanner-container">
		<div class="fullwidthbanner">
			<ul>
				<li data-transition="3dcurtain-horizontal" data-slotamount="15" data-masterspeed="300">
					<img src="<%=basePath%>/static/img/carousel/slides/slide3.jpg" alt=""/>									
				</li>
				<li data-transition="3dcurtain-vertical" data-slotamount="15" data-masterspeed="300" data-link="#">
					<img src="<%=basePath%>/static/img/carousel/slides/slide5.jpg" alt="" />
				</li>
				<li data-transition="papercut" data-slotamount="15" data-masterspeed="300" data-link="#">
					<img src="<%=basePath%>/static/img/carousel/slides/slide2.jpg" alt="" />
				</li>
				<li data-transition="turnoff" data-slotamount="15" data-masterspeed="300">
					<img src="<%=basePath%>/static/img/carousel/slides/slide1.jpg" alt="" />
				</li>	
				<li data-transition="flyin" data-slotamount="15" data-masterspeed="300">
					<img src="<%=basePath%>/static/img/carousel/slides/slide6.jpg" alt="" />	 
				</li>					
			</ul>
		</div>
	</div>
</div> --%>

<div id="wrapper">
</div>
</body>
	
</html>