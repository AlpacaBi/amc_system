<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>错误信息 - 资产管理系统</title>
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
                    <h3>错误!</h3>
                     <div class="stretch">
                        <img src="images/zd.png" />
                    </div>
                </div>
            </div>
            <div class="div-body">
               <div class="content">
                <div class="nopermission">
            	<h5>貌似您没有权限执行这次操作啊!</h5><br />
            	<p>这种操作是需要超级管理员的权限,虽然你是管理员,<br></br>但是你还是不够格!如果有不满,请咨询管理员去吧!...</p>
            	</div> 
                 </div>
            </div>
        	<div class="div-bottom"></div>
    </div>
    </div>
<jsp:include page="content/foot.jsp"></jsp:include>
</body>
</html>
