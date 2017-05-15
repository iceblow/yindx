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
                	告警处理发布
                	<font class="black">隐患发布</font>
                	<img src="../images/icon_position_arrow.png" class="pa">                	
                </div>
            </div>           
        </div>	
        <form action="/dianxin/alertPublish/adddanger" method="post" id="addform">
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
   <!--      <div class="lineBox lineBox0_22">
        	<div class="lineLabel">地点</div>
        	<input type="text" class="ltextInput" id="address" name="address">
        </div> -->
        <div class="lineBox lineBox0_22">
        	<div class="lineLabel">描述</div>
        	<div class="bigtext" contenteditable="true" id="topic"></div>
        </div>
        <div class="lineBox lineBox0_24">
        	<div class="lineLabel">图片</div>
        	<div class="addPic">添加文件<input type="file" class="fileInput file" multiple id="file" name="file"></div>
        	<input type="hidden" class="noinit" value="" name="imgs" id="pic_file">
        </div>
        <div class="lineBox lineBox0_24b">
        	<!-- <div class="imgBox">
        		<img src="../images/delete_black.png" class="deleteBtn">
        		<img src="../images/pic.png" class="backimg">        		
        	</div> -->
        </div>
        <div class="lineBox lineBox28_29">
        	<div class="lineLabel">录音</div>
        	<div class="addPic">上传文件<input type="file" class="fileInputF file" multiple id="audio" name="file"></div>
        	<input type="hidden" value="" name="upload_audio" id="pic_audio">
        	<div class="fileBox">
        		<div class="fileName">
<!--         		Luqin.mp3 -->
        		
        		</div>
        		<div class="rateBox">
        			<div class="rate"></div>
        		</div>
        		<div class="rateCount">45%</div>
        		<img src="../images/recording_delete.png" class="rateDel">
        	</div>
        </div>
        <div class="lineBox lineBox26_33">
        	<div class="box">
                <div class="labelName89 ln">行政区</div>
                <select class="selectInput" onchange="getstation()" id="area">
                	<option value="">请选择</option>
                	<c:forEach items="${areaList }" var="p">
                		<option value="${p.deptid }">${p.deptname }</option>
                	</c:forEach>
                </select>
            </div>  
            <div class="box">
                <div class="labelName65 ln">局站</div>
                <select class="selectInput" onchange="getperson()" id="station">
                	<option value="">请选择</option>
                </select>
            </div>  
            <div class="box">
                <div class="labelName80 ln">执行人</div>
                <select class="selectInput" id="owner_id" name="owner_id">
                	<option value="">请选择</option>
                </select>
            </div> 
        </div>
        <div class="lineBox lineBox31_23">  
            <div class="box">
                <div class="labelName89 ln">接单时间 </div>
                <input type="text" class="textInput179" id="receivetime" name="receivetime">分 
            </div>  
        </div>
        <div class="lineBox lineBox0_33"> 
            <div class="box">
                <div class="labelName89 ln">处理时间 </div>
                <input type="text" class="textInput179" id="resolvetime" name="resolvetime">分
            </div> 
        </div>
        <div class="lineBox lineBox56_90">
<!--         	<div class="iconcel">取消</div> -->
        	<div class="ipublish" onclick="submitForm()">发布</div>
        </div>
        </form>
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
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script src="../js/foundation-datepicker.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){   
        	$('#alertPublishDanger').addClass('active');
        	open();        
        	var height = document.documentElement.clientHeight-300;
        	$("#l-map").height(height);
        	$('.location').click(function() {
//         		$('.locationText').show();
        		showalert();
        	});
        	
        	$('.itemul li').off("click");
        	
        	$('.location').click(function() {
        		$('.locationText').show();
        	});
        	
        	$('.lineBox').on('mouseenter','.imgBox',function() {
        		$(this).find('.deleteBtn').show();
        	});
        	
        	$('.lineBox').on('mouseleave','.imgBox',function() {
        		$(this).find('.deleteBtn').hide();
        	});
        	
        	$('.lineBox').on('click','.deleteBtn',function() {
        		$(this).parent().remove();
        		$('#pic_file').val('')
        	});
        	
        	$('.fileInput').change(function(e) {
        		handleFileSelect(e);
        	});
        	
        	$('.fileInputF').change(function(e) {
        		var name = $('#audio').val();
        		console.log(name.split(".")[1].toLowerCase());
        		if (name.split(".")[1].toLowerCase() != "mp3") {
        			alert("请上传mp3文件");
        			return;
        		}
        		$('.fileBox').show();
        		progressBar();
        	});
        	
        	$('.lineBox').on('click','.rateDel',function() {
        		clearInterval(bar); 
        		$('.fileBox').hide();
        	});
        	
        	$('.iconcel').click(function() {
        		location.href = server + '/dianxin/alertPublish/reviewList';
        	});
        	
        	function progressBar(){
        		//初始化js进度条 
        		$(".rate").css("width","0px"); 
        		imgupload("audio");
        		//进度条的速度，越小越快
        		var speed = 20; 
        		var per = 0;
        		bar = setInterval(function(){ 
        			nowWidth = parseInt($(".rate").width()); 
        			//宽度要不能大于进度条的总宽度
        			if(nowWidth<=126){ 
        				barWidth = (nowWidth + 1)+"px"; 
        				$(".rate").css("width",barWidth); 
        				per = parseInt((nowWidth + 1)/126*100);
        				$('.rateCount').text(per + '%');
        			} else{ 
        				//进度条读满后，停止 
        				clearInterval(bar); 
        				$('.rateBox').hide();
        				$('.rateCount').text('上传成功！');
        			} 
        		},speed);
        	} 
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
        function submitForm(){
        	var longitude = $('#longitude').val();
        	var latitude = $('#latitude').val();
			var title = $('#title').val();
			var address = $('#address').val();
			var topic = $('#topic').text();
			var owner_id = $('#owner_id').val();
			var receivetime = $('#receivetime').val();
			var resolvetime = $('#resolvetime').val();
			var pic_file = $('#pic_file').val();
			var pic_audio = $('#pic_audio').val();
			if (title == '' ||title=='请输入') {
				alert("请输入名称");
				return;
			}
			if (address == ''||address == '请输入') {
				alert("请输入地点");
				return;
			}
			if (topic == ''||topic == '请输入') {
				alert("请输入描述");
				return;
			}
			if(pic_file==''){
				alert("请添加图片");
				return;
			}
			if (owner_id == ''||owner_id == '请输入') {
				alert("请选择执行人");
				return;
			}
			if (receivetime == ''||receivetime=='请输入') {
				alert("请输入接单时间");
				return;
			}
			if (resolvetime == ''||resolvetime=='请输入') {
				alert("请输入处理时间");
				return;
			}
			var Url = server + '/dianxin/alertPublish/adddanger';
			$.ajax({
        		url: Url,
        		data: {
        			title:title,
        			address:address,
        			topic:topic,
        			owner_id:owner_id,
        			receivetime:receivetime,
        			resolvetime:resolvetime,
        			pic_file:pic_file,
        			pic_audio:pic_audio,
        			longitude:longitude,
        			latitude:latitude
        		},
        		type: 'POST',
        		success: function(msg){
        			var data = eval('('+msg+')');
       				alert(data.message);
       				window.location.href="./reviewList";
        		}
        	});
        }
        
        function getstation(){
        	var id = $('#area').val();
        	var Url = server + '/dianxin/alertPublish/getDept2';
        	$.ajax({
        		url: Url,
        		data: {id:id},
        		type: 'POST',
        		success: function(msg){
        			var html='<option value="">请选择</option>';
        			var date = eval('('+msg+')');
        			for (var i=0; i < date.list.length ; i++){
        				html+='<option value="'+date.list[i].deptid+'">'+date.list[i].deptname+'</option>';
        			}
        			$('#station').html(html);
        		}
        	})
        }

        function getperson(){
        	var id = $('#station').val();
        	var Url = server + '/dianxin/alertPublish/getUser';
        	$.ajax({
        		url: Url,
        		data: {deptid:id},
        		type: 'POST',
        		success: function(msg){
        			var html='<option value="">请选择</option>';
        			var date = eval('('+msg+')');
        			for (var i=0; i < date.user_list.length ; i++){
        				html+='<option value="'+date.user_list[i].id+'">'+date.user_list[i].username+'</option>';
        			}
        			$('#owner_id').html(html);
        		}
        	});
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
				$("#pic_"+fileid).val(data.fileUrl);
			}
		},
		});
	}
 </script>
</body>
</html>