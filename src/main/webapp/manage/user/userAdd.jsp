<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户新增</title>
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
                	用户管理
                	<font class="black">用户新增</font>
                	<img src="../images/icon_position_arrow.png" class="pa">                	
                </div>
            </div>
            <div class="titleBox titleBox41-48">基本信息</div>
            <!-- 输入框 -->
            <div class="lineBox lineBox0_14b">
	            <div class="leadInput">            	
	                <div class="lineNomal">                    
	                    <div class="box">
	                        <div class="labelName">姓名</div>
	                        <input type="text" class="textInput">
	                    </div> 
	                    <div class="box">
	                        <div class="labelName labelName86">工号</div>
	                        <input type="text" class="textInput">
	                    </div> 
	                    <div class="box">
	                        <div class="labelName labelName100">状态</div>
	                        <input type="text" class="selectInput" readonly="readonly">
	                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-100" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="lineNomal">                    
	                    <div class="box">
	                        <div class="labelName">所属单位</div>
	                        <input type="text" class="textInput">
	                    </div> 
	                    <div class="box">
	                        <div class="labelName labelName86">职务</div>
	                        <input type="text" class="selectInput" readonly="readonly">
	                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-86" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
	                    </div> 
	                    <div class="box">
	                        <div class="labelName labelName100">部门</div>
	                        <input type="text" class="selectInput" readonly="readonly">
	                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-100" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="lineNomal">                   
	                    <div class="box">
	                        <div class="labelName">大区</div>
	                        <input type="text" class="selectInput" readonly="readonly">
	                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-81" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
	                    </div>
	                    <div class="box">
	                        <div class="labelName labelName86">小区</div>
	                        <input type="text" class="selectInput" readonly="readonly">
	                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-86" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
	                    </div>                    
	                    <div class="box">
	                        <div class="labelName labelName100">账号</div>
	                        <input type="text" class="textInput">
	                    </div> 
	                </div>
	            </div>   	
            </div>   
            <div class="titleBox titleBox42-36">权限设置</div>  
       </div>
       <div class="tableBox">
       		<div class="table">
       			<div class="thead">
       				<div class="title active">地区</div>
       				<div class="title">告警处理</div>
       				<div class="title">告警发布</div>
       				<div class="title">公告管理</div>
       				<div class="title">用户管理</div>
       				<div class="title">设备管理</div>
       				<div class="title">查询统计</div>
       				<div class="title">系统设置</div>
       			</div>
       			<div class="tbody">
       				<div class="item">
	        			<img src="../images/selected.png" alt="" class="triangle">西湖区
		        		<ul class="itemul">
		        			<li><img src="../images/noselect.png" alt="" class="select">文一路</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">文一西路</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">文二路</li>
		        		</ul>
		        	</div>
		        	<div class="item">
	        			<img src="../images/noselect.png" alt="" class="triangle">拱墅区
		        		<ul class="itemul">
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        		</ul>
		        	</div>
		        	<div class="item">
	        			<img src="../images/noselect.png" alt="" class="triangle">上城区
		        		<ul class="itemul">
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        		</ul>
		        	</div>
		        	<div class="item">
	        			<img src="../images/noselect.png" alt="" class="triangle">下城区
		        		<ul class="itemul">
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        		</ul>
		        	</div>
		        	<div class="item">
	        			<img src="../images/noselect.png" alt="" class="triangle">滨江区
		        		<ul class="itemul">
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        		</ul>
		        	</div>
		        	<div class="item">
	        			<img src="../images/noselect.png" alt="" class="triangle">余杭区
		        		<ul class="itemul">
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        			<li><img src="../images/noselect.png" alt="" class="select">小分类一</li>
		        		</ul>
		        	</div>
       			</div>       			
       		</div>
       </div>     
       <!-- 两个按钮 -->
	   	<div class="lineBox lineBox59_68">
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
        	$('#userU').addClass('active');
        	open();        
        	
        	$('.itemul li').off("click");
        	$('.itemul').on('click','li',function() {  
      			if($(this).find('img').attr('src') == '../images/noselect.png'){
      				$(this).find('img').attr('src','../images/selected.png');
      			} else {
      				$(this).find('img').attr('src','../images/noselect.png');
      			}        		
        	});
        	
        	$('.tbody').on('click','.triangle',function() {  
      			if($(this).attr('src') == '../images/noselect.png'){
      				$(this).attr('src','../images/selected.png');
      			} else {
      				$(this).attr('src','../images/noselect.png');
      			}        		
        	});
        	
        	$('.iconcel').click(function() {
        		location.href = server + '/dianxin/user/userList.jsp';
        	});
        	
        	$('.ipublish').click(function() {
        		location.href = server + '/dianxin/user/userList.jsp';
        	});
        	
        	$('.title').click(function() {
        		$('.title').removeClass('active');
        		$(this).addClass('active');
        	});
        });
    </script>
</body>
</html>