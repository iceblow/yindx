<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门</title>
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
                	用户管理
                	<font class="black">部门</font>
                	<img src="../images/icon_position_arrow.png" class="pa">                	
                </div>
            </div>
            <!-- 输入框 -->
            <div class="leadInput">
                <div class="lineTop">                    
                    <div class="box">
                        <div class="labelName">大区</div>
                        <input type="text" class="selectInput" readonly="readonly">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                        <!-- 列表 -->
                        <ul class="dropcontent" style="display:none;">
                            <li>111</li>
                            <li>222</li>
                            <li>333</li>
                        </ul>
                    </div> 
                    <div class="box">
                        <div class="labelName">时间</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>  
                    <div class="box">
                        <div class="labelNameTime">至</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>  
                    
                    <!--按钮 -->
                    <div class="button">新增</div>
                </div>
                <div class="lineBottom lineBottomBig">
                	<div class="box">
                		<div class="labelName">关键字</div>
                        <input type="text" class="textInput340" value="公告关键字查询">
                        <img src="../images/icon_search_gray.png" class="iconOf340">
                    </div> 
                    <!-- 搜索按钮 -->
                    <div class="button">搜索</div>
                </div>
            </div>
        </div>
        <!-- 数据表格 -->
        <div class="wrapperMain">
            <!-- 表格 -->
            <table class="wrap">
                <tr date-idtr="1">
                    <th class="persentEight">编号</th>
                    <th class="persentTen">大区</th>
                    <th class="persentTen">小区</th>
                    <th class="persentTen">辖区</th>
                    <th class="persentTwenty">部门</th>
                    <th class="persentFortyFive"></th>
                    <th class="persentSixteen">操作</th>
                </tr>                
                <tr date-idtr="2">
                    <td>01</td>
                    <td>拱墅区</td>
                    <td>祥园路</td>
                    <td>XX</td>
                    <td>XX部门</td>
                    <td></td>
                    <td><a title="编辑" class="update">编辑</a><font class="lineStr">|</font><a title="删除">删除</a></td>
                </tr>
               <tr date-idtr="3">
                    <td>02</td>
                    <td>拱墅区</td>
                    <td>祥园路</td>
                    <td>XX</td>
                    <td>XX部门</td>
                    <td></td>
                    <td><a title="编辑" class="update">编辑</a><font class="lineStr">|</font><a title="删除">删除</a></td>
                </tr>
                <tr date-idtr="4">
                    <td>03</td>
                    <td>拱墅区</td>
                    <td>祥园路</td>
                    <td>XX</td>
                    <td>XX部门</td>
                    <td></td>
                    <td><a title="编辑" class="update">编辑</a><font class="lineStr">|</font><a title="删除">删除</a></td>
                </tr>
                <tr date-idtr="4">
                    <td>04</td>
                    <td>拱墅区</td>
                    <td>祥园路</td>
                    <td>XX</td>
                    <td>XX部门</td>
                    <td></td>
                    <td><a title="编辑" class="update">编辑</a><font class="lineStr">|</font><a title="删除">删除</a></td>
                </tr>
                <tr date-idtr="6">
                    <td>05</td>
                    <td>拱墅区</td>
                    <td>祥园路</td>
                    <td>XX</td>
                    <td>XX部门</td>
                    <td></td>
                    <td><a title="编辑" class="update">编辑</a><font class="lineStr">|</font><a title="删除">删除</a></td>
                </tr>
                <tr date-idtr="7">
                    <td>06</td>
                    <td>拱墅区</td>
                    <td>祥园路</td>
                    <td>XX</td>
                    <td>XX部门</td>
                    <td></td>
                    <td><a title="编辑" class="update">编辑</a><font class="lineStr">|</font><a title="删除">删除</a></td>
                </tr>
                <tr date-idtr="8">
                    <td>07</td>
                    <td>拱墅区</td>
                    <td>祥园路</td>
                    <td>XX</td>
                    <td>XX部门</td>
                    <td></td>
                    <td><a title="编辑" class="update">编辑</a><font class="lineStr">|</font><a title="删除">删除</a></td>
                </tr>
            </table>
       		 <!-- 页码 -->
	        <div class="pageWrapper">
	       		<div class="pageBox">
	       			<div class="no prev">上一页</div>
	       			<div class="curr">1</div>
	       			<div class="next">下一页</div>
	       			<img src="../images/shuxin1X25.png" alt="" class="shuxin">
	       			<div class="skip">跳转至</div>
	       			<div class="goBox" contenteditable="true">1</div>
	       			<div class="goBtn">GO</div>
	       			<div class="detailP">当前第<font>1</font>页/共<font>22页</font></div>
	       		</div>
	        </div>
       </div>   
	 	<!-- 编辑模态层 -->
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
							<input type="text"  class="selectInput" value="XX部门" readonly="true">
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
							<input type="text"  class="selectInput" value="文一路" readonly="true">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
					</div>					
					<div class="redTip redTipt">请输入名称</div>
					<div class="redTip redTips">请选择名称</div>
					<div class="grayBox">
						<div class="indu"><img src="../images/point_gray.png" class="point">该员工必须存在员工库里</div>
						<div class="box">
							<input type="text"  class="selectInput146" value="张晓明" readonly="true">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-0-144" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
						<div class="box">
							<input type="text"  class="selectInput146" value="张明" readonly="true">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-0-144" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
						<div class="box">
							<input type="text"  class="selectInput146" value="张晓" readonly="true">
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
			<div class="bottomWrapper">
				<div class="confirm">确定</div>
				<div class="cancel">取消</div>
			</div>
		</div>	
		<!-- 新增模态层 -->
		<div class="modal updateModal" id="addModal" date-idu="" date-idi="">
			<div class="titleWrapper">
				<div class="title">新增部门</div>
				<img src="../images/button_delete.png">
			</div>
			<div class="contentWrapper">
				<div class="tipInner tipInner27-38">
					<div class="row">
						<div class="box">
							<div class="labelName labelName104">部门名称</div>
							<input type="text"  class="textInput" >
						</div>
						<div class="box">
							<div class="labelName labelName104">上级部门</div>
							<input type="text"  class="selectInput" readonly="true">
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
							<input type="text"  class="textInput">
						</div>
						<div class="box">
							<div class="labelName labelName104">所属小区</div>
							<input type="text"  class="selectInput" readonly="true">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
					</div>					
					<div class="redTip redTipt">请输入名称</div>
					<div class="redTip redTips">请选择名称</div>
					<div class="grayBox">
						<div class="indu"><img src="../images/point_gray.png" class="point">该员工必须存在员工库里</div>
						<div class="box">
							<input type="text"  class="selectInput146" readonly="true">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-0-144" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
						<div class="box">
							<input type="text"  class="selectInput146" readonly="true">
							<img src="../images/arrowdown.png" alt="" class="arrowdown">
	                        <!-- 列表 -->
	                        <ul class="dropcontent dropcontent36-0-144" style="display:none;">
	                            <li>111</li>
	                            <li>222</li>
	                            <li>333</li>
	                        </ul>
						</div>
						<div class="box">
							<input type="text"  class="selectInput146" readonly="true">
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
			<div class="bottomWrapper">
				<div class="confirm">确定</div>
				<div class="cancel">取消</div>
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
        	$('#userDepartment').addClass('active');
        	open();        
        	/* $('.wrap tr:gt(0)').each(function(index,el) {
        		$(el).find('td:eq(4)').each(function(index,elm) {
        			$(elm).css('text-align','left');
        		});
        	}); */
        	
        	
        	//搜索框获得焦点
			$('.textInput340').focusin(function() {	
				$(this).val('');
				$(this).css('color','#474747');
				$(this).next().attr('src','../images/icon_search_after.png');
			});
			
			//搜索框失去焦点
			$('.textInput340').focusout(function() {
				if($(this).val() == '') {					
					$(this).val('公告关键字查询');						
				} 
				$(this).css('color','#999');	
				$(this).next().attr('src','../images/icon_search_gray.png');
			});	
			
			$('.right').on('click','td .update',function() {
				position('updateModal');
        		$('#updateModal').show();
        		$('.wrapperModal').show();
        		$('#updateModal').attr('date-idu',$(this).parents('tr').attr('date-idtr'));
			});
			
			$('.right').on('click','.button',function() {
				position('addModal');
        		$('#addModal').show();
        		$('.wrapperModal').show();
        		$('#addModal .textInput').val('请输入');
        		$('#addModal .selectInput').val('请选择');
        		$('#addModal .selectInput146').val('请选择');
			});
			
			$('.modal .confirm').click(function() { 
				var count = 0;
				var scount = 0;
				$(this).parents('.modal').find('.textInput').each(function(index,el) {
					if($(el).val() == '' || $(el).val() == '请输入'){
						count ++;
					}
				});				
				$(this).parents('.modal').find('.selectInput').each(function(index,el) {
					if($(el).val() == '请选择'){
						scount ++;
					}
				});
				$(this).parents('.modal').find('.selectInput146').each(function(index,el) {
					if($(el).val() == '请选择'){
						scount ++;
					}
				});
				if(count != 0){
					$('.redTipt').show();
					console.log(11);
				} else {
					if(scount != 0){					
	            		$('.redTips').show();
	            		$('.redTipt').hide();
	            		console.log(22);
					} else {
						$('.modal').hide();
	            		$('.wrapperModal').hide();
	            		$('.redTipt').hide();
	            		$('.redTips').hide();
	            		console.log(33);
					}
				}
        	});
        });     
        
    </script>
</body>
</html>