<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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
                    <font class="gray">用户管理</font>
                    <img src="../images/icon_position_arrow.png" class="pa">   
                    <font class="black">用户</font> 
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
                        <input type="text" class="textInput340 noinit"  value="${username2 }" placeholder="用户名称查询" name="username2">
                        <img src="../images/icon_search_gray.png" class="iconOf340">
                    </div>   
                    <div class="box">
                        <input type="text" class="textInput340 noinit"  value="${mobile }"   placeholder="手机查询" name="mobile">
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
            <table class="wrap">
                <tr date-idtr="1">
                    <th class="username">用户名称</th>
                    <th class="loginid">登录账号</th>
                    <th class="mobile">手机</th>
                    <th class="rolename">角色</th>
                    <th class="deptname">部门</th>
                    <th class="titlename">职务</th>
                    <th class="persentSixteen">操作</th>
                </tr> 
                <c:forEach items="${list }" var="p"> 
                 <input type="hidden"  id="id"  value="${p.id} "/>            
                <tr date-idtr="2">         
                    <td>${p.username}</td>
                    <td>${p.loginid }</td>
                    <td>${p.mobile }</td>
                    <td>${p.rolename }</td>
                    <td>${p.deptname }</td>
                    <td>${p.titlename }</td>
                    <td><a href="./userUpdate?id=${p.id }"  title="编辑" class="update">编辑</a><font class="lineStr">|</font><a href="./deleteUser?id=${p.id }" title="删除">删除</a></td>
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
	 	<!-- 添加模态层 -->
		<div class="modal updateModal" id="addModal" date-idu="" date-idi="">
			<div class="titleWrapper">
				<div class="title">编辑部门</div>
				<img src="../images/button_delete.png">
			</div>
			<div class="contentWrapper">
				<div class="tipInner tipInner27-38">
					<div class="row">
						<div class="box">
							<div class="labelName labelName104">部门名称</div>
							<input type="text"  class="textInput" value="XX部门">
						</div>
						<div class="box">
							<div class="labelName labelName104">上级部门</div>
							<input type="text"  class="selectInput" value="XX部门">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
					</div>
					<div class="row">
						<div class="box">
							<div class="labelName labelName104">所属大区</div>
							<input type="text"  class="textInput" value="西湖区">
						</div>
						<div class="box">
							<div class="labelName labelName104">所属小区</div>
							<input type="text"  class="selectInput" value="文一路">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
					</div>					
					<div class="redTip">请输输入名称</div>
					<div class="grayBox">
						<div class="indu"><img src="../images/point_gray.png" class="point">该员工必须存在员工库里</div>
						<div class="box">
							<input type="text"  class="selectInput146" value="张晓明">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-0-144" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
						<div class="box">
							<input type="text"  class="selectInput146" value="张明">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-0-144" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
						<div class="box">
							<input type="text"  class="selectInput146" value="张晓">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-0-144" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="bottomWrapper">
				<div class="confirm">确定</div>
				<div class="cancel">取消</div>
			</div> -->
		</div>	
		
		<!-- 新增模态层 -->
		<div class="modal updateModal" id="updateModal" date-idu="" date-idi="">
			<div class="titleWrapper">
				<div class="title">编辑部门</div>
				<img src="../images/button_delete.png">
			</div>
			<div class="contentWrapper">
				<div class="tipInner tipInner27-38">
					<div class="row">
						<div class="box">
							<div class="labelName labelName104">部门名称</div>
							<input type="text"  class="textInput" value="XX部门">
						</div>
						<div class="box">
							<div class="labelName labelName104">上级部门</div>
							<input type="text"  class="selectInput" value="XX部门">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
					</div>
					<div class="row">
						<div class="box">
							<div class="labelName labelName104">所属大区</div>
							<input type="text"  class="textInput" value="西湖区">
						</div>
						<div class="box">
							<div class="labelName labelName104">所属小区</div>
							<input type="text"  class="selectInput" value="文一路">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
					</div>					
				
					</div>
				</div>
			</div>
			<!-- <div class="bottomWrapper">
				<div class="confirm">确定</div>
				<div class="cancel">取消</div>
			</div> -->
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
			 
			});	
			
			$('.right').on('click','td .update',function() {
				location.href = server + '/dianxin/user/userUpdate.jsp';
			});
			
			$('.right').on('click','.button',function() {
				location.href = server + '/dianxin/user/userList';
			});
			
			$('.leadTop .button').click(function() {
				location.href = server + '/dianxin/user/userUpdate.jsp';
            });
            var username2 = '${username2}';
            var mobile = '${mobile}';
            $('.prev').on('click',function(){
                location.href = server +  '/dianxin/user/userList?page='+'${page-1}'+'&username='+username2+'&mobile='+mobile;
            });
            
            $('.next').on('click',function(){
                location.href = server +  '/dianxin/user/userList?page='+'${page+1}'+'&username='+username2+'&mobile='+mobile;
            });
            
            $('.no').off('click');
            
            $('.goBtn').on('click',function(){
                location.href = server +  '/dianxin/user/userList?page='+$('.goBox').html().replace(/[^0-9-]+/,'')+'&username2='+username2+'&mobile='+mobile;
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
        	//location.href = server + '/dianxin/user/userUpdate';
        	 location.href = server +  '/dianxin/user/userList?page='+'${page+1}'+'&username='+username2+'&mobile='+mobile;
        } 
			
			
      
    </script>
</body>
</html>