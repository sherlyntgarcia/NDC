<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<security:authorize access="!hasRole('FMG_STRATEGIC_USER') and !hasRole('FMG_OPERATIONAL_USER') and !hasRole('POWER_USER')" >
	<c:redirect url="/dashboard" />
</security:authorize>

<c:import url="../template/header.jsp" />
<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			
			<div class="row-fluid">
				<div class="span12">
					<label class="label label-info" style="padding:10px;font-size:15px">Internal Dashboard (FMG)</label> 
				</div>
			</div>
			
		</div> 
		
		<div class="row-fluid" style="margin-top:10px">
	
			<div class="span3">
			
				<c:import url="../template/fmgLeftNav.jsp" />
			
			</div>
			
			<div class="span9">
			
				<div class="row-fluid">
					
					<p class="lead">
						FMG Internal Dashboard
					</p>
					
					<hr />
					
					<p>You can click the <span class="badge badge-important">graphs</span> to update.</p>
				</div>
				
				<c:import url="internalFmgTemplate.jsp" />
		
		</div>
	</div>
	</div>
</div>

<c:import url="../template/footer.jsp" />