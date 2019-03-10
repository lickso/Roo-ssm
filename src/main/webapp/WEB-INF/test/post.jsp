<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>login</title>
<!-- <link href="static/css/search/base.css" type="text/css" rel="stylesheet" /> -->

<script src="static/base/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="static/base/jquery-3.1.1.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
<%-- debugger;
//var name = document.getElemengtById("user").value;
//var password = document.getElementById("pswd").value;
var name = $("input[name='user']").val();
var password = $("input[name='pswd']").val();

//var data = {"name":$('input[name="user"]').val(),"password":$('input[name="pswd"]').val()};
function post(){
	var data = '{ "name":"' + $("input[name='user']").val() + '","password":"' + $("input[name='pswd']").val() + '"}';
	//var data1 = {};
	$.ajax({
		type: "post",
		async: false,
        url: "<%=basePath%>test/shiro.action",
        contentType: "application/json; charset=utf-8",
        data: data,
        dataType: "json",
        success: function (message) {
          alert(message.object);
        },
        error: function (message) {
            alert("fail");
        }
	});
} --%>

//登录提示方法
function loginsubmit() {
	alert("hello");
	$("#loginform").submit();
}


</script>
</head>
<body>
	<form id="loginform" action="<%=basePath%>user/userRegister.action" method="post">
	<!-- <form> -->	
		<p>
			user:<input type = "text" name = "username" id = "user"/>
		</p>
		<p>
			pswd:<input type = "password" name = "password" id = "pswd"/>
		</p>
		<p>
			<button type = "button" onclick="loginsubmit()" value="登&nbsp;&nbsp;录" />po</button>
		</p>
		<shiro:user/>
			
		<!-- <p>
				<button type = "submit" id = "submit" onclick = "post()">po</button>
		</p> -->
	</form>
	<font color = "red">${error }</font>
	
</body>
	
</html>