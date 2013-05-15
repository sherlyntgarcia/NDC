<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
	
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/highcharts.src.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/dashboard_default_options.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/dashboard_fmg_scripts.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/dashboard_amg_scripts.js"/>"></script>
	
	<script type="text/javascript">
		$(function() {
			var name = $( "#name" ),
				email = $( "#email" ),
				password = $( "#password" ),
				allFields = $( [] ).add( name ).add( email ).add( password ),
				tips = $( ".validateTips" );
	 
			function updateTips( t ) {
				tips
					.text( t )
					.addClass( "ui-state-highlight" );
				setTimeout(function() {
					tips.removeClass( "ui-state-highlight", 1500 );
				}, 500 );
			}
	 
			function checkLength( o, n, min, max ) {
				if ( o.val().length > max || o.val().length < min ) {
					o.addClass( "ui-state-error" );
					updateTips( "Length of " + n + " must be between " +
						min + " and " + max + "." );
					return false;
				} else {
					return true;
				}
			}
	 
			function checkRegexp( o, regexp, n ) {
				if ( !( regexp.test( o.val() ) ) ) {
					o.addClass( "ui-state-error" );
					updateTips( n );
					return false;
				} else {
					return true;
				}
			}
	 
			$( "#dialog-form" ).dialog({
				autoOpen: false,
				height: 400,
				width: 550,
				modal: true,
				show: "fade",
				hide: "fade",
				buttons: {
					"Register": function() {
						var bValid = true;
						allFields.removeClass( "ui-state-error" );
	 
						bValid = bValid && checkLength( username, "username", 5, 10 );
						bValid = bValid && checkLength( email, "email", 6, 80 );
						bValid = bValid && checkLength( password, "password", 8, 10 );
	 
						bValid = bValid && checkRegexp( username, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
						// From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
						bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
						bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
	 
						if ( bValid ) {
							$( "#users tbody" ).append( "<tr>" +
								"<td>" + name.val() + "</td>" + 
								"<td>" + email.val() + "</td>" + 
								"<td>" + password.val() + "</td>" +
							"</tr>" ); 
							$( this ).dialog( "close" );
						}
					},
					Cancel: function() {
						$( this ).dialog( "close" );
					}
				},
				close: function() {
					allFields.val( "" ).removeClass( "ui-state-error" );
				}
			});
			
		});
	</script>
	
    
    <style type="text/css">
      body {
        padding-top: 10%;
        padding-bottom: 40px;
        background-color: #c6fdc4;
        font-family: vrinda;
        size:14px;
      }
      
      

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      
      .admin-home{
      	max-width:92%;
      	padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
	label, input { display:block; }
	input.text { margin-bottom:12px; width:95%; padding: .4em; }
	fieldset { padding:0; border:0; margin-top:25px; }
	h1 { font-size: 1.2em; margin: .6em 0; }
	div#users-contain { width: 350px; margin: 20px 0; }
	div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
	div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
	.ui-dialog .ui-state-error { padding: .3em; }
	.validateTips { border: 1px solid transparent; padding: 0.3em; }

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

	<div class="navbar navbar-inverse navbar-fixed-top"
		style="background: #27b357; margin-top: -2px">
		<img onclick="window.open('http://www.ndc.gov.ph')"
			src="${pageContext.request.contextPath}/resources/img/NDC2.png"
			width="15%" height="10%"> <img
			src="${pageContext.request.contextPath}/resources/img/iso_t.png"
			width="7%" height="10%"
			style="float: right; margin-top: 6px; margin-right: 10px" />
		<div class="navbar-inner">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>

			<div class="nav-collapse collapse">

				<ul class="nav">

					<security:authorize access="!isAuthenticated()">
						<li><a href="<c:url value="/login" />">Login</a></li>
					</security:authorize>

					<security:authorize access="isAuthenticated()">
						<security:authentication var="username"
							property="principal.username" />
						<li><a id="editProfileBtn" usr="${username}" href="#"
							style="color: #FFF"> You are logged in as <c:out
									value="${username}" /> (Edit Profile)
						</a></li>
						<li><a href="<c:url value="/logout"  />">Logout</a></li>
					</security:authorize>

				</ul>

			</div>
			<!--/.nav-collapse -->
		</div>
		<!-- /.navbar-inner -->
	</div>
