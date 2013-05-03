<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<security:authorize access="!hasRole('FAD_STRATEGIC_USER') and !hasRole('FAD_OPERATIONAL_USER') and !hasRole('POWER_USER')" >
	<c:redirect url="/dashboard" />
</security:authorize>

<c:import url="../template/header.jsp" />
<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			
			<div class="row-fluid">
				<div class="span12">
					<label class="label label-info" style="padding:10px;font-size:15px">Internal Dashboard (FAD)</label> 
				</div>
			</div>
			
		</div>
		
		<div class="row-fluid" style="margin-top:10px">
	
			<div class="span3">
			
				<c:import url="../template/fadLeftNav.jsp" />
			
			</div>
			
			<div class="span9">
			
				<div class="row-fluid">
					<div class="span12">
						<p class="lead">Create New Visual for 'Income Statement'</p>
						
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
					
						<spring:form modelAttribute="incomeStatement" method="POST">
						
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
							
							<label>Operating Income</label>
							<div>
								<spring:input path="operatingIncome" placeholder="(e.g. 500000)" class="span3" constraint="number" />
							</div>
							
							<label>Dividends</label>
							<div>
								<spring:input path="dividend" placeholder="(e.g. 650000)" class="span3" constraint="number" />
							</div>
							
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">Save changes</button>
								<a class="btn" href="${pageContext.request.contextPath}/dashboard/internal/FAD">Go back</a>
							</div>
						</spring:form>
						
					</div>
				</div>
			
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />