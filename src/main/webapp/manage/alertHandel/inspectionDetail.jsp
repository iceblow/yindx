<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>巡检详情</title>
<link rel="stylesheet" type="text/css" href="../css/right.css">
</head>
<style>
.result{
	overflow: hidden;
    height: auto !important;
}
.itemBox{
	overflow: hidden;
    height: auto !important;
}
</style>
<body>
	<!-- 主内容 -->
	<div class="right">
		<div class="locationBox">
			<img src="../images/icon_address_xiao.png">
			<font class="fontLeft">${route.address }</font>
			<font class="fontCenter"><fmt:formatDate value="${route.createdate }" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></font>
<!-- 			<font class="fontRight">14:06</font> -->
			<div class="return">返回</div>
		</div>
		<div class="contentTitle">${route.name }<div class="finishBox" style="font-size: 13px;border: 1px solid red;color: red;text-align: center;line-height: 24px;width: 85px;">
			<c:if test="${type == 10 }">未执行</c:if>
                    <c:if test="${type == 11 }">有隐患</c:if>
                    <c:if test="${type == 12 }">有隐患/解决</c:if>
                    <c:if test="${type == 13 }">未按时</c:if>
                    <c:if test="${type == 14 }">正常/按时</c:if>
		</div></div>
		<div class="content">${route.topic }</div>
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
			<div class="resultBox">
				<div class="result">
					<div class="resultTitle">巡查结果</div>
					<div class="itemBox">
							<c:forEach items="${routeList }" var="p">
							<c:if test="${p.status != 0}">
								<table class="nomalTable" style="margin-top: 10px;">
									<tr>
										<th>项目</th>
										<th>子项目</th>
										<th>状态</th>
									</tr>
									<tr>
										<td>${p.name}</td>
										<td>${p.childName}</td>
										<c:if test="${p.status == 2}">
											<td>
												<c:if test="${p.problem_id > 0}"><a href="./dangerDetail?id=${p.problem_id }"></c:if>
												<font class="red">${p.state}</font>
												<c:if test="${p.problem_id > 0}"></a></c:if>
											</td>
										</c:if>
										<c:if test="${p.status == 1}">
											<td>${p.state}</td>
										</c:if>
									</tr>
								</table>
							</c:if>
							</c:forEach>
					</div>
				</div>
			</div>			
			<table class="detailTable lastOne">
				<tr>
					<th>时间</th>
					<th>部门</th>
					<th>人员</th>
					<th>操作</th>
					<th>内容</th>
				</tr>
				<c:forEach items="${list }" var="p">
					<tr>
						<td><fmt:formatDate value="${p.createtime }" type="date" pattern="yyyy-MM-dd" /></td>
						<td>${p.deptname }</td>
						<td>${p.username }</td>
						<td>
							<c:if test="${p.laststep == 10 }">发起</c:if>
	                    	<c:if test="${p.laststep == 11 }">审核通过</c:if>
	                    	<c:if test="${p.laststep == 12 }">审核通过</c:if>
	                    	<c:if test="${p.laststep == 121 }">接单</c:if>
	                    	<c:if test="${p.laststep == 13 }">审核通过</c:if>
	                    	<c:if test="${p.laststep == 14 }">挂起</c:if>
	                    	<c:if test="${p.laststep == 141 }">挂起审核通过</c:if>
	                    	<c:if test="${p.laststep == 142 }">挂起审核不通过</c:if>
	                    	<c:if test="${p.laststep == 15 }">打回</c:if>
	                    	<c:if test="${p.laststep == 151 }">打回审核通过</c:if>
	                    	<c:if test="${p.laststep == 152 }">打回审核不通过</c:if>
	                    	<c:if test="${p.laststep == 16 }">解决</c:if>
						</td>
						<td>${p.createcontent }</td>
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
        	$('#alertHandelInspection').addClass('active');
        	open();       
        	
        	$('.right').on('click','.return',function() {
        		location.href = server + '/dianxin/alertHandel/inspectionList';
        	});
        });
    </script>
</body>
</html>