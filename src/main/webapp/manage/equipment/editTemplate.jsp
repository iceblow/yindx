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
                	<font class="gray">模板设置</font>
                	<img src="../images/icon_position_arrow.png" class="pa">   
                	<font class="black">新建模板</font>              	
                </div>
            </div>           
        </div>	
        <div class="lineBox lineBox45_22">
        	<div class="lineLabel">名称</div>
        	<input type="text" class="ltextInput noinit" placeholder="模板名称" name="name" value="${template.name }">
        	<input type="hidden" class="noinit" value="${template.template_id }" name="template_id">
        	<div class="box">
                <div class="labelName89 ln">设备类型</div>
               <select class="selectInput"  name="typeid"  data-value="${template.typeid }">
                	<option value="">请选择</option>
                	<c:forEach items="${deviceList }" var="p">
                		<option value="${p.typeid }">${p.typename }</option>
                	</c:forEach>
                </select>
            </div>  
        </div>
        <div class="lineBox lineBox0_34">
        	<div class="lineLabel">描述</div>
        	<textarea class="bigtext"  name="topic" >${template.topic }</textarea>
        </div>
        <div class="lineBox lineBox23_0">
        	<div class="addDiv">
        		<img src="../images/icon_add14X14.png" class="addImg">添加巡检项目
        	</div>        	
        </div>
        <div class="lineBox lineBox32_30">   
        	<c:if test="${not empty calist }">
        		<c:forEach items="${calist }" var="p">  
		        	 <div class="ztreeBox">
		        		<div class="level_line_1"></div>
		        		<input class="level_box_1 noinit" data-id="${p.category_id }" value="${p.name }" placeholder="请输入一级分类">
		        		<div class="ztreeImg"></div>
		        		<c:forEach items="${p.sublist }" var="sub"> 
		        		<div class="level_line_2"></div>
		        		<input class="level_box_2 noinit" data-id="${sub.category_id }" value="${sub.name }" placeholder="请输入二级分类" >
		        		</c:forEach>
		        	</div>
        		</c:forEach>
        	</c:if>     	
        	<c:if test="${empty calist }">
        	<div class="ztreeBox">
        		<div class="level_line_1"></div>
        		<input class="level_box_1 noinit" data-id="" placeholder="请输入一级分类">
        		<div class="ztreeImg"></div>
        		<div class="level_line_2"></div>
        		<input class="level_box_2 noinit" data-id="" placeholder="请输入二级分类" >
        		<div class="level_line_2" ></div>
        		<input class="level_box_2 noinit" data-id="" placeholder="请输入二级分类" >
        	</div>
        	</c:if>
        </div>
        <!-- 两个按钮 -->
	   	<div class="lineBox lineBox63_90">
	   		<div class="btnBox">
	   			<div class="iconcel">取消</div>
	       		<div class="ipublish">确定</div>
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
        	
        	$('.leftLead').click(function() {
        		location.href = server + '/for/equipment/templateList.jsp';
        	});
        	
        	$('.leftNav ul .active').parent().prev().find('.fanhui').css('margin-top','22px');
        	
        	$('.location').click(function() {
        		$('.locationText').show();
        	});
        	$("select").each(function(){
        		var value = $(this).attr("data-value");
        		if(value){
        			$(this).val(value);
        		}
        	})
        	
        	$('.itemul li').off("click");
        	$('.itemul').on('click','li',function() {  
      			if($(this).find('img').attr('src') == '../images/noselect.png'){
      				$(this).find('img').attr('src','../images/selected.png');
      			} else {
      				$(this).find('img').attr('src','../images/noselect.png');
      			}        		
        	});
        	
        	$('.iconcel').click(function() {
        		location.href = server + './templateList';
        	});
        	
        	$('.ipublish').click(function() {
//         		location.href = server + '/for/equipment/templateList.jsp';
				var name = $("input[name='name']").val();
				var topic = $("textarea[name='topic']").val();
				var typeid = $("select[name='typeid']").val();
				var template_id = $('input[name=template_id]').val();
				if(!name){
					alert("请输入模板名称");
					return;
				}
				if(!topic){
					alert("请输入模板简介");
					return;
				}
				if(!typeid){
					alert("请选择设备类型");
					return;
				}
				var _list = new Array();
				var i = 0;
				var eachflg = false;
				$(".ztreeBox").each(function(){
					var pid =  $(this).find(".level_box_1").attr("data-id");
					var pname = $(this).find(".level_box_1").val();
					var templateCate = 	new Object();
					templateCate.pname=pname;
					templateCate.id=pid;
					var cnames = new Array();
					var j= 0;
					var haschildname = false;
					 $(this).find(".level_box_2").each(function(){
						 var subcate = new Object();
						 subcate.name=$(this).val();
						 subcate.id=$(this).attr("data-id"); 
						 console.log($(this).val());
						 console.log(subcate);
						 cnames.push(subcate);
						 if(subcate.name){
							 haschildname = true;
						 }
						 j++;
					 })		
					 if(!templateCate.pname&&haschildname){
						 alert("请输入一级分类名名称或清空二级分类");
						 $(this).focus();
						 eachflg = true;
						 return;
					 }
					 templateCate.subcates = cnames;
					 _list.push(templateCate);
					 i++;
				})
// 				alert(eachflg);
				if(eachflg){
					return;
				}
				console.log(_list);
				$.ajax({
					url:'./saveTemplate',
					type:'post',
				    traditional:true,    //这里必须设置
					data:{name:name,topic:topic,typeid:typeid,templateCate:JSON.stringify(_list),template_id:template_id},
					dataType:'json',
					success:function(msg){
						if(msg.code==0){
        					alert(msg.message);
        				}else{
        					alert("保存成功!");
        					window.location.href="./templateList";
        				}
					}
				})
        	});
        	
//         	$('.right').on('focusin','.level_box_1',function() {
//         		if($(this).text() == '请输入一级分类名') {
//         			$(this).text('');
//         			$(this).css('color','#666');
//         		} 
//         	});
        	
//         	$('.right').on('focusout','.level_box_1',function() {
//         		if($(this).text() == '请输入一级分类名' || $(this).text() == '') {
//         			$(this).text('请输入一级分类名');
//         			$(this).css('color','#aaa');
//         		} else {
//         			$(this).css('color','#666');
//         		}
//         	});
        	
//         	$('.right').on('focusin','.level_box_2',function() {
//         		if($(this).text() == '请输入二级分类名') {
//         			$(this).text('');
//         			$(this).css('color','#666');
//         		} 
//         	});
        	
//         	$('.right').on('focusout','.level_box_2',function() {
//         		if($(this).text() == '请输入二级分类名' || $(this).text() == '') {
//         			$(this).text('请输入二级分类名');
//         			$(this).css('color','#aaa');
//         		} else {
//         			$(this).css('color','#666');
//         		}
//         	});
        	
        	$('.right').on('click','.ztreeImg',function() {
        		var html = '<div class="level_line_2"></div>';
        		html += '<input class="level_box_2 noinit" placeholder="请输入二级分类"  >';
        		$(this).parent().append(html);
        	});
        	
        	$('.addDiv').click(function() {
        		var html = '';
        		html += '<div class="ztreeBox">';
        		html += '<div class="level_line_1"></div>';
        		html += '<input class="level_box_1 noinit" data-id="" placeholder="请输入一级分类">';
        		html += '<div class="ztreeImg"></div>';
        		html += '<div class="level_line_2"></div>';
        		html += '<input class="level_box_2 noinit" data-id="" placeholder="请输入二级分类" >';
        		html += '<div class="level_line_2" ></div>';
        		html += '<input class="level_box_2 noinit" data-id="" placeholder="请输入二级分类" ></div>';
        		$('.lineBox32_30').append(html);
        	});
        	
//         	$('.level_box_1').focusout();
//         	$('.level_box_2').focusout();
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
</body>
</html>