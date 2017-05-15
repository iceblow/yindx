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
<title>积分查询</title>
<link href="../css/foundation-datepicker.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css/right.css">
</head>
<body>
	<form action="<%=basePath %>query/integral" id="form" style="display:none;" method="post">
		<input name="ss_id" />
		<input name="station_id"/>
		<input name="user_id"/>
		<input name="start_time"/>
		<input name="end_time"/>
		<input name="type"/>
		<input name="page"/>
	</form>
	<!-- 右边主要内容 -->
    <div class="right">
        <!-- 头部 -->
        <div class="wrapperTop">
            <!-- 当前页面 -->
            <div class="leadTop">
                <div class="leftLead">
                	<img src="../images/icon_position.png">
                	查询统计
                	<font class="black">积分查询</font>
                	<img src="../images/icon_position_arrow.png" class="pa">
                	
                </div>
            </div>
            <!-- 输入框 -->
            <div class="leadInput">
                <div class="lineTop">
                    <div class="box">
                        <div class="labelName">大区</div>
                        <select class="selectInput" id="s_ss">
                        	<option value="">全部</option>
                        	<c:forEach items="${areas }" var ="a">
                        			<c:if test="${ss_id==a.area_id }"> <option value="${a.area_id }" selected>${a.area_name }</option></c:if>
                        			<c:if test="${ss_id!=a.area_id }"> <option value="${a.area_id }">${a.area_name }</option></c:if>
                            </c:forEach>
                        </select>
                    </div>  
                    <div class="box">
                        <div class="labelName">小区</div>
                       <select class="selectInput" id="s_station">
                        	<option value="">全部</option>
                        	 <c:forEach items="${stations }" var="a">
                        	 <c:if test="${station_id==a.station_id }"> <option value="${a.station_id }" selected>${a.station_name }</option></c:if>
                           	<c:if test="${station_id!=a.station_id }"> <option value="${a.station_id }">${a.station_name }</option></c:if>
                           </c:forEach>
                        </select>
                    </div>  
                    <div class="box">
                        <div class="labelName">工作人员</div>
                        <select class="selectInput" id="s_user">
                        	<option value="">全部</option>
                        	 <c:forEach items="${users }" var="a">
                        	 <c:if test="${user_id==a.id }"> <option value="${a.id }" selected>${a.username }</option></c:if>
                             <c:if test="${user_id!=a.id }"> <option value="${a.id }">${a.username }</option></c:if>	
                            </c:forEach>
                        </select>
                    </div>           
                </div>
                <div class="lineBottom lineBottomBig">
                    <div class="box">
                        <div class="labelName">时间</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly" id="s_start_time" value="${start_time }">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>  
                    <div class="box">
                        <div class="labelNameTime">至</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly" id="s_end_time" value="${end_time }">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>  
                    <div class="box">
                        <div class="labelName">类型</div>
                         <select class="selectInput" id="s_type">
                        	<option value="">全部</option>
                        	<option <c:if test="${type=='0' }"> selected </c:if> value="0">隐患发布</option>
                        	<option <c:if test="${type=='1' }"> selected </c:if> value="1">隐患处理</option>
                        	<option <c:if test="${type=='2' }"> selected </c:if> value="2">巡检处理</option>
                        	<option <c:if test="${type=='3' }"> selected </c:if> value="3">检查处理</option>
                        </select>
                    </div>  
                    <!-- 搜索按钮 -->
                    <div class="button" onclick="searchClick(1)">搜索</div>
                    <div class="button" onclick="refreshSearch()">重置</div>
                </div>
            </div>
        </div>
        <!-- 数据表格 -->
        <div class="wrapperMain">
            <!-- 表格 -->
            <table>
                <tr>
                    <th class="persentTen">编号</th>
                    <th class="persentTen">大区</th>
                    <th class="persentFourteen">小区</th>
                    <th class="persentFourteen">工作人员</th>
                    <th class="persentTen">部门</th>
                    <th class="persentTen">类型</th>
                    <th class="persentSixteen">处理时间</th>
                    <th class="persentTen">积分</th>
                </tr>     
                 <c:set var="index" value="${(page-1)*10 }"></c:set>     
                 <c:forEach var="list" items="${result.dataList }">
                 <c:set var="index" value="${index+1 }"></c:set>            
                <tr>
                    <td>${index }</td>
                    <td>${list.ss_name }</td>
                    <td>${list.station_name }</td>
                    <td>${list.username }</td>
                    <td>${list.deptname }</td>
                    <td>${list.typename }</td>
                    <td>${list.createdate }</td>
                    <td class="cyan">${list.score }</td>
                </tr>
                </c:forEach> 
            </table>
       		 <!-- 页码 -->
	        <div class="pageWrapper">
	       		<div class="pageBox" data-total="${total }">
	       			<div class="prev <c:if test="${page == 1 }">no</c:if> " onclick="searchClick(${page-1})">上一页</div>
	       			<div class="curr">${page }</div>
	       			<div class="next <c:if test="${page == total }">no</c:if> " onclick="searchClick(${page+1})">下一页</div>
	       			<img src="../images/shuxin1X25.png" alt="" class="shuxin">
	       			<div class="skip">跳转至</div>
	       			<div class="goBox" contenteditable="true">${page }</div>
	       			<div class="goBtn">GO</div>
	       			<div class="detailP">当前第<font>${page }</font>页/共<font>${total }页</font></div>
	       		</div>
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
        	$('#queryIntegral').addClass('active');
        	open();
        });
        
        $(function(){
        	$('#s_ss').change(function(){
        		var id = $(this).val();
        		$.ajax({
        			url:'./getstation',
        			data:{'id':id},
        			dataType:'json',
        			success:function(result){
        				var obj = $('#s_station').empty(); 
        				obj.append('<option value="">全部</option>');
        				for(var i = 0;i<result.length;i++){
        					obj.append('<option value="'+result[i].station_id+'">'+result[i].station_name+'</option>');
        				}
        			}
        		})
        	});
        });
        
        function refreshSearch(){
        	$('.leadInput').find('input').each(function(){
        		if($(this).hasClass('getTime')){
        			$(this).val('请选择');
        		}else{
        			$(this).val('');
        		}
        	});
        	$('.leadInput').find('select').each(function(){
        		$(this).find('option').removeAttr('selected');
        		$(this).find("option[text='全部']").attr("selected",true); 
        		
        	});
        }
        
        function searchClick(obj){
        	if(!obj){
        		obj=1;
        	}
        	var ss_id = $('#s_ss').val();
        	var station_id = $('#s_station').val();
        	var user_id = $('#s_user').val();
        	var start_time = $('#s_start_time').val();
        	var end_time = $('#s_end_time').val();
        	var type = $('#s_type').val();
        	if(start_time=='请选择'){
        		start_time = "";
        	}
			if(end_time=='请选择'){
				end_time = "";
        	}
			if(start_time!=""&&end_time!=""){
        		var start = new Date(start_time);
        		var end = new Date(end_time);
        		if(start>end){
        			alert('请输入正确日期');
        			return;
        		}
        	}
        	$('#form input[name="ss_id"]').val(ss_id);
        	$('#form input[name="station_id"]').val(station_id);
        	$('#form input[name="user_id"]').val(user_id);
        	$('#form input[name="start_time"]').val(start_time);
        	$('#form input[name="end_time"]').val( end_time);
        	$('#form input[name="type"]').val(type);
        	$('#form input[name="page"]').val(obj);
        
        	$('#form').submit();
        }
        
    </script>
</body>
</html>