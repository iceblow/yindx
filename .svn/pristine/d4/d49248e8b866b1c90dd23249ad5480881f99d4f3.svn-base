<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
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
                	系统设置
                	<font class="black">修改密码</font>
                	<img src="../images/icon_position_arrow.png" class="pa">                	
                </div>
            </div>           
        </div>	
        <div class="lineBox lineBox50_0">  
            <div class="box">
                <div class="ilabelName labelName123">旧密码 </div>
                <input type="text" class="textInput136 redfont" id="oldpwd">
<!--                 <span class="redfont">*当前密码不正确</span> -->
            </div>  
        </div>
        <div class="lineBox lineBox15_0">  
            <div class="box">
                <div class="ilabelName labelName123">新密码 </div>
                <input type="text" class="textInput136" id="newpwd">
<!--                 <span class="redfont">*当前密码不正确</span> -->
            </div>  
        </div>
        <div class="lineBox lineBox15_54"> 
            <div class="box">
                <div class="ilabelName labelName123">再次输入</div>
                <input type="text" class="textInput136" id="repwd">
<!--                 <span class="redfont">*当前密码不正确</span> -->
            </div> 
        </div>
        
        <div class="lineBox lineBox45_90">
        	<div class="password_button">确定</div>        	
        </div>
	</div>
    <div class="wrapperModal" style="display:none;"></div>
    <jsp:include page="../common/common.jsp" />
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/foundation-datepicker.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){   
        	$('#systemSetuppassword').addClass('active');
        	open(); 
        	
        	
        	$('.password_button').on('click',function(){
        		if ('${sessionScope.SESSION_LOGINID}' != null && '${sessionScope.SESSION_LOGINID}' != '') {
        			var user_id = '${sessionScope.SESSION_LOGINID}';
        		} else {
        			user_id = 0;
        		}
        		var oldpwd = $('#oldpwd').val();
        		var newpwd = $('#newpwd').val();
        		var repwd = $('#repwd').val();
        		if (newpwd != repwd) {
        			alert("新密码不一致！");
        			return;
        		}
        		$.ajax({
        			url: "/dianxin/api/user/updatePassword",
        			data: {
        				user_id: user_id,
        				password_old: oldpwd,
        				password_new: newpwd
        			},
        			type: 'POST',
        			success: function(msg){
        				var data = eval('('+msg+')');
        				console.log(data);
        				if (data.code == "1") {
        					alert("修改成功");
        				} else {
        					alert(data.message);
        				}
        				window.location.reload();
        			}
        		})
        	})
        });
    </script>
</body>
</html>