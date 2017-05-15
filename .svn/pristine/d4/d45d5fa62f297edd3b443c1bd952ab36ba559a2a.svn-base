<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>隐患发布</title>
<link href="../css/foundation-datepicker.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css/right.css">
<link rel="stylesheet" type="text/css" href="../css/equipment.css">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=rgbCiTGtXE5l7yXtxwlTjPtresDqVfiY"></script>
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
                	<font class="gray">设备设置</font>
                	<img src="../images/icon_position_arrow.png" class="pa">   
                	<font class="black">新增设备</font>                 	
                </div>
            </div>           
        </div>	
        <form id="equipmentForm">
        <div class="lineBox lineBox45_22">
        	<div class="lineLabel">名称</div>
        	<input type="hidden" value="${device.device_id }" class="noinit" name="device_id" > 
        	<input type="text" class="ltextInput" name="name" id="name" value="${device.name }">
        	<div class="location">
        		<img src="../images/icon_map.png">地点
        	</div>
        	<div class="locationText">
        		<img src="../images/icon_map.png">${route.address }
        	</div>
        </div>
        <div class="lineBox lineBox0_22">
        	<div class="lineLabel">描述</div>
        	<textarea class="bigtext" contenteditable="true" name="topic" id="topic" >${device.topic }</textarea>
        </div>
        <div class="lineBox lineBox0_33">
        	<div class="box">
                <div class="labelName89 ln">行政区</div>
                <select class="selectInput" onchange="getstation()" id="area" name="ss_id" data-value="${device.ss_id}">
                	<option value="">请选择</option>
                	<c:forEach items="${areaList }" var="p">
                		<option value="${p.area_id }">${p.area_name }</option>
                	</c:forEach>
                </select>
            </div>  
            <div class="box">
                <div class="labelName65 ln">局站</div>
                <select class="selectInput" id="station" name="station_id" data-value="${device.station_id }">
                	<option value="">请选择</option>
                </select>
            </div>  
            <div class="box">
                <div class="labelName89 ln">设备类型</div>
                <select class="selectInput"  name="typeid" data-value="${device.typeid }">
                	<option value="">请选择</option>
                	<c:forEach items="${deviceList }" var="p">
                		<option value="${p.typeid }">${p.typename }</option>
                	</c:forEach>
                </select>
            </div>  
        </div>
        <div class="lineBox lineBox28_29n">
        	<div class="lineLabel">图片</div>
        	<div class="addPic">添加图片<input type="file" class="fileInput file" multiple id="file" name="file" ></div>
        	<input type="hidden" value="${device.imgs }" name="imgs" id="pic_file">
        </div>
        <div class="lineBox lineBox0_24b">
        <c:if test="${not empty  device.imgs}">
        	 <div class="imgBox">
        		<img src="../images/delete_black.png" class="deleteBtn">
        		<img src="${device.imgs}" class="backimg">        		
        	</div> 
        </c:if>
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
			<input type="text" class="form-control"  id="address" name="address" value="${device.address }" style="float:left;width: 550px; height: 30px;margin-left:10px; padding-left:5px; ">
			<button type="button" class="btn btn-primary detail_location" style="float:right;height:30px;margin-right:10px;width:75px;background-image: none;" aria-haspopup="true" aria-expanded="false" onclick="sureAlert()">确定</button>
			<button type="button" class="btn btn-primary detail_location" style="float:right;height:30px;margin-right:10px;width:75px;background-image: none;" aria-haspopup="true" aria-expanded="false" onclick="searchWord()">搜索</button>
			<input type="hidden"  id="longitude" name="longitude" value="${device.longitude }">
			<input type="hidden"  id="latitude" name="latitude" value="${device.latitude }">
		</div>  
		<div style="position: relative;margin-top:15px;">
			<div id="l-map" class="l-map" style="width:1000px;border: 1px solid #e8e8e8;margin: 10px;"></div>
			<div id="r-result"></div>
		</div>
		</div>
		</form>
	</div>
    <div class="wrapperModal" style="display:none;"></div>
    <jsp:include page="../common/common.jsp" />
    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script src="../js/foundation-datepicker.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){   
        	$('#equipmentEquipment').addClass('active');
        	open();  
        	var height = document.documentElement.clientHeight-300;
        	$("#l-map").height(height);
        	
        	$('.leftNav ul .active').parent().prev().find('.fanhui').css('margin-top','22px');
        	
        	$("select").each(function(){
        		var value = $(this).attr("data-value");
        		if(value){
        			$(this).val(value);
        		}
        		if($(this).attr("id")=="area"){
        			getstation();
        		}
        	})
        	
        	$('.location').click(function() {
//         		$('.locationText').show();
        		showalert();
        	});
        	
        	$('.lineBox').on('mouseenter','.imgBox',function() {
        		$(this).find('.deleteBtn').show();
        	});
        	
        	$('.lineBox').on('mouseleave','.imgBox',function() {
        		$(this).find('.deleteBtn').hide();
        	});
        	
        	$('.lineBox').on('click','.deleteBtn',function() {
        		$(this).parent().remove();
        	});
        	
        	$('.fileInput').change(function(e) {
        		handleFileSelect(e);
        	});
        	
        	$('.iconcel').click(function() {
        		window.location.href="./equipment";
        	});
        	
        	$('.ipublish').click(function() {
        		var name = $("#name").val();
        		if(!name){
        			alert("请输入名称");
        			return;
        		}
        		var topic = $("#topic").val();
        		if(!topic){
        			alert("请输入描述");
        			return;
        		}
        		var longitude = $("#longitude").val();
        		if(!longitude){
        			alert("请选择地址")
        			return;
        		}
        		var area = $("#area").val();
        		if(!area){
        			alert("请选择行政区")
        			return;
        		}
        		var station = $("#station").val();
        		if(!station){
        			alert("请选择局站")
        			return;
        		}
        		$.ajax({
        			url:'./saveAquipment',
        			data:$("#equipmentForm").serialize(),
        			dataType:'json',
        			success:function(msg){
        				if(msg.code==0){
        					alert(msg.message);
        				}else{
        					alert("保存成功!");
        					window.location.href="./equipment";
        				}
        			}
        		})
        	});
        	
        	$('.leftLead').click(function() {
        		location.href = server + '/for/equipment/equipment.jsp';
        	});
        	
        	//图片压缩
			function handleFileSelect (evt) {
				var files = evt.target.files;
				var currLength = $(evt.target).parents('.lineBox').next().find('.imgBox').length;
				if(currLength > 5){
					alert("最多上传5张图片！");
				} else if((files.length + currLength)>5 ){
					alert("最多上传5张图片！");
				} else {
					for (var i = 0, f; f = files[i]; i++) {
					      if (!f.type.match('image.*')) {
					        continue;
					      }				 
					      var reader = new FileReader();				 		
					      reader.onload = (function(theFile) {
					        return function(e) {
					          var b = document.createElement("div");
					          $(b).addClass('imgBox');					     
					          var d = document.createElement("img");
					          $(d).addClass('deleteBtn');
					          d.src = '../images/delete_black.png';
					          var i = document.createElement("img");
					          $(i).addClass('backimg');
					          $(b).append(d);
					          $(b).append(i);
					          $(evt.target).parents('.lineBox').next().append(b);
					          i.src = event.target.result;
					          i.onload=function(){
					        	  imgupload("file");
					          }					          
					        };
					      })(f);			 
					      reader.readAsDataURL(f);
					 }				
				}				
			}	
        	
        });
        
        function getstation(){
        	var id = $('#area').val();
        	if(id){
        		var Url = server + '/dianxin/alertHandel/getstation';
            	$.ajax({
            		url: Url,
            		data: {id:id},
            		type: 'POST',
            		async:false,
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
    </script>
    
<script type="text/javascript">
	
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
	// 	alert(template_id);
		$.ajaxFileUpload({
		url : '../manage/imgupload',//用于文件上传的服务器端请求地址
		secureuri : false,          //一般设置为false
		fileElementId : fileid,     //文件上传空间的id属性  <input type="file" id="file" name="file" />
		dataType : 'json',          //返回值类型 一般设置为json
		success : function(data) {
			console.log(data);
			if(data.code=="1"){
				$("#pic_"+fileid).val(data.fileUrl);
			}
		},
		});
	}

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
	
</script>
</body>
</html>