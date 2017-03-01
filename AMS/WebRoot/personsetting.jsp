<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="entity.Admin"%>
<% if(session.getAttribute("admin") == null){%>
	<jsp:forward page="index.jsp"/><%} %>
<%Admin admin = (Admin)session.getAttribute("admin"); 
	String permission;
	if(admin.getPermission() == 0)
		permission = "超级管理员";
	else
		permission = "普通管理员";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人设置 - 资产管理系统</title>
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
<body>
<jsp:include page="content/head.jsp"></jsp:include>

	<div class="body">
            <div class="div-top">
            	 <div class="title">
                    <h3>更改密码</h3>
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
        			<li><label>原始密码*:</label><input type="text" size="70" id="old"/>*</li>
        			<li><label>新密码*:</label><input type="text" size="70" id="new"/>*</li>
        			<li><label>确认密码*:</label><input type="text" size="70" id="rep"/>*</li>
                    <li><input type="button" id="changepassbtn" value="SUBMIT" /><input type="reset" value="RESET" /></li>
                    </ul>
                    </form>
                </div>
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>


	<div class="body" id="xiugaigerenziliao">
            <div class="div-top">
            	 <div class="title">
                    <h3>修改个人资料</h3>
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
     				 <li><label >部门*:</label>
				        <select id="departval" class="depart">
				        <option value="0">请选择</option>
				        </select>
				    </li>
        			<li><label>邮件*:</label><input type="text" size="70" id="email" value="${sessionScope.admin.email }" />*</li>
        			<li><label>工作电话:</label><input type="text" size="70" id="wp" value="${sessionScope.admin.workphone }"/></li>
        			<li><label>移动电话:</label><input type="text" size="70" id="mp" value="${sessionScope.admin.mobilephone }" /></li>
                    <li><input type="button" id="changepersondetail" value="SUBMIT" /><input type="reset" value="RESET" /></li>
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
	$('#u1').show();
	$('#changepassbtn').click(changepass);
	$('#changepersondetail').click(changepersondetail);
	$('.menu1  li:eq(0)').addClass('open');
	$('.menu1  li:gt(0)').show();
	$('.menu1  li:eq(1)').addClass('menucurrent');
});
</script>
</html>
