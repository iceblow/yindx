<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>巡检发布</title>
<link href="../css/foundation-datepicker.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css/right.css">
<link rel="stylesheet" type="text/css" href="../css/equipment.css">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=rgbCiTGtXE5l7yXtxwlTjPtresDqVfiY"></script>
<!-- <script type="text/javascript" src="../js/ajaxfileupload.js"></script> -->
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
                	告警处理发布
                	<font class="black">巡检发布</font>
                	<img src="../images/icon_position_arrow.png" class="pa">                	
                </div>
            </div>           
        </div>	
        <div class="lineBox lineBox45_22">
        	<div class="lineLabel">名称</div>
        	<input type="text" class="ltextInput" id="title">
        	<div class="location">
        		<img src="../images/icon_map.png">地点
        	</div>
        	<div class="locationText">
        		<img src="../images/icon_map.png">
        	</div>
        </div>
        <div class="lineBox lineBox0_34">
        	<div class="lineLabel">描述</div>
        	<textarea class="bigtext" name="describe" id="describe"></textarea>
        </div>
        <div class="lineBox lineBox30_33">
        	<div class="box">
                <div class="labelName89 ln">分局/大院</div>
               <select class="selectInput" id="area" onclick="area(this.value)">
                	<option value="">请选择</option>
                	<c:forEach items="${areaList }" var="p">
                			<option value="${p.deptid }">${p.deptname }</option>
                	</c:forEach>
                </select>
            </div>  
            <div class="box">
                <div class="labelName70 ln">支局/部门</div>
				<select class="selectInput"  id="xiaoqu" onclick="xiaoqu(this.value)">
                </select>
            </div>  
            <div class="box">
                <div class="labelName76 ln" name="shebei">执行人</div>
				<select class="selectInput"  id="shebei">
                </select>
            </div> 
            <div class="box">
                <div class="labelName65 ln" name="type">设备类型</div>
				<select class="selectInput"  id="type" onclick="types(this.value)">
				<option value="">请选择</option>
				<c:forEach items="${deviceList }" var="p">
                		<option value="${p.typeid }" data-name="${p.typename }">${p.typename }</option>
                	</c:forEach>
                </select>
            </div>
               <div class="box">
                <div class="labelName65 ln" name="device">设备模板</div>
				<select class="selectInput"  id="device" onclick="model(this.value)">
                </select>
            </div>  
        </div>
        <div class="lineBox lineBox30_30">
        </div>
        <div class="lineBox lineBox32_30">
        	<div class="box">
                <div class="ln labelName89">频次</div>
                <select class="selectInput" id="frequency">
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
            <div class="box">
                <div class="ln labelName136">接单时间 </div>
                <input type="text" class="textInput179" id="receivetime">分
            </div>  
            <div class="box">
                <div class="ln labelName112">处理时间 </div>
                <input type="text" class="textInput179" id="resolvetime">分
            </div> 
        </div>
        <div class="lineBox lineBox56_90">
        	<div class="iconcel">取消</div>
        	<div class="ipublish">发布</div>
        </div>
        <div class="mask" style="display:none;"></div>
        <!-- 地图弹窗 -->
		<div id="box_detail" class="alert" style="display: none;">
		<div style="height:40px;line-height:40px;padding-left:22px;background-color:#f5f6fa">
		地址定位
		<img style='float:right;' src="../images/delete_black.png"  onclick="hiddenAlert()">
		</div>
		<div style="margin-top:15px;height:30px;">
			<input type="text" class="form-control"  id="address" name="address" value="${route.address }" style="float:left;width: 550px; height: 30px;margin-left:10px; padding-left:5px; ">
			<button type="button" class="btn btn-primary detail_location" style="float:right;height:30px;margin-right:10px;width:75px;background-image: none;" aria-haspopup="true" aria-expanded="false" onclick="sureAlert()">确定</button>
			<button type="button" class="btn btn-primary detail_location" style="float:right;height:30px;margin-right:10px;width:75px;background-image: none;" aria-haspopup="true" aria-expanded="false" onclick="searchWord()">搜索</button>
			<input type="hidden"  id="longitude" name="longitude" value="">
			<input type="hidden"  id="latitude" name="latitude" value="">
		</div>  
		<div style="position: relative;margin-top:15px;">
			<div id="l-map" class="l-map" style="width:1000px;border: 1px solid #e8e8e8;margin: 10px;"></div>
			<div id="r-result"></div>
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
        	var height = document.documentElement.clientHeight-300;
        	$("#l-map").height(height);
        	$('.location').click(function() {
//         		$('.locationText').show();
        		showalert();
        	});
        	
        	$('.itemul li').off("click");
        	
        	$('.iconcel').click(function() {
        		location.href = server + '/dianxin/alertPublish/inspectionList';
        	});
        	$('.ipublish').click(function() {
        		longitude = $("#longitude").val();
        		latitude = $("#latitude").val();
        		address = $("#address").val();
        		var title = $('#title').val().trim();
        		var miaoshu = $('#describe').val().trim();
        		var daqu = $('#area').val().trim();
        		var xiaoqu = $('#xiaoqu').val();
        		var shebei = $('#shebei').val();
        		var type = $('#type').val().trim();
        		var typename = $('#type').attr("data-name");
        		var device = $('#device').val();
        		var pinci = $('#frequency').val().trim();
        		var jiedan = $('#receivetime').val().trim();
        		var chuli = $('#resolvetime').val().trim();
        		var itms = "";
        		$('.lineBox30_30').find('.item').each(function(index,el){
        			$(el).find('li').each(function(ind,elm){
        				if($(elm).find('img').attr('src') == '../images/selected.png'){
        					itms += $(elm).find('img').attr('idto')+",";
        				}
        			})
        		})
	 		if(address == null || address == '' || address == undefined || address == '请输入'){
        			alert('地址不能为空');
        			return;
        		} 
			if(title == null || title == '' || title == undefined || title == '请选择'){
        			alert('名称不能为空');
        			return;
        		}
			if(miaoshu == null || miaoshu == '' || miaoshu == undefined || miaoshu == '请选择'){
        			alert('描述不能为空');
        			return;
        		}
			if(daqu == null || daqu == '' || daqu == undefined || daqu == '请选择'){
        			alert('大区不能为空');
        			return;
        		}
			if(xiaoqu == null || xiaoqu == '' || xiaoqu == undefined || xiaoqu == '请选择'){
        			alert('小区不能为空');
        			return;
        		}
			if(shebei == null || shebei == '' || shebei == undefined || shebei == '请选择'){
        			alert('执行人不能为空');
        			return;
        		}
			if(type == null || type == '' || type == undefined || type == '请选择'){
        			alert('设备类型不能为空');
        			return;
        		}
			if(device == null || device == '' || device == undefined || device == '请选择'){
        			alert('设备模板不能为空');
        			return;
        		}
			if(pinci == null || pinci == '' || pinci == undefined || pinci == '请选择'){
        			alert('频次不能为空');
        			return;
        		}
			if(jiedan == null || jiedan == '' || jiedan == undefined || jiedan == '请选择'){
        			alert('接单时间不能为空');
        			return;
        		}
			if(chuli == null || chuli == '' || chuli == undefined || chuli == '请选择'){
        			alert('处理时间不能为空');
        			return;
        		}
			if(itms.length == 0){
        			alert('分类不能为空');
        			return;
        		}
			
			$.ajax({
        		url: server +'/dianxin/alertPublish/addInspection',
        		data: {title:title,miaoshu:miaoshu,daqu:daqu,xiaoqu:xiaoqu,shebei:shebei,type:type,typename:typename,device:device,
        			pinci:pinci,jiedan:jiedan,chuli:chuli,itms:itms,longitude:longitude,latitude:latitude,address:address},
        		type: 'POST',
        		success: function(msg){
        			msg = eval('('+msg+')');
        			if(msg.code == 0){
        				alert("添加成功");
        				window.location.href="./inspectionList";
        			}else{
        				alert("添加失败");
        			}
        		}
        		});
			
			
        	});
        });
        function area(id){
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
        function xiaoqu(id){
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
        function types(id){
        	if(id != null && id != '' && id != undefined){
    		$.ajax({
        		url: server +'/dianxin/alertPublish/type',
        		data: {id:id},
        		type: 'POST',
        		success: function(msg){
        			msg = eval('('+msg+')');
        			if(msg.code == 0){
        				$('#device').empty();
        				if(msg.templates != null){
        					var html = '<option value="">请选择</option>';
            				for(var i =0;i<msg.templates.length;i++){
            					html += '<option value="'+msg.templates[i].template_id+'">'+msg.templates[i].name+'</option>';
            				}
            				$('#device').append(html);
        				}
        			}else{
        				alert('查询失败');
        				return;
        			}
        		}
        	});
        }
        }
        function model(id){
        	if(id != null && id != '' && id != undefined){
    		$.ajax({
        		url: server +'/dianxin/alertPublish/model',
        		data: {id:id},
        		type: 'POST',
        		success: function(msg){
        			msg = eval('('+msg+')');
        			if(msg.code == 0){
        				$('.lineBox30_30').empty();
        				if(msg.categories != null){
        					var html = '';
            				for(var i =0;i<msg.categories.length;i++){
            					var bb = msg.categories[i].sublist;
            					html += '<div class="item" idid = "'+msg.categories[i].category_id+'">'
            					html += '<img src="../images/icon_triangle.png" alt="" class="triangle">'+msg.categories[i].name+'';
            	        		html += '<ul class="itemul">';
            	        		for(var v =0;v< bb.length;v++){
            	        			html += '<li><img src="../images/noselect.png" alt="" class="select" idto="'+bb[v].category_id+'">'+bb[v].name+'</li>';
            	        		}
            	        		html +='</ul></div>';
            				}
            				$('.lineBox30_30').append(html);
            				$('.itemul li').off("click");
            	        	$('.itemul').on('click','li',function() {  
            	      			if($(this).find('img').attr('src') == '../images/noselect.png'){
            	      				$(this).find('img').attr('src','../images/selected.png');
            	      			} else {
            	      				$(this).find('img').attr('src','../images/noselect.png');
            	      			}        		
            	        	});
        				}
        			}else{
        				alert('查询失败');
        				return;
        			}
        		}
        	});
        }
        }
    </script>
    <script type="text/javascript">
	var mark = new Array();//用来统计信息窗口下标
	var longitude = $("#longitude").val();
	var latitude = $("#latitude").val();
	var address = $("#address").val();
	// 百度地图API功能
	var map = new BMap.Map("l-map",{enableMapClick:false});
	var point = new BMap.Point(120.161604,30.276251);
	if(longitude != "" && latitude != "" && longitude != 0.0 && latitude != 0.0){
		map.centerAndZoom(new BMap.Point(longitude,latitude), 15);
		
		var point0 = new BMap.Point(longitude,latitude);
		map.panBy(305,165);
			
		var label = new BMap.Label(address,{offset:new BMap.Size(20,-10)});
		label.setStyle({
			borderColor:"#000000",
		 });
	
		var marker0 = new BMap.Marker(point0);
		 
		 map.addOverlay(marker0);
		 marker0.setLabel(label);
	}else{
		map.centerAndZoom(point,15);
		map.panBy(305,165);
		
	}

	map.enableScrollWheelZoom();    //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
	
	
	
	
	var marker = '';

	

	
	//点击获取经纬度,并且获取附近信息
	function showInfo(e){
	  var pt = e.point;
	  lng = e.point.lng;
	  lat = e.point.lat;
		var gc = new BMap.Geocoder();
	    gc.getLocation(pt,  function(rs){
	        var addComp = rs.addressComponents;
	        address = addComp.district+addComp.street+addComp.streetNumber;
	      	map.clearOverlays(marker);
	      	
	      	var point0 = new BMap.Point(e.point.lng,e.point.lat);
	    	var label = new BMap.Label(address,{offset:new BMap.Size(20,-10)});
	    	label.setStyle({
	    		borderColor:"#000000",
	    	 });
			 var marker = new BMap.Marker(point0);
 			 map.addOverlay(marker);
	 		 marker.setLabel(label);
	 		 map.panTo(point0);
		   	 $("#address").val(address);
		   	 $("#longitude").val(e.point.lng);
		   	 $("#latitude").val(e.point.lat);
	    });  
		    
		    
	
	}
	map.addEventListener("click", showInfo);
	map.addEventListener("dragend", showInfo);
	function sureMap(lng, lat,title){
		map.clearOverlays(marker);
		$("input[name=longitude]").val(lng);
		$("input[name=latitude]").val(lat);
		
		$("#alert_body").fadeOut();
		$("#box_detail").fadeOut();
		$("#box_backgrond").fadeOut();
		
	}
	//关闭覆盖物
	function cancelMap(){
		marker.closeInfoWindow(marker.infoWindow);
		map.clearOverlays(marker);
	}
	
	//关闭覆盖物
	function cancelMap2(){
		marker0.closeInfoWindow(marker0.infoWindow);
		map.clearOverlays(marker0);
	}
	
	// 添加标注
	function addMarker(point, index){
	  var myIcon = new BMap.Icon("http://api.map.baidu.com/img/markers.png", new BMap.Size(23, 25), {
	    offset: new BMap.Size(10, 25),
	    imageOffset: new BMap.Size(0, 0 - index * 25)
	  });
	  var marker2 = new BMap.Marker(point, {icon: myIcon});
	  marker2.disableMassClear(); 
	  map.addOverlay(marker2);
	 
	  return marker2;
	}
	
	//自定义复杂样式
	window.openInfoWinFuns = null;
	var options = {
	  onSearchComplete: function(results){
	    // 判断状态是否正确
	    if (local.getStatus() == BMAP_STATUS_SUCCESS){
	        if(results.getCurrentNumPois() == undefined){
	        	return;
	        }
	    	   var lon2 = results.getPoi(0).point.lng;
	    	   var lat2 = results.getPoi(0).point.lat;
	    	   	map.clearOverlays(marker);
		      	
		      	var point0 = new BMap.Point(lon2,lat2);
		    	var label = new BMap.Label($("#address").val(),{offset:new BMap.Size(20,-10)});
		    	label.setStyle({
		    		borderColor:"#000000",
		    	 });
				 var marker = new BMap.Marker(point0);
	 			 map.addOverlay(marker);
		 		 marker.setLabel(label);
		 		 map.centerAndZoom(point0,15);
		 		 $("#longitude").val(lon2);
			   	 $("#latitude").val(lat2);
	    }else{
	    	
	    }
	  }
	  
	};
	

	//自定义复杂样式
	//搜索	
	function searchWord(){
		local = new BMap.LocalSearch(map, options);
	    local.search($("#address").val());
	}
	
	
	function showalert(){
		var height = $("#content").height();
		$("#alert_body").height(height);
		$(".mask").show();
		$("#box_detail").show();
		$("#r-result").hide();
		for(var i = 0; i < mark.length; i++){
			map.removeOverlay(mark[i]);
		}
	}
	
	function sureAlert(){
		$('.locationText').text($("#address").val());
		$('.locationText').show();
		$("#box_detail").hide();
		$(".mask").hide();
	}
	
	function hiddenAlert(){
		$("#box_detail").hide();
		$(".mask").hide();
	}
	
	function imgupload(fileid){
//	 	alert(template_id);
		$.ajaxFileUpload({
		url : '../manage/imgupload',//用于文件上传的服务器端请求地址
		secureuri : false,          //一般设置为false
		fileElementId : fileid,     //文件上传空间的id属性  <!--  <input type="file" id="file" name="file" />-->
		dataType : 'json',          //返回值类型 一般设置为json
		success : function(data) {
			console.log(data);
			if(data.code==1){
				$("#pic_"+fileid).val(data.picid);
			}
		},
		});
	}
 </script>
</body>
</html>