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
<title>公告查看</title>
<link href="../css/foundation-datepicker.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css/right.css">
</head>
<body>
	<form action="<%=basePath %>notice/lookList" id="form" style="display:none;" method="post">
		<input name="select" />
		<input name="start_date"/>
		<input name="end_date"/>
		<input name="type"/>
		<input name="page"/>
	</form>
	<form action="<%=basePath %>notice/lookDetail" id="lookDetail" method="post">
	<input name="id"/>
	</form>
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
                	<font class="black">公告查看</font>               	
                </div>
            </div>
            <!-- 输入框 -->
            <div class="leadInput">
                <div class="lineTop lineBottomBig">
                    <div class="box">
                        <input type="text" class="textInput340" value="${select }" placeholder="查询关键字" id="s_select">
                        <img src="../images/icon_search_gray.png" class="iconOf340">
                    </div> 
                    <div class="box">
                        <div class="labelName">时间</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly"  value="${start_date }"  id="s_start_date" unselectable="on">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>  
                    <div class="box">
                        <div class="labelNameTime">至</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly"  value="${end_date }" id="s_end_date" unselectable="on">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>
                    <div class="box">
                		<div class="labelName">类别</div>
                		<input type="text" class="selectInput" readonly="readonly" unselectable="on" id="type">
                		<img src="../images/arrowdown.png" alt="" class="arrowdown">
                		<!-- 列表 -->
                		<ul class="dropcontent" style="display:none;">
                     		<li data-id ="1">通知</li>
                    		<li data-id= "2">学习</li>
                		</ul>
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
                    <th class="persentEleven">编号</th>
                    <th class="persentEighteen">公告名称</th>
                    <th class="persentThirteen">类别</th>
                    <th class="persentFourteen state">
                    	<div>状态</div>
<!--                     	<img src="../images/icon_xiala.png" alt=""> -->
<!--                     	<ul> -->
<!--                     		<li>未处理</li> -->
<!--                     		<li>已处理</li> -->
<!--                     		<li>处理中</li> -->
<!--                     		<li>有隐患</li> -->
<!--                     		<li>完结</li> -->
<!--                     	</ul> -->
                    </th>
                   
                    <th class="persentFourteen">执行人</th>
                    <th class="persentFifteen">发起时间</th>
                    
                    <th class="persentFifteen">操作</th>
                </tr> 
                <c:set var="index" value="${(page-1)*10 }"></c:set>     
                 <c:forEach var="list" items="${result.dataList }">
                 <c:set var="index" value="${index+1 }"></c:set> 
                 <tr>
                    <td data-id="">${index }</td>
                    <td>${list.title }</td>
                    <td data-type="${list.type }"><c:if test="${list.type==1 }">通知</c:if><c:if test="${list.type==2 }">学习</c:if></td>
                    <td data-status = "${list.status }"><c:if test="${list.status==0 }">正常</c:if><c:if test="${list.status==1 }">下架</c:if></td>
                    <td>${list.holdername }</td> 
                    <td><fmt:formatDate value="${list.createdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td  data-id="${list.notice_id }"><input class="look" type="button" style="width: 50px; height: 20px;float: left; margin-left: 50px; margin-right: 10px;" data-id="${list.notice_id }" value="查看" />
                    <input type="button" style="cursor: pointer;color: #2f96f5;width: 50px; height: 20px;float: left; margin-right: 10px;" value="删除" onclick="delNotice(${list.notice_id})"/></td>
                </tr>
                 </c:forEach>                         
            </table>
       		 <!-- 页码 -->
	        <div class="pageWrapper">
	       		<div class="pageBox" data-total="${total }">
	       			<div class="prev <c:if test="${page == 1 }">no</c:if> " <c:if test="${page > 1 }">onclick="searchClick(${page-1})"</c:if> >上一页</div>
	       			<div class="curr">${page }</div>
	       			<div class="next <c:if test="${page == total }">no</c:if> "  <c:if test="${page < total }">onclick="searchClick(${page+1})" </c:if>>下一页</div>
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
    
    	function delNotice(id){
    		var flag = confirm('是否删除?');
    		if(!flag){
    			return;
    		}
    		$.ajax({
    			url:'./delnotice',
    			data:{'id':id},
    			dataType:'json',
    			success:function(msg){
    				if(msg.code==0){
    					alert(msg.message);
    				}else{
    					alert("删除成功!");
    					window.location.href="./lookList";
    				}
    			}
    		})
    	}
        $(document).ready(function(){   
        	$('#noticeLookList').addClass('active');
        	open();  
        	$('.leftNav ul .active').parent().prev().find('.fanhui').css('margin-top','22px');
        	
        	$('.right').on('click','table .state',function() {
        		$(this).find('ul').show();
        		$(this).find('img').attr('src','../images/icon_shangla.png')
        	});
        	$('.right').on('click','th li',function() {
        		$(this).parents('ul').hide();
        		$(this).parents('ul').prev('img').attr('src','../images/icon_xiala.png');
        		return false;
        	});
        	
        	$('.right').on('click','.look',function() {
        		var id = $(this).data('id');
        		$('#lookDetail input[name="id"]').val(id);
        		$('#lookDetail').submit();
        	});
        	
        	//搜索框获得焦点
			$('.textInput340').focusin(function() {	
				$(this).val('');
				$(this).css('color','#999');
				$(this).next().attr('src','../images/icon_search_after.png');
			});
			
			//搜索框失去焦点
			$('.textInput340').focusout(function() {
				if($(this).val() == '') {					
					//$(this).val('公告关键字查询');						
				} 
				$(this).css('color','#999');	
				$(this).next().attr('src','../images/icon_search_gray.png');
			});	
        });
        
        $(document).on('click','.goBtn',function(){
        	var page = $('.goBox').html();
        	var end = $('.pageBox').attr('data-total');
        	if(page<1||page>end){
        		alert('请输入范围内数字');
        		return;
        	}
        	searchClick(page);
        });
        function refreshSearch(){
        	$('.leadInput').find('input').each(function(){
        		if($(this).hasClass('selectInput')){
        			$(this).val('请选择');
        		}else{
        			$(this).val('');
        		}
        	});
        }
        function checkVal(val){
        	if(val=='请输入'||val=="请选择"||typeof(val)=='undefined'){
        		return "";
        	}
        	return val;
        }
        
        function searchClick(obj){
        	if(!obj){
        		obj=1;
        	}
        	
        	var search = $('#s_select').val();
        	var start_time = $('#s_start_date').val();
        	var end_time = $('#s_end_date').val();
        	var type = $('#type').val();
        	var page = obj;
        	search = checkVal(search);
        	start_time = checkVal(start_time);
        	end_time= checkVal(end_time);
        	if(start_time!=""&&end_time!=""){
        		var start = new Date(start_time);
        		var end = new Date(end_time);
        		if(start>end){
        			alert('请输入正确日期');
        			return;
        		}
        	}
        	if(search=='公告关键字查询'){
        		search ='';
        	}
        	$('#form input[name="select"]').val(search);
        	$('#form input[name="start_date"]').val(start_time);
        	$('#form input[name="end_date"]').val(end_time);
        	$('#form input[name="type"]').val(type);
        	$('#form input[name="page"]').val(page);
        
        	$('#form').submit();
        }
        
        
        
    </script>
</body>
</html>