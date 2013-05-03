<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> ${title} </title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.css" />
</head>

<body>

	<div class = "container-fluid">
	
		<div class="row-fluid" style="margin-top:20px">
		
			<div class="span12">
			
				<div class="row-fluid">
					<div class="span12">
						<img class="pull-left" src="<c:url value="/resources/img/forbidden.jpg" />" />
						<h1 style="font-size:40px">Access is Denied!</h1>
						<p class="lead">
							You do not have enough privilege to visit this page. Please contact your site administrator for more
							info. If you are already logged in, visit your respective <a href="<c:url value="/dashboard" />">dashboard</a> 
							or go to the external <a href="<c:url value="/external" />">dashboard</a>.
						</p>
					</div>
				</div>
				
				<div class="row-fluid">
					<div class='span12'>
						<hr />
					</div>
				</div>
			
			</div>
		
		</div>
		
	</div>

</body>

</html>