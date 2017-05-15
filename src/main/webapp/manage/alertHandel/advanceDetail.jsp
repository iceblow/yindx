<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预警详情</title>
<link rel="stylesheet" type="text/css" href="../css/right.css">
</head>
<body>
	<!-- 主内容 -->
	<div class="right">
		<div class="locationBox">
<!-- 			<img src="../images/icon_address_xiao.png"> -->
<!-- 			<font class="fontLeft">拱墅区大关小区沈半路45号</font> -->
			<font class="fontCenter" style="display: none;color: red;"></font>
<!-- 			<font class="fontRight">14:06</font> -->
			<div class="return">返回</div>
		</div>
<!-- 		<div class="contentTitle"> -->
<!-- 			电源损坏 -->
<!-- 			<div class="finishBox"><img src="../images/display_over.png"></div> -->
<!-- 		</div> -->
<!-- 		<div class="content">出发前，组织人员清点测试所需设备是否准备就绪及备用设备是否充足；准备好测试所需软件及各种相关驱动程序和系统恢复盘（T400和DELL6400），准备好集团公用服务器上的所有相关文档，并下发各组员。得到确认版软件之后，电脑上仅能放确认版本的软件和key，软件装上后，要确认好版本号是否正确，key是否正确（任何人重装系统重装软件之后，一定要确认版本号）</div> -->
		<div class="bottomContent">
<!-- 			<div class="biao"> -->
<!-- 				<img src="../images/biao.png"> -->
<!-- 				<div class="fenL">13&acute;&acute;</div> -->
<!-- 				<div class="fenR">22&acute;&acute;</div> -->
<!-- 			</div> -->
			<div class="imagesBox imagesBox54">
				<div class="image"><img src="../images/pic.png" id="img"></div>
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
			</div>
<!-- 			<table class="detailTable lastOne"> -->
<!-- 				<tr> -->
<!-- 					<th>时间</th> -->
<!-- 					<th>部门</th> -->
<!-- 					<th>人品</th> -->
<!-- 					<th>操作</th> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>2017-01-20</td> -->
<!-- 					<td>工程部</td> -->
<!-- 					<td>小名</td> -->
<!-- 					<td>发起</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>2017-01-20</td> -->
<!-- 					<td>工程部</td> -->
<!-- 					<td>小名</td> -->
<!-- 					<td>审核</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>2017-01-20</td> -->
<!-- 					<td>工程部</td> -->
<!-- 					<td>小名</td> -->
<!-- 					<td>接单</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>2017-01-20</td> -->
<!-- 					<td>工程部</td> -->
<!-- 					<td>小名</td> -->
<!-- 					<td>处理</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>2017-01-20</td> -->
<!-- 					<td>工程部</td> -->
<!-- 					<td>小名</td> -->
<!-- 					<td>转发</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>2017-01-20</td> -->
<!-- 					<td>工程部</td> -->
<!-- 					<td>小名</td> -->
<!-- 					<td>打回</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>2017-01-20</td> -->
<!-- 					<td>工程部</td> -->
<!-- 					<td>小名</td> -->
<!-- 					<td>挂起</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
		</div>
	</div>
	<jsp:include page="../common/common.jsp" />
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/foundation-datepicker.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){   
        	$('#alertHandelAdvance').addClass('active');
        	open();       
        	
        	$('.right').on('click','.return',function() {
        		location.href = server + '/dianxin/alertHandel/advanceList';
        	});
        	$.ajax({
        		url: server +'/dianxin/api/ewremind/detail',
        		data: {uuid:'${id}',type:'${type}'},
        		type: 'POST',
        		success: function(msg){
        			msg = eval('('+msg+')');
        			if(msg.code != 1){
        				$('.fontCenter').text(msg.message);
        				$('.fontCenter').show();
        			}else{
        				$('#img').attr('src',msg.floor.map);
        			}
        			
        			}
        		});
        });
    </script>
</body>
</html>