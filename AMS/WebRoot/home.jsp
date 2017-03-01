<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="entity.Admin"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主页 - 资产管理系统</title>
<link rel="shortcut icon" type="image/png" href="images/favicons/favicon.png"/>
<link rel="icon" type="image/png" href="images/favicons/favicon.png"/>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery.uniform.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="./fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="./fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="./fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/uniform.default.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="css/jquery.confirm.css" type="text/css" media="screen" />
</head>
<% Admin admin = (Admin)session.getAttribute("admin");
if(session.getAttribute("admin") == null){%>
<jsp:forward page="index.jsp"/><%} %>
<body>
<jsp:include page="content/head.jsp"></jsp:include>
<div class="tips"><p>毕国康毕国康毕国康</p><div class="close"></div></div>
    	<div class="body">
            <div class="div-top">
             <div class="title"> 
                    <h3>欢迎回来${sessionScope.admin.name}(${sessionScope.admin.username })</h3>
                     <div class="stretch">
                        <img src="images/zd.png" />
                    </div>
                  </div>
            </div>
            <div class="div-body">
               <div class="content" id="welcomeback">
                    <p><%if(admin.getLogincount()>1){ %>上次登录在 ${sessionScope.lasttime }  ,共登录 ${sessionScope.admin.logincount } 次.<%} %>
            <%if(admin.getLogincount()==1){ %>您是第1次登陆, 建议点击<a href="personsetting.jsp">此处</a>修改密码.<%} %></p>
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>
    
   	<div class="body">
            <div class="div-top">
            <div class="title">
                    <h3>最近一个月增加的资产</h3>
                     <div class="stretch">
                        <img src="images/zd.png" />
                    </div>
                </div>
            </div>
            <div class="div-body" id="getnew">
                <p>
               <div class="content">
                    <div class="detail">
                    	<h5>获取数据中,请稍候..</h5>
                    </div>
                   </p>
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>
    
    <div class="body">
            <div class="div-top">
            <div class="title">
                    <h3>最近一个月送修的资产</h3>
                     <div class="stretch">
                        <img src="images/zd.png" />
                    </div>
                </div>
            </div>
            <div class="div-body">
                <p>
               <div class="content" id="getbsend">
                   <div class="detail">
                    	<h5>获取数据中,请稍候..</h5>
                    </div>
                 </p>
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>
    
    <div class="sttop"></div>
    </div>
</div>
<jsp:include page="content/foot.jsp"></jsp:include>
<script>
$(document).ready(function (){
	getbsend();
	getnew();
});

</script>
</body>
</html>
