<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模板详情</title>
<link href="../css/foundation-datepicker.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css/right.css">
</head>
<body>
	<!-- 右边主要内容 -->
    <div class="right">
        <!-- 头部 -->
        <div class="wrapperTop">
            <!-- 当前页面 -->
            <div class="leadTop">
                <div class="leftLead">
                	<img src="../images/icon_position.png">
                	<font class="gray">模板设置</font>
                	<img src="../images/icon_position_arrow.png" class="pa">   
                	<font class="black">模板详情</font>            	
                </div>
            </div>            
        </div>
        <div class="contentTitle contentTitle28-19">
			<div class="contentTitleInner">模板名称</div>
		
			
		</div>
		<div class="dtniBox">
			<font class="date">2017/03/21</font>
			<font class="time">14:06</font>
			<font class="name">小明</font>设备分类
		</div>
		<div class="content content873">出发前，组织人员清点测试所需设备是否准备就绪及备用设备是否充足；准备好测试所需软件及各种相关驱动程序和系统恢复盘（T400和DELL6400），准备好集团公用服务器上的所有相关文档，并下发各组员。得到确认版软件之后，电脑上仅能放确认版本的软件和key，软件装上后，要确认好版本号是否正确，key是否正确（任何人重装系统重装软件之后，一定要确认版本号）</div>
		
		<div class="bottomContent ">
			<div class="lineBox marginTop48 marginLeft22">
	        	<div class="item">
        		<img src="../images/icon_triangle.png" alt="" class="triangle">大分类一
        		<ul class="itemul">
        			<li class="marginLeft25">小分类一</li>
        			<li class="marginLeft25">小分类一</li>
        			<li class="marginLeft25">小分类一</li>
        		</ul>
        	</div>
        	<div class="item">
        		<img src="../images/icon_triangle.png" alt="" class="triangle">大分类一
        		<ul class="itemul">
        			<li class="marginLeft25">小分类一</li>
        			<li class="marginLeft25">小分类一</li>
        			<li class="marginLeft25">小分类一</li>
        		</ul>
        	</div>
        	<div class="item">
        		<img src="../images/icon_triangle.png" alt="" class="triangle">大分类一
        		<ul class="itemul">
        			<li class="marginLeft25">小分类一</li>
        			<li class="marginLeft25">小分类一</li>
        			<li class="marginLeft25">小分类一</li>
        		</ul>
        	</div>
	        </div>
		</div>
	</div>
    <div class="wrapperModal" style="display:none;"></div>
    <jsp:include page="../common/common.jsp" />
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/foundation-datepicker.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){   
        	$('#equipmentTemplateList').addClass('active');
        	open();  
        
        	$('.leftLead').click(function() {
        		location.href = server + '/for/equipment/templateList.jsp';
        	});
        	$('.leftNav ul .active').parent().prev().find('.fanhui').css('margin-top','22px');
        	
        });
    </script>
</body>
</html>