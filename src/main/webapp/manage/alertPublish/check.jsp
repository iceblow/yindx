<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>隐患发布</title>
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
                	告警处理发布
                	<font class="black">检查发布</font>
                	<img src="../images/icon_position_arrow.png" class="pa">                	
                </div>
            </div>           
        </div>
        <form action="">
        <div class="lineBox lineBox0_56">
        <c:forEach items="${checkList }" var="p" varStatus="status">
                <div class="treeBox treeBoxFirst" date-idt="${status.index+1}">
	        	<div class="addBtn"></div>        	  
	        	<div class="treeTitle">${p.name } <img src="../images/button_delete.png" style="margin-left:30px;margin-right:26px;float:right;margin-top:13px;"  onclick="delCheck(${p.check_id})"></div>
	        	<div class="title" style="display: none;">${p.check_id }</div>
	        	<ul class="ul_0" style="padding-bottom:40px;"> 
	        	 <c:forEach items="${p.items }" var="c" varStatus="sta">       		
		       		<li date-idi="${sta.index+1}">
		       			<div class="level_one">
		       				<div class="number">${sta.index+1}</div>
		       				<input type="hidden" name="list" value="${c.check_id }">
		       				<div class="name" style="width:auto;">${c.name }</div>
		       				<img src="../images/button_delete.png" style="margin-left:30px;margin-right:26px;float:right;margin-top:6px;"  onclick="delCheck(${c.check_id})">	
		       				<img src="../images/icon_editor.png" style="float:right;" class="opration">   			       				
		       			</div>
		       		</li>
		       		</c:forEach>
		       	</ul>
	        </div>      
          </c:forEach>
<!-- 	        <div class="treeBox" date-idt="2"> -->
<!-- 	        	<div class="addBtn"></div>        	   -->
<!-- 	        	<div class="treeTitle">火警</div> -->
<!-- 	        	<ul>        		 -->
<!-- 		       		<li date-idi="1"> -->
<!-- 		       			<div class="level_one"> -->
<!-- 		       				<div class="number">01</div> -->
<!-- 		       				<div class="name">外观</div> -->
<!-- 		       				<img src="../images/icon_editor.png" class="opration">      					       				 -->
<!-- 		       			</div> -->
<!-- 		       		</li> -->
<!-- 		       		<li date-idi="2"> -->
<!-- 		       			<div class="level_one"> -->
<!-- 		       				<div class="number">02</div> -->
<!-- 		       				<div class="name">周边</div> -->
<!-- 		       				<img src="../images/icon_editor.png" class="opration">      					       				 -->
<!-- 		       			</div> -->
<!-- 		       		</li> -->
<!-- 		       		<li date-idi="3"> -->
<!-- 		       			<div class="level_one"> -->
<!-- 		       				<div class="number">03</div> -->
<!-- 		       				<div class="name">电源</div> -->
<!-- 		       				<img src="../images/icon_editor.png" class="opration">      					       				 -->
<!-- 		       			</div> -->
<!-- 		       		</li> -->
<!-- 		       	</ul> -->
<!-- 	        </div>    -->
			<div class="treeBox" date-idt="">
	        	<div class="addBtn"></div>
	        	<div class="treeTitle"><img src="../images/icon_add14X14.png" class="addT"> 添加检查项目</div>
	        	<div class="title" style="display: none;"></div> 
	        	<ul class="ul_0" id="add">        		
<!-- 		       		<li date-idi="1"> -->
<!-- 		       			<div class="level_one"> -->
<!-- 		       				<div class="number">01</div> -->
<!-- 		       				<div class="name">外观</div> -->
<!-- 		       				<img src="../images/icon_editor.png" class="opration">      					       				 -->
<!-- 		       			</div> -->
<!-- 		       		</li> -->
		       	</ul>
	        </div>
	        <!-- <div class="saveBtn" style="margin-left:26px;width:80px">保存</div>  --> 
        </div>
        </form>
           
         <!-- <div class="saveBtn">保存</div> -->  
        <!-- 编辑模态层 -->
		<div class="modal tipModal" id="updateModal" date-idu="" date-idi="">
			<div class="titleWrapper">
				<div class="title">编辑</div>
				<img src="../images/button_delete.png">
			</div>
			<div class="contentWrapper">
				<div class="tipInner">
					<div class="row">
						<div class="labelName">01</div>
						<input type="text"  class="textInput" value="">
					</div>
					<div class="redTip">请输输入名称</div>
				</div>
			</div>
			<div class="bottomWrapper">
				<div class="confirm">确定</div>
				<div class="cancel">取消</div>
			</div>
		</div>
		<!-- 新增模态层 -->
		<div class="modal tipModal" id="addModal" date-ida="">
			<div class="titleWrapper">
				<div class="title">新增</div>
				<img src="../images/button_delete.png">
			</div>
			<div class="contentWrapper">
				<div class="tipInner">
					<div class="row">
						<div class="labelName">01</div>
						<input type="text"  class="textInput" value="请输入">
					</div>
					<div class="redTip">请输输入名称</div>
				</div>
			</div>
			<div class="bottomWrapper">
				<div class="confirm">确定</div>
				<div class="cancel">取消</div>
			</div>
		</div>
		<!-- 新增项目模态层 -->
		<div class="modal tipModal" id="addModalP" date-idap="">
			<div class="titleWrapper">
				<div class="title">新增</div>
				<img src="../images/button_delete.png">
			</div>
			<div class="contentWrapper">
				<div class="tipInner">
					<div class="row">
						<div class="labelName">项目名</div>
						<input type="text"  class="textInput" value="请输入">
					</div>
					<div class="redTip">请输输入名称</div>
				</div>
			</div>
			<div class="bottomWrapper">
				<div class="confirm">确定</div>
				<div class="cancel">取消</div>
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
        	$('#alertPublishCheck').addClass('active');
        	open();        
        	
        	//添加按钮
        	$('.right').on('click','.addBtn',function() {
        		position('addModal');
        		$('#addModal').find('.labelName').text('0' + ($(this).nextAll('ul').find('li').length + 1));
        		$('#addModal').find('.textInput').val('请输入');
        		$('#addModal').find('.textInput').css('color','rgb(153, 153, 153)');
        		$('#addModal').attr('date-ida',$(this).parents('.treeBox').attr('date-idt'));
        		$('#addModal').show();
        		$('.wrapperModal').show();
        	});
        	
        	//编辑按钮
			$('.right').on('click','.opration',function() {
				$('#updateModal').attr('date-idu',$(this).parents('.treeBox').attr('date-idt'));
				$('#updateModal').attr('date-idi',$(this).parents('li').attr('date-idi'));
				$('#updateModal').find('.labelName').text($(this).parent().find('.number').text());
				position('updateModal');
        		$('#updateModal').show();
        		$('.wrapperModal').show();
        	});
			
        	//添加项目按钮
			$('.right').on('click','.addT',function() {
				$(this).parents('.treeBox').attr('date-idt',$('.treeBox').length);
				$('#addModalP').attr('date-idp',$(this).parents('.treeBox').attr('date-idt'));
				position('addModalP');
        		$('#addModalP').find('.textInput').val('请输入');
        		$('#addModalP').find('.textInput').css('color','rgb(153, 153, 153)');
        		$('#addModalP').show();
        		$('.wrapperModal').show();
        	});
			
        	//编辑模太层确认
			$('#updateModal .confirm').click(function() {   
        		if($('#updateModal .textInput').val() != '' && $('#updateModal .textInput').val() != '请输入'){
            		$('#updateModal').hide();
            		$('.wrapperModal').hide();
            		$('#updateModal .redTip').hide();
            		var id = $(this).parents('#updateModal').attr('date-idu');   
            		var idi = $(this).parents('#updateModal').attr('date-idi');
            		$('.treeBox').each(function(index,el) {
            			if($(el).attr('date-idt') == id){
            				$(el).find('li').each(function(index,elm) {
            					if($(elm).find('.number').text() == idi){
            						$.ajax({
                    	        		url: server +'/dianxin/alertPublish/addCheck',
                    	        		data: {title:$('#updateModal .textInput').val(),id:$(elm).find('input[name="list"]').val(),type:1},
                    	        		type: 'POST',
                    	        		async:false,
                    	        		success: function(msg){
                    	        			msg = eval('('+msg+')');
                    	        			if(msg.code == 0){
                    	        				$('#addModal').hide(); 
                    	        				$(elm).find('.name').text($('#updateModal .textInput').val());
                    	        				return;
                    	        			}else{
                    	        				alert('修改失败');
                    	        				return;
                    	        			}
                    	        		}
                    	        	});
            					}
            				});
            			}            			
            		}); 
        		} else {
        			$('#updateModal .redTip').show();
        		}     		
        	});
        	
        	//新增模太层确认
			$('#addModal .confirm').click(function() {
				var id = 0;
        		if($('#addModal .textInput').val() != '' && $('#addModal .textInput').val() != '请输入'){
            		$('.wrapperModal').hide();
            		$('#addModal .redTip').hide();
            		var id = $(this).parents('#addModal').attr('date-ida');
            		$('.treeBox').each(function(index,el) {
            			
            			
            			
            			if($(el).attr('date-idt') == id){
            				$.ajax({
            	        		url: server +'/dianxin/alertPublish/addCheck',
            	        		data: {title:$('#addModal .textInput').val(),id:$(el).find('.title').text(),type:0},
            	        		type: 'POST',
            	        		success: function(msg){
            	        			msg = eval('('+msg+')');
            	        			if(msg.code == 0){
            	        				id = msg.checkid;
            	        				$('#addModal').hide(); 
            	        				var num = ($(el).find('ul').find('li').length + 1);
                                		var html = '';
                                		html += '<li date-idi="1">';
                                		html += '	<div class="level_one">';
                                		html += '		<div class="number">'+num+'</div>';
                                		html += '		<input name="list_hidden" type="hidden" value="'+id+'">';
                                		html += '		<div class="name" name="list">'+$('#addModal .textInput').val()+'</div>';
                                		html += '		<img src="../images/button_delete.png" style="margin-left:30px;margin-right:26px;float:right;margin-top:6px;" onclick="delCheck('+id+')">';
                                		html += '		<img src="../images/icon_editor.png" style="float:right;" class="opration">   ';
                                		html += '	</div>';
                                		html += '</li>';
                                		
                        				$(el).find('ul').append(html);
                        				window.location.reload();
            	        			}else{
            	        				alert('新增失败');
            	        				return;
            	        			}
            	        		}
            	        	});
            			}
            		});            		
        		} else {
        			$('#addModal .redTip').show();
        		}     		
        	});
        	
			//新增模太层确认
			$('#addModalP .confirm').click(function() {   
        		if($('#addModalP .textInput').val() != '' && $('#addModalP .textInput').val() != '请输入'){
            		$('#addModalP .redTip').hide();
            		$('.wrapperModal').hide();
            		var id = $(this).parents('#addModalP').attr('date-idp');              		
            		$('.treeBox').each(function(index,el) {
            			if($(el).attr('date-idt') == id){
            				$(el).find('.treeTitle').text($('#addModalP .textInput').val());
            				$.ajax({
            	        		url: server +'/dianxin/alertPublish/addCheck',
            	        		data: {title:$('#addModalP .textInput').val(),type:0},
            	        		type: 'POST',
            	        		success: function(msg){
            	        			msg = eval('('+msg+')');
            	        			if(msg.code == 0){
            	        				$('#addModalP').hide(); 
            							$(el).find('.title').text($(msg.checkid));
            	        			}else{
            	        				alert('新增失败');
            	        				return;
            	        			}
            	        		}
            	        	});
            			}            			
            		});   
            		var html = '';
            		html += '<div class="treeBox" date-idt="">';
            		html += '	<div class="addBtn"></div> ';
            		html += '	<div class="treeTitle"><img src="../images/icon_add14X14.png" class="addT"> 添加检查项目</div>';
            		html += '	<div class="title" style="display: none;"></div>';
            		html += '	<ul class="ul_0">';
//             		html += '		<li date-idi="1">';
//             		html += '			<div class="level_one">';
//             		html += '				<div class="number">01</div>';
//             		html += '				<div class="name">外观</div>';
//             		html += '				<img src="../images/icon_editor.png" class="opration">';
//             		html += '			</div>';
//             		html += '		</li>';
            		html += '	</ul>';
            		html += '</div>';
            		$('.lineBox0_56').append(html);
            		$('.ul_0').css('display','block');
        		} else {
        			$('#addModalP .redTip').show();
        		}     		
        	});
			
			//保存按钮
			$('.saveBtn').click(function() {
        		window.location.reload();
        	});
			$('.ul_0').css('display','block');
        });
        
        function delCheck(id){
        	if(confirm("确定删除检查项目?")){
        		$.ajax({
        			url:'./delCheck',
					type:'post',
					data:{id:id},
					dataType:'json',
					success:function(msg){
						if(msg.code==0){
        					alert(msg.message);
        				}else{
        					alert("删除成功!");
        					window.location.reload();
        				}
					}
        		})
        	}
        }
    </script>
</body>
</html>