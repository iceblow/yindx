<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实时列表</title>
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
                	<font class="black">实时</font>
                	<img src="../images/icon_position_arrow.png" class="pa">
                	
                </div>
            </div>
            <!-- 输入框 -->
            <form id="searchForm" action="./actualList" method="post">
            <div class="leadInput">
                <div class="lineTop">
                    <div class="box">
                        <div class="labelName">分局/大院</div>
                        <select class="selectInput" id="area" name="area_id"  data-value="${area_id }" onclick="area11()">
                		<option value="">请选择</option>
                		<c:forEach items="${areaList }" var="p">
                			
                			<option value="${p.deptid }" <c:if test="${area_id==p.deptid }">selected</c:if>>${p.deptname }</option>
                		</c:forEach>
               			 </select>
                    </div>  
                    <div class="box">
                        <div class="labelName">支局/部门</div>
                        <select class="selectInput"  id="xiaoqu" name="xiaoqu" data-value="${xiaoqu }" onclick="xiaoqu11()">
               	 		<option value="">请选择</option>
               	 		<c:forEach items="${depts }" var="d">
                			
                			<option value="${d.deptid }" <c:if test="${xiaoqu==d.deptid }">selected</c:if>>${d.deptname }</option>
                		</c:forEach>
               	 		</select>
                    </div>  
                    <div class="box">
                        <div class="labelName">执行人</div>
                        <select class="selectInput"  id="shebei" name = "user_id" data-value="${user_id }">
                        <option value="">请选择</option>
                        <c:forEach items="${users }" var="u">
                			<option value="${u.id }" <c:if test="${user_id==u.id }">selected</c:if>>${u.username }</option>
                		</c:forEach>
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
                        	<option value="1">电子工单生成</option>
                        	<option value="2">电子工单生成后自动结束</option>
                        	<option value="10">未确认</option>
                        	<option value="11">已确认</option>
                        	<option value="12">已挂起</option>
                        	<option value="13">已解挂</option>
                        	<option value="14">已结束</option>
                        	<option value="15">已撤销</option>
                        	<option value="16">短信报障</option>
                        	<option value="17">电话报障</option>
                        	<option value="18">自动短信派单</option>
                        	<option value="19">短信确认</option>
                        	<option value="20">短信派单提醒</option>
                        	<option value="21">短信回复</option>
                        	<option value="101">发送电子工单</option>
                        	<option value="102">电子工单追单</option>
                        	<option value="103">发送电子工单后自动结束</option>
                        	<option value="104">电子工单短信确认</option>
                        	<option value="105">电子工单网站确认</option>
                        	<option value="106">电子工单语音确认</option>
                        	<option value="107">确认工单后自动结束</option>
                        	<option value="108">电子工单确认失败</option>
                        	<option value="201">工单回复提醒</option>
                        	<option value="202">工单语音回复</option>
                        	<option value="203">工单网站回复</option>
                        	<option value="204">工单短信回复</option>
                        	<option value="205">工单短信保存</option>
                        	<option value="206">工单回复超时</option>
                        	<option value="302">工单解挂</option>
                        	<option value="303">工单挂起</option>
                        	<option value="304">人工工单结束</option>
                        	<option value="401">工单结束</option>
                        </select>
                    </div> 
                    <!-- 搜索按钮 -->
                     <div class="button" onclick="submitForm()">搜索</div>
                </div>
            </div></form>
        </div>
        <!-- 数据表格 -->
        <div class="wrapperMain">
            <!-- 表格 -->
            <table>
                <tr>
                    <th class="persentTen">编号</th>
                    <th class="persentFourteen">大区</th>
                    <th class="persentTwentyThree">小区</th>
                    <th class="persentTwenty">执行人</th>
                    <th class="persentTwenty">工单详情</th>
                    <th class="persentSixteen">发起时间</th>
                    <th class="persentEighteen state">
                    	<div>状态</div>
                    	<!-- <img src="../images/icon_xiala.png" alt="">
                    	<ul>
                    		<li>正常</li>
                    		<li>隐患</li>
                    	</ul> -->
                    </th>
                    <th class="persentTwelfth">操作</th>
                </tr>                
                  <c:forEach items="${list }" var="p">
                	<tr>
                		<td>${p.aefid }</td>
	                    <td>${p.ss_name }</td>
	                    <td>${p.station_name }</td>
	                    <td>${p.username }</td>
	                    <td>${p.topic }</td>
	                    <td><fmt:formatDate value="${p.aecreatedate }" type="date" pattern="yyyy-MM-dd hh:mm:ss" /></td>
	                    <td>
	                    	<c:if test="${p.laststep == 1 }">电子工单生成</c:if>
                        	<c:if test="${p.laststep == 2}">电子工单生成后自动结束</c:if>
                        	<c:if test="${p.laststep == 10}">未确认</c:if>
                        	<c:if test="${p.laststep == 11}">已确认</c:if>
                        	<c:if test="${p.laststep == 12}">已挂起</c:if>
                        	<c:if test="${p.laststep == 13}">已解挂</c:if>
                        	<c:if test="${p.laststep == 14}">已结束</c:if>
                        	<c:if test="${p.laststep == 15}">已撤销</c:if>
                        	<c:if test="${p.laststep == 16}">短信报障</c:if>
                        	<c:if test="${p.laststep == 17}">电话报障</c:if>
                        	<c:if test="${p.laststep == 18}">自动短信派单</c:if>
                        	<c:if test="${p.laststep == 19}">短信确认</c:if>
                        	<c:if test="${p.laststep == 20}">短信派单提醒</c:if>
                        	<c:if test="${p.laststep == 21}">短信回复</c:if>
                        	<c:if test="${p.laststep == 101}">发送电子工单</c:if>
                        	<c:if test="${p.laststep == 102}">电子工单追单</c:if>
                        	<c:if test="${p.laststep == 103}">发送电子工单后自动结束</c:if>
                        	<c:if test="${p.laststep == 104}">电子工单短信确认</c:if>
                        	<c:if test="${p.laststep == 105}">电子工单网站确认</c:if>
                        	<c:if test="${p.laststep == 106}">电子工单语音确认</c:if>
                        	<c:if test="${p.laststep == 107}">确认工单后自动结束</c:if>
                        	<c:if test="${p.laststep == 108}">电子工单确认失败</c:if>
                        	<c:if test="${p.laststep == 201}">工单回复提醒</c:if>
                        	<c:if test="${p.laststep == 202}">工单语音回复</c:if>
                        	<c:if test="${p.laststep == 203}">工单网站回复</c:if>
                        	<c:if test="${p.laststep == 204}">工单短信回复</c:if>
                        	<c:if test="${p.laststep == 205}">工单短信保存</c:if>
                        	<c:if test="${p.laststep == 206}">工单回复超时</c:if>
                        	<c:if test="${p.laststep == 302}">工单解挂</c:if>
                        	<c:if test="${p.laststep == 303}">工单挂起</c:if>
                        	<c:if test="${p.laststep == 304}">人工工单结束</c:if>
                        	<c:if test="${p.laststep == 401}">工单结束</c:if>
	                    </td>
	                    <td class="look" onclick="actualDetail('${p.aefid }')">查看</td>
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
        	$('#alertHandelActual').addClass('active');
        	open();        
        	
        	$('.right').on('click','table .state',function() {
        		$(this).find('ul').show();
        		$(this).find('img').attr('src','../images/icon_shangla.png')
        	});
        	$('.right').on('click','th li',function() {
        		$(this).parents('ul').hide();
        		$(this).parents('ul').prev('img').attr('src','../images/icon_xiala.png');
        		return false;
        	});
        	
//         	$("select").each(function(){
//         		var value = $(this).attr("data-value");
//         		if(value){
//         			$(this).val(value);
//         		}
//         		if($(this).attr("id")=="area"){
//         			area11();
//         		}
//         		if($(this).attr("id")=="xiaoqu"){
//         			xiaoqu11();
//         		}
//         	})
        	
        	var laststep = '${laststep}';
        	var start_date = '${start_date}';
        	var end_date = '${end_date}';
        	var area_id = '${area_id}';
        	var xiaoqu = '${xiaoqu}';
        	var user_id = '${user_id}';
        	var keyword='${keyword}';
        	
        	$('.prev').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/actualList?page='+'${page-1}'+'&laststep='+laststep+'&start_date='+start_date+'&end_date='+end_date+'&area_id='+area_id+'&xiaoqu='+xiaoqu+'&user_id='+user_id;
        	});
        	
        	$('.next').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/actualList?page='+'${page+1}'+'&laststep='+laststep+'&start_date='+start_date+'&end_date='+end_date+'&area_id='+area_id+'&xiaoqu='+xiaoqu+'&user_id='+user_id;
        	});
        	
        	$('.no').off('click');
        	
        	$('.goBtn').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/actualList?page='+$('.goBox').html().replace(/[^0-9-]+/,'')+'&laststep='+'&laststep='+laststep+'&start_date='+start_date+'&end_date='+end_date+'&area_id='+area_id+'&xiaoqu='+xiaoqu+'&user_id='+user_id;
        	});
        	
        });

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
      function area11(id){
        	id = $('#area').val();
        	if(id != null  && id != undefined){
        		if(id==''){
        			id="all";
        		}
        		$.ajax({
            		url: server + '/dianxin/alertPublish/getDept2',
            		data: {id:id},
            		type: 'POST',
            		success: function(msg){
            			msg = eval('('+msg+')');
            			$('#xiaoqu').empty();
            				if(msg.list != null){
            					var html = '<option value="">请选择</option>';
                				for(var i =0;i<msg.list.length;i++){
                					html += '<option value="'+msg.list[i].deptid+'">'+msg.list[i].deptname+'</option>';
                				}
                				$('#xiaoqu').append(html);
            				}
            			}
            		});
        	}
    		
        }
        function xiaoqu11(id){
        	id = $('#xiaoqu').val();
        	if(id != null  && id != undefined){
        		if(id==''){
        			id="all";
        		}
    		$.ajax({
        		url: server + '/dianxin/alertPublish/getUser',
        		data: {deptid:id},
        		type: 'POST',
        		success: function(msg){
        			msg = eval('('+msg+')');
        			$('#shebei').empty();
        				if(msg.user_list != null){
        					var html = '<option value="">请选择</option>';
            				for(var i =0;i<msg.user_list.length;i++){
            					html+='<option value="'+msg.user_list[i].id+'">'+msg.user_list[i].username+'</option>';
            				}
            				$('#shebei').append(html);
        				}
        		}
        	});
        }
       }
        function actualDetail(id) {
        	location.href = server + '/dianxin/alertHandel/actualDetail?id='+id;
        }
    </script>
</body>
</html>