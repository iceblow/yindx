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
<title>修改公告</title>
<link href="../css/foundation-datepicker.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css/right.css">
<style>
	.right .height351{
		height:351px;
	}
	.right .widthbai100{
		width:100%;
	}
	.right .padding89_60{
		padding-left:89px;
		padding-right:60px;
	}
	.right .borderbottomNone{
		border-bottom:none;
	}
</style>
</head>
<body data-id = "${n.notice_id }">
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
                	<font class="black">修改公告</font>               	
                </div>
            </div>           
        </div>	
         <form id="equipmentForm">
        <div class="lineBox lineBox45_22">
        	<div class="lineLabel">名称</div>
        	<input type="text" class="ltextInput" id="add_title" value="${n.title }">
        	<div class="box">
                <div class="labelName70 ln">类别</div>
                <input type="text" class="selectInput" readonly="readonly" unselectable="on" id="add_type" <c:if test="${n.type==1 }">value="通知"</c:if> <c:if test="${n.type==2 }">value="重要"</c:if>>
                <img src="../images/arrowdown.png" alt="" class="arrowdown">
                <!-- 列表 -->
                <ul class="dropcontent" style="display:none;">
                     <li data-id ="1">通知</li>
                    <li data-id= "2">重要</li>
                </ul>
            </div>          	
        </div>
        <div class="lineBox lineBox0_22">
        	<div class="lineLabel">描述</div>
        	<textarea class="bigtext  height351" contenteditable="true" id="add_content" >${n.content }</textarea>
        </div>
        <div class="lineBox lineBox0_24">
        	<div class="lineLabel">图片</div>
        	<div class="addPic"><c:if test="${not empty  n.picurl}">修改文件</c:if><c:if test="${empty  n.picurl}">添加文件</c:if><input type="file" class="fileInput file" value="" id="file" name="file" multiple></div>
        	<input type="hidden" value="${n.picurl}" name="imgs" id="pic_file" value="${n.picurl }">
        </div>
        <div class="lineBox lineBox0_24b " id="showpic">
        	<!-- <div class="imgBox">
        		<img src="../images/delete_black.png" class="deleteBtn">
        		<img src="../images/pic.png" class="backimg">        		
        	</div> -->
        	<c:if test="${not empty  n.picurl}">
	        		<div class="imgBox">
        		<img src="../images/delete_black.png" class="deleteBtn">
        		<img src="${n.picurl }" class="backimg">  
        		</div> 
	        	</c:if>
        </div>
        <div class="lineBox picwarm">请填入宽度与高度为2比1的图片，否则手机页面样式会坏掉</div>
        <div class="lineBox lineBox56_90 borderbottomNone">
        	<div class="iconcel">取消</div>
        	<div class="ipublish">修改</div>
        </div>
        </form>
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
    
//     	$(document).on('change','.fileInput',function(e){
//     		handleFileSelect(e);
//     	});
	$(function(){
		$('.fileInput').change(function(e) {
			$('#showpic').empty();
    		handleFileSelect(e);
    	});
    	
	});
        $(document).ready(function(){   
        	$('#noticeSet').addClass('active');
        	open();        
        
        	$('.location').click(function() {
        		$('.locationText').show();
        	});
        	
        	$('.lineBox').on('mouseenter','.imgBox',function() {
        		$(this).find('.deleteBtn').show();
        	});
        	
        	$('.lineBox').on('mouseleave','.imgBox',function() {
        		$(this).find('.deleteBtn').hide();
        	});
        	
        	$('.lineBox').on('click','.deleteBtn',function() {
        		$(this).parent().remove();
        		$('#pic_file').val('');
        	});
        	
//         	$('.fileInput').change(function(e) {
//         		handleFileSelect(e);
//         	});
        	
        	$('.fileInputF').change(function(e) {
        		$('.fileBox').show();
        		progressBar();
        	});
        	
        	$('.lineBox').on('click','.rateDel',function() {
        		clearInterval(bar); 
        		$('.fileBox').hide();
        	});
        	
        	$('.iconcel').click(function() {
        		history.go(-1);
        	});
        	
        	$('.ipublish').click(function() {
        		var title = $('#add_title').val();
        		var type = $('#add_type').val();
        		editor.sync();
        		//var newcontent = $('#add_content').val();
        		var content = $('#add_content').val();
        		if(title==""||title=="请输入"||title=="请选择"){
        			alert('请输入名称');
        			return;
        		}
        		if(type==""||type=="请输入"||type=="请选择"){
        			alert('请选择类型');
        			return;
        		}
        		if(content==""||content=="请输入"||content=="请选择"){
        			alert('描述不能为空');
        			return;
        		} 
        		var typeid = null;
        		if(type=='通知'){
        			typeid = 1;
        		}else{
        			typeid = 2;
        		}
        		//var img = $('#pic_file').val();
        		var imgurl = $('#pic_file').val();
        		if(imgurl=="请输入"||imgurl=="请选择"){
        			imgurl="";
        		}
        		var params = {};
        		var id = $('body').attr('data-id');
        		params.title = title;
        		params.type = typeid;
        		params.content = content;
        		params.imgurl = imgurl;
        		params.id = id;
        		
        		$.ajax({
        			url:'./domodifi',
        			data:params,
        			dataType:'json',
        			success:function(msg){
        				if(msg.code==0){
        					alert(msg.message);
        				}else{
        					alert("修改成功!");
        					window.location.href="./lookList";
        				}
        			}
        		})
        	});
        	
        	
        	
        	
        	function progressBar(){
        		//初始化js进度条 
        		$(".rate").css("width","0px"); 
        		//进度条的速度，越小越快
        		var speed = 20; 
        		var per = 0;
        		bar = setInterval(function(){ 
        			nowWidth = parseInt($(".rate").width()); 
        			//宽度要不能大于进度条的总宽度
        			if(nowWidth<=126){ 
        				barWidth = (nowWidth + 1)+"px"; 
        				$(".rate").css("width",barWidth); 
        				per = parseInt((nowWidth + 1)/126*100);
        				$('.rateCount').text(per + '%');
        			} else{ 
        				//进度条读满后，停止 
        				clearInterval(bar); 
        				$('.rateBox').hide();
        				$('.rateCount').text('上传成功！');
        			} 
        		},speed);
        	} 
        	
        	$('.leftNav ul .active').parent().prev().find('.fanhui').css('margin-top','22px');
//         	//图片压缩
// 			function handleFileSelect (evt) {
// 				var files = evt.target.files;
// 				var currLength = $(evt.target).parents('.lineBox').next().find('.imgBox').length;
// 				if(currLength > 5){
// 					alert("最多上传5张图片！");
// 				} else if((files.length + currLength)>5 ){
// 					alert("最多上传5张图片！");
// 				} else {
// 					for (var i = 0, f; f = files[i]; i++) {
// 					      if (!f.type.match('image.*')) {
// 					        continue;
// 					      }				 
// 					      var reader = new FileReader();				 		
// 					      reader.onload = (function(theFile) {
// 					        return function(e) {
// 					          var b = document.createElement("div");
// 					          $(b).addClass('imgBox');					     
// 					          var d = document.createElement("img");
// 					          $(d).addClass('deleteBtn');
// 					          d.src = '../images/delete_black.png';
// 					          var i = document.createElement("img");
// 					          $(i).addClass('backimg');
// 					          $(b).append(d);
// 					          $(b).append(i);
// 					          $(evt.target).parents('.lineBox').next().append(b);
// 					          i.src = event.target.result;
// 					          i.onload=function(){
// 					        	  imgupload("file");
// 					          }					          
// 					        };
// 					      })(f);			 
// 					      reader.readAsDataURL(f);
// 					 }				
// 				}				
// 			}	
        });
        
        
        function imgupload(fileid){
    		// 	alert(template_id);
    			$.ajaxFileUpload({
    			url : '../manage/imgupload',//用于文件上传的服务器端请求地址
    			secureuri : false,          //一般设置为false
    			fileElementId : fileid,     //文件上传空间的id属性  <input type="file" id="file" name="file" />
    			dataType : 'json',          //返回值类型 一般设置为json
    			success : function(data) {
    				console.log(data);
    				if(data.code=="1"){
    					$("#pic_file").val(data.fileUrl);
    				}
    			},
    			});
    		}
      //图片压缩
		function handleFileSelect (evt) {
			var files = evt.target.files;
			var currLength = $(evt.target).parents('.lineBox').next().find('.imgBox').length;
			if(currLength > 5){
				alert("最多上传5张图片！");
			} else if((files.length + currLength)>5 ){
				alert("最多上传5张图片！");
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
      
      
		$(function(){
		    kedit('#add_content');
		})
		
		var editor;
		function kedit(kedit){
			//添加
			editor = KindEditor.create(kedit, {
				pasteType : 2,
				//设置可否改变编辑器大小
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : true,
				filterMode : true,
				uploadJson : '../manage/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '../manage/kindeditor/jsp/file_manager_json.jsp',
				//			width: "696px", 
				height : "270px",
				urlType : "domain"
					
			});
		}
		
    </script>
</body>
</html>