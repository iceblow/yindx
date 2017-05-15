<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>告警计时</title>
<link href="../css/foundation-datepicker.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../css/right.css">
    <link rel="stylesheet" type="text/css" href="../css/systemSetup.css">
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/time.css">
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
                    <font class="black">告警计时</font>
                    <img src="../images/icon_position_arrow.png" class="pa">                    
                </div>
            </div>           
        </div>
    	<!-- 第一个框 -->
    	<form action="/dianxin/systemSetup/updateTime" id="Form" method="post">
        <div class="box_100">
            <div class="box_248 marginLeftbai16">
                    <h1 class="headline">实时告警</h1>
                    <div class="box">  
                        <div class="henghang marginTop15">
                            <div class="ilabelName">第一负责人 </div>
                            <input type="text" class="textInput136" name = "owner1" value="<c:if test="${not empty OWNER1 }">${OWNER1}</c:if>"
                            onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">
                            <span class="lineHeight">分钟</span>
                        </div>
                         <div class="henghang marginTop15">
                            <div class="ilabelName">第一负责人 </div>
                            <input type="text" class="textInput136" name = "owner2" value="<c:if test="${not empty OWNER2 }">${OWNER2}</c:if>"
                            onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">分钟</span>
                        </div>
                         <div class="henghang marginTop15 marginBottom37">
                            <div class="ilabelName">第一负责人 </div>
                            <input type="text" class="textInput136" name = "owner3" value="<c:if test="${not empty OWNER3 }">${OWNER3}</c:if>"
                            onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">分钟</span>
                        </div>
                    </div>
                    <div class="clearfix"></div>
            </div>  
       </div>
		<!-- 第二个框 -->
<!--         <div class="box_50"> -->
<!--             <div class="box_248 marginTop21 marginLeftbai12"> -->
<!--                     <h1 class="headline">预警处理</h1> -->
<!--                     <div class="box">   -->
<!--                         <div class="henghang marginTop15"> -->
<!--                             <div class="ilabelName">第一负责人 </div> -->
<!--                             <input type="text" class="textInput136"><span class="lineHeight">分钟</span> -->
<!--                         </div> -->
<!--                          <div class="henghang marginTop15"> -->
<!--                             <div class="ilabelName">第一负责人 </div> -->
<!--                             <input type="text" class="textInput136"><span class="lineHeight">分钟</span> -->
<!--                         </div> -->
<!--                          <div class="henghang marginTop15 marginBottom37"> -->
<!--                             <div class="ilabelName">第一负责人 </div> -->
<!--                             <input type="text" class="textInput136"><span class="lineHeight">分钟</span> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="clearfix"></div> -->
<!--             </div>   -->
<!--        </div> -->
		<!-- 第三个框 -->
       <div class="box_50" style="height: 229px;">
            <div class="box_248 marginLeftbai32">
                    <h1 class="headline">巡检处理</h1>
                    <div class="box">  
                        <div class="henghang marginTop15">
                            <div class="ilabelName width60">接单 </div>
                            <input type="text" class="textInput136" name="route_time" value="<c:if test="${not empty ROUTE_TIME }">${ROUTE_TIME}</c:if>"
                            onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">分钟</span>
                        </div>
<!--                          <div class="henghang marginTop15 marginBottom37"> -->
<!--                             <div class="ilabelName width60">处理</div> -->
<%--                             <input type="text" class="textInput136" name="route_solve" value="<c:if test="${not empty ROUTE_SOLVE }">${ROUTE_SOLVE}</c:if>" --%>
<!--                             onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">分钟</span> -->
<!--                         </div> -->
                    </div>
                    <div class="clearfix"></div>
            </div>  
       </div>
		<!-- 第四个框 -->
        <div class="box_50">
            <div class="box_248 marginLeftbai12">
                    <h1 class="headline">隐患处理</h1>
                    <div class="box">  
                        <div class="henghang marginTop15">
                            <div class="ilabelName width60">接单 </div>
                            <input type="text" class="textInput136" name="problem_time" value="<c:if test="${not empty PROBLEM_TIME }">${PROBLEM_TIME}</c:if>"
                            onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">分钟</span>
                        </div>
                         <div class="henghang marginTop15 marginBottom37">
                            <div class="ilabelName width60">处理 </div>
                            <input type="text" class="textInput136" name="problem_solve" value="<c:if test="${not empty PROBLEM_SOLVE }">${PROBLEM_SOLVE}</c:if>"
                            onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">分钟</span>
                        </div>
                    </div>
                    <div class="clearfix"></div>
            </div>  
        </div>
        </form>
		<!-- 两个按钮 -->
	    <div class="lineBox lineBox100_90">
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
            $('#systemSetupTime').addClass('active');
            open();   
            $('.ipublish').on('click',function(){
            	var owner1 = $('input[name="owner1"]').val();
            	var owner2 = $('input[name="owner2"]').val();
            	var owner3 = $('input[name="owner3"]').val();
            	var route_time = $('input[name="route_time"]').val();
//             	var route_solve = $('input[name="route_solve"]').val();
            	var problem_time = $('input[name="problem_time"]').val();
            	var problem_solve = $('input[name="problem_solve"]').val();
            	if(owner1 == null || owner1 == '' || owner1 == undefined){
        			alert('第一负责人不能为空');
        			return;
        		}
            	if(owner2 == null || owner2 == '' || owner2 == undefined){
        			alert('第二负责人不能为空');
        			return;
        		}
            	if(owner3 == null || owner3 == '' || owner3 == undefined){
        			alert('第三负责人不能为空');
        			return;
        		}
            	if(route_time == null || route_time == '' || route_time == undefined){
        			alert('巡检接单不能为空');
        			return;
        		}
//             	if(route_solve == null || route_solve == '' || route_solve == undefined){
//         			alert('巡检处理不能为空');
//         			return;
//         		}
            	if(problem_time == null || problem_time == '' || problem_time == undefined){
        			alert('隐患接单不能为空');
        			return;
        		}
            	if(problem_solve == null || problem_solve == '' || problem_solve == undefined){
        			alert('隐患处理不能为空');
        			return;
        		}
        		$('#Form').submit();
        	});
        });
    </script>
</body>
</html>