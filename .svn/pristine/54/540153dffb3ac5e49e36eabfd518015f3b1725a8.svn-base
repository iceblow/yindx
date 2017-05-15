<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设备查看</title>
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
                	<font class="gray">设备管理</font>
                	<img src="../images/icon_position_arrow.png" class="pa">   
                	<font class="black">设备查看</font> 
                </div>
            </div>
             <form id="searchForm" action="./equipment" method="post">
            <!-- 输入框 -->
            <div class="leadInput">
                <div class="lineTop">
                    <div class="box">
                        <div class="labelName">分局/大院</div>
		                <select class="selectInput" onchange="getstation()" id="area" data-value="${ss_id }" name="ss_id">
		                	<option value="">请选择</option>
		                	<c:forEach items="${dList }" var="p">
                			<option value="${p.deptid }">${p.deptname }</option>
                		</c:forEach>
		                </select>
                    </div>  
                    <div class="box">
                        <div class="labelName">支局/部门</div>
                         <select class="selectInput" id="station" data-value="${station_id }" name="station_id">
		                	<option value="">请选择</option>
		                </select>
                    </div>  
                    <div class="box">
                        <div class="labelName">设备类型</div>
		                <select class="selectInput"  name="typeid" data-value="${typeid }">
		                	<option value="">请选择</option>
		                	<c:forEach items="${deviceList }" var="p">
		                		<option value="${p.typeid }">${p.typename }</option>
		                	</c:forEach>
		                </select>
                    </div> 
                    <!-- 搜索按钮 -->
                    <div class="button" onclick="add()">新增</div>          
                </div>
                <div class="lineBottom lineBottomBig">
                    <div class="box">
                		<div class="labelName">关键字</div>
                        <input type="text" class="textInput340 noinit"  placeholder="设备名称模糊查询"  name="name" value="${name }">
                        <img src="../images/icon_search_gray.png" class="iconOf340">
                    </div> 
                   
<!--                     <div class="box"> -->
<!--                         <div class="labelName">状态</div> -->
<!--                         <input type="text" class="selectInput" readonly="readonly" unselectable="on"> -->
<!--                         <img src="../images/arrowdown.png" alt="" class="arrowdown"> -->
<!--                         列表 -->
<!--                         <ul class="dropcontent" style="display:none;"> -->
<!--                             <li>111</li> -->
<!--                             <li>222</li> -->
<!--                             <li>333</li> -->
<!--                         </ul> -->
<!--                     </div>   -->
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
                    <th class="persentSeven">编号</th>
                    <th class="persentFifteen">设备名称</th>
                    <th class="persentNine">大区</th>
                    <th class="persentNine">小区</th>
                    <th class="persentEleven">类型</th>
                    <th class="persentSeventeen">地址</th>
                    <th class="persentSeven state">
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
                    <th class="persentSixteen">操作</th>
                </tr>
                 <c:forEach items="${list }" var="p">                
                <tr>
                    <td>${p.device_id }</td>
                    <td>${p.name }</td>
                    <td>${p.ss_name }</td>
                    <td>${p.station_name }</td>
                    <td>${p.typename }</td>
                    <td>${p.address }</td>
                    <td><c:if test="${p.status==0 }">启用</c:if><c:if test="${p.status==1 }">停用</c:if></td>
              		<td>
                        <a href="./editAquipment?device_id=${p.device_id }" class="look">编辑</a>
                        <font class="lineStr">|</font><a href="#" onclick="delAuipment(${p.device_id})">删除</a>
                    </td>
                </tr>
                </c:forEach>
            </table>
       		 <!-- 页码 -->
	        <div class="pageWrapper">
	       		<div class="pageBox">
	       			<div class="<c:if test="${page == 1 }">no</c:if> prev">上一页</div>
	       			<div class="curr">${page }</div>
	       			<div class="next <c:if test="${page == total }">no</c:if>">下一页</div>
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
        	$('#equipmentEquipment').addClass('active');
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
        	
        	$("select").each(function(){
        		var value = $(this).attr("data-value");
        		if(value){
        			$(this).val(value);
        		}
        		if($(this).attr("id")=="area"){
        			getstation();
        		}
        	})
        	
        	$('.right').on('click','.look',function() {
        		location.href = server + '/for/equipment/equipmentUpdate.jsp';
        	});
        	
        	
        	//搜索框获得焦点
			$('.textInput340').focusin(function() {	
				$(this).val('');
				$(this).css('color','#999');
				$(this).next().attr('src','../images/icon_search_after.png');
			});
			
			//搜索框失去焦点
			$('.textInput340').focusout(function() {
// 				if($(this).val() == '') {					
// 					$(this).val('公告关键字查询');						
// 				} 
// 				$(this).css('color','#999');	
// 				$(this).next().attr('src','../images/icon_search_gray.png');
			});	
			
        });
        
        function add(){
    		location.href = './editAquipment';
    	};
    	
    	 function submitForm(){
         	$('#searchForm').submit();
         }
        
        
        function getstation(){
        	var id = $('#area').val();
        	if(id){
        		var Url = server + '/dianxin/alertHandel/getstation';
            	$.ajax({
            		url: Url,
            		data: {id:id},
            		type: 'POST',
            		success: function(msg){
            			var html='<option value="">请选择</option>';
            			var date = eval('('+msg+')');
            			for (var i=0; i < date.list.length ; i++){
            				html+='<option value="'+date.list[i].station_id+'">'+date.list[i].station_name+'</option>';
            			}
            			$('#station').html(html);
            		}
            	})
        	}
        }
        
        function delAuipment(device_id){
        	if(confirm("删除设备?")){
        		$.ajax({
        			url:'./delAquipment',
        			data:{device_id:device_id},
        			type:'post',
        			dataType:'json',
        			success:function(msg){
        				if(msg.code==0){
        					alert(msg.message);
        				}else{
        					alert("删除成功!");
        					window.location.reload();
        				}
        			}
        		})
        	}
        }
        
        function getstation(){
        	var id = $('#area').val();
        	var Url = server + '/dianxin/alertPublish/getDept2';
        	$.ajax({
        		url: Url,
        		data: {id:id},
        		type: 'POST',
        		success: function(msg){
        			$('#station').empty();
        			var html='<option value="">请选择</option>';
        			var date = eval('('+msg+')');
    				for(var i =0;i<date.list.length;i++){
    					html += '<option value="'+date.list[i].deptid+'">'+date.list[i].deptname+'</option>';
    				}
        			$('#station').html(html);
        		}
        	})
        }
    </script>
</body>
</html>