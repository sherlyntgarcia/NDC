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
					<p class="lead">Create New Visual for 'NIA Loan Proceeds (Allocation)'</p>
					
					<hr />
						
						<p>
							NOTE: 
							<ul>
								<li> Please enter the actual amount of value. </li>
								<li> To prevent inaccurate data, do not use copy & paste feature while adding amounts. </li>
							</ul>
						</p>
				</div>
				
				<spring:form method="POST" modelAttribute="niaLoanProceedsAllocation">
				
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
					
					<div class="span4">
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">1</span></span>
							<spring:input path="car" class="span6" placeholder="CAR" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">2</span></span>
							<spring:input path="ariip" class="span6" placeholder="ARIIP" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">3</span></span>
							<spring:input path="mariis" class="span6" placeholder="MARIIS" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">4</span></span>
							<spring:input path="upriis" class="span6" placeholder="UPRIIS" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">5</span></span>
							<spring:input path="armm" class="span6" placeholder="ARMM" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">6</span></span>
							<spring:input path="ncr" class="span6" placeholder="NCR" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">7</span></span>
							<spring:input path="region1" class="span6" placeholder="Region I" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">8</span></span>
							<spring:input path="region2" class="span6" placeholder="Region II" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">9</span></span>
							<spring:input path="region3" class="span6" placeholder="Region III" constraint="number" />
						</div>
					
					</div>
					
					<div class="span4">
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">10</span></span>
							<spring:input path="region4" class="span6" placeholder="Region IV" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">11</span></span>
							<spring:input path="region5" class="span6" placeholder="Region V" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">12</span></span>
							<spring:input path="region6" class="span6" placeholder="Region VI" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">13</span></span>
							<spring:input path="region7" class="span6" placeholder="Region VII" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">14</span></span>
							<spring:input path="region8" class="span6" placeholder="Region VIII" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">15</span></span>
							<spring:input path="region9" class="span6" placeholder="Region IX" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">16</span></span>
							<spring:input path="region10" class="span6" placeholder="Region X" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">17</span></span>
							<spring:input path="region11" class="span6" placeholder="Region XI" constraint="number" />
						</div>
						
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">18</span></span>
							<spring:input path="region12" class="span6" placeholder="Region XII" constraint="number" />
						</div>
						
					</div>
					
					<div class="span4">
					
						<div class="input-prepend">
							<span class="add-on"><span class="badge badge-important">19</span></span>
							<spring:input path="region13" class="span6" placeholder="Region XIII" constraint="number" />
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