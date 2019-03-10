<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%
	String basePath = request.getContextPath()+"/";
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title></title>

<script src="<%=basePath%>static/js/person/jquery-latest.js" type="text/javascript"></script>
<script src="<%=basePath%>static/js/person/carts.js" type="text/javascript"></script>
<script src="<%=basePath%>static/base/jquery-3.1.1.min.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/person/stylepc.css"/>


<script type="text/javascript">
$(document).ready(function(){
	
	
	$("#signInOperate").click(function(){
		post();
		return false;
	})
	
	$("#loginOut").click(function(){
		loginOut();
		return false;
	})
	
	
	//取消收藏	
	var $cancelButton = $('.cancelCollection');
	$cancelButton.each(function () {
        $(this).click(function () {
		var productid = parseInt($(this).parents('.collectiondiv').find('.productid').html().substring(0));
		var id = parseInt($(this).parents('.collectiondiv').find('.id').html().substring(0));
		
		var data = '{"params":{"productid":'+productid+',"id":'+id+'}}';
		cancelCollection(data);
		//alert(productid);
        })
	})
	
	//用户确认订单
	debugger;
	var $orderCheck = $('.orderCheck');
	$orderCheck.each(function () {
        $(this).click(function () {
        	
        debugger;	
        var s1 = $(this).parents('.orderCheckFdiv');
        alert(s1);
        var s2 = s1.parents('.orderOfdiv');
        alert(s2);
        var s3 = s2.parents('.orderId').val();
        alert(s3);
        	
        	
        //var orderId = parseInt($(this).parents('.orderCheckFdiv').parents('.orderOfdiv').find('.orderId').val());
        //alert(orderId);
		//var productId = parseInt($(this).parents('.tab-pane active').find('.productId').html().substring(0));
		//alert(productId);
		//var id = parseInt($(this).parents('.collectiondiv').find('.id').html().substring(0));
		
		//var data = '{"params":{"productid":'+productid+',"id":'+id+'}}';
		//cancelCollection(data);
		//alert(productid);
        })
	})
	
});

function post(){
	$.ajax({
		type: "post",
		async: true,
        url: "<%=basePath%>user/userCreditsSignIn.action",
        contentType: "application/json; charset=utf-8",
        data: "",
        dataType: "json",
        success: function (message) {
        	if(message.rtnCode == '1'){
        		alert("签到成功！");
        		window.location.href="<%=basePath%>user/iniPersonalPage.action";
        	}else{
        		alert("签到失败！");
        	}
        	return true;
        },
        error: function (message) {
            alert("环境异常！");
            return false;
        }
	});
}

function loginOut(){
	$.ajax({
		type: "post",
		async: true,
        url: "<%=basePath%>user/loginOut.action",
        contentType: "application/json; charset=utf-8",
        data: "",
        dataType: "json",
        success: function (message) {
        	if(message.rtnCode == '1'){
        		alert("注销成功！");
        		window.location.href="<%=basePath%>direct/index.action";
        	}else{
        		alert("注销失败！");
        	}
        	return true;
        },
        error: function (message) {
            alert("环境异常！");
            return false;
        }
	});
}

function cancelCollection(data){
	$.ajax({
		type: "post",
		async: true,
        url: "<%=basePath%>user/cancelCollection.action",
        contentType: "application/json; charset=utf-8",
        data: data,
        dataType: "json",
        success: function (message) {
        	if(message.rtnCode == '1'){
        		alert("取消成功！");
        		window.location.href="<%=basePath%>user/iniPersonalPage.action";
        	}else{
        		alert("取消失败！");
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


<script type="text/javascript">

/**
 * Created by Administrator on 2017/5/24.
 */

$(function () {

    //全局的checkbox选中和未选中的样式
    var $allCheckbox = $('input[type="checkbox"]'),     //全局的全部checkbox
        $wholeChexbox = $('.whole_check'),
        $cartBox = $('.cartBox'),                       //每个商铺盒子
        $shopCheckbox = $('.shopChoice'),               //每个商铺的checkbox
        $sonCheckBox = $('.son_check');                 //每个商铺下的商品的checkbox
    $allCheckbox.click(function () {
        if ($(this).is(':checked')) {
            $(this).next('label').addClass('mark');
        } else {
            $(this).next('label').removeClass('mark')
        }
    });

    //===============================================全局全选与单个商品的关系================================
    $wholeChexbox.click(function () {
        var $checkboxs = $cartBox.find('input[type="checkbox"]');
        if ($(this).is(':checked')) {
            $checkboxs.prop("checked", true);
            $checkboxs.next('label').addClass('mark');
        } else {
            $checkboxs.prop("checked", false);
            $checkboxs.next('label').removeClass('mark');
        }
        totalMoney();
    });


    $sonCheckBox.each(function () {
        $(this).click(function () {
            if ($(this).is(':checked')) {
                //判断：所有单个商品是否勾选
                var len = $sonCheckBox.length;
                var num = 0;
                $sonCheckBox.each(function () {
                    if ($(this).is(':checked')) {
                        num++;
                    }
                });
                if (num == len) {
                    $wholeChexbox.prop("checked", true);
                    $wholeChexbox.next('label').addClass('mark');
                }
            } else {
                //单个商品取消勾选，全局全选取消勾选
                $wholeChexbox.prop("checked", false);
                $wholeChexbox.next('label').removeClass('mark');
            }
        })
    })

    //=======================================每个店铺checkbox与全选checkbox的关系/每个店铺与其下商品样式的变化===================================================

    //店铺有一个未选中，全局全选按钮取消对勾，若店铺全选中，则全局全选按钮打对勾。
    $shopCheckbox.each(function () {
        $(this).click(function () {
            if ($(this).is(':checked')) {
                //判断：店铺全选中，则全局全选按钮打对勾。
                var len = $shopCheckbox.length;
                var num = 0;
                $shopCheckbox.each(function () {
                    if ($(this).is(':checked')) {
                        num++;
                    }
                });
                if (num == len) {
                    $wholeChexbox.prop("checked", true);
                    $wholeChexbox.next('label').addClass('mark');
                }

                //店铺下的checkbox选中状态
                $(this).parents('.cartBox').find('.son_check').prop("checked", true);
                $(this).parents('.cartBox').find('.son_check').next('label').addClass('mark');
            } else {
                //否则，全局全选按钮取消对勾
                $wholeChexbox.prop("checked", false);
                $wholeChexbox.next('label').removeClass('mark');

                //店铺下的checkbox选中状态
                $(this).parents('.cartBox').find('.son_check').prop("checked", false);
                $(this).parents('.cartBox').find('.son_check').next('label').removeClass('mark');
            }
            totalMoney();
        });
    });


    //========================================每个店铺checkbox与其下商品的checkbox的关系======================================================

    //店铺$sonChecks有一个未选中，店铺全选按钮取消选中，若全都选中，则全选打对勾
    $cartBox.each(function () {
        var $this = $(this);
        var $sonChecks = $this.find('.son_check');
        $sonChecks.each(function () {
            $(this).click(function () {
                if ($(this).is(':checked')) {
                    //判断：如果所有的$sonChecks都选中则店铺全选打对勾！
                    var len = $sonChecks.length;
                    var num = 0;
                    $sonChecks.each(function () {
                        if ($(this).is(':checked')) {
                            num++;
                        }
                    });
                    if (num == len) {
                        $(this).parents('.cartBox').find('.shopChoice').prop("checked", true);
                        $(this).parents('.cartBox').find('.shopChoice').next('label').addClass('mark');
                    }

                } else {
                    //否则，店铺全选取消
                    $(this).parents('.cartBox').find('.shopChoice').prop("checked", false);
                    $(this).parents('.cartBox').find('.shopChoice').next('label').removeClass('mark');
                }
                totalMoney();
            });
        });
    });


    //=================================================商品数量==============================================
    var $plus = $('.plus'),
        $reduce = $('.reduce'),
        $all_sum = $('.sum');
    $plus.click(function () {
        var $inputVal = $(this).prev('input'),
            $count = parseInt($inputVal.val())+1,
            $obj = $(this).parents('.amount_box').find('.reduce'),
            $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
            $price = $(this).parents('.order_lists').find('.price').html(),  //单价
            $priceTotal = $count*parseInt($price.substring(0));
        $inputVal.val($count);
        $priceTotalObj.html('￥'+$priceTotal);
        if($inputVal.val()>1 && $obj.hasClass('reSty')){
            $obj.removeClass('reSty');
        }
        totalMoney();
    });

    $reduce.click(function () {
        var $inputVal = $(this).next('input'),
            $count = parseInt($inputVal.val())-1,
            $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
            $price = $(this).parents('.order_lists').find('.price').html(),  //单价
            $priceTotal = $count*parseInt($price.substring(0));
        if($inputVal.val()>1){
            $inputVal.val($count);
            $priceTotalObj.html('￥'+$priceTotal);
        }
        if($inputVal.val()==1 && !$(this).hasClass('reSty')){
            $(this).addClass('reSty');
        }
        totalMoney();
    });

    $all_sum.keyup(function () {
        var $count = 0,
            $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
            $price = $(this).parents('.order_lists').find('.price').html(),  //单价
            $priceTotal = 0;
        if($(this).val()==''){
            $(this).val('1');
        }
        $(this).val($(this).val().replace(/\D|^0/g,''));
        $count = $(this).val();
        $priceTotal = $count*parseInt($price.substring(0));
        $(this).attr('value',$count);
        $priceTotalObj.html('￥'+$priceTotal);
        totalMoney();
    })

    //======================================移除商品========================================

    var $order_lists = null;
    var $order_content = '';
    $('.delBtn').click(function () {
        $order_lists = $(this).parents('.order_lists');
        $order_content = $order_lists.parents('.order_content');
        $('.model_bg').fadeIn(300);
        $('.my_model').fadeIn(300);
    });

    //关闭模态框
    $('.closeModel').click(function () {
        closeM();
    });
    $('.dialog-close').click(function () {
        closeM();
    });
    function closeM() {
        $('.model_bg').fadeOut(300);
        $('.my_model').fadeOut(300);
    }
    //确定按钮，移除商品
    $('.dialog-sure').click(function () {
        $order_lists.remove();
        if($order_content.html().trim() == null || $order_content.html().trim().length == 0){
            $order_content.parents('.cartBox').remove();
        }
        closeM();
        $sonCheckBox = $('.son_check');
        totalMoney();
    })

    //======================================总计==========================================

    function totalMoney() {
        var total_money = 0;
        var total_count = 0;
        var calBtn = $('.calBtn a');
        $sonCheckBox.each(function () {
            if ($(this).is(':checked')) {
                var goods = parseInt($(this).parents('.order_lists').find('.sum_price').html().substring(0));
                var num =  parseInt($(this).parents('.order_lists').find('.sum').val());
                total_money += goods;
                total_count += num;
            }
        });
        $('.total_text').html('￥'+total_money);
        $('.piece_num').html(total_count);

        // console.log(total_money,total_count);

        if(total_money!=0 && total_count!=0){
            if(!calBtn.hasClass('btn_sty')){
                calBtn.addClass('btn_sty');
            }
        }else{
            if(calBtn.hasClass('btn_sty')){
                calBtn.removeClass('btn_sty');
            }
        }
    }

	//======================================封装请求报文==========================================
	$(document).ready(function(){
	$("#calBtn").click(function(){
		var data = '{"params":{"produceList":[';
		$sonCheckBox.each(function () {
            if ($(this).is(':checked')) {
				var iniStr = '{ "productId":';
//                var goods = parseInt($(this).parents('.order_lists').find('.sum_price').html().substring(1));
				var goods = parseInt($(this).parents('.order_lists').find('.productid').html().substring(0));
                var num =  parseInt($(this).parents('.order_lists').find('.sum').html().substring(0));
				
				//var productId =  parseInt($(this).parents('.order_lists').find('.productId').val());
				
				var price = goods/num;
				
				//alert(price);
				//封装请求,'{ "productId":"' + $("input[name='productId']").val() + '","number":"' + $("#number").val() + '"}'
				iniStr+=goods;
				
				iniStr+=',"number":';
				iniStr+=num;
				iniStr+='}'; 
				data+=iniStr;
            }
        });
		data+=']}}';

		/* alert(data); */
		
		$.ajax({
			type: "post",
			async: true,
	        url: "<%=basePath%>user/orderPurchase.action",
	        contentType: "application/json; charset=utf-8",
	        data: data,
	        dataType: "json",
	        success: function (message) {
	        	if(message.rtnCode == '1'){
	        		alert("购买成功");
	        		window.location.href="<%=basePath%>user/iniPersonalPage.action";
	        		return false;
	        	}else{
	        		alert("购买失败");
	        		return false;
	        	}
	        	return true;
	        },
	        error: function (message) {
	            alert("环境异常！");
	            return false;
	        }
		});
		
	})
	});
	

});

</script>

</head>
<body>
<div class="top01" style="height:30px;width:100%;" >
	<div class="top02" style="height:30px;width:80%; margin:0 auto;" >
		<div class="top03" style="height:30px;width:10%; float:left" >
			<img src="<%=basePath%>/static/img/base/home.png" style="height:30px;width:30px; float:left;display:inline;" />
			<a class="top04" style="height:30px;width:50px; float:left;display:inline;vertical-align:middle;margin-top:10px;outline: none;" href="<%=basePath%>direct/index.action">
				首页
			</a>
		</div>
		<div class="top03" style="height:30px;width:40%;float:right" >
			
			
			<a class="top04" style="height:30px;width:50px; float:right;display:inline;vertical-align:middle;margin-top:10px;outline: none;" id="loginOut">
				注销
			</a>
			<img src="<%=basePath%>/static/img/base/loginout.png" style="height:30px;width:30px; float:right;display:inline;" />
			
			<%-- <a class="top04" style="height:30px;width:50px; float:right;display:inline;vertical-align:middle;margin-top:10px;margin-right:12.5%;outline: none;" href = "#">
				购物车
			</a>
			<img src="<%=basePath%>/static/img/base/shopcart.png" style="height:30px;width:30px;background: yellow; float:right;display:inline;" />
			
			
			<a class="top04" style="height:30px;width:50px; float:right;display:inline;vertical-align:middle;margin-top:10px;margin-right:12.5%;outline: none;" href = "#">
				收藏
			</a>
			<img src="<%=basePath%>/static/img/base/collection.png" style="height:30px;width:30px; float:right;display:inline;" />
			 --%>
		</div>
	</div>	
</div>
	
<div class="top05" style="height:70px;width:100%;background-color:#FFA500;" >
	<div class="top06" style="height:50px;width:55%; margin:0 auto;" >
		<div class="top03" style="height:50px;width:100px; float:left" >
			<img src="<%=basePath%>/static/img/base/head.png" style="height:50px;width:50px;border-radius:50px;vertical-align:middle;" />
			<a class="top08" style="height:10px;width:50px;vertical-align:middle;margin-top:0px;outline: none;" href = "#">
			<c:choose>
   				<c:when test="${sessionScope.user == null}">  
           			<a class="a globalLoginBtn" href="javascript:showDialog();">登录/注册</a>
               		<div>
               		</div>
   				</c:when>
   				<c:otherwise> 
           			<%-- <a class="a globalLoginBtn" href="<%=basePath%>user/iniPersonalPage.action">${sessionScope.user.name}</a> --%>
           			${sessionScope.user.name}
               		<div>
               		</div>
   				</c:otherwise>
			</c:choose>
			</a>
		</div>
	</div>	
</div>

<div class="show" style="height:500px;width:100%;" >
<div class="container">
	<div class="menu">
		<h3><i class="q-menu-img positionIicon"></i>个人中心</h3>
		<ul class="ulmenu1">
			<li><a class="selected" href="#tab1">我的积分</a></li>
			<!-- <li><a href="#">我的积分</a></li>
			<li><a href="#">我的优惠</a></li>
			<li><a href="#">修改资料</a></li> -->
		</ul>

		<h3><i class="q-menu-doit positionIicon"></i>订单管理</h3>
		<ul class="ulmenu2">
			<li><a href="#" class="selected">我的订单</a></li>
			<li><a href="#">我的购物车</a></li>
			<li><a href="#">我的收藏</a></li>
			<!-- <li><a href="#">我的评价</a></li>
			<li><a href="#">我的足迹</a></li> -->
		</ul>

		<h3><i class="q-menu-three positionIicon"></i>售后服务</h3>
		<ul class="ulmenu3">
			<li><a class="selected" href="#tab1">增值服务</a></li>
			<li><a href="#">意见反馈</a></li>
		</ul>
	</div>
	
	<div class="content">
		<!-- <div class="get-menu">
			<a href="#">用户中心</a>
			<span>></span>
			<a class="A1" href="#">个人中心</a>
		</div>
 -->
		<div class="menu1 menu_tab">
			<div id="tab1" class="tab active">
				<div class="server-wrapper">
					<div class="server-tab" style="margin-top: 26px;">
						<div style=" float: left;vertical-align: bottom;text-align: center;">
						<div style="width: 680px;padding: 10px;float: left;background-color: #fff;height: 250px;">
						<div style="float: left;width:200px ;height: 152px;border: 1px #ccc solid;box-shadow: 1px 1px 1px #F5F5F5;padding: 5px;">
							<div style="width: 100%;height: 100%;border: 1px #F2873B dashed;">
								<span style="font-size: 18px;color: #686868;font-weight: bold;display: block;    display: block; width: 100px; margin-left: 50px;    margin-top:20px;">2018年5月</span>
								<span style="font-size: 36px;color: #F88600;display: block;    display: block; width: 100px; margin-left: 50px;margin-top: 28;">12</span>
							     <input id = "signInOperate"  type="button" value="签到领币" style="background-color: #f56a48;border-radius: 5px;color: #fff; font-size:14px;border: 0px;width: 107px;height: 26px;margin-top: 30px;" />
							</div>
						</div>
						
						<div style="float: left;width:200px ;height: 152px;;margin-left: 20px;border: 1px #ccc solid;box-shadow: 1px 1px 1px #F5F5F5;padding: 5px;">
							<div style="width: 100%;height: 100%;border: 1px #F2873B dashed;">
								<span style="font-size: 18px;color: #686868;font-weight: bold;display: block;    display: block; width: 100px; margin-left: 50px; margin-bottom: 20px;   margin-top: 20px;">我的资产</span>
							    <span style="width: 87px;height: 20px;background-color: #fee3dc;padding: 5px;border: 1px #C62B26 dashed;border-radius: 5px;">${requestScope.rtnObject.userRemain} B</span>
								<img src="<%=basePath%>/static/img/base/money.png" style="position: absolute; margin-top: 30px;  margin-left: -80px;;" />	
							</div>
						</div>
						
						<div style="float: left;width:200px ;height: 152px;margin-left: 20px;border: 1px #ccc solid;box-shadow: 1px 1px 1px #F5F5F5;padding: 5px;">
							<div style="width: 100%;height: 100%;border: 1px #F2873B dashed;">
								<span style="font-size: 18px;color: #686868;font-weight: bold;display: block;    display: block; width: 100px; margin-left: 50px;    margin-top: 20px; margin-bottom: 20px;">我的收益</span>
								<span style="width: 87px;height: 20px;background-color: #fee3dc;padding: 5px;border: 1px #C62B26 dashed;border-radius: 5px;">${requestScope.rtnObject.signInCredits} B</span>
							    <img src="<%=basePath%>/static/img/base/income.png" style="position: absolute; margin-top: 13px;  margin-left: -80px;;" />									</div>
						</div>
						
						<div style="border-top:1px #ccc solid;width: 650px;position: absolute;margin-top: 200px;margin-left: 20px;float: left;"></div>
						<div style="position: absolute;margin-top: 230px;font-size: 14px;color: #686868;float: left;">
							<span style="margin-left: 20px;">设计中</span>
							<font style="color: #CF2D27;">${requestScope.rtnObject.proceedCount}</font>
							<span style="margin-left: 40px;margin-right: 40px;">|</span>
							<span >已完成</span>
							<font style="color: #CF2D27;">${requestScope.rtnObject.completeCount}</font>
							<span style="margin-left: 40px;margin-right: 40px;">|</span>
							<span>待评价</span>
							<font style="color: #CF2D27;">0</font>
							<!-- <span style="margin-left: 40px;margin-right: 40px;">|</span>
							<span>待评价</span>
							<font style="color: #CF2D27;">0</font>
							<span style="margin-left: 40px;margin-right: 40px;">|</span>
							<span>退款</span> -->
							
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>
			<div  id="tab2" class="tab">
				我的优惠
			</div>

			<div  id="tab3" class="tab">
				修改资料
			</div>			

		</div>

		<div class="menu2 menu_tab">
			<div id="tab-1" class="tab">
				<!-- 我的订单 -->
				
				<div style="position: absolute;margin-top: 0px;font-size: 14px;color: #686868;float: left;margin-left: 10px;">
					<span style="margin-left: 20px;">设计中</span>
					<font style="color: #CF2D27;">${requestScope.rtnObject.proceedCount}</font>
					<span style="margin-left: 40px;margin-right: 40px;">|</span>
					<span >已完成</span>
					<font style="color: #CF2D27;">${requestScope.rtnObject.completeCount}</font>
					<span style="margin-left: 40px;margin-right: 40px;">|</span>
					<span>待评价</span>
					<font style="color: #CF2D27;">0</font>
					<!-- <span style="margin-left: 40px;margin-right: 40px;">|</span>
					<span>待评价</span>
					<font style="color: #CF2D27;">0</font>
					<span style="margin-left: 40px;margin-right: 40px;">|</span>
					<span>退款</span> -->
					
				</div>
				<!-- <div style="border-top:1px #ccc solid;width: 650px;position: absolute;margin-top: 30px;margin-left: 30px;float: left;"></div> -->
				
				<div class="main-wrap mt15" style="border: 0px;">
						      <!-- <ul class="sui-nav nav-tabs" style="margin-top:0px;width: 1000px;margin-left: 30px;">
								  <li   style="margin-left: -5px;"><a href="#profile" data-toggle="tab">所有订单<span style="margin-left: 20px;color: #ccc;">|</span></a></li>
								  <li class="active"><a href="#profile" data-toggle="tab">待付款<span style="margin-left: 20px;color: #ccc;">|</span></a></li>
								   <li class="active"><a href="#profile" data-toggle="tab">待发货<span style="margin-left: 20px;color: #ccc;">|</span></a></li>
								    <li class="active"><a href="#profile" data-toggle="tab">待发货1<span style="margin-left: 20px;color: #ccc;">|</span></a></li>
								    <li class="active"><a href="#profile" data-toggle="tab">待评价<span style="margin-left: 20px;color: #ccc;">|</span></a></li>
								</ul> -->
							<!-- <div class="profile-info">
								<div class="control-group clearfix " style="width: 1020px;margin-bottom: 0px;">
									<div style="margin-top: -60px";>
                                        <div style="float:right;display: inline;margin-left:60px;display: inline-block;height: 25px;margin-right: -5px;padding-top: 10px;"> 
									    <img src="img/trash-拷贝.png"  style="height: 10px;width: 10px;" />
									           <font style="">订单回收站</font>
                                        </div> 
									 </div>
									
								</div>
							</div> -->
							<!-- <div style="margin-left: 30px;height: 25px;" >
								<input  type="text"  placeholder="输入商品标题或者订单号进行搜索 " style="width: 200px;height: 25px;font-size: 12px;" />
								<button style="height: 100%;margin-left: -5px;border: 1px #ccc solid;font-size: 12px;color:#353535;background-color: #f2f2f2;width: 100px;">订单搜索</button>
								
								
								
							    <span style="margin-left: 5px;">更多搜索条件</span>
							</div> -->
							
							
						<c:forEach items="${requestScope.rtnObject.outOrderList}" var="outOrder">
							<div class="tab-content" style="width: 1000px;margin-top: 10px;border:1px #fff solid; border-top:transparent;margin-left: 30px;">
								  <!-- <div id="index" class="tab-pane " style="padding: 40px 30px;">
								  </div> -->
								 <div id="profile" class="tab-pane active" style="padding: 00px 00px;">
								 <!-- <div style="width: 100%;height: 50px;border: 1px #ccc solid;line-height: 50px;background-color: #fdfdfd">
								 	<span style="color: #858585;margin-left: 160px;">宝贝</span>
								 	<span style="color: #858585;margin-left: 190px;">单价(元)</span>
								 	<span style="color: #858585;margin-left: 29px;">数量</span>
								 	<span style="color: #858585;margin-left: 45px;">商品操作</span>
								 	<span style="color: #858585;margin-left: 100px;">实付款(元)</span>
								 	<span style="color: #858585;margin-left: 45px;">交易状态</span>
								 	<span style="color: #858585;margin-left: 45px;">交易操作</span>
								 </div> -->
								 <div style="width: 100%;height: 0px;padding: 10px;">
								 	<!-- <span style="line-height: 20px;">全选</span>
								 	<input type="button" value="批量确认收货"  style="padding: 2px;border: 1px #ccc solid;background-color: #fff;color: #ccc;margin-left: 20px;"/> -->
								 	
								    <!-- <div style="float: right;margin-right: 5px;">
									    	<input type="button"  style="display: inline-block;background-color: #fff; background-image: url(img/我的订单/组-39.png);width: 20px;height: 20px;border: 0px;background-repeat: no-repeat;" />
								    	<input type="button" style="border:0px;display: inline-block;background-color: #fff;background-image: url(img/我的订单/组-40.png);background-repeat: no-repeat;width: 58px;height: 20px;" />
								    </div> -->
								 </div>
								 
								 <div style="margin-top: 0px;width: 100%;height: 250px;border: 1px #addff8 solid;" class="orderOfdiv">
								 <div style="width: 100%;height: 50px;background-color: #eaf9ff;vertical-align: middle;font-size: 12px;">
								<input type="checkbox" style="line-height: 50px;margin-left: 20px;"/>
								<span style="line-height: 50px;">${outOrder.order.ordertime}</span>
								<span style="line-height: 50px;margin-left: 20px;" >订单号：<font class="orderId">${outOrder.order.id}</font></span>
								<span style="line-height: 50px;margin-left: 100px;">旗舰店</span>
								<img src="<%=basePath%>/static/img/personalpage/speech-bubble-4.png" style="margin-left: 100px;"/> <span>和我联系</span>
								 </div>	
								 <div style="float: left;width: 65%;height: 93px;">
								 	<div style="width: 100%;">
								 	<img src="<%=basePath%>${outOrder.showImg}" style="height: 100px;width:100px;float: left;" />
								 	<dl style="width: 220px;float: left;margin-left: 20px;margin-top: 20px;">${outOrder.title}</dl>
								    <del style="display: inline-block;margin-left: -38px;margin-top: 20px;color: #858585;">${outOrder.order.total}</del>
								    <dl style="float: left;margin-left: 50px;margin-top: 40px;">${outOrder.order.realpay}</dl>
								    <span style="margin-left: 40px;"></span>
								    <dl style="float: right;margin-right: 50px;margin-top: 20px;">退款/退货
								    <br /><!-- 投诉卖家 -->
								    <br>
								    退运保险
								    </dl>
								    </div>
								    <div style="border-top: 1px #addff8 solid;height: 50px;width: 100%;margin-top: 80px;padding-top: 20px;">
								    	<!-- <dl style="float: left;margin-left: 20px;">保险服务</dl> -->
								    	<dl style="float: left;margin-left: 20px;"></dl>
								    	<del style="display: inline-block;margin-left: -40px;margin-top: 0px;color: #858585;">20.00</del>
								    <dl style="float: left;margin-left: 320px;margin-top: 30px;">0.00</dl>
								     <span style="margin-left: 40px;"></span>
								    </div>
								    
								    
								 </div>	
								 
								 <div style="float: left;border-left: 1px #addff8 solid;width: 11%;height:200px;text-align: center;">
								 	
								 	<span style="font-weight: bold;margin-top: 30px;display: block;">${outOrder.order.realpay}</span>
								 	<dl>(含运费:00)</dl>
								 	
								 </div>
								 <div style="float: left;border-left: 1px #addff8 solid;width: 11%;height:200px;text-align: center ;">
								 	<dl style="margin-top: 30px;">状态:</dl>
								 	<dl>订单详情</dl>
								 	<!-- <dl>查看物流</dl> -->
								 </div>
								 <div style="float: left;border-left: 1px #addff8 solid;width: 11%;height:200px;text-align: center ;" class="orderCheckFdiv">
								 	<!-- <dl style="margin-top: 30px;">还有9天10时4分</dl> -->
								 	<dl style="margin-top: 30px;"></dl>
								 	<button style="color: fff;background-color: #65b5ff;border: 0px;padding: 4px;margin-top: 5px;" class="orderCheck">确认收货</button>
								 </div>
								 </div>
								 
								 <!-- <div style="width: 100%;height: 0px;padding: 10px;">
								 	<span style="line-height: 20px;">全选</span>
								 	<input type="button" value="批量确认收货"  style="padding: 2px;border: 1px #ccc solid;background-color: #fff;color: #ccc;margin-left: 20px;"/>
								 		
								 </div>	 -->	<!-- <p style="text-align:right;margin-top: 10px;width: 100%;">
							    	<span class="fenye"><</span><span class="fenye" style="margin-left: 10px;">1</span><span class="fenye">2</span><span class="fenye">3</span>.....<span class="fenye">></span>共1页，到<input type="text" value="1" style="width: 20px;margin-left: 10px;margin-right: 10px;" />页<button  style="background-color: #f95555;padding: 3px;border: 0px;color: #fff;margin-left: 10px;width: 50px;border-radius:4px;">确认</button>
							    		</p> -->
								 </div>
						    </div>		 
						</c:forEach>
								  	
					</div>
				</div>

			<div  id="tab-2" class="tab">
				<div style="margin-top: 20px;width: 1200px;">
						<font style="font-size: 16px;color: #F4401C;font-weight: bold; margin-left:20px;border-bottom: 1px #F88600 solid;   padding-bottom: 14px;">全部商品 6</font>
						<font style="font-size: 16px;color: #060606; font-weight:bold;margin-left:20px;">|</font>
						<font style="font-size: 16px;color: #060606; font-weight:bold;margin-left:20px;">降价商品 0</font>
						<font style="font-size: 16px;color: #060606; font-weight:bold;margin-left:20px;">|</font>
						<font style="font-size: 16px;color: #060606; font-weight:bold;margin-left:20px;">库存紧张  0</font>
						
						<!-- <input name="全选商品" type="checkbox" value="" style="font-size: 12px;color: #949494; font-weight:bold;margin-left:670px;" id="all" class="whole_check"/>
						<font style="font-size: 12px;color: #949494; font-weight:bold;">全选商品</font> -->
						<!-- <input type="button" value="结算" style="float: right; color:#686868;background-color:#DEDEDE;height:20px;width:46px;border-style:solid;"></input> -->
						
                        <hr style=" border-style:solid;width: 1200px;border-color:#DEDEDE;margin-top: 12px;"/> 
					    <br />
                        <!-- <input name="店铺" type="checkbox" value="" style="margin-top: 20px;"  id="shop_a" class="shopChoice"/>
                        <font style="font-size: 12px;color: #212121;margin-left: 10px;font-weight: bold;">店铺:天猫旗舰店</font>  -->
						
						<div class="cartBox">
						<div class="shop_info">
								<!-- 总选项 -->
								<input name="店铺" type="checkbox" value="" style="margin-top: 20px;"  id="shop_a" class="shopChoice"/>
                        		<font style="font-size: 12px;color: #212121;margin-left: 10px;font-weight: bold;">店铺:天猫旗舰店</font> 
						</div>
						<c:forEach items="${requestScope.rtnObject.product_CartList}" var="u">
						
						<ul class="order_lists">
						    <div style="border:1px solid #ccc;height: 150px; margin-top: 20px;">
						    	<input name="店铺" type="checkbox" value="" style="margin-top: 20px;margin-left: 20px;" id="checkbox_2" class="son_check"/>
								<div >
							    	<img src="<%=basePath%>${u.showImg}" style="margin-left:40px; float: left;width:200px;height:100px" />
							    </div>	
							    
							    <div>
							    	<span style="margin-left:15px;float: left;"><font style="font-size: 12px;color: #1f1f1f; ">${u.product.title}</font>
							    		<font style="font-size: 12px;color: #949494;margin-left: 130px;TEXT-DECORATION: line-through; ">${u.product.price}</font>
							    		<!-- <br/> <font style="font-size: 12px;color: #1f1f1f; ">底料百搭调味料250克</font> -->
							    		<font style="font-size: 12px;color: #1f1f1f;margin-left:2px;font-weight: bold;  ">${u.product.price-u.product.discount}</font>
							    		<font class="sum" style="font-size: 12px;color: #1f1f1f;margin-left:30px;font-weight: bold; ">${u.number}</font><font>件</font>
							    		
							    		<div class="productid"  style="display:none">
							    			${u.product.id}
							    		</div>
							    		
							    		<li class="list_sum">
							    			<font style="font-size: 12px;color: #949494;margin-left: 430px;">总价：</font><font class="sum_price">${(u.product.price-u.product.discount)*u.number}</font><font >B</font>
							    		</li>
							    		<br />
							    		<img src="img/购物车/矢量智能对象.png" style="margin-left:0px; float: left;display:none" />
							    	</span>
									<!-- <span style="margin-left:65px;float: left; ">
										<input type="button" value="-" style=" color:#333333;height:30px;width:20px;border-style:solid;margin-left:30px;"></input><input type="text" value="1" style=" color:#333333;height:30px;width:30px;text-align:center;"></input><input type="button" value="+" style=" color:#333333;height:30px;width:20px;border-style:solid;"></input>
									</span> -->
									<span style="margin-left:10px;float: left;">
		                          <!-- <font style="font-size: 14px;color: #FD3C0D;margin-left: 80px;font-weight: bold;  ">15.90</font> -->
									</span >
									<span style="margin-left:785px; float: left;"><font style="font-size: 14px;color: #1E1E1E; ">移入收藏夹</font>
		                          <br/> <font style="font-size: 14px;color: #1E1E1E; ">删除</font>
									</span>
							    </div>
						  </div>
						</ul>
						
					  	</c:forEach>
						</div> 
					  
					  <!--  <div style="border:1px solid #ccc;height: 40px;line-height:40px;border-top:0px;">					    
					   <font style="font-size: 12px;margin-left:780px;color: #949494; ">再买3974.00元,"满4000.00元减2200.00元",该店铺商品合计:￥26.00</font>
					   <font style="margin-left: 3px;">|</font><font style="margin-left: 3px;color:#F88600 ;">去凑单</font>
					  </div> -->
					  
					  <!-- <br />
                        <input name="店铺" type="checkbox" value="" style="margin-top: 20px;" /><font style="font-size: 12px;color: #212121;margin-left: 10px;font-weight: bold;">店铺:巴鼎红火锅店专用</font> 

					   <div style="border:1px solid #ccc;height: 150px;margin-top: 20px;">
					    	<input name="店铺" type="checkbox" value="" style="margin-top: 20px;margin-left: 20px;" />
						<div >
					    	<img src="img/购物车/组-44.png" style="margin-left:40px; float: left;" />
					    </div>	
					    <div>
					    	<span style="margin-left:15px;float: left;"><font style="font-size: 12px;color: #1f1f1f; ">买二送一,巴鼎红重庆麻辣香锅火锅底料干锅</font>
					    		<font style="font-size: 12px;color: #949494;margin-left: 230px;TEXT-DECORATION: line-through; ">22.8</font>
					    		<br/> <font style="font-size: 12px;color: #1f1f1f; ">底料百搭调味料250克</font>
					    		<font style="font-size: 12px;color: #1f1f1f;margin-left: 340px;font-weight: bold;  ">15.90</font>
					    		<br />
					    		<img src="img/购物车/矢量智能对象.png" style="margin-left:0px; float: left;" />
					    		</span>
							<span style="margin-left:65px;float: left; ">
								<input type="button" value="-" style=" color:#333333;height:30px;width:20px;border-style:solid;margin-left:30px;"></input><input type="text" value="1" style=" color:#333333;height:30px;width:30px;text-align:center;"></input><input type="button" value="+" style=" color:#333333;height:30px;width:20px;border-style:solid;"></input>
							</span>
							<span style="margin-left:10px;float: left;">
                          <font style="font-size: 14px;color: #FD3C0D;margin-left: 85px;font-weight: bold;  ">15.90</font>
							</span >
							<span style="margin-left:85px; float: left;"><font style="font-size: 14px;color: #1E1E1E; ">移入收藏夹</font>
                          <br/> <font style="font-size: 14px;color: #1E1E1E; ">删除</font>
							</span>
					    </div>
					   
					  </div> -->
					   
					<div style="margin-top: 10px;background:#E5E5E5;height:50px;width:1200px;" class="bar-wrapper">
							<table class="uiTable" >
											<tr >
										        <th  style="line-height:50px;" >
										        	<input name="店铺" type="checkbox" value="" style="height: 14px;width: 14px;float: left;margin-top: 19px;" id="all" class="whole_check"/>
										        <font style="font-size: 12px;color: #333333;margin-left: 20px;font-weight: bold;display: flex;">全选</font> 
												<th  style="line-height:50px;"><font style="font-size: 12px;margin-left:50px;color: #333333; ">删除</font></th>
												<th  style="line-height:50px;"><font style="font-size: 12px;margin-left:50px;color: #333333;  ">消除失效宝贝</font></th>
												<th  style="line-height:50px;" ><font style="font-size: 12px;margin-left:50px; color: #333333;">移入收藏夹</font></th>
												<th  style="line-height:50px; " ><font style="font-size: 12px;margin-left:50px;color: #333333; ">分享</font></th>
												<!-- <th class="lastTd" colspan="2" style="line-height:50px; "><font style="font-size: 12px;margin-left:300px; ">已选商品</font>
												<font style="font-size: 12px;color:#FD3C0D;">0</font><font style="font-size: 12px;color:#333333;">件</font></th> -->
												<th  style="line-height:50px; " ><span style="font-size: 12px;margin-left:80px;color: #949494; ">合计(不含运费):</span>
													</th>
													<th  style="line-height:50px; " >
													<span style="font-size: 18px;color:#FD3C0D;" class="total_text">￥0</span></th>
                                                <th  style="line-height:50px; " ><input  type="button" style="font-size: 20px;margin-left:43px;color: #949494;" class="calBtn" id = "calBtn" value="结算" class="calBtn" id = "calBtn"/></th>
											</tr>

										</table>
						</div>
					
				</div>
				<!-- <div>
					<div class="bar-right">
						<div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
						<div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
						<div class="calBtn" id = "calBtn"><a href="javascript:;">结算</a></div>
					</div>
				</div> -->
			</div>

			<div  id="ta-3" class="tab">
				<div style="margin-top: 10px;height: 600px;width: 1200px; border:1px solid #EDEDED">
						<!-- <img src="img/frigidere.png" style="margin-left:10px;margin-top: 25px;margin-bottom: -3px;" /> -->
						<font style="font-size: 12px;color: #8e8e8e;font-weight: bold; margin-top:25px;">全部</font>
						<!-- <img src="img/iphone.png" style="margin-left:80px;margin-top: 25px;margin-bottom: -3px;"  /> -->
						<font style="font-size: 12px;color: #8e8e8e;font-weight: bold; margin-top:25px;margin-left: 10px;">降价</font>
						<!-- <img src="img/tennis-ball.png" style="margin-left:80px;margin-top: 25px;margin-bottom: -3px;" /> -->
						<font style="font-size: 12px;color: #8e8e8e;font-weight: bold; margin-top:25px;margin-left: 10px;">优惠</font>
						<!-- <img src="img/muffin.png" style="margin-left:80px;margin-top: 25px;margin-bottom: -3px;" /> -->
						<font style="font-size: 12px;color: #8e8e8e;font-weight: bold; margin-top:25px;margin-left: 10px;">失效</font>
						
						<!-- <img src="img/钉子图标.png" style="float: right;height: 25px;" id="loginimg"> -->
						
						<hr style=" border-style:solid;width:1200px;border-color:#f8c3b1;margin-top: 25px;"> </hr>
						
				
						
						
						
						<%-- <div style="width:100%;height:200px" > 
							<div style="float: left;padding: 10px;margin-left: 120px;">
								<img src="<%=basePath%>/static/img/showProd/X1.png" style="min-width: 150px;width:200px;height:200px" />
								<br />
								<span style="color: #686868;">21cake21客蛋糕朗姆之...</span>
								<br />
								<!-- <span style="color: #686868;margin-top: 23px;display:block;margin-left: 50px;width:200px;height:200px"> -->
								<font style="font-size:14px;color:#fb3201; font-weight: bold;">￥126</font></span>
							</div>
							<div style="float: left;padding: 10px;margin-left: 10px;">
								<img src="<%=basePath%>/static/img/showProd/X1.png" style="min-width: 150px;width:200px;height:200px" />
								<br />
								<span style="color: #686868;">21cake21客蛋糕朗姆之...</span>
								<br />
								<!-- <span style="color: #686868;margin-top: 23px;display:block;margin-left: 50px;width:200px;height:200px"> -->
								<font style="font-size:14px;color:#fb3201; font-weight: bold;">￥126</font></span>
							</div>
							<div style="float: left;padding: 10px;margin-left: 10px;">
								<img src="<%=basePath%>/static/img/showProd/X1.png" style="min-width: 150px;width:200px;height:200px" />
								<br />
								<span style="color: #686868;">21cake21客蛋糕朗姆之...</span>
								<br />
								<!-- <span style="color: #686868;margin-top: 23px;display:block;margin-left: 50px;width:200px;height:200px"> -->
								<font style="font-size:14px;color:#fb3201; font-weight: bold;">￥126</font></span>
							</div>
							
							<div style="float: left;padding: 10px;margin-left: 120px;">
								<img src="/roobusi//static/img/showProd/X1.png" style="min-width: 150px;width:200px;height:200px" />
								<br />
								<span style="color: #686868;">艺术画设计-（测试）</span>
								<br />
								<!-- <span style="color: #686868;margin-top: 23px;display:block;margin-left: 50px;width:200px;height:200px"> -->
								<font style="font-size:14px;color:#fb3201; font-weight: bold;">￥126</font></span>
							</div>

						</div> --%>
						
						
						<c:forEach items="${requestScope.rtnObject.product_CollectionList}" var="product_CollectionList">
						<div style="width:100%;height:200px" >
							<c:forEach items="${product_CollectionList}" var="product_CollectionList_object">
							
							<div style="float: left;padding: 10px;margin-left: 30px;" class="collectiondiv">
							
								<img src="<%=basePath%>${product_CollectionList_object.showImg}" style="min-width: 150px;width:200px;height:200px" />
							
								<br />
								<a href="<%=basePath%>common/showProd.action?id=${product_CollectionList_object.product_Artdesign.id}">
								<span style="color: #686868;">${product_CollectionList_object.product_Artdesign.title}</span>
								</a>
								<br />
								<!-- <span style="color: #686868;margin-top: 23px;display:block;margin-left: 50px;width:200px;height:200px"> -->
								<font style="font-size:14px;color:#fb3201; font-weight: bold;">￥${product_CollectionList_object.product_Artdesign.price-product_CollectionList_object.product_Artdesign.discount}
								</font>
								<div style="display:none" class="id">${product_CollectionList_object.product_Collection.id}</div>
								<div style="display:none" class="productid">${product_CollectionList_object.product_Artdesign.id}</div>
 								<a style="font-size:12px;color:#fb3201;" class="cancelCollection"  >取消收藏</a>
								
							</div>
							</c:forEach>
						</div>
						</c:forEach>
						
						
						
					
					</div>
					<hr style=" border-style:solid;width: 1200px;border-color:#D3D3D3;"> </hr>
			</div>

			

			<div  id="tab-4" class="tab">
				我的足迹
			</div>

			<div  id="tab-5" class="tab">table5</div>
			<div  id="tab-6" class="tab">table6</div>
			<div  id="tab-7" class="tab">table7</div>
			<div  id="tab-8"  class="tab">table8</div>
			<div  id="tab-9" class="tab">table9</div>
			<div  id="tab-10" class="tab">table10</div>
			<div  id="tab-11"  class="tab">table11</div>
			<div  id="tab-12" class="tab">table12</div>
		</div>
		
		<div class="menu3 menu_tab">
			<div id="tab-3-1" class="tab">
				<!-- 增值服务 -->
			</div>
			<div  id="tab-3-2" class="tab">意见反馈</div>
			<div  id="tab-3-3" class="tab">table3</div>
			<div  id="tab-3-4" class="tab">
				<p class="tt">1. 。。。</p>
				<p>。。。的个人版用户，100套账免费记，只需注册即可直接使用。。。。的代账公司版，多人操作且有服务运营管理系统，总账套数300套收费980元/年，总账套数1000套收费1980元/年。</p>

				<p class="tt">2. 。。。安全吗？</p>
				<p>在安全保障方面，我们参照并实施了多项国际及国家在信息安全领域的标准，成立了公司级安全小组，制定了详细的规章制度与考核标准，由安全监理负责监察规章制度的执行，确保客户数据的收集、储存及使用均遵守内部监控以及适用的法律及法规规定；用户数据安全方面我们采用安全性最好的独立部署模式，对每一家企业分配私有的专用服务器资源独立使用，数据单独存放，核心数据每天进行本地，本地异机与异地异机三重备份机制，解决因为极端事件给数据带来的安全隐患；在数据传输安全方面，所有用户关键及核心数据，我们全部使用SSL加密转输，杜绝了用户数据在传输过程中可能出现的窃听、篡改、伪造等行为。</p></div>
			<div  id="tab-3-5" class="tab">table5</div>
			<div  id="tab-3-6" class="tab">table6</div>
			<div  id="tab-3-7" class="tab">table7</div>
			<div  id="tab-3-8"  class="tab">table8</div>
			<div  id="tab-3-9" class="tab">table9</div>
			<div  id="tab-3-10" class="tab">table10</div>
			<div  id="tab-3-11"  class="tab">table11</div>
			<div  id="tab-3-12" class="tab">table12</div>
		</div>
	</div>
</div>
</div>
<script src="<%=basePath%>static/js/person/pc.js" type="text/javascript"></script>
</body>
</html>