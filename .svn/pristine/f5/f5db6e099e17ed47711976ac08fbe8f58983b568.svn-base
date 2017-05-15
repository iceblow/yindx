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
        <form action="/dianxin/systemSetup/updateIntegral" id="Form" method="post">
    	<!-- 第一个框 -->
        <div class="box_50">
            <div class="box_248 marginTop21 marginLeftbai32">
                    <h1 class="headline">提交</h1>
                    <div class="box">
                         <div class="henghang marginTop15 marginBottom37">
                            <div class="ilabelName">发现隐患 </div>
                            <input type="text" class="textInput136" name = "find_problem" value="<c:if test="${not empty FIND_PROBLEM }">${FIND_PROBLEM}</c:if>"
                            onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">积分</span>
                        </div>
                    </div>
                    <div class="clearfix"></div>
            </div>  
       </div>
		<!-- 第二个框 -->
        <div class="box_50">
            <div class="box_248 marginTop21 marginLeftbai12">
                    <h1 class="headline">其他</h1>
                    <div class="box"> 
                         <div class="henghang marginTop15 marginBottom37">
                            <div class="ilabelName">检查 </div>
                            <input type="text" class="textInput136" name = "solve_check" value="<c:if test="${not empty SOLVE_CHECK }">${SOLVE_CHECK}</c:if>"
                            onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">积分</span>
                        </div>
                    </div>
                    <div class="clearfix"></div>
            </div>  
       </div>
		<!-- 第三个框 -->
       <div class="box_50">
            <div class="box_248 marginTop21 marginLeftbai32">
	            <h1 class="headline">处理</h1>
	            <div class="box">  
	                <div class="henghang marginTop15">
	                    <div class="ilabelName width60">实时 </div>
	                    <input type="text" class="textInput136" name = "solve_real" value="<c:if test="${not empty SOLVE_REAL }">${SOLVE_REAL}</c:if>"
	                    onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">积分</span>
	                </div>
	                <div class="henghang marginTop15">
	                    <div class="ilabelName width60">预警 </div>
	                    <input type="text" class="textInput136" name = "solve_eaely" value="<c:if test="${not empty SOLVE_EAELY }">${SOLVE_EAELY}</c:if>"
	                    onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">积分</span>
	                </div>
	                <div class="henghang marginTop15">
	                    <div class="ilabelName width60">巡检 </div>
	                    <input type="text" class="textInput136" name = "solve_route" value="<c:if test="${not empty SOLVE_ROUTE }">${SOLVE_ROUTE}</c:if>"
	                    onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">积分</span>
	                </div>
	                 <div class="henghang marginTop15 marginBottom37">
	                    <div class="ilabelName width60">隐患</div>
	                    <input type="text" class="textInput136" name = "solve_problem" value="<c:if test="${not empty SOLVE_PROBLEM }">${SOLVE_PROBLEM}</c:if>"
	                    onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">积分</span>
	                </div>
	            </div>
                <div class="clearfix"></div>
            </div>
        </div> 
         <!-- 第三个框 -->
       <div class="box_50">
            <div class="box_248 marginTop21 marginLeftbai12">
	            <h1 class="headline">要求</h1>
	            <div class="box">  
	                <div class="henghang marginTop15">
	                    <div class="ilabelName width60">按时接单 </div>
	                    <input type="text" class="textInput136" name = "on_order" value="<c:if test="${not empty ON_ORDER }">${ON_ORDER}</c:if>"
	                    onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">积分</span>
	                </div>
	                <div class="henghang marginTop15">
	                    <div class="ilabelName width60">超时接单</div>
	                    <input type="text" class="textInput136" name = "over_order" value="<c:if test="${not empty OVER_ORDER }">${OVER_ORDER}</c:if>"
	                    onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">积分</span>
	                </div>
	                <div class="henghang marginTop15">
	                    <div class="ilabelName width60">按时处理 </div>
	                    <input type="text" class="textInput136" name = "on_dispose" value="<c:if test="${not empty ON_DISPOSE }">${ON_DISPOSE}</c:if>"
	                    onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">积分</span>
	                </div>
	                 <div class="henghang marginTop15 marginBottom37">
	                    <div class="ilabelName width60">超时处理</div>
	                    <input type="text" class="textInput136" name = "over_dispose" value="<c:if test="${not empty OVER_DISPOSE }">${OVER_DISPOSE}</c:if>"
	                    onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"><span class="lineHeight">积分</span>
	                </div>
	            </div>
                <div class="clearfix"></div>
            </div>
        </div> 
        </form>    
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
            $('#systemSetupIntegral').addClass('active');
            open();        
            $('.ipublish').on('click',function(){
            	var find_problem = $('input[name="find_problem"]').val();
            	var solve_real = $('input[name="solve_real"]').val();
            	var solve_eaely = $('input[name="solve_eaely"]').val();
            	var solve_route = $('input[name="solve_route"]').val();
            	var solve_problem = $('input[name="solve_problem"]').val();
            	var solve_check = $('input[name="solve_check"]').val();
            	var on_order = $('input[name="on_order"]').val();
            	var over_order = $('input[name="over_order"]').val();
            	var on_dispose = $('input[name="on_dispose"]').val();
            	var over_dispose = $('input[name="over_dispose"]').val();
            	if(on_order == null || on_order == '' || on_order == undefined){
        			alert('按时接单不能为空');
        			return;
        		}
            	if(over_order == null || over_order == '' || over_order == undefined){
        			alert('超时接单不能为空');
        			return;
        		}
            	if(on_dispose == null || on_dispose == '' || on_dispose == undefined){
        			alert('按时处理不能为空');
        			return;
        		}
            	if(over_dispose == null || over_dispose == '' || over_dispose == undefined){
        			alert('超时处理不能为空');
        			return;
        		}
            	if(find_problem == null || find_problem == '' || find_problem == undefined){
        			alert('发现隐患不能为空');
        			return;
        		}
            	if(solve_real == null || solve_real == '' || solve_real == undefined){
        			alert('实时不能为空');
        			return;
        		}
            	if(solve_eaely == null || solve_eaely == '' || solve_eaely == undefined){
        			alert('预警不能为空');
        			return;
        		}
            	if(solve_route == null || solve_route == '' || solve_route == undefined){
        			alert('巡检不能为空');
        			return;
        		}
            	if(solve_problem == null || solve_problem == '' || solve_problem == undefined){
        			alert('隐患不能为空');
        			return;
        		}
            	if(solve_check == null || solve_check == '' || solve_check == undefined){
        			alert('检查不能为空');
        			return;
        		}
        		$('#Form').submit();
        	});   
        });
    </script>
</body>
</html>