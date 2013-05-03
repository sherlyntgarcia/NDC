<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<security:authorize access="!hasRole('AMG_STRATEGIC_USER') and !hasRole('AMG_OPERATIONAL_USER') and !hasRole('POWER_USER')" >
	<c:redirect url="/dashboard" />
</security:authorize>

<c:import url="../template/header.jsp" />
<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			
			<div class="row-fluid">
				<div class="span12">
					<label class="label label-info" style="padding:10px;font-size:15px">Internal Dashboard (AMG)</label> 
				</div>
			</div>
			
		</div>
		
		<div class="row-fluid" style="margin-top:10px">
	
			<div class="span3">
			
				<c:import url="../template/amgLeftNav.jsp" />
			
			</div>
			
			<div class="span9">
			
				<div class="row-fluid">
					<div class="span12">
						<p class="lead">Create New Visual for 'Sources & Uses of Funds'</p>
						
						<hr />
						
						<p>
							NOTE: 
							<ul>
								<li> Please enter the actual amount of value. </li>
								<li> To prevent inaccurate data, do not use copy & paste feature while adding amounts. </li>
							</ul>
						</p>
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span12">
					
						<spring:form modelAttribute="sourcesFunds" method="POST">
						
							<spring:errors path="*" element="div" class="alert alert-error" />
							
							<c:if test="${not empty success}">
								<div class="alert alert-success">
									${success}
								</div>
							</c:if>
							
							<c:if test="${not empty error}">
								<div class="alert alert-error">
									${error}
								</div>
							</c:if>
							
							<label>Year</label>
							<div>
								<spring:input path="year" class="span3" readonly="true" />
							</div>
						
							<label>Projected Sources of Funds</label>
							<div>
								<spring:input path="projectedSourcesOfFunds" class="span3" constraint="number" placeholder="(e.g. 200000)" />
							</div>
							
							<label>Projected Uses of Funds</label>
							<div>
								<spring:input path="projectedUsesOfFunds" class="span3" constraint="number" placeholder="(e.g. 200000)" />
							</div>
							
							<div class="form-actions">
								<button type="submit" class="btn btn-primary"><i class="icon icon-download-alt icon-white"></i> Save changes</button>
								<a class="btn" href="${pageContext.request.contextPath}/dashboard/internal/AMG">Go back</a>
							</div>
						</spring:form>
						
					</div>
				</div>
			
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />