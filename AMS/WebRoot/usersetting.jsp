<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户设置 - 资产管理系统</title>
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
                    <h3>添加用户</h3>
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
        			<li><label>姓名*:</label><input type="text" size="70" id="name"/>*</li>
        			<li><label>部门*:</label>
				        <select id="departval" class="depart">
				        <option value="0">请选择</option>
				        </select>
				    </li>
				    <li><label>邮箱*:</label><input type="text" size="70" id="email"/>*</li>
				    <li><label>工作电话:</label><input type="text" size="70" id="wp"/></li>
				    <li><label>移动电话:</label><input type="text" size="70" id="mp"/></li>
                    <li><input type="button" id="creatuserbtn" value="SUBMIT" /><input type="reset" value="RESET" /></li>
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
                    <h3>查找用户</h3>
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
        			<li><label>选择查询方式*:</label><br/><label><input type="radio" name="typeval" value="1" /> 按姓名查找</label><label><input type="radio" name="typeval" value="2" /> 按邮箱查找</label></li>
        			<li><label>输入查询的值*:</label><input type="text" size="70" id="value"/>*</li>
        			<li><label >选择所在部门(可选):</label>
				        <select id="departval1" class="depart">
				        <option value="0">请选择</option>
				        </select>
				    </li>
                    <li><input type="button" id="searchpersondetail" value="SUBMIT" /><input type="reset" value="RESET" /></li>
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
                  <input type="hidden" id="userid"/>
                	<div id="searchresult">
               
                	</div>
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>
          
    <div class="body" id="alteruserwrap">
            <div class="div-top">
            	 <div class="title">
                    <h3>修改用户</h3>
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
        			<li><label>姓名*:</label><input type="text" size="70" id="aname"/>*</li><input type="hidden" id="aid"/>
        			<li><label>部门*:</label>
				        <select id="departval2" class="depart">
				        <option value="0">请选择</option>
				        </select>
				    </li>
				    <li><label>邮箱*:</label><input type="text" size="70" id="aemail"/>*</li>
				    <li><label>工作电话:</label><input type="text" size="70" id="awp"/></li>
				    <li><label>移动电话:</label><input type="text" size="70" id="amp"/></li>
                    <li><input type="button" id="alteruserbtn" value="SUBMIT" /><input type="reset" value="RESET" /></li>
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
	$('#alteruserwrap').hide();
	$('#ares').hide();
	$('#u1').show();
	$('#creatuserbtn').click(createuser);
	$('#searchpersondetail').click(searchuser);
	$('#alteruserbtn').click(alteruser);
	$('.menu1  li:eq(0)').addClass('open');
	$('.menu1  li:gt(0)').show();
	$('.menu1  li:eq(2)').addClass('menucurrent');
});
</script>
</html>
