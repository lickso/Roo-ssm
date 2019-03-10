<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%
	String basePath = request.getContextPath()+"/";
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=yes">
<meta http-equiv=”X-UA-Compatible” content=”IE=edge,chrome=1″/> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>

<link href="<%=basePath%>static/css/admin/style_index.css" rel="stylesheet" type="text/css" />

<script src="<%=basePath%>static/base/jquery-1.8.3.min.js" type="text/javascript"></script>

<!--[if lte IE 6]> 
<script src="DD_belatedPNG.js" tppabs="js/DD_belatedPNG.js" type="text/javascript"></script>
<script type="text/javascript">
DD_belatedPNG.fix('.foot_r span img,.foot_r li img,.kf a img,.title');
/* 将 .png_bg 改成你应用了透明PNG的CSS选择器*/
</script>
<![endif]-->

</head>
<body>
<!--header开始 -->
<header>
<!-----------------tow end----------><!-----------------one stare---------->
<script type="text/javascript">
$(function(){
    var tabNum=$(".important").find("li");
    var contentNum=$(".contents").children();
    var timer;
    $(tabNum).each(function(index){
        $(this).hover(function(){
            var that=$(this)
             timer=window.setTimeout(function(){
                $(contentNum).eq(index).css({"display":"block"});
                $(contentNum).eq(index).siblings().css({"display":"none"});
                 that.find("a").css({"background":"#FFF","color":"#fff"});
                 that.find("strong").show();
                 that.siblings().find("strong").hide();
                 that.siblings().find("a").css({"background":"#fff","color":"black"});
            },100)
        },function(){
            window.clearTimeout(timer);
        })
    })
})
</script>

<div class="w1200">
  <div class="title">
    <h1><span>功能</span>展示</h1>
  </div>
<ul class="important cl">
	 <li class="rcsp_1">
		<a><span></span></a>
		<p>日常审批</p>
		<strong><i></i></strong>
	 </li>
	 <li class="rcsp_2">
		<a><span></span></a>
		<p>计划管理</p>
		<strong style="display:none"><i></i></strong>
	 </li>
	 <li class="rcsp_3">
		<a><span></span></a>
		<p>知识管理</p>
		<strong style="display:none"><i></i></strong>
	</li>
	 <li class="rcsp_4">
		<a><span></span></a>
		<p>客户管理</p>
		<strong style="display:none"><i></i></strong>
	</li>
	 <li class="rcsp_5">
		<a><span></span></a>
		<p>合同管理</p>
		<strong style="display:none"><i></i></strong>
	</li>
	 <li class="rcsp_6">
		<a><span></span></a>
		<p>员工信息档案</p>
		<strong style="display:none"><i></i></strong>
	</li>
	 <li class="rcsp_7">
		<a><span></span></a>
		<p>招聘管理</p>
		<strong style="display:none"><i></i></strong>
	</li>
	 <li class="rcsp_8">
		<a><span></span></a>
		<p>薪酬管理</p>
		<strong style="display:none"><i></i></strong>
	</li>
	 <li class="rcsp_9">
		<a><span></span></a>
		<p>绩效管理</p>
		<strong style="display:none"><i></i></strong>
	</li>
</ul>
<div class="contents">
		<div class="cl">
			<div class="important_l">
				<a><img src="images/071146464hka.jpg"/></a>
			</div>
			<div class="important_r">
			   <div class="title_1">
				  <h3><span>DAILY</span> APPROVAL </h3>
				  <h2>日常审批<span>流程可视</span></h2>
				  <p>梳理企业业务，简化审批流程，提高办公效率</p>
			   </div>
			   <div class="icon_top cl"><i class="i_left"></i><i class="i_right"></i></div>
			   <div class="study">
				  <h3>日常审批</h3>
				  <span><p><font size="2">日常审批覆盖了财务审批、人事审批（公出、请假、出差、加班）、行政审批（公文、用品、采购）、合同审批等多个工作场景，具有可视化流程和多种催办方式。</font></p></span> <img src="images/17092157z5yc.png"/>
			   </div>
			   <div class="icon_top cl" style="padding-top:0px;"><i class="i_left1"></i><i class="i_right1"></i></div>
			</div>
    </div>
	<div class="cl" style="display: none">
		<div class="important_l"><a><img src="images/170854226k8c.png"/></a></div>
		<div class="important_r">
			<div class="title_1">
			  <h3><span>PROGRAM</span> MANAGEMENT </h3>
			  <h2>计划管理<span>实时把控</span></h2>
			  <p>工作计划轻松梳理，更可通过共享实现“协同办公”。</p>
		   </div>
		   <div class="icon_top cl"><i class="i_left"></i><i class="i_right"></i></div>
		   <div class="study">
			  <h3>计划管理</h3>
			  <span><p><span style="font-size: small;">计划管理分为&ldquo;个人/部门计划&rdquo;和&ldquo;日/周/月计划&rdquo;两个维度，可自定义计划模板，计划可共享，便于管控、总结、汇报。</span></p></span> <img src="images/17085113rcs3.png"/>
		   </div>
		   <div class="icon_top cl" style="padding-top:0px;"><i class="i_left1"></i><i class="i_right1"></i></div>
       <!--div class="study"><a class="know" href="">对计划管理不了解？>点击了解</a></div-->
    </div>
  </div>
                <div class="cl" style="display: none">
    <div class="important_l"><a><img src="images/17085130oitn.jpg"/></a></div>
    <div class="important_r">
       <div class="title_1">
          <h3><span>KNOWLEDGE</span> MANAGEMENT </h3>
          <h2>知识管理<span>企业宝库</span></h2>
          <p>企业知识库持续积累，可进行知识采集发布，应对市场变化，做出正确决策</p>
       </div>
       <div class="icon_top cl"><i class="i_left"></i><i class="i_right"></i></div>
       <div class="study">
          <h3>知识管理</h3>
          <span><p><span style="font-size: small;">知识管理可以对企业内的所有电子文档进行上传、分类管理、查询/借阅，包括个人网盘、公文文件柜和知识中心</span></p></span>
		  <img src="images/17085136g8gd.png"/>
       </div>
       <div class="icon_top cl" style="padding-top:0px;"><i class="i_left1"></i><i class="i_right1"></i></div>
       <!--div class="study"><a class="know" href="">对知识管理不了解？>点击了解</a></div-->
    </div>
  </div>
                <div class="cl" style="display: none">
    <div class="important_l"><a><img src="images/17085153yh1h.jpg"/></a></div>
    <div class="important_r">
       <div class="title_1">
          <h3><span>CUSTOMER</span> MANAGEMENT </h3>
          <h2>客户管理<span>精准营销</span></h2>
          <p>有效记录和跟踪客户，管控销售过程，推进签单</p>
       </div>
       <div class="icon_top cl"><i class="i_left"></i><i class="i_right"></i></div>
       <div class="study">
          <h3>客户管理</h3>
          <span><p><span style="font-size: small;">客户管理涵盖客户信息记录/提取、销售数据统计分析、商机追踪等功能，配备销售漏斗，为业务提供全程支持。</span></p></span> 
		  <img src="images/170851595vrj.png"/>
       </div>
       <div class="icon_top cl" style="padding-top:0px;"><i class="i_left1"></i><i class="i_right1"></i></div>
       <!--div class="study"><a class="know" href="">对客户管理不了解？>点击了解</a></div-->
    </div>
  </div>
                <div class="cl" style="display: none">
    <div class="important_l"><a><img src="images/170852357mmn.png"/></a></div>
    <div class="important_r">
       <div class="title_1">
          <h3><span>CONTRACT</span> MANAGEMENT </h3>
          <h2>合同管理<span>缜密清晰</span></h2>
          <p>帮你做好合同管理工作的方方面面</p>
       </div>
       <div class="icon_top cl"><i class="i_left"></i><i class="i_right"></i></div>
       <div class="study">
          <h3>合同管理</h3>
          <span><p><span style="font-size: small;">合同评审、签订、归档、变更、交付、违约全方位管控，让您的合同管理360度无死角！</span></p></span> 
		  <img src="images/17085243mni6.png"/>
       </div>
       <div class="icon_top cl" style="padding-top:0px;"><i class="i_left1"></i><i class="i_right1"></i></div>
       <!--div class="study"><a class="know" href="">对合同管理不了解？>点击了解</a></div-->
    </div>
  </div>
                <div class="cl" style="display: none">
    <div class="important_l"><a><img src="images/17085256xhlm.png"/></a></div>
    <div class="important_r">
       <div class="title_1">
          <h3><span>PERSONNAL</span> FILES </h3>
          <h2>人事信息<span>管理无忧</span></h2>
          <p>人事信息多维度展现，可自定义模板，灵活便捷</p>
       </div>
       <div class="icon_top cl"><i class="i_left"></i><i class="i_right"></i></div>
       <div class="study">
          <h3>员工信息档案</h3>
          <span><p><span style="font-size: small;">实现对人员信息档案的记录、查询，可展现组织架构，可进行员工报道激活，也可以生成照片墙，为人力资源管理工作铺好基石。</span></p></span> <img src="images/17085308kw67.png"/>
       </div>
       <div class="icon_top cl" style="padding-top:0px;"><i class="i_left1"></i><i class="i_right1"></i></div>
       <!--div class="study"><a class="know" href="">对员工档案不了解？>点击了解</a></div-->
    </div>
  </div>
                <div class="cl" style="display: none">
    <div class="important_l"><a><img src="images/17091705h84f.png"/></a></div>
    <div class="important_r">
       <div class="title_1">
          <h3><span>RECRUITING</span> MANAGEMENT </h3>
          <h2>招聘管理<span>高效快速</span></h2>
          <p>人力资源优化配置的助推器</p>
       </div>
       <div class="icon_top cl"><i class="i_left"></i><i class="i_right"></i></div>
       <div class="study">
          <h3>招聘管理</h3>
          <span><p><span style="font-size: small;">可记录分析招聘需求、发布招聘计划、简历采集甄选、协助HR面试，规范招聘工作全流程。</span></p></span> 
		  <img src="images/170917105dqs.png"/>
       </div>
       <div class="icon_top cl" style="padding-top:0px;"><i class="i_left1"></i><i class="i_right1"></i></div>
       <!--div class="study"><a class="know" href="">对招聘管理不了解？>点击了解</a></div-->
    </div>
  </div>
                <div class="cl" style="display: none">
    <div class="important_l"><a><img src="images/17091755q1f1.png"/></a></div>
    <div class="important_r">
       <div class="title_1">
          <h3><span>SALARY</span> MANAGEMENT </h3>
          <h2>薪酬管理<span>易如反掌</span></h2>
          <p>薪资发放调整都有据可循</p>
       </div>
       <div class="icon_top cl"><i class="i_left"></i><i class="i_right"></i></div>
       <div class="study">
          <h3>薪酬管理</h3>
          <span><p><span style="font-size: small;">提供薪资体系/标准设置、薪资计算、薪资发放记录查询、薪资记录调整查询等功能</span></p></span> 
		  <img src="images/17091801zica.png" />
       </div>
       <div class="icon_top cl" style="padding-top:0px;"><i class="i_left1"></i><i class="i_right1"></i></div>
       <!--div class="study"><a class="know" href="">对薪酬管理不了解？>点击了解</a></div-->
    </div>
  </div>
                <div class="cl" style="display: none">
    <div class="important_l"><a><img src="images/17091816zslw.png"/></a></div>
    <div class="important_r">
       <div class="title_1">
          <h3><span>PERFORMANCE</span> MANAGEMENT </h3>
          <h2>绩效管理<span>轻松实现</span></h2>
          <p>在这里，部门职能差异不是制定考核标准的难点。</p>
       </div>
       <div class="icon_top cl"><i class="i_left"></i><i class="i_right"></i></div>
       <div class="study">
          <h3>绩效管理</h3>
          <span><p><span style="font-size: small;">可按照月度/年度、个人/部门等多个维度进行绩效考核，综合员工业务行为数据进行分析，不仅使团队短板一目了然，还可以为制定考核标准提供依据。</span></p></span> 
		  <img src="images/17091821ne9m.png"/>
       </div>
       <div class="icon_top cl" style="padding-top:0px;"><i class="i_left1"></i><i class="i_right1"></i></div>
       <!--div class="study"><a class="know" href="">对绩效管理不了解？>点击了解</a></div-->
    </div>
  </div>

</div>
</div>


</body>
</html>  