<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门</title>
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
                	<font class="black">用户编辑</font>
                	<img src="../images/icon_position_arrow.png" class="pa">                	
                </div>
            </div>
            <div class="titleBox titleBox41-48">修改基本信息</div>
            <!-- 输入框 -->
            <div class="lineBox lineBox0_14b">
	            <div class="leadInput">            	
	                <div class="lineNomal">                    
	                    <div class="box">
	                        <div class="labelName ">用户名称</div>
	                        <input type="text" class="textInput"  name="username" value="${user.username}">
	                    </div> 
	                    <div class="box">
	                        <div class="labelName ">登录账号</div>
	                        <input type="text" class="textInput"  name="loginid"  value="${user.loginid}" >
	                    </div> 
	                    <div class="box">
                            <div class="labelName ">手机</div>
                            <input type="text" class="textInput"  name="mobile"  value="${user.mobile}">
                        </div>
                        <div class="box">
                            <div class="labelName ">邮箱</div>
                            <input type="text" class="textInput"  name="email" value="${user.email}" >
                        </div>
	                    <div class="box">
	                        <div class="labelName labelName100">角色</div>
	                        <input type="text" class="selectInput" name="rolename" readonly="readonly" value="${user.rolename}">
	                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-100" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
	                    </div>
	                     <div class="box">
                            <div class="labelName  ">查看组</div>
                            <input type="text" class="textInput" value="${u.viewgroupname} ">
                        </div>
	                     <div class="box">
                            <div class="labelName  ">部门</div>
                            <input type="text" name="deptname" class="textInput"  value="${user.deptname}">
                        </div>
                         <div class="box">
                            <div class="labelName  ">职务</div>
                            <input type="text" name="titlename" class="textInput" value="${user.titlename}">
                        </div>
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
        		location.href = server + '/dianxin/user/userList';
        	});
        	
        	$('.ipublish').click(function() {
        		location.href = server + '/dianxin/user/doUpdate';
        	});
        	
        	$('.title').click(function() {
        		$('.title').removeClass('active');
        		$(this).addClass('active');
        	});
        });
    </script>
</body>
</html>