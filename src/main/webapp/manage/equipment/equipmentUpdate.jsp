<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                	<font class="gray">设备设置</font>
                	<img src="../images/icon_position_arrow.png" class="pa">   
                	<font class="black">编辑设备</font>               	
                </div>
            </div>           
        </div>	
        <div class="lineBox lineBox45_22">
        	<div class="lineLabel">名称</div>
        	<input type="text" class="ltextInput">
        	<div class="location">
        		<img src="../images/icon_map.png">地点
        	</div>
        	<div class="locationText">
        		<img src="../images/icon_map.png">杭州市拱墅区祥园路28号
        	</div>
        </div>
        <div class="lineBox lineBox0_22">
        	<div class="lineLabel">描述</div>
        	<div class="bigtext" contenteditable="true"></div>
        </div>
        <div class="lineBox lineBox0_33">
        	<div class="box">
                <div class="labelName89 ln">大区</div>
                <input type="text" class="selectInput" readonly="readonly" unselectable="on">
                <img src="../images/arrowdown.png" alt="" class="arrowdown">
                <!-- 列表 -->
                <ul class="dropcontent" style="display:none;">
                    <li>111</li>
                    <li>222</li>
                    <li>333</li>
                </ul>
            </div>  
            <div class="box">
                <div class="labelName65 ln">小区</div>
                <input type="text" class="selectInput" readonly="readonly" unselectable="on">
                <img src="../images/arrowdown.png" alt="" class="arrowdown">
                <!-- 列表 -->
                <ul class="dropcontent" style="display:none;">
                    <li>111</li>
                    <li>222</li>
                    <li>333</li>
                </ul>
            </div>  
            <div class="box">
                <div class="labelName80 ln">设备人</div>
                <input type="text" class="selectInput" readonly="readonly" unselectable="on">
                <img src="../images/arrowdown.png" alt="" class="arrowdown">
                <!-- 列表 -->
                <ul class="dropcontent" style="display:none;">
                    <li>111</li>
                    <li>222</li>
                    <li>333</li>
                </ul>
            </div> 
        </div>
        <div class="lineBox lineBox28_29n">
        	<div class="lineLabel">图片</div>
        	<div class="addPic">添加图片<input type="file" class="fileInput file" multiple></div>
        </div>
        <div class="lineBox lineBox0_24b">
        	<!-- <div class="imgBox">
        		<img src="../images/delete_black.png" class="deleteBtn">
        		<img src="../images/pic.png" class="backimg">        		
        	</div> -->
        </div>
        
        <div class="lineBox lineBox56_90">
        	<div class="iconcel">取消</div>
        	<div class="ipublish">发布</div>
        </div>
	</div>
    <div class="wrapperModal" style="display:none;"></div>
    <jsp:include page="../common/common.jsp" />
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/foundation-datepicker.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){   
        	$('#equipmentEquipment').addClass('active');
        	open();  
        	
        	$('.leftNav ul .active').parent().prev().find('.fanhui').css('margin-top','22px');
        
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
        	});
        	
        	$('.fileInput').change(function(e) {
        		handleFileSelect(e);
        	});
        	
        	$('.iconcel').click(function() {
        		location.href = server + '/for/equipment/equipment.jsp';
        	});
        	
        	$('.ipublish').click(function() {
        		location.href = server + '/for/equipment/equipment.jsp';
        	});
        	
        	$('.leftLead').click(function() {
        		location.href = server + '/for/equipment/equipment.jsp';
        	});
        	
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
					        	 
					          }					          
					        };
					      })(f);			 
					      reader.readAsDataURL(f);
					 }				
				}				
			}	
        });
    </script>
</body>
</html>