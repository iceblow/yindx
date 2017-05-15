<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模板设置</title>
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
                	<font class="gray">模板设置</font>
                	<img src="../images/icon_position_arrow.png" class="pa">   
                	<font class="black">编辑模板</font>           	
                </div>
            </div>           
        </div>	
        <div class="lineBox lineBox45_22">
        	<div class="lineLabel">名称</div>
        	<input type="text" class="ltextInput" value="模板名称">
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
        </div>
        <div class="lineBox lineBox0_34">
        	<div class="lineLabel">描述</div>
        	<div class="bigtext" contenteditable="true">模板描述</div>
        </div>
        <div class="lineBox lineBox23_0">
        	<div class="addDiv">
        		<img src="../images/icon_add14X14.png" class="addImg">添加巡检项目
        	</div>        	
        </div>
        <div class="lineBox lineBox32_30">
        	<div class="ztreeBox">
        		<div class="level_line_1"></div>
        		<div class="level_box_1" contenteditable="true">巡检项目名称</div>
        		<div class="ztreeImg"></div>
        		<div class="level_line_2"></div>
        		<div class="level_box_2" contenteditable="true">巡检二级项目名称</div>
        		<div class="level_line_2"></div>
        		<div class="level_box_2" contenteditable="true">巡检项目名称</div>
        	</div>
        </div>
        <!-- 两个按钮 -->
	   	<div class="lineBox lineBox63_90">
	   		<div class="btnBox">
	   			<div class="iconcel">取消</div>
	       		<div class="ipublish">确定</div>
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
        	$('#equipmentTemplateList').addClass('active');
        	open();  
        	
        	$('.leftLead').click(function() {
        		location.href = server + '/for/equipment/templateList.jsp';
        	});
        	
        	$('.leftNav ul .active').parent().prev().find('.fanhui').css('margin-top','22px');
        	
        	$('.location').click(function() {
        		$('.locationText').show();
        	});
        	
        	$('.itemul li').off("click");
        	$('.itemul').on('click','li',function() {  
      			if($(this).find('img').attr('src') == '../images/noselect.png'){
      				$(this).find('img').attr('src','../images/selected.png');
      			} else {
      				$(this).find('img').attr('src','../images/noselect.png');
      			}        		
        	});
        	
        	$('.iconcel').click(function() {
        		location.href = server + '/for/equipment/templateList.jsp';
        	});
        	
        	$('.ipublish').click(function() {
        		location.href = server + '/for/equipment/templateList.jsp';
        	});
        	
        	$('.right').on('focusin','.level_box_1',function() {
        		if($(this).text() == '请输入一级分类名') {
        			$(this).text('');
        			$(this).css('color','#666');
        		} 
        	});
        	
        	$('.right').on('focusout','.level_box_1',function() {
        		if($(this).text() == '请输入一级分类名' || $(this).text() == '') {
        			$(this).text('请输入一级分类名');
        			$(this).css('color','#aaa');
        		} else {
        			$(this).css('color','#666');
        		}
        	});
        	
        	$('.right').on('focusin','.level_box_2',function() {
        		if($(this).text() == '请输入二级分类名') {
        			$(this).text('');
        			$(this).css('color','#666');
        		} 
        	});
        	
        	$('.right').on('focusout','.level_box_2',function() {
        		if($(this).text() == '请输入二级分类名' || $(this).text() == '') {
        			$(this).text('请输入二级分类名');
        			$(this).css('color','#aaa');
        		} else {
        			$(this).css('color','#666');
        		}
        	});
        	
        	$('.right').on('click','.ztreeImg',function() {
        		var html = '<div class="level_line_2"></div>';
        		html += '<div class="level_box_2" contenteditable="true">请输入二级分类名</div>';
        		$(this).parent().append(html);
        	});
        	
        	$('.addDiv').click(function() {
        		var html = '<div class="ztreeBox">';
        		html += '	<div class="level_line_1"></div>';
        		html += '	<div class="level_box_1" contenteditable="true">请输入一级分类名</div>';
        		html += '	<div class="ztreeImg"></div>';
        		html += '	<div class="level_line_2"></div>';
        		html += '	<div class="level_box_2" contenteditable="true">请输入二级分类名</div>';
        		html += '	<div class="level_line_2"></div>';
        		html += '	<div class="level_box_2" contenteditable="true">请输入二级分类名</div>';
        		html += '	</div>';
        		$('.lineBox32_30').append(html);
        	});
        	
        	$('.level_box_1').focusout();
        	$('.level_box_2').focusout();
        });
    </script>
</body>
</html>