<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告详情</title>
<link href="../css/foundation-datepicker.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css/right.css">
</head>
<body data-id="${n.notice_id }">
	<!-- 右边主要内容 -->
    <div class="right">
        <!-- 头部 -->
        <div class="wrapperTop">
            <!-- 当前页面 -->
            <div class="leadTop">
                <div class="leftLead">
                	<img src="../images/icon_position.png">
                	<font class="gray">公告管理</font>
                	<img src="../images/icon_position_arrow.png" class="pa">   
                	<font class="black">公告详情</font>                 	
                </div>
            </div>            
        </div>
        <div class="contentTitle contentTitle28-19">
			<div class="contentTitleInner">${n.title }</div>	
<!-- 			<div class="finishBox"><img src="../images/display_yitongguo.png"></div> -->
			<div class="withdraw" <c:if test="${n.status==0 }">style="background: #18c5bf;"</c:if> data-status="${n.status }"><c:if test="${n.status==0 }">正常</c:if><c:if test="${n.status==1 }">下架</c:if></div>
			<div class="stick" <c:if test="${n.settop==0 }"> style="background: #cfcfcf;" </c:if> data-setop="${n.settop }" data-pic="${n.picurl }"><c:if test="${n.settop==0 }">未置顶</c:if><c:if test="${n.settop==1 }">已置顶</c:if></div>
			<div class="editNotice">编辑</div>
		</div>
		<div class="dtniBox">
			<font class="date"><fmt:formatDate value="${n.createdate }" pattern="yyyy-MM-dd"/></font>
			<font class="time"><fmt:formatDate value="${n.createdate }" pattern="HH:mm"/></font>
			<font class="name">${n.holdername }</font><c:if test="${n.type==1 }">通知</c:if><c:if test="${n.type==2 }">重要</c:if>
		</div>
		<div class="content content873" style="line-height:34px;">${n.content }</div>
		
		<div class="bottomContent">
			<div class="lineBox lineBox31_23">
	        	<c:if test="${not empty  n.picurl}"><div class="lineLabel labelName108">图片</div></c:if>
<!-- 	        	<div class="addPic">添加图片</div> -->
<!-- 	        	<input type="file" class="fileInput file"  id="file" name="file" style="display:none;" multiple> -->
<%-- 	        	<input type="hidden" value="${n.picurl }" name="imgs" id="pic_file"> --%>
	        </div>
	        <div class="lineBox lineBox0_90"  <c:if test="${empty  n.picurl}"> style="display:none;" </c:if>  id="showpic">
	        	<c:if test="${not empty  n.picurl}">
	        		<div class="imgBox">
        		<img src="../images/delete_black.png" class="deleteBtn">
        		<img src="${n.picurl }" class="backimg">  
        		</div> 
	        	</c:if>
        		<!-- <div class="imgBox">
        		<img src="../images/delete_black.png" class="deleteBtn">
        		<img src="../images/pic.png" class="backimg">        		
        	</div> -->
	       			       		
	        	
	        </div>
		</div>
		<!-- 不通过模态层 -->
		<div class="modal tipModal tipModal364" id="notPassModal">
			<div class="titleWrapper">
				<div class="title">提示</div>
				<img src="../images/button_delete.png">
			</div>
			<div class="contentWrapper contentWrappernob">
				<div class="tipInner tipInner22-44 tipInner30pl">
					<p>该公告未添加配图，无法置顶！</p>
					<p>请先添加配图。</p>
				</div>
			</div>
		</div>
		<!-- 通过模态层 -->
		<div class="modal saveModal" id="saveModal">
			<img src="../images/icon_success.png">
			<div class="message">操作成功</div>
			
		</div>
	</div>
    <div class="wrapperModal" style="display:none;"></div>
    <jsp:include page="../common/common.jsp" />
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
     <script  src="../manage/kindeditor/kindeditor-all.js" type="text/javascript"></script>
     <script  src="../manage/kindeditor/lang/zh-CN.js"></script>
    <script src="../js/foundation-datepicker.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
    
    	$(function(){
    		$('.editNotice').click(function(){
    			var id = $('body').attr('data-id');
    			location.href = '<%=basePath %>notice/modifi?id='+id;
    		});
    		$('.withdraw').click(function(){
    			var id = $('body').attr('data-id');
    			var data = $(this).attr('data-status');
    		
    			var status = 1;
    			if(data=='0'){
    				var flag = confirm('是否下架该公告');
    				if(!flag){
    					return;
    				}
    				status = 1;
    			}else{
    				var flag = confirm('是否发布该通知');
    				if(!flag){
    					return;
    				}
    				status = 0;
    			}
    			$.ajax({
    				url:'<%=basePath%>notice/changestatus',
    				type:'POST',
    				data:{"id":id,'status':status},
    				success:function(result){
    					if(result.code=="1"){
    						alert('操作成功');
    						history.go(0);
    					}else{
    						alert('操作失败');
    					}
    				}
    			})
    		});
    		
    		$('.addPic').click(function(){
    			var flag = confirm('是否修改公告图片');
        		if(!flag){
        			return;
        		}
        		$('.fileInput').click();
    		});
    		
    		$('.fileInput').change(function(e) {
    			var s = $('.lineBox0_90').css('display');
        		if(!$('.lineBox0_90').css('display') == 'none') {
        			
        		}
        		$('.lineBox0_90').show();
    			$('#showpic').empty();
        		handleFileSelect(e);
        	});
    				
    		$('.stick').click(function() {
    			var id = $('body').attr('data-id');
    			var obj = $(this);
    			console.log($(this).attr('data-pic'));
    			if($(this).attr('data-pic')==null ||$(this).attr('data-pic')==''){
    				return;
    			}
    			if($(this).attr('data-setop')=='0'){
    				var flag = confirm('是否置顶该通知');
    				if(!flag){
    					return;
    				}
           			position('saveModal');	
           			$.ajax({
           				url:'<%=basePath%>notice/settop',
           				type:'POST',
           				data:{"id":id},
           				success:function(result){
           					if(result.code=="1"){
           						alert('操作成功');
           						history.go(0);
           					}else{
           						alert('操作失败');
           					}
           				}
           			})              		     	
    			}else{
    				var flag = confirm('是否取消该置顶');
    				if(!flag){
    					return;
    				}
    				$.ajax({
        				url:'<%=basePath%>notice/deletetop',
        				type:'POST',
        				data:{"id":id},
        				success:function(result){
        					if(result.code=="1"){
        						alert('操作成功');
           						history.go(0);
        					}else{
        						alert('操作失败');
        					}
        				}
        			})
//             		$('#saveModal').show();
//             		$('.wrapperModal').show();
    			}
        			
        	});
    		
    		$('.message').click(function(){
    			$('#saveModal').hide();
    			$('.wrapperModal').hide();
    		});
    	});
        $(document).ready(function(){   
        	
        	$('#noticeLookList').addClass('active');
        	open();  
        	
        	$('.leftLead').click(function() {
        		location.href = '<%=basePath %>notice/lookList';
        	});
        	
        	$('.leftNav ul .active').parent().prev().find('.fanhui').css('margin-top','22px');
        	
        	
        	
//         	$('.lineBox').on('mouseenter','.imgBox',function() {
//         		$(this).find('.deleteBtn').show();
//         	});
        	
        	$('.lineBox').on('mouseleave','.imgBox',function() {
        		$(this).find('.deleteBtn').hide();
        	});
        	
        	$('.lineBox').on('click','.deleteBtn',function() {
        		$(this).parent().remove();
        	});
        	
        });
        
      //图片压缩
		function handleFileSelect (evt) {
			var files = evt.target.files;
			var currLength = $(evt.target).parents('.lineBox').next().find('.imgBox').length;
			if(currLength > 1){
				alert("最多上传1张图片！");
			} else if((files.length + currLength)>1 ){
				alert("最多上传1张图片！");
			} else {
				for (var i = 0, f; f = files[i]; i++) {
				      if (!f.type.match('image.*')) {
				        continue;
				      }				 
				      var reader = new FileReader();				 		
				      reader.onload = (function(theFile) {
				        return function(e) {
				          var b = document.createElement("div");
				          $(b).addClass('imgBox');					     
				          var d = document.createElement("img");
				          $(d).addClass('deleteBtn');
				          d.src = '../images/delete_black.png';
				          var i = document.createElement("img");
				          $(i).addClass('backimg');
				          $(b).append(d);
				          $(b).append(i);
				          $(evt.target).parents('.lineBox').next().append(b);
				          i.src = event.target.result;
				          i.onload=function(){
				        	  imgupload("file");
				          }					          
				        };
				      })(f);			 
				      reader.readAsDataURL(f);
				 }				
			}				
		}	
		function imgupload(fileid){
    		// 	alert(template_id);
    		var id = $('body').attr('data-id');
    			$.ajaxFileUpload({
    			url : '../manage/imgupload',//用于文件上传的服务器端请求地址
    			secureuri : false,          //一般设置为false
    			fileElementId : fileid,     //文件上传空间的id属性  <input type="file" id="file" name="file" />
    			dataType : 'json',          //返回值类型 一般设置为json
    			success : function(data) {
    				console.log(data);
    				if(data.code=="1"){
    					$("#pic_file").val(data.fileUrl);
    					var img = data.fileUrl;
    					if(!img){
    						alert('修改失败');
    						return;
    					}
    					editNoticePic(id,img);
    				}else{
    					alert('修改失败');
    				}
    			},
    			});
    		}
		

    	function editNoticePic(id,img){
    		var params ={};
    		params.id = id;
    		params.img = img
    		$.ajax({
    			url:'./editaddnoticeimg',
    			data:params,
    			dataType:'json',
    			success:function(msg){
    				if(msg.code==1){
    					alert("修改成功!");
    					history.go(0);
    				}else{
    					alert(msg.message);
    				}
    			}
    		})
    	}
    	
//     	$(function(){
// 		    kedit('#edit_notice');
// 		})
		
// 		var editor;
// 		function kedit(kedit){
// 			//添加
// 			editor = KindEditor.create(kedit, {
// 				pasteType : 2,
// 				//设置可否改变编辑器大小
// 				resizeType : 1,
// 				allowPreviewEmoticons : false,
// 				allowImageUpload : true,
// 				filterMode : true,
// 				uploadJson : '../manage/kindeditor/jsp/upload_json.jsp',
// 				fileManagerJson : '../manage/kindeditor/jsp/file_manager_json.jsp',
// 				//			width: "696px", 
// 				height : "270px",
// 				urlType : "domain",
// 					items : [ "fontname", "fontsize", "forecolor", "bold",
// 							"italic", "underline", "strikethrough" ]
// 			});
// 		}
    </script>
</body>
</html>