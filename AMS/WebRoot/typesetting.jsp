<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>类别设置 - 资产管理系统</title>
<link rel="shortcut icon" type="image/png" href="images/favicons/favicon.png"/>
<link rel="icon" type="image/png" href="images/favicons/favicon.png"/>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery.uniform.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="css/uniform.default.css" type="text/css" media="screen"/>
<script type="text/javascript" src="js/main.js"  charset="utf-8"></script>
<script type="text/javascript" src="./fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="./fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="./fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/jquery.confirm.css" type="text/css" media="screen" />
</head>
<% if(session.getAttribute("admin") == null){%>
	<jsp:forward page="index.jsp"/><%} %>
<body>
<jsp:include page="content/head.jsp"></jsp:include>

	<div class="body">
            <div class="div-top">
            	 <div class="title">
                    <h3>添加类别</h3>
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
        			<li><label>类别名*:</label><input type="text" size="70" id="dpname"/>*</li>
        			<li><label>描述:</label><textarea cols="70" rows="5" id="description" wrap="hard"></textarea></li>
                    <li><input type="button" id="creatdpbtn" value="SUBMIT" /><input type="reset" value="RESET" /></li>
                    </ul>
                    </form>
                </div>
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>
    

    <div class="body">
            <div class="div-top">
            	 <div class="title">
                    <h3>查找类别</h3>
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
        			<li><label>输入查询的值(空值为显示所有类别):</label><input type="text" size="70" id="value"/></li>
                    <li><input type="button" id="searchdpdetail" value="SUBMIT" /><input type="reset" value="RESET" /></li>
                    </ul>
                    </form>
                </div>
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>
    
    <div class="body" id="searchresultwrap">
            <div class="div-top">
            	 <div class="title">
                    <h3>查询结果(如果有资产属于此类别,则不能删除该类别)</h3>
                     <div class="stretch">
                        <img src="images/zd.png" />
                    </div>
                </div>
            </div>
            <div class="div-body">
               <div class="content">
                  <input type="hidden" id="ddpid"/>
                	<div id="searchresult">
               
                	</div>
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>
    
    <div class="body" id="alterdpwrap">
            <div class="div-top">
            	 <div class="title">
                    <h3>修改类别</h3>
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
        			<li><label>类别名*:</label><input type="text" size="70" id="adpname"/>*</li><input type="hidden" id="dpid"/>
        			<li><label>类别描述:</label><textarea cols="70" rows="5" id="adescription" wrap="hard"></textarea></li>
                    <li><input type="button" id="alterdpbtn" value="SUBMIT" /><input type="reset" value="RESET" /></li>
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
<style>
#type{
	width:300px;
	height:auto;
	overflow:hidden;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$('#searchresultwrap').hide();
	$('#alterdpwrap').hide();
	$('#ares').hide();
	$('#u1').show();
	$('#creatdpbtn').click(createtype);
	$('#searchdpdetail').click(searchtype);
	$('#alterdpbtn').click(altertype);
	$('.menu1  li:eq(0)').addClass('open');
	$('.menu1  li:gt(0)').show();
	$('.menu1  li:eq(4)').addClass('menucurrent');
});
</script>
</html>
