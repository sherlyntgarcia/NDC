<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<security:authorize access="isAuthenticated()" >
	<c:redirect url="/dashboard" />
</security:authorize>

<!DOCTYPE html>
<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	
	<title> ${title} </title>
	
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/appStyle.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.dataTables.css" />
	
	<!-- for maps -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mapcss.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/general.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/luzon_css.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/visayas_css.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mindanao_css.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colorbox.css" />
	
	<!-- Le styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reveal.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
    
    <style type="text/css">
    
		body {
			padding-top: 60px;
			padding-bottom: 40px;
			background: #c6fdc4;
		} 
		
    </style>
  

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/NDC2.png" >
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/NDC2.png" >
							

</head>

<body>

	<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="${pageContext.request.contextPath}">National Development Company</a>
          <div class="nav-collapse collapse">         
            <form class="navbar-form pull-right" method="POST" action="${pageContext.request.contextPath}/j_spring_security_check">              
			  <div class="btn-group">
				  <a class="btn btn-danger dropdown-toggle" data-toggle="dropdown" href="#">
				    Forgot Password?
				    <span class="caret"></span>
				  </a>
				  <ul class="dropdown-menu">
					<li><a href = "#forgotPasswordModal" id = "forgotPass">Non-Admin</a></li> 
					<li><a href = "#forgotPasswordAdminModal" id = "forgotPassAdmin">Admin or Tactical User</a></li>
				  </ul>
				</div>			  			   
			  <input class="span2" autocomplete="off" type="text" name="j_username" placeholder="Username">
              <input class="span2" type="password" name="j_password" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>
            </form>
          </div><!--/.nav-collapse -->          
        </div>
        
      </div>
    </div>
    
<%--     <c:if test="${not empty error}"> --%>
<!--     	<div class = "pull-right"> -->
<!-- 			<div style="width:250px;margin-top: -7%;margin-left: -57%;" class="alert alert-error" style = "display: inline-block" align = "center"> -->
<%-- 				<b>${error}!</b> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</c:if> --%>

    <div class="container">

		<div style="border:2px solid #b94a48;display:none" class="alert alert-error errorDiv">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
    		<span style="font-weight:bold">Invalid login. If you are having problems logging in, check with admin if your account is disabled.</span>
    	</div>

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit" style = "background: lightgreen">
        <h1><img src = "${pageContext.request.contextPath}/resources/img/NDC2.png" style = "width: 25%; margin-top: -5%; margin-left: -4%;"></h1>
        <p>Welcome to NDC's Strategic Business Dashboard!</p>
        <p><a class="btn btn-inverse" href="<c:url value="/external" />"><i class="icon icon-hand-right icon-white"></i> Visit our external dashboard!</a></p>
		<img src = "${pageContext.request.contextPath}/resources/img/iso_t.png/" style="float:right; width: 11%; margin-top: -22%; margin-right: -45px;">
      </div>
      
      <!-- Example row of columns -->
      <div class="row">
        <div class="span4">
          <h2>NDC</h2>
          <p>The National Development Company is an attached agency of the Department of Trade and Industry (DTI), managing  about P 4.5 billion worth of investment portfolios.</p>        
        </div>
        <div class="span4">
          <h2>NDC was created </h2>
          <p>to function as the government's investment arm.  It develops,  finances and implements pioneering development-oriented projects vital to the sustainability of the   government's structural reforms and economic policies.</p>
       </div>
        <div class="span4">
          <h2>Since 1919</h2>
          <p>NDC had a hand in the establishment and privatization   of the vital companies that are today among the biggest and oldest companies in the country.</p>
        </div>
      </div>

	<hr style="border-top: 0; border-bottom: 1px solid lightgreen">

	<footer>
	  <p>&copy; National Development Company 2013</p>
	</footer>

    </div>
	 <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	
	<!-- Forgot password MODAL -->
	<div id="forgotPasswordModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
			
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			<h3 id="deleteModalLabel">Forgot Password</h3>
		</div>
		
		<form method="POST" id="forgotPasswordForm" action="${pageContext.request.contextPath}/login/forgot">
			
			<div class="modal-body">
				<p class="lead">Fill this up ${showModal}</p>
				
				<c:if test="${not empty modalError}">
					<div class="alert alert-error">
						${modalError}
					</div>
				</c:if>
				
				<c:if test="${not empty modalSuccess}">
					<div class="alert alert-success">
						${modalSuccess}
					</div>
				</c:if>
				
				<div id="message"></div>
				
				<label>What is your username?</label>
				<div>
					<input type="text" id="username" name="username" class="span4" placeholder="Username..." required="required" />
				</div>
					
				<label>What is your secret question?</label>
				<div>
					<select id="secretQuestion" name="secretQuestion" class="span4">
						<c:forEach var="question" items="${questions}">
							<option value="${question}">${question}</option>
						</c:forEach>
					</select>
				</div>
					
				<label>What is your secret answer?</label>
				<div>
					<input type="text" id="secretAnswer" name="secretAnswer" class="span4" placeholder="Answer..." required="required"  />
				</div>
				
			</div>
			
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
				<button id="forgotPass1" data-loading-text="Processing..." class="btn btn-primary" type="button">Yes, reset my password.</button>
			</div>
		
		</form>
			
	</div>
	
	<!-- Forgot password MODAL -->
	<div id="forgotPasswordAdminModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="forgotPasswordAdminModalLabel" aria-hidden="true">
			
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			<h3 id="forgotPasswordAdminModalLabel">Forgot Password</h3>
		</div>
		
		<form method="POST" id="forgotPasswordAdminForm" action="${pageContext.request.contextPath}/login/forgot">
			
			<div class="modal-body">
				<p class="lead">Fill this up ${showModal}</p>
				
				<c:if test="${not empty modalError}">
					<div class="alert alert-error">
						${modalError}
					</div>
				</c:if>
				
				<c:if test="${not empty modalSuccess}">
					<div class="alert alert-success">
						${modalSuccess}
					</div>
				</c:if>
				
				<div id="adminMessage"></div>
				
				<label>What is your username?</label>
				<div>
					<input type="text" id="adminUsername" name="adminUsername" class="span4" placeholder="Username..." required="required" />
				</div>
					
				<label>What is your email?</label>
				<div>
					<input type="text" id="adminEmail" name="adminEmail" class="span4" placeholder="Email..." required="required" />
				</div>
				
			</div>
			
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
				<button id="forgotPass2" data-loading-text="Processing..." class="btn btn-primary" type="button">Yes, reset my password.</button>
			</div>
		
		</form>
			
	</div>
	
	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";
		var error = "${error}";
	</script>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.reveal.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		
    		if(error != "") {
    			$(".errorDiv").show();
    		}
    		
    	});
    </script>
    
</body>

</html>

		