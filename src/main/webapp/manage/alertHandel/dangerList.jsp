<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>隐患列表</title>
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
                	告警处理 
                	<font class="black">隐患</font>
                	<img src="../images/icon_position_arrow.png" class="pa">
                	
                </div>
            </div>
            <!-- 输入框 -->
            <form id="searchForm" action="./dangerList" method="get">
            <div class="leadInput">
                <div class="lineTop">
                    <div class="box">
                        <div class="labelName">分局/大院</div>
                        <select class="selectInput" onchange="getstation()" id="area" name="area_id" >
                        	<option value="">请选择</option>
                        	<c:forEach items="${areaList }" var="p">
                        		<option value="${p.deptid }" <c:if test="${p.deptid == area_id}">selected="selected"</c:if>>${p.deptname }</option>
                        	</c:forEach>
                        </select>
                    </div>  
                    <div class="box">
                        <div class="labelName">支局/部门</div>
                        <select class="selectInput" onchange="getperson()" id="station" name="station_id">
                        	<option value="">请选择</option>
                        </select>
                    </div>  
                    <div class="box">
                        <div class="labelName">执行人</div>
                        <select class="selectInput" id="person" name="user_id">
                        	<option value="">请选择</option>
                        </select>
                    </div>  
                      <div class="labelName">关键字</div>
                     <input type="text" class="selectInput" id="keyword" name="keyword">         
                </div>
                <div class="lineBottom lineBottomBig">
                    <div class="box">
                        <div class="labelName">时间</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly" name="start_date" id="start_date">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>  
                    <div class="box">
                        <div class="labelNameTime">至</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly" name="end_date" id="end_date">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>  
                    <div class="box">
                        <div class="labelName">状态</div>
                        <select class="selectInput" name="laststep" id="laststep">
                        	<option value="">请选择</option>
                        	<option value="10" <c:if test="${laststep == 10}">selected="selected"</c:if>>待审</option>
                        	<option value="12" <c:if test="${laststep == 12}">selected="selected"</c:if>>已通过</option>
                        	<option value="121" <c:if test="${laststep == 121}">selected="selected"</c:if>>已接单</option>
                        	<option value="13" <c:if test="${laststep == 13}">selected="selected"</c:if>>不通过</option>
                        	<option value="14" <c:if test="${laststep == 14}">selected="selected"</c:if>>挂起</option>
                        	<option value="141" <c:if test="${laststep == 141}">selected="selected"</c:if>>挂起通过</option>
                        	<option value="142" <c:if test="${laststep == 142}">selected="selected"</c:if>>挂起不通过</option>
                        	<option value="15" <c:if test="${laststep == 15}">selected="selected"</c:if>>打回</option>
                        	<option value="151" <c:if test="${laststep == 151}">selected="selected"</c:if>>打回通过</option>
                        	<option value="152" <c:if test="${laststep == 152}">selected="selected"</c:if>>打回不通过</option>
                        	<option value="16" <c:if test="${laststep == 16}">selected="selected"</c:if>>解决</option>
                        </select>
                        <!-- 列表 -->
                    </div>  
                    <!-- 搜索按钮 -->
                    <div class="button" onclick="submitForm()">搜索</div>
                </div>
            </div>
            </form>
        </div>
        <!-- 数据表格 -->
        <div class="wrapperMain">
            <!-- 表格 -->
            <table>
                <tr>
                    <th class="persentTen">编号</th>
                    <th class="persentFourteen">名称</th>
                    <th class="persentFourteen">描述</th>
                    <th class="persentTwenty">地址</th>
                    <th class="persentTwenty">是否结束</th>
                    <th class="persentSixteen">创建时间</th>
                    <th class="persentEighteen">状态</th>
                    <th class="persentTwelfth">操作</th>
                </tr>   
                <c:forEach items="${list }" var="p">
                	<tr>
                		<td>${p.problem_id }</td>
	                    <td>${p.title }</td>
	                    <td>${p.topic }</td>
	                    <td>${p.address }</td>
	                    <td>
	                    	<c:if test="${p.isend == 0 }">否</c:if>
	                    	<c:if test="${p.isend == 1 }">是</c:if>
	                    </td>
	                    <td><fmt:formatDate value="${p.createdate }" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                    <td>
	                    	<c:if test="${p.laststep == 10 }">待审</c:if>
	                    	<c:if test="${p.laststep == 11 }">已通过</c:if>
	                    	<c:if test="${p.laststep == 12 }">已通过</c:if>
	                    	<c:if test="${p.laststep == 121 }">已接单</c:if>
	                    	<c:if test="${p.laststep == 13 }">不通过</c:if>
	                    	<c:if test="${p.laststep == 14 }">挂起</c:if>
	                    	<c:if test="${p.laststep == 141 }">挂起通过</c:if>
	                    	<c:if test="${p.laststep == 142 }">挂起不通过</c:if>
	                    	<c:if test="${p.laststep == 15 }">打回</c:if>
	                    	<c:if test="${p.laststep == 151 }">打回通过</c:if>
	                    	<c:if test="${p.laststep == 152 }">打回不通过</c:if>
	                    	<c:if test="${p.laststep == 16 }">解决</c:if>
	                    </td>
	                    <td class="look" onclick="dangerDetail('${p.problem_id }')">查看</td>
                	</tr>
                </c:forEach>             
            </table>
       		 <!-- 页码 -->
	        <div class="pageWrapper">
	       		<div class="pageBox">
	       			<div class="prev <c:if test="${page == 1 }">no</c:if> ">上一页</div>
	       			<div class="curr">${page }</div>
	       			<div class="next <c:if test="${page == total }">no</c:if> ">下一页</div>
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
        	$('#alertHandelDanger').addClass('active');
        	open();        
        	var daq = '${area_id}';
        	if(daq != null && daq != '' && daq != undefined && daq != '请选择'){
        		getstation();
        		xiaoq = '${station_id}';
        		if(xiaoq != null && xiaoq != '' && xiaoq != undefined && xiaoq != '请选择'){
        			getperson();
        		}
        	}
        	$('.right').on('click','table .state',function() {
        		$(this).find('ul').show();
        		$(this).find('img').attr('src','../images/icon_shangla.png')
        	});
        	$('.right').on('click','th li',function() {
        		$(this).parents('ul').hide();
        		$(this).parents('ul').prev('img').attr('src','../images/icon_xiala.png');
        		return false;
        	});
        	var area_id = '${area_id}';
        	var station_id = '${station_id}';
        	var user_id = '${user_id}';
        	var laststep = '${laststep}';
        	var start_date = '${start_date}';
        	var end_date = '${end_date}';
        	var keyword='${keyword}';
        	
//         	$('.right').on('click','.look',function() {
//         		location.href = server + '/dianxin/alertHandel/dangerDetail';
//         	});
        	
        	$('.prev').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/dangerList?page='+'${page-1}'+'&laststep='+laststep+'&start_date='+start_date+'&end_date='+end_date+'&area_id='+area_id+'&station_id='+station_id+'&user_id='+user_id;
        	});
        	$('.next').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/dangerList?page='+'${page+1}'+'&laststep='+laststep+'&start_date='+start_date+'&end_date='+end_date+'&area_id='+area_id+'&station_id='+station_id+'&user_id='+user_id;
        	});
        	$('.no').off('click');
        	$('.goBtn').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/dangerList?page='+$('.goBox').html().replace(/[^0-9-]+/,'')+'&laststep='+laststep+'&start_date='+start_date+'&end_date='+end_date+'&area_id='+area_id+'&station_id='+station_id+'&user_id='+user_id;
        	});
        });
        
        function dangerDetail(id) {
        	location.href = server + '/dianxin/alertHandel/dangerDetail?id='+id;
        }
        
        function submitForm(){
        	$('#searchForm').submit();
        }
        
        $(function(){
        	if ('${laststep}' != null && '${laststep}' != '') {
        		$('#laststep').val('${laststep}');
        	}
        	if ('${start_date}' != null && '${start_date}' != '') {
        		$('#start_date').val('${start_date}');
        	}
        	if ('${end_date}' != null && '${end_date}' != '') {
        		$('#end_date').val('${end_date}');
        	}
        })
        
        function getstation(){
        	var id = $('#area').val();
        	var station_id = '${station_id}';
        	var area_id = '${area_id}';
        	if(area_id != null && area_id != undefined && area_id != ''){
        		id = area_id;
        	}
        	if(id != null && id != '' && id != undefined){
        		$.ajax({
            		url: server + '/dianxin/alertPublish/getDept2',
            		data: {id:id},
            		type: 'POST',
            		success: function(msg){
            			msg = eval('('+msg+')');
            			$('#station').empty();
            				if(msg.list != null){
            					var html = '<option value="">请选择</option>';
                				for(var i =0;i<msg.list.length;i++){
                					html += '<option value="'+msg.list[i].deptid+'"';
                					if(msg.list[i].deptid-station_id == 0){
                						html += 'selected="selected"';
                					}
                					html += '>'+msg.list[i].deptname+'</option>';
                				}
                				$('#station').append(html);
            				}
            			}
            		});
        	}
        }

        function getperson(){
        	var id = $('#station').val();
        	var user_id = '${user_id}';
        	var station_id = '${station_id}';
        	if(station_id != null && station_id != undefined && station_id != ''){
        		id = station_id;
        	}
        	if(id != null && id != '' && id != undefined){
        		$.ajax({
            		url: server + '/dianxin/alertPublish/getUser',
            		data: {deptid:id},
            		type: 'POST',
            		success: function(msg){
            			msg = eval('('+msg+')');
            			$('#person').empty();
            				if(msg.user_list != null){
            					var html = '<option value="">请选择</option>';
                				for(var i =0;i<msg.user_list.length;i++){
                					html += '<option value="'+msg.user_list[i].id+'"';
                					if(msg.user_list[i].id-user_id == 0){
                						html += 'selected="selected"';
                					}
                					html += '>'+msg.user_list[i].username+'</option>';
                				}
                				
                				$('#person').append(html);
            				}
            		}
            	});
        	}
        }
    </script>
</body>
</html>