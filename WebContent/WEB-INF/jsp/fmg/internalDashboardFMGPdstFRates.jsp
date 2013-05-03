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
					<p class="lead">Create New Visual for 'PDST-F Rates'</p>
					
					<hr />
						
						<p>
							NOTE: 
							<ul>
								<li> Please enter the actual amount of value. </li>
								<li> To prevent inaccurate data, do not use copy & paste feature while adding amounts. </li>
							</ul>
						</p>
				</div>
				
				<spring:form method="POST" modelAttribute="pdstFRates">
				
				<div class="row-fluid">
					<div class="span12">
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
					</div>
				</div>
				
				<div class="row-fluid">
					
						<div class="span6">
							<label>Year</label>
							<div>
								<spring:input path="year" class="span6" readonly="true" />
							</div>
							
							<label>Month</label>
							<div>
								<spring:select items="${months}" path="month" class="span6" />
							</div>
							
							<label>1-MONTH (Average)</label>
							<div>
								<spring:input path="month1Avg" class="span6" placeholder="Average for 1 month" constraint="number" />
							</div>
							
							<label>3-MONTH (Average)</label>
							<div>
								<spring:input path="month3Avg" class="span6" placeholder="Average for 3 months" constraint="number" />
							</div>
							
							<label>6-MONTH (Average)</label>
							<div>
								<spring:input path="month6Avg" class="span6" placeholder="Average for 6 month" constraint="number" />
							</div>
							
							<label>1-YEAR (Average)</label>
							<div>
								<spring:input path="year1Avg" class="span6" placeholder="Average for 1 year" constraint="number" />
							</div>
							
							<label>2-YEAR (Average)</label>
							<div>
								<spring:input path="year2Avg" class="span6" placeholder="Average for 2 years" constraint="number" />
							</div>
							
						</div>
						
						<div class="span6">
						
							<label>3-YEAR (Average)</label>
							<div>
								<spring:input path="year3Avg" class="span6" placeholder="Average for 3 years" constraint="number" />
							</div>
							
							<label>4-YEAR (Average)</label>
							<div>
								<spring:input path="year4Avg" class="span6" placeholder="Average for 4 years" constraint="number" />
							</div>
							
							<label>5-YEAR (Average)</label>
							<div>
								<spring:input path="year5Avg" class="span6" placeholder="Average for 5 years" constraint="number" />
							</div>
							
							<label>7-YEAR (Average)</label>
							<div>
								<spring:input path="year7Avg" class="span6" placeholder="Average for 7 years" constraint="number" />
							</div>
							
							<label>10-YEAR (Average)</label>
							<div>
								<spring:input path="year10Avg" class="span6" placeholder="Average for 10 years" constraint="number" />
							</div>
							
							<label>20-YEAR (Average)</label>
							<div>
								<spring:input path="year20Avg" class="span6" placeholder="Average for 20 years" constraint="number" />
							</div>
							
							<label>25-YEAR (Average)</label>
							<div>
								<spring:input path="year25Avg" class="span6" placeholder="Average for 25 years" constraint="number" />
							</div>
						</div>
					
				</div>
				
				<div class="row-fluid">
					<div class="span12">
						<div class="form-actions">
							<button type="submit" class="btn btn-primary"><i class="icon icon-download-alt icon-white"></i> Save changes</button>
							<a href="${pageContext.request.contextPath}/dashboard/internal/FMG" class="btn">Go back</a>
						</div>
					</div>
				</div>
				
				</spring:form>
				
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />