<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="entity.Admin"%>
<%
	Admin admin = (Admin) session.getAttribute("admin");
	String permission;
	if (admin.getPermission() == 0)
		permission = "超级管理员";
	else
		permission = "普通管理员";
%>
<div style="display: none">
	<div id="detail">
		<p>
			<br />
			<h4>
				${sessionScope.admin.name }
			</h4>
		<br />
		<li>
			用户名: ${sessionScope.admin.username }
		</li>
		<br />
		<li>
			部门:
			<%=admin.getDepartment().getDpname()%></li>
		<br />
		<li>
			邮件: ${sessionScope.admin.email }
		</li>
		<br />
		<li>
			工作电话: ${sessionScope.admin.workphone }
		</li>
		<br />
		<li>
			移动电话: ${sessionScope.admin.mobilephone }
		</li>
		<br />
		<li>
			权限:
			<%=permission%></li>
		<br />
		<li>
			登录次数: ${sessionScope.admin.logincount }
		</li>
		<br />
		<li>
			上次登录时间: ${sessionScope.lasttime }
		</li>
		<br />
		<li>
			<input type="button" id="detailbtn" value="ALTER"/>
		</li>
		<br />
		</p>

	</div>
</div>
<div class="menu">
	<div class="menuborder">
		<div class="menu1">
			<ul>
				<li class="menutitle">
					系统设置
				</li>
				<li>
					<a href="personsetting.jsp">个人设置</a>
				</li>
				<li>
					<a href="usersetting.jsp">用户设置</a>
				</li>
				<li>
					<a href="departmentsetting.jsp">部门设置</a>
				</li>
				<li>
					<a href="typesetting.jsp">类别设置</a>
				</li>
				${sessionScope.manageadmin }
			</ul>
		</div>
		<div class="menu2">
			<ul>
				<li class="menutitle">
					资产管理
				</li>
				<li>
					<a href="addasset.jsp">资产添加</a>
				</li>
				<li>
					<a href="search.jsp">资产编辑</a>
				</li>
			</ul>
		</div>
		<div class="menu3">
			<ul>
				<li class="menutitle">
					分类统计
				</li>
				<li>
					<a href="statistics.jsp">分类统计</a>
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
						<a href="#detail" id="adetail"
							title="${sessionScope.admin.name }的个人信息">${sessionScope.admin.name}(${sessionScope.admin.username })</a>
					</li>
					<li>
						|
					</li>
					<li>
						<a href="home.jsp">主页</a>
					</li>
					<li>
						|
					</li>
					<li>
						<a id="exit" href="#confirm">退出</a>
					</li>
				</ul>
			</div>
		</div>