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
					<p class="lead">Create New Visual for 'Economic Impact'</p>
					
					<hr />
						
						<p>
							NOTE: 
							<ul>
								<li> Please enter the actual amount of value. </li>
								<li> To prevent inaccurate data, do not use copy & paste feature while adding amounts. </li>
							</ul>
						</p>
				</div>
				
				<div class="row-fluid">
					
					<div class="span12">
					
						<spring:form method="POST" modelAttribute="economicImpact">
							
							<spring:errors path="*" element="div" class="alert alert-error" />
							
							<c:if test="${not empty error}">
								<div class="alert alert-error">
									${error}
								</div>
							</c:if>
							
							<c:if test="${not empty success}">
								<div class="alert alert-success">
									${success}
								</div>
							</c:if>
						
							<label>Rehabilitated Irrigation systems (Hectares)</label>
							<div>
								<spring:input path="rehabilitated" class="span3" placeholder="(e.g. 300000)" constraint="number" />
							</div>
							
							<label>Restored irrigable areas (Hectares)</label>
							<div>
								<spring:input path="restored" class="span3" placeholder="(e.g. 50000)" constraint="number" />
							</div>
							
							<div class="form-actions">
								<button type="submit" class="btn btn-primary"><i class="icon icon-download-alt icon-white"></i> Save changes</button>
								<a href="${pageContext.request.contextPath}/dashboard/internal/FMG" class="btn">Go back</a>
							</div>
							
						</spring:form>
					
					</div>
					
				</div>
				
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />