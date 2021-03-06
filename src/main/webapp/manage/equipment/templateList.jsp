<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模板设置</title>
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
                	<font class="black">模板设置</font> 
                </div>
            </div>
             <form id="searchForm"  method="post">
            <!-- 输入框 -->
            <div class="leadInput">
                <div class="lineTop">
                    <div class="box">
                        <div class="labelName">设备类型</div>
		                <select class="selectInput" data-value="${typeid }" name="typeid">
		                	<option value="">请选择</option>
		                	<c:forEach items="${deviceList }" var="p">
		                		<option value="${p.typeid }">${p.typename }</option>
		                	</c:forEach>
		                </select>
                    </div> 
<!--                     <div class="box"> -->
<!--                         <div class="labelName">小分类</div> -->
<!--                         <input type="text" class="selectInput" readonly="readonly" unselectable="on"> -->
<!--                         <img src="../images/arrowdown.png" alt="" class="arrowdown"> -->
<!--                         列表 -->
<!--                         <ul class="dropcontent" style="display:none;"> -->
<!--                             <li>111</li> -->
<!--                             <li>222</li> -->
<!--                             <li>333</li> -->
<!--                         </ul> -->
<!--                     </div>   -->
                    <div class="box">
                        <input type="text" class="textInput340 noinit" value="${name }" placeholder="模板名称查询" name="name">
                        <img src="../images/icon_search_gray.png" class="iconOf340">
                    </div>   
                     
                    <!-- 搜索按钮 -->
                    <div class="button" onclick="submitForm()">搜索</div>          
                </div>
                <div class="lineBottom lineBottomBig">
                   
                   
                     
                    <!-- 搜索按钮 -->
                    <div class="button" onclick="addto()">新增</div>
                </div>
            </div>
            </form>
        </div>
        <!-- 数据表格 -->
        <div class="wrapperMain">
            <!-- 表格 -->
            <table>
                <tr>
                    <th class="persentNine">编号</th>
                    <th class="persentThirteen">模板名称</th>
                    <th class="persentThirteen">设备名称</th>
                    <th class="persentThirteen">创建时间</th>
<!-- 					<th class="persentNine">创建人</th> -->
                    <th class="persentTwentySix ">备注</th>
                    <th class="persentSeventeen">操作</th>
                </tr>    
                <c:forEach items="${list }" var="p">               
                <tr>
                    <td>${p.template_id }</td>
                    <td>${p.name }</td>
                    <td>${p.typename }</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${p.createdate}" /></td>
<!--                <td>张晓明</td> -->
                    <td>${p.topic }</td>
                   
              		<td>
<!--               			<a href="#" class="look">查看</a> -->
<!--               			<font class="lineStr">|</font> -->
                        <a href="editTemplate?template_id=${p.template_id }" class="update">编辑</a>
                        <font class="lineStr">|</font><a href="#" onclick="delTemplate(${p.template_id})" >删除</a>
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
        	$('#equipmentTemplateList').addClass('active');
        	open();     
        	
        	$('.leftNav ul .active').parent().prev().find('.fanhui').css('margin-top','22px');
        	
        	$('.right tr:gt(0)').each(function(index,el) {
	    		$(el).find('td:eq(5)').each(function(index,elm) {
	    			$(elm).css('text-align','left');
	    		});
	    	}); 
        	$("select").each(function(){
        		var value = $(this).attr("data-value");
        		if(value){
        			$(this).val(value);
        		}
        	})
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
			
			$('.right').on('click','td .update',function() {
				location.href = server + '/for/equipment/templateUpdate.jsp';
			});
			
			$('.right').on('click','td .look',function() {
				location.href = server + '/for/equipment/templateDetail.jsp';
			});
			
			$('.leadTop .button').click(function() {
				location.href = server + '/for/equipment/templateAdd.jsp';
			});
			var name = '${name}';
			var typeid = '${typeid}';
			$('.prev').on('click',function(){
        		location.href = server + '/dianxin/equipment/templateList?page='+'${page-1}'+'&name='+name+'&typeid='+typeid;
        	});
        	
        	$('.next').on('click',function(){
        		location.href = server + '/dianxin/equipment/templateList?page='+'${page+1}'+'&name='+name+'&typeid='+typeid;
        	});
        	
        	$('.no').off('click');
        	
        	$('.goBtn').on('click',function(){
        		location.href = server + '/dianxin/equipment/templateList?page='+$('.goBox').html().replace(/[^0-9-]+/,'')+'&name='+name+'&typeid='+typeid;
        	});
        });
        
        function submitForm(){
        	$('#searchForm').submit();
        }
        
        function delTemplate(template_id){
        	if(confirm("是否删除模板?")){
        		$.ajax({
            		url:'./delTemplate',
        			data:{template_id:template_id},
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
        function addto(){
				location.href = server + './editTemplate';
        }
    </script>
</body>
</html>