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
<script src="<%=basePath%>static/base/jquery-1.8.3.min.js" type="text/javascript"></script>


<link rel="stylesheet" href="<%=basePath%>static/css/head/head.css" />
<link rel="stylesheet" href="<%=basePath%>static/css/login/style.css" />

<!-- <link rel="stylesheet" href="static/css/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/css/login/index.css" /> -->

<!-- <script src="static/base/jquery-3.1.1.js" type="text/javascript"></script> -->

<script type="text/javascript" language="javascript">
debugger;

/* var name = document.getElemengtById("username").value;
var password = document.getElementById("password").value; */

var name = $("input[name='username']").val();
var password = $("input[name='password']").val();

//var data = {"name":$('input[name="user"]').val(),"password":$('input[name="pswd"]').val()};
function post(){
	var data = '{ "name":"' + $("input[name='username']").val() + '","password":"' + $("input[name='password']").val() + '"}';
	//var data1 = {};
	$.ajax({
		type: "post",
		async: true,
        url: "<%=basePath%>common/userLogin.action",
        contentType: "application/json; charset=utf-8",
        data: data,
        dataType: "json",
        success: function (message) {
        	if(message.rtnCode == '1'){
        		javascript:hideDialog();
        		
        		<%-- var user = '<%=session.getAttribute("user")%>';
        	    alert(user); --%>
            	<%-- var html = '<a class="a globalLoginBtn" href="javascript:showDialog();">'+'<%=sessionScope.user.name%>'+'</a><div></div>';
            	
            	$("#loginRegisterTip").html(html);	 --%>
        		alert("登录成功！");
        		window.location.reload();
        	}else{
        		
        		var user = '<%=session.getAttribute("name")%>';
        	    alert(user);
        		
        		/* var html = '<a class="a globalLoginBtn" href="javascript:showDialog();">登录/注册</a><div></div>';
            	$("#loginRegisterTip").html(html); */
            	
        		alert("登录失败！");
        	}
        	return true;
        },
        error: function (message) {
            alert("登录环境异常！");
            return false;
        }
	});
};

$('#loginPost').unbind('click').bind('click',function(){
	alert(00);
	post();
})
</script>

<script type="text/javascript" language="javascript">
$(document).ready(function(){
	   
	$('.weixinshowPic').hover(function() {
		$(this).addClass('weixinshowPic-hover');
	}, function() {
		$(this).removeClass('weixinshowPic-hover');
	});
	$('.dropdown').hover(function() {
		$(this).addClass('dropdown-hover');
		$(".dropdown-sub").show('slow');
	}, function() {
		$(this).removeClass('dropdown-hover');
	});	
	
});
</script>

<script type="text/javascript">

	var dialogInstace , onMoveStartId , mousePos = {x:0,y:0};	//	用于记录当前可拖拽的对象
	
	// var zIndex = 9000;

	//	获取元素对象	
	function g(id){return document.getElementById(id);}

	//	自动居中元素（el = Element）
	function autoCenter( el ){
		var bodyW = document.documentElement.clientWidth;
		var bodyH = document.documentElement.clientHeight;

		var elW = el.offsetWidth;
		var elH = el.offsetHeight;

		el.style.left = (bodyW-elW)/2 + 'px';
		el.style.top = (bodyH-elH)/2 + 'px';
		
	}

	//	自动扩展元素到全部显示区域
	function fillToBody( el ){
		el.style.width  = document.documentElement.clientWidth  +'px';
		el.style.height = document.documentElement.clientHeight + 'px';
	}

	//	Dialog实例化的方法
	function Dialog( dragId , moveId ){

		var instace = {} ;

		instace.dragElement  = g(dragId);	//	允许执行 拖拽操作 的元素
		instace.moveElement  = g(moveId);	//	拖拽操作时，移动的元素

		instace.mouseOffsetLeft = 0;			//	拖拽操作时，移动元素的起始 X 点
		instace.mouseOffsetTop = 0;			//	拖拽操作时，移动元素的起始 Y 点

		instace.dragElement.addEventListener('mousedown',function(e){

			var e = e || window.event;

			dialogInstace = instace;
			instace.mouseOffsetLeft = e.pageX - instace.moveElement.offsetLeft ;
			instace.mouseOffsetTop  = e.pageY - instace.moveElement.offsetTop ;
			
			onMoveStartId = setInterval(onMoveStart,10);
			return false;
			// instace.moveElement.style.zIndex = zIndex ++;
		})

		return instace;
	}

	//	在页面中侦听 鼠标弹起事件
	document.onmouseup = function(e){
		dialogInstace = false;
		clearInterval(onMoveStartId);
	}
	document.onmousemove = function( e ){
		var e = window.event || e;
		mousePos.x = e.clientX;
		mousePos.y = e.clientY;
		

		e.stopPropagation && e.stopPropagation();
		e.cancelBubble = true;
		e = this.originalEvent;
        e && ( e.preventDefault ? e.preventDefault() : e.returnValue = false );

        document.body.style.MozUserSelect = 'none';
	}	

	function onMoveStart(){


		var instace = dialogInstace;
	    if (instace) {
	    	
	    	var maxX = document.documentElement.clientWidth -  instace.moveElement.offsetWidth;
	    	var maxY = document.documentElement.clientHeight - instace.moveElement.offsetHeight ;

			instace.moveElement.style.left = Math.min( Math.max( ( mousePos.x - instace.mouseOffsetLeft) , 0 ) , maxX) + "px";
			instace.moveElement.style.top  = Math.min( Math.max( ( mousePos.y - instace.mouseOffsetTop ) , 0 ) , maxY) + "px";

	    }

	}


	


	//	重新调整对话框的位置和遮罩，并且展现
	function showDialog(){
		g('dialogMove').style.display = 'block';
		g('mask').style.display = 'block';
		autoCenter( g('dialogMove') );
		fillToBody( g('mask') );
	}

	//	关闭对话框
	function hideDialog(){
		g('dialogMove').style.display = 'none';
		g('mask').style.display = 'none';
	}

	//	侦听浏览器窗口大小变化
	//window.onresize = showDialog;

	Dialog('dialogDrag','dialogMove');
	showDialog();

</script>
</head>
<body>
<div class="global-nav">
    <div class="container">
        <!--收藏关注start-->
        <ul class="global-nav-left">
            <li><b></b><a onclick="myAddFavorite()" href="<%=basePath%>direct/index.action">首页</a></li>
            <li>
                <div class="weixinshowPic"> <i class="i-qrcode"></i>微信
                    <div class="wx_box"><span class="arrow"><i class="layer1"></i><i class="layer2"></i></span></div>
                </div>
            </li>
            
            <!-- <div id = "test"></div> -->
            
            
            <!-- <li>
            <a class="a globalLoginBtn" href="javascript:showDialog();">登录/注册</a>
                <div>
                    
                </div>
            </li> -->
            
            <%-- <c:choose>
   				<c:when test="${requestScope.user == null}">  
         			<li>
            			<a class="a globalLoginBtn" href="javascript:showDialog();">登录/注册</a>
                		<div>
                		</div>
            		</li>      
   				</c:when>
   				<c:otherwise> 
   					<li>
            			<a class="a globalLoginBtn" href="javascript:showDialog();">${requestScope.user.name}</a>
                		<div>
                		</div>
            		</li>   
   				</c:otherwise>
			</c:choose> --%>
			
			
			<li id = "loginRegisterTip">
			<c:choose>
   				<c:when test="${sessionScope.user == null}">  
           			<a class="a globalLoginBtn" href="javascript:showDialog();">登录/注册</a>
               		<div>
               		</div>
   				</c:when>
   				<c:otherwise> 
           			<a class="a globalLoginBtn" href="<%=basePath%>user/iniPersonalPage.action">${sessionScope.user.name}</a>
               		<div>
               		</div>
            		   
   				</c:otherwise>
			</c:choose>
            </li>
            
        </ul>

        <!--收藏关注end-->
        <div class="global-nav-right">
            <a class="global-nav-right_a" target="_blank" href="#"> <i class="ico global-nav-right_i" title="vip"></i> <span style="float:left">五年工作经验创作团队</span></a>
            <div class="dropdown ">
                <a href="#" class="dropdown-main"> <i class="ico helper-sprite-menu"></i> <span>网站导航</span> <i class="ico helper-sprite-dropdown"></i> </a>
                <div class="dropdown-main_after"></div>
                <div class="dropdown-sub" style="display:none;">
                    <div class="dropdown-sub_box">
                        <div class="menu_nav2015">
                            <p class="menu_nav2015_p1">
                                <span><a target="_blank" href="#">LOGO</a></span>
                                <a target="_blank" href="#">图文LOGO</a>
                                <a target="_blank" href="#">图形LOGO</a>
                                <a target="_blank" href="#">企业LOGO</a>
                                <a target="_blank" href="#">产品LOGO</a>
                            </p>
                            <p class="menu_nav2015_p2">
                                <span><a target="_blank" href="#">电商服务</a></span>
                                <a target="_blank" href="#">整店装修</a>
                                <a target="_blank" href="#">首页设计</a>
                                <a target="_blank" href="#">主图设计</a>                              
                                <a target="_blank" href="#">活动页设计</a>
                                <a target="_blank" href="#">店铺LOGO</a>
                            </p>
                            <p class="menu_nav2015_p3">
                                <span><a target="_blank" href="#">宣传品</a></span>
                                <a target="_blank" href="#">企业宣传单</a>
                                <a target="_blank" href="#">三折页</a>
                                <a target="_blank" href="#">宣传海报</a>
                                <a target="_blank" href="#">广告牌</a>
                            </p>
                            <p class="menu_nav2015_p4">
                                <span><a target="_blank" href="#">文案撰写</a></span>
                                <a target="_blank" href="#">编辑校对</a>
                                <a target="_blank" href="#">文学创作</a>
                                <a target="_blank" href="#">广告创意类文案</a>
                                <a target="_blank" href="#">品牌/产品文案</a>
                            </p>
                        </div>
                    </div>
                </div> </div>
        </div>
    </div>
</div>


<div class="ui-mask" id="mask" onselectstart="return false"></div>

<div class="ui-dialog" id="dialogMove" onselectstart='return false;'>
	<div class="ui-dialog-title" id="dialogDrag"  onselectstart="return false;" >		
		登录
		<a class="ui-dialog-closebutton" href="javascript:hideDialog();"></a>

	</div>
	<div class="ui-dialog-content">
		<div class="ui-dialog-l40 ui-dialog-pt15">
			<input class="ui-dialog-input ui-dialog-input-username" type="input" placeholder="用户名" name="username"/>
		</div>
		<div class="ui-dialog-l40 ui-dialog-pt15">
			<input class="ui-dialog-input ui-dialog-input-password" type="password" placeholder="密码" name="password"/>
		</div>
		<div class="ui-dialog-l40">
			<a href="#">记住密码</a>
		</div>
		<div class="ui-dialog-l60">
			<input id="ck1" type="checkbox" value="true"/>
		</div>
		<div>
			<a class="ui-dialog-submit" id = "loginPost" onclick="post()">登录</a>
		</div>
		<div class="ui-dialog-l30">
			<a href="<%=basePath%>direct/userRegister.action" style="padding-left:0px;">立即注册</a>
		</div>
		<div class="ui-dialog-l50">
			<a href="#" style="margin-right:200px;">忘记密码</a>
		</div>
	</div>
</div>

<!-- <div class="modal fade" id="loginModal" style="display:none;">
	
	<div class="modal-dialog modal-sm" style="width:540px;">
		<div class="modal-content" style="border:none;">
			<div class="col-left"></div>
			<div class="col-right">
				<div class="modal-header">
					<button type="button" id="login_close" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="loginModalLabel" style="font-size: 18px;">登录</h4>
				</div>
				<div class="modal-body">
					<section class="box-login v5-input-txt" id="box-login">
						<form id="login_form" action="" method="post" autocomplete="off">
							
							<ul>
								<li class="form-group"><input class="form-control" id="id_account_l" maxlength="50" name="account_l" placeholder="请输入邮箱账号/手机号" type="text"></li>
								<li class="form-group"><input class="form-control" id="id_password_l" name="password_l" placeholder="请输入密码" type="password"></li>
							</ul>
						</form>
						<p class="good-tips marginB10"><a id="btnForgetpsw" class="fr">忘记密码？</a>还没有账号？<a href="javascript:;" target="_blank" id="btnRegister">立即注册</a></p>
						<div class="login-box marginB10">
							<button id="login_btn" type="button" class="btn btn-micv5 btn-block globalLogin">登录</button>
							<div id="login-form-tips" class="tips-error bg-danger" style="display: none;">错误提示</div>
						</div>

						
						<div class="threeLogin"><span>其他方式登录</span><a class="nqq" href="javascript:;"></a><a class="nwx" href="javascript:;"></a><a class="nwb"></a></div>
						
					</section>
				</div>
			</div>
		</div>
	</div>
	
</div> -->
<!-- <script src="static/js/login/modal.js" type="text/javascript"></script>
<script src="static/js/login/script.js" type="text/javascript"></script> -->

		
</body>
	
</html>