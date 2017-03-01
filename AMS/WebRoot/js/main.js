$body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
//弹出框定义
(function($){
	$.confirm = function(params){
		if($('#confirmOverlay').length){
			return false;
		}
		var buttonHTML = '';
		$.each(params.buttons,function(name,obj){
			buttonHTML += '<a href="#" class="button '+obj['class']+'">'+name+'<span></span></a>';
			if(!obj.action){
				obj.action = function(){};
			}
		});
		var markup = [
			'<div id="confirmOverlay">',
			'<div id="confirmBox">',
			'<h1>',params.title,'</h1>',
			'<p>',params.message,'</p>',
			'<div id="confirmButtons">',
			buttonHTML,
			'</div></div></div>'
		].join('');
		$(markup).hide().appendTo('body').fadeIn();
		var buttons = $('#confirmBox .button'),
			i = 0;
		$.each(params.buttons,function(name,obj){
			buttons.eq(i++).click(function(){
				obj.action();
				$.confirm.hide();
				return false;
			});
		});
	}
	$.confirm.hide = function(){
		$('#confirmOverlay').fadeOut(function(){
			$(this).remove();
		});
	}
})(jQuery);

//加载项
$(document).ready(function (){
	$("input, textarea, select, button").uniform();
	//对IE6,IE7的兼容调整
	if($.browser.msie && $.browser.version < 8.0){
		$('.detail').css('display','inline');
		$('.menu1').css('display','inline');
		$('.menu2').css('display','inline');
		$('.menu3').css('display','inline');
		$('.body li').css('margin-left','10px');
		$('#detail li').css('margin-top','20px');
	}
	//滚至顶部的注册
	$('.sttop').click(scrolltotop);
	//提示的关闭按钮的注册
	$('.close').click(closetips);
	//折叠展开的注册
	$('.stretch img').toggle(zhedie,zhankai);
	//菜单的注册
	menu();
	//登录表单的验证
	$('#username').bind('blur', Checkusername);
	$('#password').bind('blur', Checkpassword);
	//登录功能的注册
	$("#password").keydown(function(e){
	    　if(e.keyCode == 13)
	       login();
	  });
	$('#sub').click(login);
	$('#detailbtn').click(function(){window.location.href="personsetting.jsp#xiugaigerenziliao";});
	//退出窗口的注册
	$('#exit').click(function(){
		$.confirm({
			'title'	: 'Exit Confirmation',
			'message': 'You are about to exit system. Continue?',
			'buttons': {
			'Yes': {
				'class'	: 'blue',
				'action': function(){
					window.location.href="exit";}},
			'No': {
				'class'	: 'gray',
				'action': function(){}}}
				});});
	$("#adetail").fancybox();
	$(".stretch img").hover(function(){
		if($(this).attr('src') == 'images/zd.png')
			$(this).attr('src','images/zdh.png');
		else
			$(this).attr('src','images/zkh.png');
		},function(){
			if($(this).attr('src') == 'images/zdh.png')
				$(this).attr('src','images/zd.png');
			if($(this).attr('src') == 'images/zkh.png')
				$(this).attr('src','images/zk.png');
		});
	$('.sttop').hover(function(){
			$(this).css('background','url(images/sttoph.png) center right no-repeat');
		},function(){
			$(this).css('background','url(images/sttop.png) center right no-repeat');
		});
	$('#res').hide();
	$('#res1').hide();
	getdepartment();
	gettype();
	getuser();
});


function setCurrentDate() {
	var dateinput = $(this).parents('li').find('input');
	var userAgent = navigator.userAgent.toLowerCase();
	var chrome = /chrome/.test(userAgent); 
	var opera = /opera/.test(userAgent);
	var currentDate = new Date(); 
	var currentYear = currentDate.getYear(); 
	if ($.browser.mozilla || chrome || opera)
		currentYear += 1900; 
	if($.browser.msie && $.browser.version >= 8.0)
		currentYear -= 1900;
	if(currentDate.getMonth()<9){
		var currentDateStr = currentYear + '-0' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate();
		if(currentDate.getDate()<9)
			var currentDateStr = currentYear + '-0' + (currentDate.getMonth() + 1) + '-0' + currentDate.getDate();
	}
	if(currentDate.getMonth()>=9){
		var currentDateStr = currentYear + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate();
		if(currentDate.getDate()<9)
			var currentDateStr = currentYear + '-' + (currentDate.getMonth() + 1) + '-0' + currentDate.getDate();
	}
	dateinput.val(currentDateStr); 
}

function emptydateinput() {
	var dateinput = $(this).parents('li').find('input');
	dateinput.val(""); 
}

function getnew(){
	$.post('getnew',function(data){
			var json = eval('(' + data + ')');
			$('#getnew').empty();
			$.each(json,function(idx,item){
				if(idx == json.length)
					return true;
				$('#getnew').append("<div class='detail'><h5>"+item.assetname+"</h5><li>编号: "+item.aid+"</li><li>类别: "+item.type.typename+"</li><li>原值(价格): "+item.price+"</li></div>");
				});
				if($.browser.msie && $.browser.version < 8.0){
					$('.detail').css('display','inline');
					$('.body li').css('margin-left','10px');
				}
		});
}

function getbsend(){
	$.post('getbsend',function(data){
			var json = eval('(' + data + ')');
			$('#getbsend').empty();
			$.each(json,function(idx,item){
				if(idx == json.length)
					return true;
				$('#getbsend').append("<div class='detail'><h5>"+item.assetname+"</h5><li>编号: "+item.aid+"</li><li>类别: "+item.type.typename+"</li><li>原值(价格): "+item.price+"</li></div>");
				});
				if($.browser.msie && $.browser.version < 8.0){
					$('.detail').css('display','inline');
					$('.body li').css('margin-left','10px');
				}
		});
}

function getdepartment(){
	$.post('getdepartment',function(data){
			var json = eval('(' + data + ')');
			$.each(json,function(idx,item){
				if(idx == json.length)
					return true;
				$('.depart').append("<option value='"+item.id+"'>"+item.dpname+"</option>");
				});
		});
}

function gettype(){
	$.post('gettype',function(data){
			var json = eval('(' + data + ')');
			$.each(json,function(idx,item){
				if(idx == json.length)
					return true;
				$('.type').append("<option value='"+item.id+"'>"+item.typename+"</option>");
				});
		});
}

function getuser(){
	$.post('getuser',function(data){
			var json = eval('(' + data + ')');
			$.each(json,function(idx,item){
				if(idx == json.length)
					return true;
				$('.user').append("<option value='"+item.id+"'>"+item.name+"(  部门:"+item.department.dpname+")</option>");
				});
		});
}

function Checkusername(){
	if($('#username').val().length < 6){
		$('#res').animate({height:'show'},200);
		$('#res').show();
		$('#res .close').show();
		$('#res').attr('innerHTML','<font color=red>用户名长度必须大于6位</font>');
		$('#sub').unbind('click');
	}
	else{
		$('#res').attr('innerHTML','请先登录之后再进行操作.');
		$('#sub').click(login);
	}
}

function Checkpassword(){
	if($('#password').val().length < 6){
		$('#res').animate({height:'show'},200);
		$('#res').show();
		$('#res .close').show();
		$('#res').attr('innerHTML','<font color=red>密码长度必须大于6位</font>');
		$('#sub').unbind('click');
	}
	else{
		$('#res').attr('innerHTML','请先登录之后再进行操作.');
		$('#sub').click(login);
	}
}

function closetips(){
	$(this).hide();
	$(this).parents(".tips").find('p').hide();
	var tips = $(this).parents(".tips");
	$(tips).animate({height:'hide'},200);
}

function scrolltotop(){
	if(window.chrome) 
		jQuery('body').animate({scrollTop: 0}, 500);
	$body.animate({scrollTop: 0}, 500);
}

function login(){
	$('#res').animate({height:'show'},200);
	$('#res').show();
	$('#res .close').show();
	$('#res').attr('innerHTML','连接中,请稍候....');
	$.post('login?admin.username='+$('#username').val()+'&admin.password='+$('#password').val(),function(data){
			if(data == 'no'){
				$('#res').attr('innerHTML','<font color=red>用户名或者密码错误!</font>');
			}
			else{
				window.location.href='home.jsp';
			}
		});
}

function zhedie(){
	var div = $(this).parents(".stretch").parents(".title").parents(".div-top").parents(".body").find(".div-body");
	$(div).animate({height:'hide'},300);
	$(this).attr('src','images/zkh.png');
	$(this).attr('title','点击展开');
}

function zhankai(){
	var div = $(this).parents(".stretch").parents(".title").parents(".div-top").parents(".body").find(".div-body");
	$(div).animate({height:'show'},300);
	$(this).attr('src','images/zdh.png');
	$(this).attr('title','点击折叠');
}

function menu(){
	$('.menu1  li:gt(0)').hide();
	$('.menu2  li:gt(0)').hide();
	$('.menu3  li:gt(0)').hide();
	$('.menu1 li:eq(0)').click(function(){
		if($(this).hasClass('open')){
			$('.menu1  li:gt(0)').hide();
			$(this).removeClass('open');
		}
		else{
			$('.menu2  li:gt(0)').hide();
			$('.menu2  li:eq(0)').removeClass('open');
			$('.menu3  li:gt(0)').hide();
			$('.menu3  li:eq(0)').removeClass('open');
			$('.menu1  li:gt(0)').show();
			$(this).addClass('open');
		}
			});
	$('.menu1 li').hover(function(){
			$(this).addClass('menuhover');
		},function(){
			$(this).removeClass('menuhover');
			});
	$('.menu2 li:eq(0)').click(function(){
		if($(this).hasClass('open')){
			$('.menu2  li:gt(0)').hide();
			$(this).removeClass('open');
		}
		else{
			$('.menu1  li:gt(0)').hide();
			$('.menu1  li:eq(0)').removeClass('open');
			$('.menu3  li:gt(0)').hide();
			$('.menu3  li:eq(0)').removeClass('open');
			$('.menu2  li:gt(0)').show();
			$(this).addClass('open');
		}
			});
	$('.menu2 li').hover(function(){
			$(this).addClass('menuhover');
		},function(){
			$(this).removeClass('menuhover');
			});
	$('.menu3 li:eq(0)').click(function(){
		if($(this).hasClass('open')){
			$('.menu3  li:gt(0)').hide();
			$(this).removeClass('open');
		}
		else{
			$('.menu1  li:gt(0)').hide();
			$('.menu1  li:eq(0)').removeClass('open');
			$('.menu2  li:gt(0)').hide();
			$('.menu2  li:eq(0)').removeClass('open');
			$('.menu3  li:gt(0)').show();
			$(this).addClass('open');
		}
			});
	$('.menu3 li').hover(function(){
			$(this).addClass('menuhover');
		},function(){
			$(this).removeClass('menuhover');
			});
}

function changepass(){
	$('#res').attr('innerHTML',' 连接中,请稍后....');
	$('#res').animate({height:'show'},200);
	$.post('changepass?old='+$('#old').val()+'&newp='+$('#new').val()+'&rep='+$('#rep').val(),function(data){
			if(data == 'wrong'){
				$('#res').attr('innerHTML',' <font color=red>原始密码错误!</font>');
				$('#res').animate({height:'show'},200);
			}
			if(data == 'length'){
				$('#res').attr('innerHTML',' <font color=red>密码长度至少为6位!</font>');
				$('#res').animate({height:'show'},200);
			}
			if(data == 'same'){
				$('#res').attr('innerHTML',' <font color=red>两次密码不一致!</font>');
				$('#res').animate({height:'show'},200);
			}
			if(data == 'yes'){
				$('#res').attr('innerHTML',' 修改成功!');
				$('#res').animate({height:'show'},200);
			}
			if(window.chrome) 
				jQuery('body').animate({scrollTop: $('#res').offset().top}, 300);
			$body.animate({scrollTop: $('#res').offset().top}, 300);
		});
}

function changepersondetail(){
	$('#res1').attr('innerHTML',' 连接中,请稍后....');
	$('#res1').animate({height:'show'},200);
	$.post('changepersondetail?dp='+$('#departval').val()+'&email='+$('#email').val()+'&wp='+$('#wp').val()+'&mp='+$('#mp').val(),function(data){
			if(data == 'email'){
				$('#res1').attr('innerHTML',' <font color=red>邮箱格式错误!</font>');
				$('#res1').animate({height:'show'},200);
			}
			if(data == 'wp'){
				$('#res1').attr('innerHTML',' <font color=red>工作电话格式错误!</font>');
				$('#res1').animate({height:'show'},200);
			}
			if(data == 'mp'){
				$('#res1').attr('innerHTML',' <font color=red>移动电话格式错误!</font>');
				$('#res1').animate({height:'show'},200);
			}
			if(data == 'dp'){
				$('#res1').attr('innerHTML',' <font color=red>请选择部门!</font>');
				$('#res1').animate({height:'show'},200);
			}
			if(data == 'suc'){
				$('#res1').attr('innerHTML',' 修改成功!');
				$('#res1').animate({height:'show'},200);
			}
			if(window.chrome) 
				jQuery('body').animate({scrollTop: $('#res1').offset().top}, 300);
			$body.animate({scrollTop: $('#res1').offset().top}, 300);
		});
}

function createuser(){
	$('#res').attr('innerHTML',' 连接中,请稍后....');
	$('#res').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'createuser?did='+$('#departval').val()+'&user.email='+$('#email').val()+'&user.workphone='+$('#wp').val()+'&user.mobilephone='+$('#mp').val()+'&user.name='+$('#name').val()+'&isIE=1';
	else
		url = 'createuser?did='+$('#departval').val()+'&user.email='+$('#email').val()+'&user.workphone='+$('#wp').val()+'&user.mobilephone='+$('#mp').val()+'&user.name='+$('#name').val()+'&isIE=0';
	$.post(url,function(data){
			if(data == 'email'){
				$('#res').attr('innerHTML',' <font color=red>邮箱格式错误!</font>');
				$('#res').animate({height:'show'},200);
			}
			if(data == 'wp'){
				$('#res').attr('innerHTML',' <font color=red>工作电话格式错误!</font>');
				$('#res').animate({height:'show'},200);
			}
			if(data == 'mp'){
				$('#res').attr('innerHTML',' <font color=red>移动电话格式错误!</font>');
				$('#res').animate({height:'show'},200);
			}
			if(data == 'suc'){
				$('#res').attr('innerHTML',' 添加成功!');
				$('#res').animate({height:'show'},200);
			}
			if(data == 'empty'){
				$('#res').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
				$('#res').animate({height:'show'},200);
			}
			if(window.chrome) 
				jQuery('body').animate({scrollTop: $('#res').offset().top}, 300);
			$body.animate({scrollTop: $('#res').offset().top}, 300);
		});
}

function searchuser(){
	$('#res1').attr('innerHTML',' 连接中,请稍后....');
	$('#res1').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'searchuser?type='+$('input[@type=radio][name=typeval][checked]').val()+'&value='+$('#value').val()+'&did='+$('#departval1').val()+'&isIE=1';
	else
		url = 'searchuser?type='+$('input[@type=radio][name=typeval][checked]').val()+'&value='+$('#value').val()+'&did='+$('#departval1').val()+'&isIE=0';
	$.post(url,function(data){
			if(data == 'empty'){
				$('#res1').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
				$('#res1').animate({height:'show'},200);
				if(window.chrome) 
					jQuery('body').animate({scrollTop: $('#res1').offset().top}, 300);
				$body.animate({scrollTop: $('#res1').offset().top}, 300);
			}
			else{
				var json = eval('(' + data + ')');
				if(json.length == 0){
					$('#res1').attr('innerHTML',' <font color=red>暂无数据!</font>');
					$('#res1').animate({height:'show'},200);
					$body.animate({scrollTop: $('#res1').offset().top}, 300);
					$('#searchresultwrap').animate({height:'hide',opacity:'hide'},300);
				}
				else{
					$('#searchresult').empty();
					$.each(json,function(idx,item){
						if(idx == json.length)
							return true;
						var a;
						a = "<li><a class='delete' relid='"+item.id+"'>删除</a></li>";
						$('#searchresult').append("<div class='detail'><h5>"+item.name+"</h5><li>部门: "+item.department.dpname+"</li><li>邮箱: "+item.email+"</li><li>工作电话: "+item.workphone+"</li><li>移动电话: "+item.mobilephone+"</li><li><a href='#alteruserwrap' class='alter'  aid='"+item.id+"' name='"+item.name+"' email='"+item.email+"' wp='"+item.workphone+"' mp='"+item.mobilephone+"' dpid='"+item.department.id+"' dpname='"+item.department.dpname+"'>修改</a></li>"+a+"</div>");
						});
					$('#searchresult').append('<br/>');
					$('#searchresultwrap').animate({height:'show',opacity:'show'},300);
					$('#res1').attr('innerHTML','查询成功!');
					if($.browser.msie && $.browser.version < 8.0){
						$('.detail').css('display','inline');
					}
					$('#searchresult .delete').click(function(){
						$('#userid').val($(this).attr('relid'));
						$.confirm({
							'title'		: 'Delete Confirmation',
							'message'	: 'You are about to delete this item. Continue?',
							'buttons'	: {
								'Yes'	: {
									'class'	: 'blue',
									'action': function(){
											$.post('deleteuser?id='+$('#userid').val(),function(data){
											if(data == 'success'){
												searchuser();
											}
										});
									}
								},
								'No'	: {
									'class'	: 'gray',
									'action': function(){}
								}
							}
						});
						});
					if(window.chrome) 
						jQuery('body').animate({scrollTop: $('#searchresult').offset().top}, 300);
					$body.animate({scrollTop: $('#searchresult').offset().top}, 300);
					$('#searchresult .alter').click(function(){
						$('#alteruserwrap').animate({height:'hide',opacity:'hide'},300);
						$('#aname').val($(this).attr('name'));
						$('#aemail').val($(this).attr('email'));
						$('#departval2').val($(this).attr('dpid'));
						$('#aid').val($(this).attr('aid'));
						$('#awp').val($(this).attr('wp'));
						$('#amp').val($(this).attr('mp'));
						$('#alteruserwrap').animate({height:'show',opacity:'show'},300);
						$('#ares').hide();
						if(window.chrome) 
							jQuery('body').animate({scrollTop: $('#alteruserwrap').offset().top}, 300);
						$body.animate({scrollTop: $('#alteruserwrap').offset().top}, 300);
					});
				}
			}
		});
}
function alteruser(){
	$('#ares').attr('innerHTML',' 连接中,请稍后....');
	$('#ares').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'alteruser?user.id='+$('#aid').val()+'&user.name='+$('#aname').val()+'&user.email='+$('#aemail').val()+'&user.workphone='+$('#awp').val()+'&user.mobilephone='+$('#amp').val()+'&did='+$('#departval2').val()+'&isIE=1';
	else
		url = 'alteruser?user.id='+$('#aid').val()+'&user.name='+$('#aname').val()+'&user.email='+$('#aemail').val()+'&user.workphone='+$('#awp').val()+'&user.mobilephone='+$('#amp').val()+'&did='+$('#departval2').val()+'&isIE=0';
	$.post(url,function(data){
		if(data == 'empty'){
			$('#ares').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
			$('#ares').animate({height:'show'},200);
		}
		if(data == 'suc'){
			$('#ares').attr('innerHTML',' 修改成功!');
			$('#ares').animate({height:'show'},200);
		}
		if(window.chrome) 
			jQuery('body').animate({scrollTop: $('#ares').offset().top}, 300);
		$body.animate({scrollTop: $('#ares').offset().top}, 300);
	});
}


function createadmin(){
	$('#res').attr('innerHTML',' 连接中,请稍后....');
	$('#res').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'createadmin?did='+$('#departval').val()+'&admin.email='+$('#email').val()+'&admin.workphone='+$('#wp').val()+'&admin.mobilephone='+$('#mp').val()+'&admin.name='+$('#name').val()+'&admin.username='+$('#username').val()+'&admin.password='+$('#password').val()+'&confirm='+$('#confirmpassword').val()+'&isIE=1';
	else
		url = 'createadmin?did='+$('#departval').val()+'&admin.email='+$('#email').val()+'&admin.workphone='+$('#wp').val()+'&admin.mobilephone='+$('#mp').val()+'&admin.name='+$('#name').val()+'&admin.username='+$('#username').val()+'&admin.password='+$('#password').val()+'&confirm='+$('#confirmpassword').val()+'&isIE=0';
	$.post(url,function(data){
		if(data == 'email'){
			$('#res').attr('innerHTML',' <font color=red>邮箱格式错误!</font>');
			$('#res').animate({height:'show'},200);
		}
		if(data == 'wp'){
			$('#res').attr('innerHTML',' <font color=red>工作电话格式错误!</font>');
			$('#res').animate({height:'show'},200);
		}
		if(data == 'mp'){
			$('#res').attr('innerHTML',' <font color=red>移动电话格式错误!</font>');
			$('#res').animate({height:'show'},200);
		}
		if(data == 'suc'){
			$('#res').attr('innerHTML',' 添加成功!');
			$('#res').animate({height:'show'},200);
		}
		if(data == 'empty'){
			$('#res').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
			$('#res').animate({height:'show'},200);
		}
		if(data == 'same'){
			$('#res').attr('innerHTML',' <font color=red>两次密码不一致!</font>');
			$('#res').animate({height:'show'},200);
		}
		if(data == 'length'){
			$('#res').attr('innerHTML',' <font color=red>用户名或者密码长度小于6位!</font>');
			$('#res').animate({height:'show'},200);
		}
		if(window.chrome) 
			jQuery('body').animate({scrollTop: $('#res').offset().top}, 300);
		$body.animate({scrollTop: $('#res').offset().top}, 300);
		});
}

function searchadmin(){
	$('#res1').attr('innerHTML',' 连接中,请稍后....');
	$('#res1').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'searchadmin?type='+$('input[@type=radio][name=typeval][checked]').val()+'&value='+$('#value').val()+'&did='+$('#departval1').val()+'&isIE=1';
	else
		url = 'searchadmin?type='+$('input[@type=radio][name=typeval][checked]').val()+'&value='+$('#value').val()+'&did='+$('#departval1').val()+'&isIE=0';
	$.post(url,function(data){
			if(data == 'empty'){
				$('#res1').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
				$('#res1').animate({height:'show'},200);
				if(window.chrome) 
					jQuery('body').animate({scrollTop: $('#res1').offset().top}, 300);
				$body.animate({scrollTop: $('#res1').offset().top}, 300);
			}
			else{
				var json = eval('(' + data + ')');
				if(json.length == 0){
					$('#res1').attr('innerHTML',' <font color=red>暂无数据!</font>');
					$('#res1').animate({height:'show'},200);
					if(window.chrome) 
						jQuery('body').animate({scrollTop: $('#res1').offset().top}, 300);
					$body.animate({scrollTop: $('#res1').offset().top}, 300);
					$('#searchresultwrap').animate({height:'hide',opacity:'hide'},300);
				}
				else{
					$('#searchresult').empty();
					$.each(json,function(idx,item){
						if(idx == json.length)
							return true;
						var a;
						a = "<li><a class='delete' relid='"+item.id+"'>删除</a></li>";
						$('#searchresult').append("<div class='detail'><h5>"+item.name+'('+item.username+')'+"</h5><li>部门: "+item.department.dpname+"</li><li>邮箱: "+item.email+"</li><li>工作电话: "+item.workphone+"</li><li>移动电话: "+item.mobilephone+"</li>"+a+"</div>");
						});
					$('#searchresult').append('<br/>');
					$('#res1').attr('innerHTML',' 查询成功!');
					$('#searchresultwrap').animate({height:'show',opacity:'show'},300);
					if($.browser.msie && $.browser.version < 8.0){
						$('.detail').css('display','inline');
					}
					$('#searchresult .delete').click(function(){
						$('#userid').val($(this).attr('relid'));
						$.confirm({
							'title'		: 'Delete Confirmation',
							'message'	: 'You are about to delete this item. Continue?',
							'buttons'	: {
								'Yes'	: {
									'class'	: 'blue',
									'action': function(){
											$.post('deleteadmin?id='+$('#userid').val(),function(data){
											if(data == 'success'){
												searchadmin();
											}
										});
									}
								},
								'No'	: {
									'class'	: 'gray',
									'action': function(){}
								}
							}
						});
						});
					if(window.chrome) 
						jQuery('body').animate({scrollTop: $('#searchresult').offset().top}, 300);
					$body.animate({scrollTop: $('#searchresult').offset().top}, 300);
				}
			}
		});
}

function createdp(){
	$('#res').attr('innerHTML',' 连接中,请稍后....');
	$('#res').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'createdp?dp.dpname='+$('#dpname').val()+'&dp.description='+$('#description').val()+'&isIE=1';
	else
		url = 'createdp?dp.dpname='+$('#dpname').val()+'&dp.description='+$('#description').val()+'&isIE=0';
	$.post(url,function(data){
		if(data == 'suc'){
			$('#res').attr('innerHTML',' 添加成功!');
			$('#res').animate({height:'show'},200);
		}
		if(data == 'empty'){
			$('#res').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
			$('#res').animate({height:'show'},200);
		}
		if(window.chrome) 
			jQuery('body').animate({scrollTop: $('#res').offset().top}, 300);
		$body.animate({scrollTop: $('#res').offset().top}, 300);
	});
}

function alterdp(){
	$('#ares').attr('innerHTML',' 连接中,请稍后....');
	$('#ares').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'alterdp?dp.dpname='+$('#adpname').val()+'&dp.description='+$('#adescription').val()+'&dp.id='+$('#dpid').val()+'&isIE=1';
	else
		url = 'alterdp?dp.dpname='+$('#adpname').val()+'&dp.description='+$('#adescription').val()+'&dp.id='+$('#dpid').val()+'&isIE=0';
	$.post(url,function(data){
		if(data == 'empty'){
			$('#ares').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
			$('#ares').animate({height:'show'},200);
		}
		if(data == 'suc'){
			$('#ares').attr('innerHTML',' 修改成功!');
			$('#ares').animate({height:'show'},200);
		}
		if(window.chrome) 
			jQuery('body').animate({scrollTop: $('#ares').offset().top}, 300);
		$body.animate({scrollTop: $('#ares').offset().top}, 300);
	});
}

function searchdp(){
	$('#res1').attr('innerHTML',' 连接中,请稍后....');
	$('#res1').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'searchdp?value='+$('#value').val()+'&isIE=1';
	else
		url = 'searchdp?value='+$('#value').val()+'&isIE=0';
	$.post(url,function(data){
			if(data == 'empty'){
				$('#res1').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
				$('#res1').animate({height:'show'},200);
				if(window.chrome) 
					jQuery('body').animate({scrollTop: $('#res1').offset().top}, 300);
				$body.animate({scrollTop: $('#res1').offset().top}, 300);
			}
			else{
				var json = eval('(' + data + ')');
				if(json.length == 0){
					$('#res1').attr('innerHTML',' <font color=red>暂无数据!</font>');
					$('#res1').animate({height:'show'},200);
					if(window.chrome) 
						jQuery('body').animate({scrollTop: $('#res1').offset().top}, 300);
					$body.animate({scrollTop: $('#res1').offset().top}, 300);
					$('#searchresultwrap').animate({height:'hide',opacity:'hide'},300);
				}
				else{
					$('#searchresult').empty();
					$.each(json,function(idx,item){
						if(idx == json.length)
							return true;
						var a;
						a = "<li><a class='delete' relid='"+item.id+"'>删除</a></li>";
						if(item.description == '')
							$('#searchresult').append("<div class='detail'><h5>"+item.dpname+"</h5><li> 暂无描述</li><li><a href='#alterdpwrap' class='alter'  dpid='"+item.id+"' dpname='"+item.dpname+"' description='"+item.description+"'>修改</a></li>"+a+"</div>");
						else
							$('#searchresult').append("<div class='detail'><h5>"+item.dpname+"</h5><li> "+item.description+"</li><li><a href='#alterdpwrap' class='alter'  dpid='"+item.id+"' dpname='"+item.dpname+"' description='"+item.description+"'>修改</a></li>"+a+"</div>");
					});
					$('#searchresult').append('<br/>');
					$('#searchresultwrap').animate({height:'show',opacity:'show'},300);
					$('#res1').attr('innerHTML','查询成功!');
					if($.browser.msie && $.browser.version < 8.0){
						$('.detail').css('display','inline');
					}
					$('#searchresult .delete').click(function(){
						$('#ddpid').val($(this).attr('relid'));
						$.confirm({
							'title'		: 'Delete Confirmation',
							'message'	: 'You are about to delete this item. Continue?',
							'buttons'	: {
								'Yes'	: {
									'class'	: 'blue',
									'action': function(){
											$.post('deletedp?id='+$('#ddpid').val(),function(data){
											if(data == 'success'){
												searchdp();
											}
										});
									}
								},
								'No'	: {
									'class'	: 'gray',
									'action': function(){}
								}
							}
						});
						});
					if(window.chrome) 
						jQuery('body').animate({scrollTop: $('#searchresult').offset().top}, 300);
					$body.animate({scrollTop: $('#searchresult').offset().top}, 300);
					$('#searchresult .alter').click(function(){
						$('#alterdpwrap').animate({height:'hide',opacity:'hide'},300);
						$('#adescription').val($(this).attr('description'));
						$('#adpname').val($(this).attr('dpname'));
						$('#dpid').val($(this).attr('dpid'));
						$('#alterdpwrap').animate({height:'show',opacity:'show'},300);
						$('#ares').hide();
						if(window.chrome) 
							jQuery('body').animate({scrollTop: $('#alterdpwrap').offset().top}, 300);
						$body.animate({scrollTop: $('#alterdpwrap').offset().top}, 300);
					});
				}
			}
		});
}


function createtype(){
	$('#res').attr('innerHTML',' 连接中,请稍后....');
	$('#res').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'createtype?type.typename='+$('#dpname').val()+'&type.description='+$('#description').val()+'&isIE=1';
	else
		url = 'createtype?type.typename='+$('#dpname').val()+'&type.description='+$('#description').val()+'&isIE=0';
	$.post(url,function(data){
		if(data == 'suc'){
			$('#res').attr('innerHTML',' 添加成功!');
			$('#res').animate({height:'show'},200);
		}
		if(data == 'empty'){
			$('#res').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
			$('#res').animate({height:'show'},200);
		}
		if(window.chrome) 
			jQuery('body').animate({scrollTop: $('#res').offset().top}, 300);
		$body.animate({scrollTop: $('#res').offset().top}, 300);
	});
}

function altertype(){
	$('#ares').attr('innerHTML',' 连接中,请稍后....');
	$('#ares').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'altertype?type.typename='+$('#adpname').val()+'&type.description='+$('#adescription').val()+'&type.id='+$('#dpid').val()+'&isIE=1';
	else
		url = 'altertype?type.typename='+$('#adpname').val()+'&type.description='+$('#adescription').val()+'&type.id='+$('#dpid').val()+'&isIE=0';
	$.post(url,function(data){
		if(data == 'empty'){
			$('#ares').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
			$('#ares').animate({height:'show'},200);
		}
		if(data == 'suc'){
			$('#ares').attr('innerHTML',' 修改成功!');
			$('#ares').animate({height:'show'},200);
		}
		if(window.chrome) 
			jQuery('body').animate({scrollTop: $('#ares').offset().top}, 300);
		$body.animate({scrollTop: $('#ares').offset().top}, 300);
	});
}

function searchtype(){
	$('#res1').attr('innerHTML',' 连接中,请稍后....');
	$('#res1').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'searchtype?value='+$('#value').val()+'&isIE=1';
	else
		url = 'searchtype?value='+$('#value').val()+'&isIE=0';
	$.post(url,function(data){
			if(data == 'empty'){
				$('#res1').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
				$('#res1').animate({height:'show'},200);
				if(window.chrome) 
					jQuery('body').animate({scrollTop: $('#res1').offset().top}, 300);
				$body.animate({scrollTop: $('#res1').offset().top}, 300);
			}
			else{
				var json = eval('(' + data + ')');
				if(json.length == 0){
					$('#res1').attr('innerHTML',' <font color=red>暂无数据!</font>');
					$('#res1').animate({height:'show'},200);
					if(window.chrome) 
						jQuery('body').animate({scrollTop: $('#res1').offset().top}, 300);
					$body.animate({scrollTop: $('#res1').offset().top}, 300);
					$('#searchresultwrap').animate({height:'hide',opacity:'hide'},300);
				}
				else{
					$('#res1').attr('innerHTML',' 查询成功!');
					$('#res1').animate({height:'show'},200);
					$('#searchresult').empty();
					$.each(json,function(idx,item){
						if(idx == json.length)
							return true;
						var a;
						a = "<li><a class='delete' relid='"+item.id+"'>删除</a></li>";
						if(item.description == '')
							$('#searchresult').append("<div class='detail'><h5>"+item.typename+"</h5><li> 暂无描述</li><li><a href='#alterdpwrap' class='alter'  dpid='"+item.id+"' dpname='"+item.typename+"' description='"+item.description+"'>修改</a></li>"+a+"</div>");
						else
							$('#searchresult').append("<div class='detail'><h5>"+item.typename+"</h5><li> "+item.description+"</li><li><a href='#alterdpwrap' class='alter'  dpid='"+item.id+"' dpname='"+item.typename+"' description='"+item.description+"'>修改</a></li>"+a+"</div>");
					});
					$('#searchresult').append('<br/>');
					$('#searchresultwrap').animate({height:'show',opacity:'show'},300);
					if($.browser.msie && $.browser.version < 8.0){
						$('.detail').css('display','inline');
					}
					$('#searchresult .delete').click(function(){
						$('#ddpid').val($(this).attr('relid'));
						$.confirm({
							'title'		: 'Delete Confirmation',
							'message'	: 'You are about to delete this item. Continue?',
							'buttons'	: {
								'Yes'	: {
									'class'	: 'blue',
									'action': function(){
											$.post('deletetype?id='+$('#ddpid').val(),function(data){
											if(data == 'success'){
												searchdp();
											}
										});
									}
								},
								'No'	: {
									'class'	: 'gray',
									'action': function(){}
								}
							}
						});
						});
					if(window.chrome) 
						jQuery('body').animate({scrollTop: $('#searchresult').offset().top}, 300);
					$body.animate({scrollTop: $('#searchresult').offset().top}, 300);
					$('#searchresult .alter').click(function(){
						$('#alterdpwrap').animate({height:'hide',opacity:'hide'},300);
						$('#adescription').val($(this).attr('description'));
						$('#adpname').val($(this).attr('dpname'));
						$('#dpid').val($(this).attr('dpid'));
						$('#alterdpwrap').animate({height:'show',opacity:'show'},300);
						$('#ares').hide();
						if(window.chrome) 
							jQuery('body').animate({scrollTop: $('#alterdpwrap').offset().top}, 300);
						$body.animate({scrollTop: $('#alterdpwrap').offset().top}, 300);
					});
				}
			}
		});
}

function createasset(){
	$('#res').attr('innerHTML',' 连接中,请稍后....');
	$('#res').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'createasset?asset.aid='+$('#aid').val()+'&asset.assetname='+$('#aname').val()+'&typeid='+$('#type').val()+'&asset.version='+$('#version').val()+'&asset.manufacturer='+$('#mf').val()+'&ccrq='+$('#ccrq').val()+'&gmrq='+$('#gmrq').val()+'&asset.price='+$('#price').val()+'&isuse='+$('input[@type=radio][name=isuse][checked]').val()+'&did='+$('#adepart').val()+'&uid='+$('#auser').val()+'&isdep='+$('input[@type=radio][name=isdep][checked]').val()+'&isIE=1';
	else
		url = 'createasset?asset.aid='+$('#aid').val()+'&asset.assetname='+$('#aname').val()+'&typeid='+$('#type').val()+'&asset.version='+$('#version').val()+'&asset.manufacturer='+$('#mf').val()+'&ccrq='+$('#ccrq').val()+'&gmrq='+$('#gmrq').val()+'&asset.price='+$('#price').val()+'&isuse='+$('input[@type=radio][name=isuse][checked]').val()+'&did='+$('#adepart').val()+'&uid='+$('#auser').val()+'&isdep='+$('input[@type=radio][name=isdep][checked]').val()+'&isIE=0';
	$.post(url,function(data){
		if(data == 'suc'){
			$('#res').attr('innerHTML',' 添加成功!');
			$('#res').animate({height:'show'},200);
		}
		if(data == 'empty'){
			$('#res').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
			$('#res').animate({height:'show'},200);
		}
		if(window.chrome) 
			jQuery('body').animate({scrollTop: $('#res').offset().top}, 300);
		$body.animate({scrollTop: $('#res').offset().top}, 300);
	});
}

function searchasset(){
	$('#res').attr('innerHTML',' 连接中,请稍后....');
	$('#res').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'searchasset?selecttype='+$('input[@type=radio][name=selecttype][checked]').val()+'&value='+$('#value').val()+'&price1='+$('#price1').val()+'&price2='+$('#price2').val()+'&isdep='+$('input[@type=radio][name=isdep][checked]').val()+'&isuse='+$('input[@type=radio][name=isuse][checked]').val()+'&typeid='+$('#type').val()+'&did='+$('#adepart').val()+'&uid='+$('#auser').val()+'&isIE=1';
	else
		url = 'searchasset?selecttype='+$('input[@type=radio][name=selecttype][checked]').val()+'&value='+$('#value').val()+'&price1='+$('#price1').val()+'&price2='+$('#price2').val()+'&isdep='+$('input[@type=radio][name=isdep][checked]').val()+'&isuse='+$('input[@type=radio][name=isuse][checked]').val()+'&typeid='+$('#type').val()+'&did='+$('#adepart').val()+'&uid='+$('#auser').val()+'&isIE=0';
		$.post(url,function(data){
			if(data == 'empty'){
				$('#res').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
				$('#res').animate({height:'show'},200);
				if(window.chrome) 
					jQuery('body').animate({scrollTop: $('#res1').offset().top}, 300);
				$body.animate({scrollTop: $('#res1').offset().top}, 300);
			}
			else{
				var json = eval('(' + data + ')');
				if(json.length == 0){
					$('#res').attr('innerHTML',' <font color=red>暂无数据!</font>');
					$('#res').animate({height:'show'},200);
					if(window.chrome) 
						jQuery('body').animate({scrollTop: $('#res').offset().top}, 300);
					$body.animate({scrollTop: $('#res').offset().top}, 300);
					$('#searchresultwrap').animate({height:'hide',opacity:'hide'},300);
				}
				else{
					var pagecount = ((json.length - (json.length % 10)) / 10) + 1;
					if(json.length % 10 == 0)
						pagecount--;
					$('#res').attr('innerHTML',' 查询成功!');
					$('#res').animate({height:'show'},200);
					showasset(json,parseInt($('#page').val()),pagecount);
					$('#searchresultwrap').animate({height:'show'},300);
					if(window.chrome) 
						jQuery('body').animate({scrollTop: $('#searchresult').offset().top}, 300);
					$body.animate({scrollTop: $('#searchresult').offset().top}, 300);
					$('#page').val(1);
				}
			}
		});
}

function showasset(json,page,pagecount){
	page = parseInt(page);
	var price = 0;
	$.each(json,function(idx,item){
		price += parseInt(item.price);
	});
	$('#searchresult').empty();
	$('#searchresult').append("<div class='pricecount'>查询出的资产的总值为:"+price+" RMB</div><div class='tablepagecount'>PAGE "+page+" / "+pagecount+"</div>");
	$('#searchresult').append("<div class='table'><div><span>资产编号</span><span>资产名</span><span>资产类别</span><span>原值(价格)</span><span>状态</span><span>折旧</span> <span>编辑</span></div></div>");
	$.each(json,function(idx,item){
		if(idx >= (page-1)*10 && idx < page*10){
			var a;
			a = "<span class='del' relid='"+item.id+"'>删除</span><span class='alter' relid='"+item.id+"' aaid='"+item.aid+"' aname='"+item.assetname+"' aversion='"+item.version+"' amf='"+item.manufacturer+"' aprice='"+item.price+"'>修改</span><span class='sx' aid='"+item.aid+"' relid='"+item.id+"'>送修</span>";
			var usestate;
			if(item.usestate == '1')
				usestate = '未分配';
			if(item.usestate == '2')
				usestate = '已分配';
			if(item.usestate == '3')
				usestate = '送修';
			var deprecition;
			if(item.deprecition == '1')
				deprecition = '是';
			if(item.deprecition == '2')
				deprecition = '否';
			$('#searchresult').append("<input type='hidden' id='ddpid' /><div class='table'><div><span>"+item.aid+"</span><span class='tableshowdetail' relid='"+item.id+"'>"+item.assetname+"</span><span>"+item.type.typename+"</span><span>"+item.price+" RMB</span><span>"+usestate+"</span><span>"+deprecition+"</span><span>"+a+"</span></div></div>");
		}
	});
	var foot = "<div class='tablepage'><div><span>First</span><span>Previous</span>";
					for(i = 1; i <= pagecount; i++){
						foot+="<span id='span"+i+"'>"+i+"</span>";
					}
					foot+="<span>Next</span><span>Last</span></div></div>"
	$('#searchresult').append(foot);
	var span = $('#span'+page);
	$(span).css('border-top','#FF3366 3px solid');
	$(span).css('color','#FF3366');
	$(span).addClass('currentpage');
	$('#searchresult .del').click(function(){
						$('#ddpid').val($(this).attr('relid'));
						var div = $(this).parents('div').parents('.table');
						$.confirm({
							'title'		: 'Delete Confirmation',
							'message'	: 'You are about to delete this item. Continue?',
							'buttons'	: {
								'Yes'	: {
									'class'	: 'blue',
									'action': function(){
											$.post('deleteasset?id='+$('#ddpid').val(),function(data){
											if(data == 'success'){
												$('#page').val(page);
												if($('#statistics').val() == 100)
													statistics();
												else
													searchasset();
											}
										});
									}
								},
								'No'	: {
									'class'	: 'gray',
									'action': function(){}
								}
							}
						});
						});
	$('.tableshowdetail').toggle(function(){
		var div = $(this).parents('div').parents('.table');
		$(div).after("<div class='tabledetail'><div>正在查询.</div></div>");
		$.post("getasset?id="+$(this).attr('relid'),function(data){
				$(div).next('div').remove();
				$(div).after(data);
				$('.sxwb').click(function(){
					$('#ddpid').val($(this).attr('relid'));
					$.confirm({
							'title'		: 'Action Confirmation',
							'message'	: 'You are about to do this action. Continue?',
							'buttons'	: {
								'Yes'	: {
									'class'	: 'blue',
									'action': function(){
											$.post('sxwb?id='+$('#ddpid').val(),function(data){
											if(data == 'success'){
												$('#sres p').attr('innerHTML',' 修改成功!');
												$('#sres').animate({height:'show'},200);
												if(window.chrome) 
													jQuery('body').animate({scrollTop: $('#sres').offset().top}, 300);
												$body.animate({scrollTop: $('#sres').offset().top}, 300);
											}
										});
									}
								},
								'No'	: {
									'class'	: 'gray',
									'action': function(){}
								}
							}
						});
				});
				if($.browser.msie && $.browser.version < 8.0)
					$('.tabledetail ul').css('display','inline');
		});
	},function(){
		var div = $(this).parents('div').parents('.table');
		$(div).next('.tabledetail').remove();
	});
	$('.table:eq(0)').css('background-image','url(images/tr1.png)');
					 $('.table').each(function(idx){
						 if(idx%2 != 0){
							$(this).css('background-image','none');
							$(this).hover(function(){$(this).css('background-image','url(images/tr1.png)');},function(){$(this).css('background-image','none');});
						 }
						  if(idx%2 == 0 && idx != 0){
							 $(this).hover(function(){$(this).css('background-image','url(images/tr1.png)');},function(){$(this).css('background-image','url(images/tr.png)');});
						 }
						$(this).find('span:eq(0)').css('width','100px');
						$(this).find('span:eq(1)').css('width','200px');
						$(this).find('span:eq(2)').css('width','200px');
						$(this).find('span:eq(3)').css('width','150px');
						$(this).find('span:eq(4)').css('width','80px');
						$(this).find('span:eq(5)').css('width','80px');
						$(this).find('span:eq(6)').css('width','100px');
					});
	$('.tablepage span').click(function(){
						page = $(this).attr('innerHTML');
						if($(this).attr('innerHTML') == 'First')
							page = 1;
						if($(this).attr('innerHTML') == 'Last')
							page = pagecount;
						if($(this).attr('innerHTML') == 'Previous'){
							page = parseInt($('.currentpage').attr('innerHTML')) - 1;
							if(page == 0)
								return;
						}
						if($(this).attr('innerHTML') == 'Next'){
							page = parseInt($('.currentpage').attr('innerHTML')) + 1;
							if(page > pagecount)
								return;
						}
						showasset(json,page,pagecount);
					});
					
		$('#searchresult .alter').click(function(){
						$('#asid').val($(this).attr('relid'));
						$('#alterdpwrap').animate({height:'hide',opacity:'hide'},300);
						$('#aaid').val($(this).attr('aaid'));
						$('#aaname').val($(this).attr('aname'));
						$('#aversion').val($(this).attr('aversion'));
						$('#amf').val($(this).attr('amf'));
						$('#ccrq').val($(this).attr('ccrq'));
						$('#gmrq').val($(this).attr('gmrq'));
						$('#aprice').val($(this).attr('aprice'));
						$('#alterdpwrap').animate({height:'show',opacity:'show'},300);
						$('#ares').hide();
						if(window.chrome) 
							jQuery('body').animate({scrollTop: $('#alterdpwrap').offset().top}, 300);
						$body.animate({scrollTop: $('#alterdpwrap').offset().top}, 300);
					});
		$('#searchresult .sx').click(function(){
						$('#sxid').val($(this).attr('relid'));
						$('#sxwrap').animate({height:'hide',opacity:'hide'},300);
						$('#aid1').val($(this).attr('aid'));
						$('#sxwrap').animate({height:'show',opacity:'show'},300);
						$('#res1').hide();
						if(window.chrome) 
							jQuery('body').animate({scrollTop: $('#sxwrap').offset().top}, 300);
						$body.animate({scrollTop: $('#sxwrap').offset().top}, 300);
					});
		$('.tablepage span').hover(function(){
				$(this).css('border-top','#FF3366 3px solid');
				$(this).css('color','#FF3366');
			},function(){
				if(!$(this).hasClass('currentpage')){
					$(this).css('border-top','#09C 2px solid');
					$(this).css('color','#09C');
				}
		});
}

function alterasset(){
	$('#ares').attr('innerHTML',' 连接中,请稍后....');
	$('#ares').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'alterasset?asset.id='+$('#asid').val()+'&asset.aid='+$('#aaid').val()+'&asset.assetname='+$('#aaname').val()+'&typeid='+$('#atype').val()+'&asset.version='+$('#aversion').val()+'&asset.manufacturer='+$('#amf').val()+'&ccrq='+$('#ccrq').val()+'&gmrq='+$('#gmrq').val()+'&asset.price='+$('#aprice').val()+'&isuse='+$('input[@type=radio][name=aisuse][checked]').val()+'&did='+$('#aadepart').val()+'&uid='+$('#aauser').val()+'&isdep='+$('input[@type=radio][name=aisdep][checked]').val()+'&isIE=1';
	else
		url = 'alterasset?asset.id='+$('#asid').val()+'&asset.aid='+$('#aaid').val()+'&asset.assetname='+$('#aaname').val()+'&typeid='+$('#atype').val()+'&asset.version='+$('#aversion').val()+'&asset.manufacturer='+$('#amf').val()+'&ccrq='+$('#ccrq').val()+'&gmrq='+$('#gmrq').val()+'&asset.price='+$('#aprice').val()+'&isuse='+$('input[@type=radio][name=aisuse][checked]').val()+'&did='+$('#aadepart').val()+'&uid='+$('#aauser').val()+'&isdep='+$('input[@type=radio][name=aisdep][checked]').val()+'&isIE=0';
	$.post(url,function(data){
		if(data == 'suc'){
			$('#ares').attr('innerHTML',' 修改成功!');
			$('#ares').animate({height:'show'},200);
		}
		if(data == 'empty'){
			$('#ares').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
			$('#ares').animate({height:'show'},200);
		}
		if(window.chrome) 
			jQuery('body').animate({scrollTop: $('#ares').offset().top}, 300);
		$body.animate({scrollTop: $('#ares').offset().top}, 300);
	});
}


function sxasset(){
	$('#res1').attr('innerHTML',' 连接中,请稍后....');
	$('#res1').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'sxasset?id='+$('#sxid').val()+'&bsend.cost='+$('#bprice').val()+'&uid='+$('#auser1').val()+'&bsend.description='+$('#description').val()+'&sxrq='+$('#sxrq').val()+'&isIE=1';
	else
		url = 'sxasset?id='+$('#sxid').val()+'&bsend.cost='+$('#bprice').val()+'&uid='+$('#auser1').val()+'&bsend.description='+$('#description').val()+'&sxrq='+$('#sxrq').val()+'&isIE=0';
	$.post(url,function(data){
		if(data == 'suc'){
			$('#res1').attr('innerHTML',' 操作成功!');
			$('#res1').animate({height:'show'},200);
		}
		if(data == 'empty'){
			$('#res1').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
			$('#res1').animate({height:'show'},200);
		}
		if(window.chrome) 
			jQuery('body').animate({scrollTop: $('#res1').offset().top}, 300);
		$body.animate({scrollTop: $('#res1').offset().top}, 300);
	});
}

function statistics(){
	$('#res').attr('innerHTML',' 连接中,请稍后....');
	$('#res').animate({height:'show'},200);
	var url;
	if($.browser.msie)
		url = 'statistics?type='+$('input[@type=radio][name=selecttype][checked]').val()+'&t1='+$('#t1').val()+'&t2='+$('#t2').val()+'&isIE=1';
	else
		url = 'statistics?type='+$('input[@type=radio][name=selecttype][checked]').val()+'&t1='+$('#t1').val()+'&t2='+$('#t2').val()+'&isIE=0';
		$.post(url,function(data){
			if(data == 'empty'){
				$('#res').attr('innerHTML',' <font color=red>请将信息补充完整!</font>');
				$('#res').animate({height:'show'},200);
				if(window.chrome) 
					jQuery('body').animate({scrollTop: $('#res1').offset().top}, 300);
				$body.animate({scrollTop: $('#res1').offset().top}, 300);
			}
			else{
				var json = eval('(' + data + ')');
				if(json.length == 0){
					$('#res').attr('innerHTML',' <font color=red>暂无数据!</font>');
					$('#res').animate({height:'show'},200);
					if(window.chrome) 
						jQuery('body').animate({scrollTop: $('#res').offset().top}, 300);
					$body.animate({scrollTop: $('#res').offset().top}, 300);
					$('#searchresultwrap').animate({height:'hide',opacity:'hide'},300);
				}
				else{
					var pagecount = ((json.length - (json.length % 10)) / 10) + 1;
					if(json.length % 10 == 0)
						pagecount--;
					$('#res').attr('innerHTML',' 查询成功!');
					$('#res').animate({height:'show'},200);
					showasset(json,parseInt($('#page').val()),pagecount);
					$('#searchresultwrap').animate({height:'show'},300);
					if(window.chrome) 
						jQuery('body').animate({scrollTop: $('#searchresult').offset().top}, 300);
					$body.animate({scrollTop: $('#searchresult').offset().top}, 300);
					$('#page').val(1);
				}
			}
		});
}