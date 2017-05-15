<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实时详情</title>
<link rel="stylesheet" type="text/css" href="../css/right.css">
</head>
<body>
	<!-- 主内容 -->
	<div class="right">
		<div class="locationBox">
			<img src="../images/icon_address_xiao.png">
			<font class="fontLeft">${detail.address }</font>
			<font class="fontCenter"><fmt:formatDate value="${detail.aecreatedate }" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></font>
<%-- 			<font class="fontRight"><fmt:formatDate value="${detail.aecreatedate }" type="date" pattern="hh:mm" /></font> --%>
			<div class="return">返回</div>
		</div>
<!-- 		<div class="contentTitle"> -->
<!-- 			电源损坏 -->
<!-- 			<div class="finishBox"><img src="../images/display_over.png"></div> -->
<!-- 		</div> -->
		<div class="content">${detail.topic }</div>
		<div class="bottomContent">
<!-- 			<div class="biao"> -->
<!-- 				<img src="../images/biao.png"> -->
<!-- 				<div class="fenL">13&acute;&acute;</div> -->
<!-- 				<div class="fenR">22&acute;&acute;</div> -->
<!-- 			</div> -->
<!-- 			<div class="imagesBox imagesBox54"> -->
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
<!-- 			</div> -->
			<table class="detailTable lastOne">
				<tr>
					<th>时间</th>
					<th>人员</th>
					<th>状态</th>
				</tr>
				<c:forEach items="${detail.flow_list }" var="p">
					<tr>
						<td><fmt:formatDate value="${p.createtime }" type="date" pattern="yyyy-MM-dd" /></td>
						<td>${p.holderid }</td>
						<td>${p.stepname }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:include page="../common/common.jsp" />
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/foundation-datepicker.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){   
        	$('#alertHandelActual').addClass('active');
        	open();       
        	
        	$('.right').on('click','.return',function() {
        		location.href = server + '/dianxin/alertHandel/actualList';
        	});
        });
    </script>
</body>
</html>