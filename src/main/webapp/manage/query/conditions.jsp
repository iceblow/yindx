<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>条件查询</title>
<link rel="stylesheet" type="text/css" href="../css/right.css">
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>	
<script type="text/javascript" src="../js/common.js"></script>	
<script type="text/javascript" src="../js/echarts.js"></script>	
<script type="text/javascript" src="../js/essos.js"></script>
</head>
<body>
	<div class="right">
		<!-- 头部 -->
        <div class="wrapperTop">
         <!-- 当前页面 -->
            <div class="leadTop">
                <div class="leftLead">
                	<img src="../images/icon_position.png">
                	查询统计
                	<font class="black">条件查询</font>
                	<img src="../images/icon_position_arrow.png" class="pa">
                	
                </div>
            </div>
            <!-- 输入框 -->
            <div class="leadInput">
                <div class="lineTop">
                    <div class="box">
                        <div class="labelName">分局/大院</div>
                        <select class="selectInput" id="area" name="area_id"  data-value="${area_id }" onclick="area11()">
                		<option value="">请选择</option>
                		<c:forEach items="${areaList }" var="p">
                			<option value="${p.deptid }">${p.deptname }</option>
                		</c:forEach>
               			 </select>
                    </div>  
                    <div class="box">
                   <div class="labelName">支局/部门</div>
                        <select class="selectInput"  id="xiaoqu" name="xiaoqu" data-value="${xiaoqu }" onclick="xiaoqu11()">
               	 		</select>
                    </div>  
                    <div class="box">
                        <div class="labelName">执行人</div>
                        <select class="selectInput"  id="shebei" name = "user_id" data-value="${user_id }">
                		</select>
                        </ul>
                    </div>           
                </div>
                <div class="lineBottom">
                    <div class="box">
                        <div class="labelName">时间</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly" name="start_date" id="start_date">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>  
                    <div class="box">
                        <div class="labelNameTime">至</div>
                        <input type="text" class="selectInput selectInputTime getTime" readonly="readonly" name="end_date" id="end_date">
                        <img src="../images/arrowdown.png" alt="" class="arrowdown">
                    </div>  
                    <!-- 搜索按钮 -->
                    <div class="button">搜索</div>
                </div>
            </div>
        </div>
		<!-- 主内容区 -->
		<div class="currBoxBottom">
			<div class="numberBox active">
				<p class="count">150</p>
				<p class="label">实时</p>
			</div>
			<div class="numberBox">
				<p class="count">139</p>
				<p class="label">预警</p>
			</div>
			<div class="numberBox">
				<p class="count">108</p>
				<p class="label">巡检</p>
			</div>
			<div class="numberBox">
				<p class="count">133</p>
				<p class="label">隐患</p>
			</div>
			<div class="numberBox">
				<p class="count">88</p>
				<p class="label">发布</p>
			</div>
			<div class="numberBox">
				<p class="count">118</p>
				<p class="label">检查</p>
			</div>
		</div>
		<div class="wrapperMain">
			<!-- 折线图 -->
			<div class="opTitle">
				历史解决：559			</div>
			<div class="echarts" id="echarts"></div>
			
			<!-- 饼图 -->
			<div class="pieBox">
				<div class="pie">					
					<div class="pieEcharts" id="unaccept"></div>
					<div class="title">未接</div>
				</div>
				<div class="pie">					
					<div class="pieEcharts" id="unhandel"></div>
					<div class="title">未处理</div>
				</div>
				<div class="pie">					
					<div class="pieEcharts" id="inhandel"></div>
					<div class="title">处理中</div>
				</div>
				<div class="pie">					
					<div class="pieEcharts" id="finish"></div>
					<div class="title">完结</div>
				</div>
				<div class="pie">					
					<div class="pieEcharts" id="danger"></div>
					<div class="title">隐患 <font class="redUnderLine">查看</font></div>
				</div>
			</div>
			<!-- 表格 -->
            <table class="lastOne">
                <tr>
                    <th class="persentTen">编号</th>
                    <th class="persentFourteen">大区</th>
                    <th class="persentTwentyThree">小区</th>
                    <th class="persentTwenty">执行人</th>
                    <th class="persentSixteen">发起时间</th>
                    <th class="persentEighteen state">
                    	<div>状态</div>
                    	<img src="../images/icon_xiala.png" alt="">
                    	<ul>
                    		<li>未处理</li>
                    		<li>已处理</li>
                    		<li>处理中</li>
                    		<li>有隐患</li>
                    		<li>完结</li>
                    	</ul>
                    </th>
                    <th class="persentTwelfth">操作</th>
                </tr>                
                <tr>
                    <td>10</td>
                    <td>拱墅区</td>
                    <td>祥园路</td>
                    <td>张晓明</td>
                    <td>2016-11-20</td>
                    <td>正常</td>
                    <td class="look">查看</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>拱墅区</td>
                    <td>祥园路</td>
                    <td>张晓明</td>
                    <td>2016-11-20</td>
                    <td>正常</td>
                    <td class="look">查看</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>拱墅区</td>
                    <td>祥园路</td>
                    <td>张晓明</td>
                    <td>2016-11-20</td>
                    <td>正常</td>
                    <td class="look">查看</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>拱墅区</td>
                    <td>祥园路</td>
                    <td>张晓明</td>
                    <td>2016-11-20</td>
                    <td><font class="red">隐患</font></td>
                    <td class="look">查看</td>
                </tr>
            </table>
		</div>
	</div>
	<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		$(document).ready(function(){
			//左侧导航栏高亮
			$('#queryConditions').addClass('active');
			open();
			
			$('.right').on('click','.numberBox',function() {
				$('.numberBox').removeClass('active');
				$(this).addClass('active');
			});
			
			/* 表格列表 */
			$('.right').on('click','table .state',function() {
        		$(this).find('ul').show();
        		$(this).find('img').attr('src','../images/icon_shangla.png')
        	});
			
        	$('.right').on('click','th li',function() {
        		$(this).parents('ul').hide();
        		$(this).parents('ul').prev('img').attr('src','../images/icon_xiala.png');
        		return false;
        	});
        	
			//主题
			var theme = {
				    // 默认色板
				    color: [
					'#62dede', '#46A9EC', '#a9cba2', '#86b379',
					'#397b29', '#8abb6f', '#FC9993', '#bfd3b7'
					]
			}	
			var themeOne = {
				    // 默认色板
				    color: [
					'#FBA58D', '#F1F6F7', '#a9cba2', '#86b379',
					]
			}
			var themeTwo = {
				    // 默认色板
				    color: [
					'#98C8F4', '#F1F6F7', '#a9cba2', '#86b379',
					]
			}
			var themeThree = {
				    // 默认色板
				    color: [
					'#F3C1F1', '#F1F6F7', '#a9cba2', '#86b379',
					]
			}
			var themeFour = {
				    // 默认色板
				    color: [
					'#C9E5A3', '#F1F6F7', '#a9cba2', '#86b379',
					]
			}
			var themeFive = {
				    // 默认色板
				    color: [
					'#F1B3B1', '#F1F6F7', '#a9cba2', '#86b379',
					]
			}
			var myChart = echarts.init(document.getElementById('echarts'),'essos');
			var myPieOne = echarts.init(document.getElementById('unaccept'),themeOne);
			var myPieTwo = echarts.init(document.getElementById('unhandel'),themeTwo);
			var myPieThree = echarts.init(document.getElementById('inhandel'),themeThree);
			var myPieFour = echarts.init(document.getElementById('finish'),themeFour);
			var myPieFive = echarts.init(document.getElementById('danger'),themeFive);
			var option = {
				    tooltip : {
				        trigger: 'axis',
				        backgroundColor: '#BDD2E0',//背景颜色（此时为默认色）
	                       borderRadius: 8,//边框圆角
	                       padding: 10,  
				        formatter: function (params, ticket, callback) {
				        		var res = '';
	                           for (var i = 0, l = params.length; i < l; i++) {
	                               res +=params[i].value;//鼠标悬浮显示的字符串内容
	                           }
	                           return res;
	                       }
				    },
				    itemStyle: {
		                normal: {
		                 
		                    color: '#90eae7',
		                    shadowColor: 'rgba(0, 0, 0, 0.1)',
		                    shadowBlur: 10
		                }
		            },
				    toolbox: {
				        feature: {
				            saveAsImage: {}
				        }
				    },
				    grid: {
				        left: '53px',
				        right:'53px',
				        bottom:'0',
				        top:'22px',
				        containLabel: true
				    },
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : ['3/09','3/10','3/11','3/12','3/13','3/14','3/15'],
				            axisLabel: {
				                textStyle:{
				                    color:'#CADBE7' ,
				                    fontSize: '14'
				                }
				            }
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            min: 0,
				            max: 4000,
				            interval: 1000,
				            axisLabel: {
				                formatter: '{value}',
				                textStyle:{
				                    color:'#CADBE7',
				                   	fontSize: '14'
				                }
				            }
				        }
				    ],
				    series : [
				        {
				            name:'邮件营销',
				            type:'line',
				            stack: '总量',
				            symbolSize: 10,
				            areaStyle: {normal: {}},
				            data:[0, 1000, 2000, 1500, 2200, 3000, 1000]
				        }
				    ]
				};
			var pie =  {	
					title: {
				        text:'8956.00',
				        right: 'center',
				        top:'center',
				        textStyle: {
				            color: '#555',
				            fontWeight: 'normal'
				        }
				    },
				     grid: {
				        left: '0',
				        right: '0',
				        bottom: '0',
				        containLabel: true
				    },
				    series: [
				        {
				            type:'pie',
				            radius: ['50%', '70%'],
				            avoidLabelOverlap: false,
				            label: {
				                normal: {
				                    show: false,
				                    position: 'center'
				                },
				                emphasis: {
				                    show: true,
				                    formatter: function(param) {
				                        return '';
				                    },
				                    textStyle: {
				                        fontSize: '16',
				                        fontWeight: 'bold'
				                    }
				                }
				            },
				            labelLine: {
				                normal: {
				                    show: false
				                }
				            },
				            data:[
				                {value:6000, name:''},
				                {value:8956.00, name:'8956.00'}
				            ]
				        }
				    ]
				};	
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
			myPieOne.setOption(pie);
			myPieTwo.setOption(pie);
			myPieThree.setOption(pie);
			myPieFour.setOption(pie);
			myPieFive.setOption(pie);
			window.onresize = function () {
				myChart.resize();	
				myPieOne.resize();	
				myPieTwo.resize();	
				myPieThree.resize();	
				myPieFour.resize();	
				myPieFive.resize();
			}
			
		});
		function area11(id){
        	id = $('#area').val();
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
        function xiaoqu11(id){
        	id = $('#xiaoqu').val();
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
		
	</script>
</body>
</html>