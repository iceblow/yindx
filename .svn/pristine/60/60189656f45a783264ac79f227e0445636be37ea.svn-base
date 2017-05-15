<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>巡检列表</title>
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
                	<font class="black">巡检</font>
                	<img src="../images/icon_position_arrow.png" class="pa">
                	
                </div>
            </div>
            <!-- 输入框 -->
            <form action="/dianxin/alertPublish/inspectionList" id="searchForm">
            <div class="leadInput">
                <div class="lineTop">
                    <div class="box">
                        <div class="labelName">分局/大院</div>
                        <select class="selectInput" id="area" onclick="area1(this.value)" name="daqu">
                		<option value="">请选择</option>
                		<c:forEach items="${dList }" var="p">
                			<option value="${p.deptid }">${p.deptname }</option>
                		</c:forEach>
                </select>
                    </div>  
                    <div class="box">
                        <div class="labelName">支局/部门</div>
                        <select class="selectInput"  id="xiaoqu" onclick="xiaoqu1(this.value)" name="xiaoqu">
                	</select>
                    </div>  
                    <div class="box">
                        <div class="labelName">执行人</div>
                        <select class="selectInput"  id="shebei" name="shebei">
                		</select>
                    </div>    
                         <div class="labelName">关键字</div>
                     <input type="text" class="selectInput" id="keyword" name="keyword">       
                </div>
                <div class="lineBottom lineBottomBig">
                    <div class="box">
                        <div class="labelName">时间</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly" name="start_date" value="${start_date }">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>  
                    <div class="box">
                        <div class="labelNameTime">至</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly" name="end_date" value="${end_date }">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>  
                    <div class="box">
                        <div class="labelName">状态</div>
                        <select class="selectInput"  id="state" name="state">
                        <option value="">请选择</option>
                        <option value="10">未执行</option>
                        <option value="14">正常/按时</option>
                        <option value="11">有隐患</option>
                        <option value="12">有隐患/解决</option>
                        <option value="13">未按时</option>
                		</select>
                    </div>  
                    <div class="box">
                        <div class="labelName">频次</div>
                        <select class="selectInput"  id="frequency" name="frequency">
                        <option value="">请选择</option>
                        <option value="0">临时</option>
                        <option value="1">每天</option>
                        <option value="2">每周</option>
                        <option value="3">每月</option>
                        <option value="4">每季</option>
                         <option value="5">半年</option>
                          <option value="6">每年</option>
                		</select>
                    </div>  
                    <!-- 搜索按钮 -->
                    <div class="button" onclick="add()">新增</div>     
                    <!-- 搜索按钮 -->
                    <div class="button" id="sousuo">搜索</div>
                </div>
            </div>
            </form>
        </div>
        <!-- 数据表格 -->
        <div class="wrapperMain">
            <!-- 表格 -->
            <table>
                <tr>
                    <th class="persentTen">周期</th>
                    <th class="persentFourteen">名称</th>
                    <th class="persentFourteen">设备类型</th>
                    <th class="persentTwenty">执行人</th>
                    <th class="persentSixteen">发起时间</th>
                    <th class="persentTwelfth">操作</th>
                </tr>  
                <c:forEach items="${list }" var="p">
                <tr>
                	<td>
                	<c:if test="${p.frequency == 0}">临时</c:if>
                	<c:if test="${p.frequency == 1}">每天</c:if>
                	<c:if test="${p.frequency == 2}">每周</c:if>
                	<c:if test="${p.frequency == 3}">每月</c:if>
                	<c:if test="${p.frequency == 4}">每季</c:if>
                	<c:if test="${p.frequency == 5}">半年</c:if>
                	<c:if test="${p.frequency == 6}">每年</c:if>
                	</td>
                    <td>${p.name }</td>
                    <td>${p.typename }</td>
                    <td>${p.deptname}_${p.people }</td>
                    <td><fmt:formatDate value="${p.createdate }" type="date" pattern="yyyy-MM-dd" /></td>
                    <td class="look" onclick="lookins('${p.route_id }','${p.laststep}')">查看</td>
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
        	$('#alertPublishInspection').addClass('active');
        	open();        
        	var daq = '${daqu}';
        	if(daq != null && daq != '' && daq != undefined && daq != '请选择'){
        		area1(daq);
        		var xiaoq = '${xiaoqu}';
        		if(xiaoq != null && xiaoq != '' && xiaoq != undefined && xiaoq != '请选择'){
        			xiaoqu1(xiaoq);
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
        	var start_date = '${start_date}';
        	var end_date = '${end_date}';
        	var daqu = '${daqu}';
        	var xiaoqu = '${xiaoqu}';
        	var people = '${people}';
        	var state = '${state}';
        	var frequency='&{frequency}';
        	var keyword='${keyword}';
        	$('#sousuo').on('click',function(){
        		$('#searchForm').submit();
        	});
        	$('.prev').on('click',function(){
        		location.href = server + '/dianxin/alertPublish/inspectionList?page='+'${page-1}'+'&start_date='+start_date+'&end_date='+end_date+'&daqu='+daqu+'&xiaoqu='+xiaoqu+'&people='+people+'&state='+state;
        	});
        	$('.next').on('click',function(){
        		location.href = server + '/dianxin/alertPublish/inspectionList?page='+'${page+1}'+'&start_date='+start_date+'&end_date='+end_date+'&daqu='+daqu+'&xiaoqu='+xiaoqu+'&people='+people+'&state='+state;
        	});
        	$('.no').off('click');
        	$('.goBtn').on('click',function(){
        		location.href = server + '/dianxin/alertPublish/inspectionList?page='+$('.goBox').html().replace(/[^0-9-]+/,'')+'&start_date='+start_date+'&end_date='+end_date+'&daqu='+daqu+'&xiaoqu='+xiaoqu+'&people='+people+'&state='+state;
        	});
        });
        
        function xiaoqu1(id){
        	id = $('#xiaoqu').val();
        	if(id != null && id != '' && id != undefined){
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
        function lookins(id,type,username){
        	location.href = server + '/dianxin/alertPublish/inspectionDetail?id='+id+"&type="+type;
        }
        function area1(id){
        	id = $('#area').val();
        	if(id != null && id != '' && id != undefined){
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
        
        function add(){
        	window.location.href="./inspection";
        }
    </script>
</body>
</html>