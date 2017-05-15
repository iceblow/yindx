<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>检查详情</title>
<link rel="stylesheet" type="text/css" href="../css/right.css">
</head>
<body>
	<!-- 主内容 -->
	<div class="right">
		<div class="locationBox">
			<img src="../images/icon_address_xiao.png">
			<font class="fontLeft">${checkFlow.address }</font>
			<font class="fontCenter"><fmt:formatDate value="${checkFlow.createdate }" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></font>
<!-- 			<font class="fontRight">14:06</font> -->
			<div class="return">返回</div>
		</div>
<!-- 		<div class="contentTitle">电源损坏</div> -->
<!-- 		<div class="content">出发前，组织人员清点测试所需设备是否准备就绪及备用设备是否充足；准备好测试所需软件及各种相关驱动程序和系统恢复盘（T400和DELL6400），准备好集团公用服务器上的所有相关文档，并下发各组员。得到确认版软件之后，电脑上仅能放确认版本的软件和key，软件装上后，要确认好版本号是否正确，key是否正确（任何人重装系统重装软件之后，一定要确认版本号）</div> -->
		<div class="bottomContent">
<!-- 			<div class="biao"> -->
<!-- 				<img src="../images/biao.png"> -->
<!-- 				<div class="fenL">13&acute;&acute;</div> -->
<!-- 				<div class="fenR">22&acute;&acute;</div> -->
<!-- 			</div> -->
<!-- 			<div class="imagesBox"> -->
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
<!-- 			</div> -->
			<div class="result lastOne" style="height: auto;">
				<div class="resultTitle">巡查结果</div>
				<div class="itemBox" style="height: auto;">
				<!-- 	<table class="nomalTable"> -->
				<!-- 		<tr>
							<th>项目</th>
							<th>状态</th>
						</tr>
						<tr>
							<td>火警</td>
							<td>正常</td>
						</tr> -->
						<!-- <tr>
							<td colspan="2" class="black">一切正常</td>
						</tr> -->
				<!-- 	</table> -->
						<c:forEach items="${checkResults }" var="p">
							<table class="nomalTable" style="margin-bottom: 20px;">
						<tr>
							<th>项目</th>
							<th>状态</th>
						</tr>
						<tr>
							<td>${p.check.name }</td>
							<td>
							<c:if test="${p.result == 0 }">正常</c:if>
							<c:if test="${p.result == 1 }">隐患</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="black">${p.content} </td>
						</tr>
							</table>
						</c:forEach>
						
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/common.jsp" />
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/foundation-datepicker.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){   
        	$('#alertHandelCheck').addClass('active');
        	open();       
        	
        	$('.right').on('click','.return',function() {
        		location.href = server + '/dianxin/alertHandel/checkList';
        	});
        	var h = $('.result.lastOne').height();
        	console.log(h);
        });
    </script>
</body>
</html>