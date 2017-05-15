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
            <form action="/dianxin/alertHandel/inspectionList" id="Form">
            <div class="leadInput">
                <div class="lineTop">
                    <div class="box">
                        <div class="labelName">分局/大院</div>
                        <select class="selectInput" id="area" onclick="area1(this.value)" name="daqu">
                		<option value="">请选择</option>
                		<c:forEach items="${dList }" var="p">
                			<option value="${p.deptid }" <c:if test="${p.deptid == daqu}">selected="selected"</c:if>>${p.deptname }</option>
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
                        <option value="10" <c:if test="${state == 10}">selected="selected"</c:if>>未执行</option>
                        <option value="14" <c:if test="${state == 14}">selected="selected"</c:if>>正常/按时</option>
                        <option value="11" <c:if test="${state == 11}">selected="selected"</c:if>>有隐患</option>
                        <option value="12" <c:if test="${state == 12}">selected="selected"</c:if>>有隐患/解决</option>
                        <option value="13" <c:if test="${state == 13}">selected="selected"</c:if>>未按时</option>
                		</select>
                    </div>  
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
                    <th class="persentTen">编号</th>
                    <th class="persentFourteen">名称</th>
                    <th class="persentFourteen">大区</th>
                    <th class="persentTwenty">小区</th>
                    <th class="persentTwenty">执行人</th>
                    <th class="persentSixteen">发起时间</th>
                    <th class="persentEighteen state">
                    	<div>状态</div>
                    	<img src="../images/icon_xiala.png" alt="">
                    	<ul>
                    		<li>全部</li>
                    		<li>未处理</li>
                    		<li>已处理</li>
                    		<li>处理中</li>
                    		<li>有隐患</li>
                    		<li>完结</li>
                    	</ul>
                    </th>
                    <th class="persentTwelfth">操作</th>
                </tr>  
                <c:forEach items="${list }" var="p">
                <tr>
                    <td>${p.route_id }</td>
                    <td>${p.name }</td>
                    <td>${p.daqu }</td>
                    <td>${p.xiaoqu }</td>
                    <td>${p.people }</td>
                    <td><fmt:formatDate value="${p.createdate }" type="date" pattern="yyyy-MM-dd" /></td>
                    <td>
                    <c:if test="${p.laststep == 10 }">未执行</c:if>
                    <c:if test="${p.laststep == 11 }">有隐患</c:if>
                    <c:if test="${p.laststep == 12 }">有隐患/解决</c:if>
                    <c:if test="${p.laststep == 13 }">未按时</c:if>
                    <c:if test="${p.laststep == 14 }">正常/按时</c:if>
                    </td>
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
        	$('#alertHandelInspection').addClass('active');
        	open(); 
        	var daq = '${daqu}';
        	if(daq != null && daq != '' && daq != undefined && daq != '请选择'){
        		area1(daq);
        		xiaoq = '${xiaoqu}';
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
        	var keyword='${keyword}';
        	$('#sousuo').on('click',function(){
        		$('#Form').submit();
        	});
        	$('.prev').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/inspectionList?page='+'${page-1}'+'&start_date='+start_date+'&end_date='+end_date+'&daqu='+daqu+'&xiaoqu='+xiaoqu+'&people='+people+'&state='+state;
        	});
        	$('.next').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/inspectionList?page='+'${page+1}'+'&start_date='+start_date+'&end_date='+end_date+'&daqu='+daqu+'&xiaoqu='+xiaoqu+'&people='+people+'&state='+state;
        	});
        	$('.no').off('click');
        	$('.goBtn').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/inspectionList?page='+$('.goBox').html().replace(/[^0-9-]+/,'')+'&start_date='+start_date+'&end_date='+end_date+'&daqu='+daqu+'&xiaoqu='+xiaoqu+'&people='+people+'&state='+state;
        	});
        });
        
        function xiaoqu1(id){
        	var people = '${people}';
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
            					html+='<option value="'+msg.user_list[i].id+'"';
            					if(msg.user_list[i].id-people == 0){
            						html += 'selected="selected"';
            					}
            						html += '>'+msg.user_list[i].username+'</option>';
            				}
            				$('#shebei').append(html);
        				}
        		}
        	});
        }
       }
        function lookins(id,type){
        	location.href = server + '/dianxin/alertHandel/inspectionDetail?id='+id+"&type="+type;
        }
        function area1(id){
        	var xiaoqu = '${xiaoqu}';
        	if(id != null  && id != undefined){
        		if(id == ''){
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
                					html += '<option value="'+msg.list[i].deptid+'"';
                					if(msg.list[i].deptid-xiaoqu == 0){
                						html += 'selected="selected"';
                					}
                					html += '>'+msg.list[i].deptname+'</option>';
                				}
                				$('#xiaoqu').append(html);
            				}
            			}
            		});
        	}
    		
        }
    </script>
</body>
</html>