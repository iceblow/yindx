<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>隐患详情</title>
<link rel="stylesheet" type="text/css" href="../css/right.css">
<script src="../js/audio.min.js"></script>
<link rel="stylesheet" href="../css/index.css" media="screen">
 <script>
      audiojs.events.ready(function() {
        audiojs.createAll();
      });
    </script>
</head>
<body>
	<!-- 主内容 -->
	<div class="right">
		<div class="locationBox">
			<img src="../images/icon_address_xiao.png">
			<font class="fontLeft">${problem.address }</font>
			<font class="fontCenter"><fmt:formatDate value="${problem.createdate }" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></font>
<!-- 			<font class="fontRight">14:06</font> -->
			<div class="return" id="return1">返回</div>
			<div class="return" id="return2">解决</div>
		</div>
		<div class="contentTitle">${problem.title }<div class="finishBox">
			<c:if test="${problem.laststep == 10 || problem.laststep == 14 || problem.laststep == 15 }"><img src="../images/display_daishen.png"></c:if>
			<c:if test="${problem.laststep == 13 || problem.laststep == 142 || problem.laststep == 152 }"><img src="../images/display_dontPass.png"></c:if>
			<c:if test="${problem.laststep == 12 }"><img src="../images/display_fabu.png"></c:if>
			<c:if test="${problem.laststep == 11 || problem.laststep == 141 || problem.laststep == 151 }"><img src="../images/display_yitongguo.png"></c:if>
			<c:if test="${problem.laststep == 16 }"><img src="../images/display_over.png"></c:if>
		</div></div>
		<div class="content">${problem.topic }</div>
		<div class="bottomContent">
			<c:if test="${not empty problem.audio }">
			<div class="biao">
<!-- 				<img src="../images/biao.png"> -->
<!-- 				<div class="fenL">13&acute;&acute;</div> -->
<!-- 				<div class="fenR">22&acute;&acute;</div> -->
<%-- 				<embed height="100" width="100" src="${problem.audio }" /> --%>
				<audio src="${problem.audio }" preload="auto"></audio>
<!-- 				<audio src="http://so1.111ttt.com:8282/2017/1/04m/26/297262113196.m4a?tflag=1493798520&pin=7326924ffac4a2ca1b11d94b0f740c49&ip=183.129.158.202#.mp3" preload="auto"></audio> -->
			</div>
			</c:if>
			<div class="imagesBox imagesBox54">
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
			</div>
			<table class="detailTable lastOne" style="width: 1136px;">
				<tr>
					<th>时间</th>
					<th>人员</th>
					<th>操作</th>
					<th>备注</th>
				</tr>
				<c:forEach items="${list }" var="p">
					<tr>
						<td><fmt:formatDate value="${p.createtime }" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><c:if test="${p.holderid == 0 }">郑凌燕</c:if>${p.full_deptname}_${p.username}</td>
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
        	$('#alertHandelDanger').addClass('active');
        	open();       
        	
        	$('.right').on('click','#return1',function() {
        		location.href = server + '/dianxin/alertHandel/dangerList';
        	});
        	
        	$('.right').on('click','#return2',function() {
        		if(!confirm("确定直接解决该隐患?")){
        			return;
        		}
        		var id = '${problem.problem_id}';
        		var Url = server + '/dianxin/alertHandel/dealProblem';
            	$.ajax({
            		url: Url,
            		data: {id:id},
            		type: 'POST',
            		success: function(msg){
            			if(msg){
            				alert(msg.message);
            			}
            		}
            	})
        	});
        	
        	var img = '${problem.imgs}';
        	var imgs = img.split(",");
        	var html = '';
        	for (var i=0; i<imgs.length ; i++) {
        		if (imgs[i].length > 0) {
        			if(imgs[i]){
        				html += '<div class="image"><img style="width:100px; height:100px;" src="'+imgs[i]+'"></div>';
        			}
        		}
        	}
        	$('.imagesBox54').html(html);
        });
    </script>
</body>
</html>