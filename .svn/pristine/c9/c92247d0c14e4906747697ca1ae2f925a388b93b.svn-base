var server = '';

$(document).ready(function(){ 
	//右侧内容宽度
	$('.right').width($(window).width() - $('.leftNav').width());
	$('.wrapperMain').width($('.right').width() - 40);
	$('.wrapperMainW').width($('.right').width() - 40);
	$('.currBoxBottom .numberBox').width(($('.currBoxBottom').width() - 40)/6);
	//input在ie8下placeholder的兼容写法
	$('input:not(.fileInput,.password,.username,.fileInputF,.textInput340,.noinit)').focusout(function(e){
		if (this.value == '') {
			if($(this).next('img').length > 0){
				this.value = '请选择';
			} else {
				this.value = '请输入';
			}		
			$(this).css('color','#999');
		}
	});

	$('input:not(.fileInput,.password,.username,.fileInputF,.textInput340)').focusin(function(e){
		if (this.value == '请输入') {
			this.value = '';
			$(this).css('color','#000');
		}
	});

	$('input:not(.fileInput)').focusout();

	//搜索栏下拉列表
	//下拉列表显示
	$('input:not(.fileInput)').focusin(function(e){
		$(this).siblings('ul').show();
	});

	//下拉列表隐藏
	$('input:not(.fileInput)').focusout(function(e){
		var that = this;
		setTimeout(function(){
			$(that).siblings('ul').hide();
		},200);
	});

	//将选中的列表值传递给输入框
	$('.right li').click(function(e){
		if((!$(this).parents('ul').hasClass('itemul')) && (!$(this).parent('ul').parent('div').hasClass('treeBox'))) {
			$(this).parents('ul').hide();
			var value = $(this).text();
			$(this).parents('ul').siblings('input').val(value);
		}		
	});
	/*$('.right .modal li').click(function(e){
		$(this).parents('ul').hide();
		var value = $(this).text();
		$(this).parents('ul').siblings('input').val(value);
	});*/
	
	//模态层隐藏
	$('.wrapperModal').click(function(){
		$('.redTip').hide();
		$('.modal').hide();
		$('.wrapperModal').hide();
	});

	//模态层右上角叉叉
	$('.titleWrapper img').click(function(){
		$('.redTip').hide();
		$('.modal').hide();
		$('.wrapperModal').hide();
	});

	//模态层取消
	$('.cancel').click(function(){
		$('.redTip').hide();
		$('.modal').hide();
		$('.wrapperModal').hide();
	});

	//时间插件
	$('.getTime').fdatepicker();


	//新增鼠标上移样式
	$('.xinzeng').mouseenter(function(event) {
		$(this).attr('src','../images/xinzeng_blue.png');
	});

	//新增鼠标移除样式
	$('.xinzeng').mouseleave(function(event) {
		$(this).attr('src','../images/xinzeng.png');
	});	

	//批量管理
	$('#some').click(function(e) {
		$('.pageWrapper .btn').show();
		$(this).hide();
		$('.wrapperMain tr:gt(0)').each(function(index,el) {
			$(this).find('td').first().html('<img src="../images/kuang.png" alt="">');
			//数据选择
			$(this).find('td').first().click(function(e) {
				if($(this).find('img').attr('src') == '../images/kuang.png' ){
					$(this).find('img').attr('src','../images/select.png');
				} else {
					$(this).find('img').attr('src','../images/kuang.png');
				}
			});
		});
	});

	//退出批量管理
	$('#exit').click(function(e) {
		$('.pageWrapper .btn').hide();
		$('#some').show();
		$('.wrapperMain tr:gt(0)').each(function(index,el) {
			var i = '0';
			if(index < 9) {
				i += (index + 1) + '';
			} else {
				var i = index + 1;
			}
			$(this).find('td').first().html(i);
		});
	});

	//project manage页面跳转
	$('#projectManager').click(function(){
		location.href = server + '/JLXi/project/manager.jsp';
	});
	$('#projectAchievement').click(function(){
		location.href = server + '/JLXi/project/manageAchievement.jsp';
	});
	$('#projectMove').click(function(){
		location.href = server + '/JLXi/project/manageMove.jsp';
	});

	//下拉列表显示zhidong
	$('input').focusin(function(e){
		if($(this).hasClass('active')){
			$(this).siblings('ul').hide();
		}else{
			$(this).siblings('ul').show();
		}
		
	});
});

//左侧导航栏
function open() {
	if($('#pandect').hasClass('active')){
		$('#pandect').find('img').attr('src','../images/icon_zonglan_white.png');
	} else {
		$('.opration ul .active').parents('ul').show();
		$('.opration ul .active').parents('ul').prev().find('.fanhui').attr('src','../images/icon_xiaArrow.png');
		src = 'url(../images/' + $('.opration ul .active').parents('ul').prev().attr('id') + '_white.png)';		
		$('.opration ul .active').parents('ul').prev().addClass('activeP');
		$('.opration .activeP').css('background',src);
	}	
}

//模态层大小
$(window).on('resize',function(e){
	position('updateModal');
	position('addModal');
	position('lookModal');
	position('xinzengModal');
	position('fingerModal');
	position('notPassModal');
	position('passModal');
	position('addModalBig');
	position('updateModalBig');
	$('.right').width($(window).width() - $('.leftNav').width());
	$('.wrapperMain').width($('.right').width() - 40);
	$('.wrapperMainW').width($('.right').width() - 40);
	$('.currBoxBottom .numberBox').width(($('.currBoxBottom').width() - 40)/6);
});

function position(id) {
	var width = $('#'+id).width();
	var height = $('#'+id).height();
	var topM = ($(window).height() - height)/2;
	var leftM = ($(window).width() - width)/2;
	$('#'+id).css('top',topM);
	$('#'+id).css('left',leftM);
}