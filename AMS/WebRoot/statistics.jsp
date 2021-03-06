<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>分类统计 - 资产管理系统</title>
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
<input type="hidden" value="100" id="statistics" />
	<div class="body">
            <div class="div-top">
            	 <div class="title">
                    <h3>查找日期区间内的资产</h3>
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
                     <li><label>选择查询的资产*:</label><br/><label><input type="radio" name="selecttype" value="1" /> 增加的资产</label><label><input type="radio" name="selecttype" value="2" /> 送修的资产</label></li>
        			<li><label>输入日期区间(YYYY-MM-DD)*:</label><input type="text" size="70" id="t1" class="dateinput"/>*<br/><br/><input type="button" id="t1btn" class="datebtn" value="Calendar" /><input type="button" class="emptybtn" value="Empty" /></li>
                    <li><input type="text" size="70" id="t2" class="dateinput"/>*<br/><br/><input type="button" id="t2btn" class="datebtn" value="Calendar" /><input type="button" class="emptybtn" value="Empty" /></li>
                    <li><input type="button" id="statisticsbtn" value="SUBMIT" /><input type="reset" value="RESET" /></li>
                    </ul>
                    </form>
                </div>
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>
    
    <div class="tips" id="sres"><p>.</p><div class="close"></div></div>
    <div class="body" id="searchresultwrap">
    				<input type="hidden" id="page" value="1"/>
					<div class="div-top">
						<div class="title">
							<h3>
								搜索结果
							</h3>
							<div class="stretch">
								<img src="images/zd.png"/>
							</div>
						</div>
					</div>
					<div class="div-body">
						<div class="content">
                        	<div class="tablewrap" id="searchresult">
						</div>
                        </div>
					</div>
					<div class="div-bottom"></div>
				</div>

	<div class="body" id="alterdpwrap">
            <div class="div-top">
            	 <div class="title">
                    <h3>修改资产</h3>
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
     				 <li><label id="ares"></label></li>
                     <li><label>编号*:</label><input type="text" size="70" id="aaid"/>*</li>
        			<li><label>资产名*:</label><input type="text" size="70" id="aaname"/>*</li>
        			<li><label>类型*:</label>
				        <select id="atype" class="type">
				        <option value="0">请选择</option>
				        </select>
				    </li>
				    <li><label>型号:</label><input type="text" size="70" id="aversion"/></li>
				    <li><label>生产厂家:</label><input type="text" size="70" id="amf"/></li>
				    <li><label>出产日期(YYYY-MM-DD):</label><input type="text" size="70" id="ccrq" class="dateinput"/><br/><br/><input type="button" id="ccrqbtn" class="datebtn" value="Calendar" /><input type="button" class="emptybtn" value="Empty" /></li>
                    <li><label>购买日期(YYYY-MM-DD)*:</label><input type="text" size="70" id="gmrq" class="dateinput"/>*<br/><br/><input type="button" id="gmrqbtn" class="datebtn" value="Calendar" /><input type="button" class="emptybtn" value="Empty" /></li>
                    <li><label>原值(价格)*:</label><input type="text" size="70" id="aprice"/></li>
                    <li><label>分配情况*:</label><br/><label><input type="radio" name="aisuse" class="aisuse" value="1" id="isuse1" />未分配</label><label><input type="radio" class="aisuse" name="aisuse" value="2" id="isuse2"/>已分配</label></li>
                    
                        <li class="ayes"><label>所属部门:</label>
                            <select id="aadepart" class="depart">
                            <option value="0">请选择</option>
                            </select>
                        </li>
                        <li class="ayes"><label>使用人员:</label>
                            <select id="aauser" class="user">
                            <option value="0">请选择</option>
                            </select>
                        </li>
                    
                    <li><label>是否折旧*:</label><br/><label><input type="radio" name="aisdep" value="1" /> 是</label><label><input type="radio" name="aisdep" value="2" /> 否</label></li>
                    <li><input type="button" id="alterassetbtn" value="SUBMIT" /><input type="reset" value="RESET" /></li>
                    <input type="hidden" id="asid" />
                    </ul>
                    </form>
                </div>
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>

	<div class="body" id="sxwrap">
            <div class="div-top">
            	 <div class="title">
                    <h3>资产送修</h3>
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
     				 <li><label id="res1"></label></li>
                     <li><label>资产编号*:</label><input type="text" size="70" id="aid1"/>*</li>
				    <li><label>送修日期(YYYY-MM-DD)*:</label><input type="text" size="70" id="sxrq" class="dateinput"/>*<br/><br/><input type="button" id="sxrqbtn" class="datebtn" value="Calendar" /><input type="button" class="emptybtn" value="Empty" /></li>
                    <li><label>花费*:</label><input type="text" size="70" id="bprice"/>*</li>
                     <li><label>送修人员*:</label>
                            <select id="auser1" class="user">
                            <option value="0">请选择</option>
                            </select>*
                        </li>
                    
                  <li><label>描述:</label><textarea cols="70" rows="5" id="description" wrap="hard"></textarea></li>
                    <li><input type="button" id="sxbtn" value="SUBMIT" /><input type="reset" value="RESET" /></li>
                    <input type="hidden" id="sxid" />
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
	$(document).ready(function() {
	$('#ares').hide();
	$('#sres').hide();
	$('#alterdpwrap').hide();
	$('.body:eq(1)').hide();
	$('#alterassetbtn').click(alterasset);
	$('#res').hide();
	$('#res1').hide();
	$('#sxwrap').hide();
	$('#statisticsbtn').click(statistics);
	$('.yes').hide();
	$('.ayes').hide();
	$('#sxbtn').click(sxasset);
	$('.isuse').change(function(){
		if($("input[name='isuse']:checked").val() == 1)
			$('.yes').animate({height:'hide'},200);
		if($("input[name='isuse']:checked").val() == 2)
			$('.yes').animate({height:'show'},200);
	});
	$('.aisuse').change(function(){
		if($("input[name='aisuse']:checked").val() == 1)
			$('.ayes').animate({height:'hide'},200);
		if($("input[name='aisuse']:checked").val() == 2)
			$('.ayes').animate({height:'show'},200);
	});
	$('.menu3  li:eq(0)').addClass('open');
	$('.menu3  li:gt(0)').show();
	$('.menu3  li:eq(1)').addClass('menucurrent');
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
	$('#t1btn').DatePicker({
		format:'Y-m-d',
		date: $('#t1').val(),
		current: $('#t1').val(),
		starts: 1,
		position: 'r',
		onBeforeShow: function(){
			$('#t1').DatePickerSetDate($('#t1').val(), true);
		},
		onChange: function(formated, dates){
			$('#t1').val(formated);
		}
	});
	$('#t2btn').DatePicker({
		format:'Y-m-d',
		date: $('#t2').val(),
		current: $('#t2').val(),
		starts: 1,
		position: 'r',
		onBeforeShow: function(){
			$('#t2').DatePickerSetDate($('#t2').val(), true);
		},
		onChange: function(formated, dates){
			$('#t2').val(formated);
		}
	});
});
$('#sxrqbtn').DatePicker({
		format:'Y-m-d',
		date: $('#sxrq').val(),
		current: $('#sxrq').val(),
		starts: 1,
		position: 'r',
		onBeforeShow: function(){
			$('#sxrq').DatePickerSetDate($('#sxrq').val(), true);
		},
		onChange: function(formated, dates){
			$('#sxrq').val(formated);
		}
	});
});
</script>
</html>
