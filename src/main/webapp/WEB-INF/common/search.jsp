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
<link rel="stylesheet" href="<%=basePath%>static/css/search/style.css" />
<!-- <script src="static/base/jquery-3.1.1.min.js" type="text/javascript"></script> -->
<!-- <script src="static/base/jquery-3.1.1.js" type="text/javascript"></script> -->
</head>
<body>
<div class="search_out">
	<div class="logo" style="padding-left:250px">
		<div class="logo_icon">
			<img width=80px src="<%=basePath%>static/img/base/logo.png"/>
		</div>
		<div class="logo_addr">
				<form>lickso.com</form>	
		</div>
	</div>
	<div class="search_in">
		<div class="zySearch" id="zySearch"></div>
	</div>
</div>
<script type="text/javascript" src="<%=basePath%>static/js/search/zySearch.js"></script>
<script type="text/javascript">
$("#zySearch").zySearch({
	"width":"355",
	"height":"33",
	"parentClass":"pageTitle",
	"callback":function(keywords){
		console.info("搜索的关键字");
		
		<%-- if(keywords == "" || keywords == null || keywords == undefined){
			alert("未输入查询信息！");
		}else{
			var url = "<%=basePath%>common/queryProuductByTitleOrDesc.action?";
		    url += "keywords="+keywords;
		    //重新定位url
		    window.location = url;
		} --%>
		
		var url = "<%=basePath%>common/queryProuductByTitleOrDesc.action?";
	    url += "keywords="+keywords;
	    //重新定位url
	    window.location = url;
		
	}
});
<%-- 
function query() {
	alert(00);
	/*var head = document.getElementsByTagName('HEAD').item(0);
	var script = document.createElement("script"); 
	script.src = "<%=basePath%>static/js/carousel/banner.js";
	script.type="text/javascript";
	script.charset="UTF-8";
	head.appendChild(script);*/
} --%>
</script>
</body>	
</html>