<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>检查列表</title>
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
                	<font class="black">检查</font>
                	<img src="../images/icon_position_arrow.png" class="pa">
                	
                </div>
            </div>
            <!-- 输入框 -->
            <form action="/dianxin/alertHandel/checkList" id="Form">
            <div class="leadInput">
                 <div class="lineTop">
                    <div class="box">
                     <div class="labelName">分局/大院</div>
                        <select class="selectInput" onclick="area1(this.value)" id="area" name="area_id" >
                        	<option value="">请选择</option>
                        	<c:forEach items="${areaList }" var="p">                     		
                        		<option value="${p.deptid }" <c:if test="${area_id==p.deptid }">selected</c:if>>${p.deptname }</option>
                        	</c:forEach>
                        </select>
                    </div>  
                    <div class="box">
                        <div class="labelName">支局/部门</div>
                        <select class="selectInput"  id="xiaoqu" onclick="xiaoqu1(this.value)" name="bumen">
                        	<option value="">请选择</option>
                        </select>
                    </div>  
                    <div class="box">
                        <div class="labelName">执行人</div>
                        <select class="selectInput" id="deptUser" name="zhixing">
                        	<option value="">请选择</option>
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
<!--                     <th class="persentFourteen">大区</th> -->
<!--                     <th class="persentTwentyThree">小区</th> -->
                    <th class="persentTwenty">部门</th>
                    <th class="persentTwenty">执行人</th>
                    <th class="persentFourteen">地址</th>
                    <th class="persentSixteen">发起时间</th>
<!--                     <th class="persentEighteen state"> -->
<!--                     	<div>状态</div> -->
<!--                     	<img src="../images/icon_xiala.png" alt=""> -->
<!--                     	<ul> -->
<!--                     		<li>未处理</li> -->
<!--                     		<li>已处理</li> -->
<!--                     		<li>处理中</li> -->
<!--                     		<li>有隐患</li> -->
<!--                     		<li>完结</li> -->
<!--                     	</ul> -->
<!--                     </th> -->
                    <th class="persentTwelfth">操作</th>
                </tr>                
               <c:forEach items="${list }" var="p">
                <tr>
                    <td>${p.check_flow_id }</td>
                    <td>${p.deptname }</td>
                    <td>${p.username }</td>
                    <td>${p.address }</td>
                    <td><fmt:formatDate value="${p.createdate}" type="date" pattern="yyyy-MM-dd" /></td>
                    <td class="look" onclick="lookins(${p.check_flow_id })">查看</td>
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
        	$('#alertHandelCheck').addClass('active');
        	open();        
        	var daq = '${area_id}';
        	if(daq != null && daq != '' && daq != undefined && daq != '请选择'){
//         		getstation();
//         		xiaoq = '${bumen}';
//         		if(xiaoq != null && xiaoq != '' && xiaoq != undefined && xiaoq != '请选择'){
//         			dept1();
//         		}
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
        	var bumen = '${bumen}';
        	var zhixing = '${zhixing}';
        	var keyword='${keyword}';
        	$('#sousuo').on('click',function(){
        		$('#Form').submit();
        	});
        	$('.prev').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/checkList?page='+'${page-1}'+'&start_date='+start_date+'&end_date='+end_date+'&bumen='+bumen+'&zhixing='+zhixing+'&area_id='+'${area_id}';
        	});
        	$('.next').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/checkList?page='+'${page+1}'+'&start_date='+start_date+'&end_date='+end_date+'&bumen='+bumen+'&zhixing='+zhixing+'&area_id='+'${area_id}';
        	});
        	$('.no').off('click');
        	$('.goBtn').on('click',function(){
        		location.href = server + '/dianxin/alertHandel/checkList?page='+$('.goBox').html().replace(/[^0-9-]+/,'')+'&start_date='+start_date+'&end_date='+end_date+'&bumen='+bumen+'&zhixing='+zhixing+'&area_id='+'${area_id}';
        	});
        });
        function lookins(id){
         	location.href = server + '/dianxin/alertHandel/checkDetail?id='+id;
         }
       
        function area1(id){
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
        function xiaoqu1(id){
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
        			$('#deptUser').empty();
        				if(msg.user_list != null){
        					var html = '<option value="">请选择</option>';
            				for(var i =0;i<msg.user_list.length;i++){
            					html+='<option value="'+msg.user_list[i].id+'">'+msg.user_list[i].username+'</option>';
            				}
            				$('#deptUser').append(html);
        				}
        		}
        	});
        }
       }
    </script>
</body>
</html>