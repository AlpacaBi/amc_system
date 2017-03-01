<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>登录 - 资产管理系统</title>
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
	<body>
		<div class="menu">
			<div class="menuborder">
				<div class="menu1">
					<ul>
						<li class="menutitle menucurrent">
							系统登录
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="menubot">
		</div>
		<div class="main">
			<div class="border">
				<div class="logo"></div>
				<div class="logofont">
					<div class="list">
						<ul>
							<li>
								<a href="home.jsp">系统主页</a>
							</li>
							<li>
								|
							</li>
							<li>
								<a href="home.jsp">用户帮助</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="tips">
					<p>
						哈哈哈哈哈
					</p>
					<div class="close"></div>
				</div>
				<div class="body">
					<div class="div-top">
						<div class="title">
							<h3>
								登录
							</h3>
							<div class="stretch">
								<img src="images/zd.png"/>
							</div>
						</div>
					</div>
					<div class="div-body">
						<div class="content">
							<div class="form">
								<form>
									<ul>
									<li><label id="res"></label></li>
										<li>
											<label>
												用户名:
											</label>
											<input type="text" size="70" id="username" />
										</li>
										<li>
											<label>
												密码:
											</label>
											<input type="password" size="70" id="password" />
										</li>
										<li>
											<input type="button" id="sub" value="SUBMIT" />
											<input type="reset" value="RESET" />
										</li>
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
	<script>
		$(document).ready(function (){
			$('#res').show();
		});
	</script>
</html>
