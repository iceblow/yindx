<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核详情</title>
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
			<div class="return">返回</div>
		</div>
		<div class="contentTitle">
			${problem.title }
			<div class="finishBox">
				<c:if test="${problem.laststep == 10 || problem.laststep == 14 || problem.laststep == 15 }"><img src="../images/display_daishen.png"></c:if>
				<c:if test="${problem.laststep == 13 || problem.laststep == 142 || problem.laststep == 152 }"><img src="../images/display_dontPass.png"></c:if>
			</div>
		</div>
		<div class="content">${problem.topic }</div>
		<div class="bottomContent">
			<c:if test="${not empty problem.audio }">
			<div class="biao">
<!-- 				<img src="../images/biao.png"> -->
<!-- 				<div class="fenL">13&acute;&acute;</div> -->
<!-- 				<div class="fenR">22&acute;&acute;</div> -->
<%-- 				<embed height="100" width="100" src="${problem.audio }" /> --%>
					<audio src="${problem.audio }" preload="auto"></audio>
			</div>
			</c:if>
			<div class="imagesBox imagesBox54">
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
<!-- 				<div class="image"><img src="../images/pic.png"></div> -->
			</div>
			<table class="detailTable">
				<tr>
					<th>时间</th>
					<th>人员</th>
					<th>操作</th>
					<th>备注</th>
				</tr>
				<c:forEach items="${list }" var="p">
					<tr>
						<td><fmt:formatDate value="${p.createtime }" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><c:if test="${p.holderid == 0 }">郑凌燕</c:if>${p.username }</td>
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
			<div class="buttonBox lastOne">
				<div class="notPass">不通过</div>
				<div class="pass">通过</div>
				<div class="reasonBox">不通过原因：<font class="reason"></font></div>
			</div>
		</div>
		<!-- 不通过模态层 -->
		<div class="modal tipModal" id="notPassModal">
			<div class="titleWrapper">
				<div class="title">提示</div>
				<img src="../images/button_delete.png">
			</div>
			<div class="contentWrapper">
				<div class="text" contenteditable="true">请输入不通过理由</div>
				<div class="redTip">请输入文字</div>
			</div>
			<div class="bottomWrapper">
				<div class="confirm">确定</div>
				<div class="cancel">取消</div>
			</div>
		</div>
		<!-- 通过模态层 -->
		<div class="modal tipModal" id="passModal">
			<div class="titleWrapper">
				<div class="title">审核通过</div>
				<img src="../images/button_delete.png">
			</div>
			<div class="contentWrapper">
				<div class="tipInner">
					<c:if test="${problem.laststep != 14 }">
						<div class="row">
							<div class="labelName">行政区</div>
							<select class="selectInput" onchange="getstation()" id="area">
	                        	<option value="">请选择</option>
	                        	<c:forEach items="${areaList }" var="p">
	                        		<option value="${p.deptid }">${p.deptname }</option>
	                        	</c:forEach>
	                        </select>
						</div>
						<div class="row">
							<div class="labelName">局站</div>
							<select class="selectInput" onchange="getperson()" id="station">
	                        	<option value="">请选择</option>
	                        </select>
						</div>
						<div class="row">
	                        <div class="labelName">执行人</div>
	                        <select class="selectInput" id="person">
	                        	<option value="">请选择</option>
	                        </select>
	                    </div>
	                    <div class="row">
	                        <div class="labelName">接单时间</div>
	                       	<input type="text" class="selectInput" id="receivetime" value="">
	                       	<div class="labelName">分钟</div>
	                    </div>
	                    <div class="row">
	                        <div class="labelName">处理时间</div>
	                       	<input type="text" class="selectInput" id="resolvetime" value="">
	                       	<div class="labelName">分钟</div>
	                    </div>
                    </c:if>
                    <c:if test="${problem.laststep == 14 }">
                    	<div class="row">
	                        <div class="labelName">挂起时间</div>
	                       	<input type="text" class="selectInput" id="handletime" value="">
	                       	 <div class="labelName">分钟</div>
	                    </div>
                    </c:if>
					<div class="redTip"></div>
				</div>
			</div>
			<div class="bottomWrapper">
				<div class="confirm">确定</div>
				<div class="cancel">取消</div>
			</div>
		</div>
	</div>
	<!-- 模态层 -->
    <div class="wrapperModal"></div>
	<jsp:include page="../common/common.jsp" />
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/foundation-datepicker.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){   
        	$('#alertPublishReview').addClass('active');
        	open();       
        	var val = $('.contentWrapper .text').text();
        	
        	$('.right').on('click','.return',function() {
        		location.href = server + '/dianxin/alertPublish/reviewList';
        	});
        	
        	$('.notPass').click(function() {
        		$('.contentWrapper .text').text(val);
        		$('.contentWrapper .text').css('color','#C3C3C3');
        		position('notPassModal');
        		$('#notPassModal').show();
        		$('.wrapperModal').show();
        	});
        	
        	$('.pass').click(function() {
        		position('passModal');
        		$('#passModal').show();
        		$('.wrapperModal').show();
        	});
        	
        	$('.contentWrapper .text').focusin(function() {        		
        		$(this).text('');
        		$(this).css('color','#666');
        	});
        	
        	$('.contentWrapper .text').focusout(function() {
        		if($(this).text() == ''){
        			$(this).text(val);
            		$(this).css('color','#C3C3C3');
        		}        		
        	});
        	
        	$('#notPassModal .confirm').click(function() {     
        		if($('.contentWrapper .text').text() != '' && $('.contentWrapper .text').text() != val){
        			var content = $('.contentWrapper .text').text();
        			var id = '${problem.problem_id }';
        			var status = 0;
        			$.ajax({
        				url: './review',
        				data: {id:id, content:content, status:status},
        				type: 'POST',
        				success: function(msg){
        					if (msg.code == 0) {
        						alert("操作失败");
        						return;
        					}
        					$('.reason').text($('.contentWrapper .text').text());
                			$('.notPass').hide();
                    		$('.pass').hide();
                    		$('.reasonBox').show();
                    		$('#notPassModal').hide();
                    		$('.wrapperModal').hide();
                    		$('.finishBox').find('img').attr('src','../images/display_dontPass.png');
                    		location.href = server + '/dianxin/alertPublish/reviewList';
        				}
        			});
        		} else {
        			$('.contentWrapper .text').focus();
        			$('#notPassModal .redTip').show();
        		}     		
        	});
        	
        	$('#passModal .confirm').click(function() {   
//         		var valp = '';
//         		$('#passModal .selectInput').each(function(indxe,el){
//             		valp += $(el).val();
//             	});
//         		if(valp.indexOf('请选择') == -1){
//         			$('.buttonBox').hide();
//             		$('.detailTable').show();
//             		$('#passModal').hide();
//             		$('.wrapperModal').hide();
//             		$('.finishBox').find('img').attr('src','../images/display_yitongguo.png');
//         		} else {
//         			console.log($('#passModal .selectInput:first'));
//         			console.log($('#passModal .selectInput:last'));
//         			console.log(valp.lastIndexOf('请选择'));
//                		if($('#passModal .selectInput:first').val() == '请选择'){
//                			$('#passModal .selectInput:first').focus();
//                		} 
//                		if($('#passModal .selectInput:first').val() != '请选择' && $('#passModal .selectInput:last').val() == '请选择') {
//                			$('#passModal .selectInput:last').focus();
//                		}
//         			$('#passModal .redTip').show();
//         		}   
				var laststep = '${problem.laststep}';
				var status = 1;
				var id = '${problem.problem_id }';
				if (laststep != 14) {
					var area= $('#area').val();
					if (area == '') {
						$('#passModal .redTip').html("请选择区域");
						$('#passModal .redTip').show();
						return;
					}
					
					var station= $('#station').val();
					if (station == '') {
						$('#passModal .redTip').html("请选择区域");
						$('#passModal .redTip').show();
						return;
					}
					
					var person= $('#person').val();
					if (person == '') {
						$('#passModal .redTip').html("请选择人员");
						$('#passModal .redTip').show();
						return;
					}
					
					var receivetime= $('#receivetime').val();
					if (receivetime == '' || receivetime=='请输入') {
						$('#passModal .redTip').html("请输入接单时间");
						$('#passModal .redTip').show();
						return;
					}
					
					var resolvetime= $('#resolvetime').val();
					if (resolvetime == '' || resolvetime=='请输入') {
						$('#passModal .redTip').html("请输入处理时间");
						$('#passModal .redTip').show();
						return;
					}
					
	        		$.ajax({
	    				url: './review',
	    				data: {id:id, status:status, person:person, receivetime:receivetime, resolvetime:resolvetime},
	    				type: 'POST',
	    				success: function(msg){
	    					if (msg.code == 0) {
	    						alert("操作失败");
	    						return;
	    					}
	    					$('.buttonBox').hide();
	                		$('.detailTable').show();
	                		$('#passModal').hide();
	                		$('.wrapperModal').hide();
	                		$('.finishBox').find('img').attr('src','../images/display_yitongguo.png');
	                		location.href = server + '/dianxin/alertPublish/reviewList';
	    				}
	    			});
				} else {
					var handletime= $('#handletime').val();
					if (handletime == '' || handletime=='请输入') {
						$('#passModal .redTip').html("请输入挂起时间");
						$('#passModal .redTip').show();
						return;
					}
					$.ajax({
	    				url: './review',
	    				data: {id:id, status:status,handletime:handletime},
	    				type: 'POST',
	    				success: function(msg){
	    					if (msg.code == 0) {
	    						alert("操作失败");
	    						return;
	    					}
	    					$('.buttonBox').hide();
	                		$('.detailTable').show();
	                		$('#passModal').hide();
	                		$('.wrapperModal').hide();
	                		$('.finishBox').find('img').attr('src','../images/display_yitongguo.png');
	                		location.href = server + '/dianxin/alertPublish/reviewList';
	    				}
	    			});
				}
        	});
        	
        	
        	var img = '${problem.imgs}';
        	var imgs = img.split(",");
        	var pichtml = '';
        	for (var i=0; i<imgs.length ; i++) {
        		if (imgs[i].length > 0) {
        			pichtml += '<div class="image"><img style="width:100px; height:100px;" src="'+imgs[i]+'"></div>';
        		}
        	}
        	$('.imagesBox54').html(pichtml);
        	console.log('${problem.audio }');
        });
        
        function getstation(){
        	var id = $('#area').val();
        	var Url = server + '/dianxin/alertPublish/getDept2';
        	$.ajax({
        		url: Url,
        		data: {id:id},
        		type: 'POST',
        		success: function(msg){
        			var html='<option value="">请选择</option>';
        			var date = eval('('+msg+')');
        			for (var i=0; i < date.list.length ; i++){
        				html+='<option value="'+date.list[i].deptid+'">'+date.list[i].deptname+'</option>';
        			}
        			$('#station').html(html);
        		}
        	})
        }

        function getperson(){
        	var id = $('#station').val();
        	var Url = server + '/dianxin/alertPublish/getUser';
        	$.ajax({
        		url: Url,
        		data: {deptid:id},
        		type: 'POST',
        		success: function(msg){
        			var html='<option value="">请选择</option>';
        			var date = eval('('+msg+')');
        			for (var i=0; i < date.user_list.length ; i++){
        				html+='<option value="'+date.user_list[i].id+'">'+date.user_list[i].username+'</option>';
        			}
        			$('#person').html(html);
        		}
        	});
        }
    </script>
</body>
</html>