<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
</head>


<body>
	<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
		prefix="tilesx"%>
		
	<tilesx:useAttribute name="current" />


<div class="container">

		<!-- Static navbar -->
<nav class="navbar navbar-default">
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#navbar" aria-expanded="false"
			aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<spring:url value='/' />">JBG</a>
	</div>
	<div id="navbar" class="navbar-collapse collapse">
		<ul class="nav navbar-nav">
			<li class="${current=='index'?'active':''}"><a
				href="<spring:url value='/' />">Home</a></li>



			<security:authorize access="hasRole('ROLE_ADMIN')">
				<li class="${current=='users'?'active':''}"><a
					href="<spring:url value="/users.html" />">Users</a></li>
			</security:authorize>
			
			<li class="${current=='register'?'active':''}"><a
				href="<spring:url value="/register.html" />">Register</a></li>

			<security:authorize access="!isAuthenticated()">
				<li class="${current=='login'?'active':''}"><a
					href="<spring:url value="/login.html" />">Login</a></li>
			</security:authorize>
			
			
			<security:authorize access="isAuthenticated()">
				<li class="${current=='user'?'active':''}"><a
					href="<spring:url value="/account.html" />">My account</a></li>
			</security:authorize>
			
			<security:authorize access="isAuthenticated()">

				<li><a href="<spring:url value="/logout" />">Logout</a></li>
			</security:authorize>
		</ul>
	</div>

</div>
<tiles:insertAttribute name="body" /> <br>
<br>
<center>
	<tiles:insertAttribute name="footer" />
</center>
</nav>
</div>
</body>
</html>