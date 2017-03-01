<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资产设置 - 资产管理系统</title>
<link rel="shortcut icon" type="image/png" href="images/favicons/favicon.png"/>
<link rel="icon" type="image/png" href="images/favicons/favicon.png"/>
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="js/datepicker.js"></script>
<script type="text/javascript" src="js/eye.js"></script>
<script type="text/javascript" src="js/utils.js"></script>
<script src="js/jquery.uniform.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="css/uniform.default.css" type="text/css" media="screen"/>
<script type="text/javascript" src="js/main.js"  charset="utf-8"></script>
<script type="text/javascript" src="./fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="./fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="./fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/jquery.confirm.css" type="text/css" media="screen" />
<link rel="stylesheet" media="screen" type="text/css" href="css/datepicker.css" />
</head>
<% if(session.getAttribute("admin") == null){%>
	<jsp:forward page="index.jsp"/><%} %>

<body>
<jsp:include page="content/head.jsp"></jsp:include>

	<div class="body">
            <div class="div-top">
            	 <div class="title">
                    <h3>添加资产</h3>
                     <div class="stretch">
                        <img src="images/zd.png" />
                    </div>
                </div>
            </div>
            <div class="div-body">
               <div class="content">
                  <div class="form">
                   <form>
     				 <ul>
                     <li><label id="res"></label></li>
                     <li><label>编号*:</label><input type="text" size="70" id="aid"/></li>
        			<li><label>资产名*:</label><input type="text" size="70" id="aname"/>*</li>
        			<li><label>类型*:</label>
				        <select id="type" class="type">
				        <option value="0">请选择</option>
				        </select>
				    </li>
				    <li><label>型号:</label><input type="text" size="70" id="version"/></li>
				    <li><label>生产厂家:</label><input type="text" size="70" id="mf"/></li>
				    <li><label>出产日期(YYYY-MM-DD):</label><input type="text" size="70" id="ccrq" class="dateinput"/><br/><br/><input type="button" id="ccrqbtn" class="datebtn" value="Calendar" /><input type="button" class="emptybtn" value="Empty" /></li>
                    <li><label>购买日期(YYYY-MM-DD)*:</label><input type="text" size="70" id="gmrq" class="dateinput"/>*<br/><br/><input type="button" id="gmrqbtn" class="datebtn" value="Calendar" /><input type="button" class="emptybtn" value="Empty" /></li>
                    <li><label>原值(价格)*:</label><input type="text" size="70" id="price"/>*</li>
                    <li><label>分配情况*:</label><br/><label><input type="radio" name="isuse" class="isuse" value="1" id="isuse1" />未分配</label><label><input type="radio" class="isuse" name="isuse" value="2" id="isuse2"/>已分配</label></li>
                    
                        <li class="yes"><label>所属部门:</label>
                            <select id="adepart" class="depart">
                            <option value="0">请选择</option>
                            </select>
                        </li>
                        <li class="yes"><label>使用人员:</label>
                            <select id="auser" class="user">
                            <option value="0">请选择</option>
                            </select>
                        </li>
                    
                    <li><label>是否折旧*:</label><br/><label><input type="radio" name="isdep" value="1" /> 是</label><label><input type="radio" name="isdep" value="2" /> 否</label></li>
                    <li><input type="button" id="creatassetbtn" value="SUBMIT" /><input type="reset" value="RESET" /></li>
                    </ul>
                    </form>
                </div>
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>


     <div class="sttop"></div>
    </div>
</div>
<jsp:include page="content/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
$(document).ready(function() {
	$('#res').hide();
	$('#creatassetbtn').click(createasset);
	$('.yes').hide();
	$('.isuse').change(function(){
		if($("input[name='isuse']:checked").val() == 1)
			$('.yes').animate({height:'hide'},200);
		if($("input[name='isuse']:checked").val() == 2)
			$('.yes').animate({height:'show'},200);
	});
	$('.menu2  li:eq(0)').addClass('open');
	$('.menu2  li:gt(0)').show();
	$('.menu2  li:eq(1)').addClass('menucurrent');
	$('.datebtn').click(setCurrentDate);
	$('.emptybtn').click(emptydateinput);
	$('#ccrqbtn').DatePicker({
		format:'Y-m-d',
		date: $('#ccrq').val(),
		current: $('#ccrq').val(),
		starts: 1,
		position: 'r',
		onBeforeShow: function(){
			$('#ccrq').DatePickerSetDate($('#ccrq').val(), true);
		},
		onChange: function(formated, dates){
			$('#ccrq').val(formated);
		}
	});
	$('#gmrqbtn').DatePicker({
		format:'Y-m-d',
		date: $('#gmrq').val(),
		current: $('#gmrq').val(),
		starts: 1,
		position: 'r',
		onBeforeShow: function(){
			$('#gmrq').DatePickerSetDate($('#gmrq').val(), true);
		},
		onChange: function(formated, dates){
			$('#gmrq').val(formated);
		}
	});
});
</script>
</html>
