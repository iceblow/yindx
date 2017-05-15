<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>辖区</title>
<link href="../css/foundation-datepicker.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css/right.css">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=rgbCiTGtXE5l7yXtxwlTjPtresDqVfiY"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
</head>
<style>
#allmap{
	width:80%;
	height:600px;
	margin:30px 10%;
}
.main_div{
	margin-left: 10%;
}
#stationName{
	font-size: 20px;
}
.box{
	margin-left: 20px;
	display: flex;
}
.labelName{
	line-height: 34px;
}
#submit{
	margin-left: 20px;
	margin-top: 7px;
}
</style>
<body>
	<!-- 右边主要内容 -->
    <div class="right">
        <!-- 头部 -->
        <div class="wrapperTop">
        
        	<!-- 输入框 -->
            <form id="searchForm" action="./userArea" method="post">
            <div class="leadInput">
                <div class="lineTop">
                    <div class="box">
                        <div class="labelName">分局/大院</div>
                        <select class="selectInput" id="area" name="area_id" onclick="area11(this.value)">
                		<option value="">请选择</option>
                		<c:forEach items="${areaList }" var="p">
                			<option value="${p.deptid }">${p.deptname }</option>
                		</c:forEach>
               			 </select>
                    </div>  
                    <div class="box">
                        <div class="labelName">支局/部门</div>
                        <select class="selectInput"  id="xiaoqu" name="xiaoqu">
                	</select>
                    </div> 
                    <!-- 搜索按钮 -->
                    <div class="button" onclick="submitSearchForm()">搜索</div> 
                </div>
            </div></form>
        
            <!-- 当前页面 -->
            <div id="allmap"></div>
            
            <c:if test="${not empty range }">
            <div class="main_div">
            	<div style="margin-bottom: 20px;">
            		<label id="stationName">${range.station_name }</label>
            	</div>
            	<form  action="" method="post" id="checkForm">
	            	<input type="hidden" name="station_id" id="station_id" class="noinit" value="${range.station_id }">
	            	<input type="hidden" name="station_name" id="station_name" class="noinit" value="${range.station_name }">
	            	<div class="box">
	            		<div class="labelName">第一责任人：</div>
	            		<select class="selectInput" name="user_id1" id="user_id1" onchange="changeselect(1)">
	            			<option value="">请选择</option>
	            			<c:forEach items="${userList }" var="p">
	            				<option value="${p.id }">${p.username }</option>
	            			</c:forEach>
	            		</select>
	            		<input type="hidden" name="user_name1" id="user_name1" class="noinit">
	            	</div>
	            	<div class="box">
	            		<div class="labelName">第二责任人：</div>
	            		<select class="selectInput" name="user_id2" id="user_id2" onchange="changeselect(2)">
	            			<option value="">请选择</option>
	            			<c:forEach items="${userList }" var="p">
	            				<option value="${p.id }">${p.username }</option>
	            			</c:forEach>
	            		</select>
	            		<input type="hidden" name="user_name2" id="user_name2" class="noinit">
	            	</div>
	            	<div class="box">
	            		<div class="labelName">第三责任人：</div>
	            		<select class="selectInput" name="user_id3" id="user_id3" onchange="changeselect(3)">
	            			<option value="">请选择</option>
	            			<c:forEach items="${userList }" var="p">
	            				<option value="${p.id }">${p.username }</option>
	            			</c:forEach>
	            		</select>
	            		<input type="hidden" name="user_name3" id="user_name3" class="noinit">
	            	</div>
	            	<input class="button" type="button" value="提交" id="submit" onclick="submitForm()">
	            </form>
            </div>
            </c:if>
        </div>
	</div>
	<c:forEach items = "${range.rangeList }" var="p">
	<div class="stationpoin" style="dispaly:none">
	<input type="hidden" id="lon" value="${p.longitude }">
	<input type="hidden" id="lat" value="${p.latitude }">
	</div>
	</c:forEach>
    <div class="wrapperModal" style="display:none;"></div>
    <jsp:include page="../common/common.jsp" />
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/foundation-datepicker.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){   
        	$('#userArea').addClass('active');
        	open();        
        	
        	if ('${area_id}' != null && '${area_id}' != '') {
	        	$('#area').val('${area_id}');
	        	area11($('#area').val());
	        	$('#xiaoqu').val('${xiaoqu}');
        	}
        });
        
        function changeselect(a){
        	if ($('#user_id'+a).val() != '') {
        		$('#user_name'+a).val($('#user_id'+a+' option:selected').text());
        	}
        }
        
        function submitForm(){
        	console.log($('#station_id').val());
        	console.log($('#station_name').val());
        	$.ajax({
        		url: '/dianxin/user/saveStationCheck',
        		data: $('#checkForm').serialize(),
        		type: 'POST',
        		success: function(msg){
        			var data = eval('('+msg+')');
        			if (data.code == 1) {
        				alert(data.message);
        				window.location.reload();
        			} else {
        				alert(data.message);
        				return;
        			}
        		}
        	})
        }
        
    	// 百度地图API功能
    	var map = new BMap.Map("allmap");
    	var point = new BMap.Point('${plon}', '${plat}');
    	map.centerAndZoom(point, 15);
      	map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
    	
    	
    	function add_oval() {
        	var assemble=new Array();
        	$(".stationpoin").each(function(){
        		var longitude = $(this).find("#lon").val();
        		var latitude = $(this).find("#lat").val();
        		var	dot = new BMap.Point(longitude, latitude);
        		assemble.push(dot);
        	})

    		return assemble;
    	}
		
		function attribute(){
// 			$('#stationName').text(this.sname);
// 			$('#station_name').val(this.sname);
// 			$('#station_id').val(this.sid);
			var station_id = $("#xiaoqu").val();
			$.ajax({
				url: '/dianxin/user/getStationCheck',
				type: 'POST',
				data: {
					station_id: station_id
				},
				success: function(msg){
					var data = eval('('+msg+')');
					for (var i=0 ; i<data.length ; i++) {
						if (data[i].seq == 1) {
							$('#user_id1').val(data[i].user_id);
							changeselect(1);
						} else if (data[i].seq == 2) {
							$('#user_id2').val(data[i].user_id);
							changeselect(2);
						} else {
							$('#user_id3').val(data[i].user_id);
							changeselect(3);
						}
						$('.main_div').show();
					}
				}
			})
			
		}
		
		$(function(){
				var oval = new BMap.Polygon(add_oval(),{strokeColor:'rgb(0,100,200)',fillColor:'rgb(0,100,200)', strokeWeight:1, strokeOpacity:0.5});
				map.addOverlay(oval);
// 			var list = '${list}';
// 			var data = eval('('+list+')');
// 			for (var i=0; i<data.length ; i++) {
// 				var oval = new BMap.Polygon(add_oval(data[i].rangeList),{strokeColor:'rgb(0,100,200)',fillColor:'rgb(0,100,200)', strokeWeight:1, strokeOpacity:0.5});
// 				oval.sid = data[i].station_id;
// 				oval.sname = data[i].station_name;
// 				oval.addEventListener("click",attribute);
// 				console.log(data[i].rangeList);
// 				console.log(data[i].station_id);
// 	    		map.addOverlay(oval);
// 			}
				attribute();
    	});
		
		function area11(id){
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
		
		function submitSearchForm(){
			if (!$('#xiaoqu').val()) {
				alert("请选择辖区");
				return;
			}
			$('#searchForm').submit();
		}
    </script>
</body>
</html>