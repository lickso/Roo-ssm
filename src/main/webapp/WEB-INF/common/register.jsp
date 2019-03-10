<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>

<script src="<%=basePath%>/static/base/jquery-3.1.1.min.js" type="text/javascript"></script>
<!-- <script src="../static/js/register/index.js" type="text/javascript"></script> -->
<link rel="stylesheet" href="<%=basePath%>/static/css/register/index.css" />

<script type="text/javascript" language="javascript">
debugger;

/* var name = document.getElemengtById("username").value;
var password = document.getElementById("password").value; */

var name = $("input[name='username']").val();
var password = $("input[name='password']").val();

//var data = {"name":$('input[name="user"]').val(),"password":$('input[name="pswd"]').val()};
function post(){
	var data = '{ "name":"' + name + '","password":"' + password + '"}';
	//var data1 = {};
	$.ajax({
		type: "post",
		async: false,
        url: "<%=basePath%>common/userRegister.action",
        contentType: "application/json; charset=UTF-8",
        data: data,
        dataType: "string",
        success: function (message) {
          alert(message.rtnCode);
        },
        error: function (message) {
            alert("fail");
        }
	});
}
</script>
</head>
<body>
	<header>
	<!-- <a href="#" class="logo"></a> -->
	<a href="#" class="logo">
		<img src="<%=basePath%>/static/img/base/logo.png" style="width:150px;height:50px;"/>
	</a>
	<div class="desc">欢迎注册</div>
</header>
<section>
	<form action="<%=basePath%>common/userRegister.action" method="post">
		<div class="register-box">
					<label for="username" class="username_label" >用 户 名
			<input maxlength="20" type="text" placeholder="您的用户名和登录名" class="name" name="name"/>
					</label>
			<div class="tips">
						
					</div>
		</div>
		<div class="register-box">
			<label for="username" class="other_label" >设 置 密 码
			<input maxlength="20" type="password" placeholder="建议至少使用两种字符组合" class="password" name="password"/>
			</label>
			<div class="tips">
				
			</div>
		</div>
		<div class="register-box">
			<label for="username" class="other_label">确 认 密 码
			<input maxlength="20" type="password" placeholder="请再次输入密码"/>
			</label>
			<div class="tips">
				
			</div>
		</div>
		<!-- <div class="register-box">
			<label for="username" class="other_label">
			<span>中国 0086∨</span>
			<input class="phone" maxlength="20" type="text" placeholder="建议使用常用手机">
			</label>
			<div class="tips">
				
			</div>
		</div>
		<div class="register-box">
			<label for="username" class="other_label">验 证 码
			<input maxlength="20" type="text" placeholder="请输入验证码">
			</label>
			<span id="code"></span>
			<div class="tips">
				
			</div>
		</div> -->
		<div class="arguement">
					<input type="checkbox" id="xieyi">
			同意注册<a href="#">《庚号仨注册协议》</a>
			<!-- <a href="#">《庚号仨注册协议》</a>
			<a href="#">《隐私政策》</a> -->
			<div class="tips">
				
			</div>
				</div>
		<div class="submit_btn">
					<!-- <button type="submit" id="submit_btn" onclick = "post()">立 即 注 册</button> -->
					<button type="submit" id="submit_btn">立 即 注 册</button>
				</div>
	</form>
</section>

</body>
	
</html>