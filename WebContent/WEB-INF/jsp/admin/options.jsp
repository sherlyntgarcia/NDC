<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<c:import url="../template/header.jsp" />
	<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
		
			<div>
				<label class="label label-info" style="padding:10px;font-size:15px">Admin Dashboard</label>
			</div>
			
		</div>
	
	</div>
	
	<div class="row-fluid" style="margin-top:20px">
	
		<div class="span3">
		
			<c:import url="../template/adminLeftNav.jsp" />
		
		</div>
		
		<div class="span9">
		
			<div class="row-fluid">
			
				<div class="span12">
					<p class="lead">
						System Options
					</p>
				</div>
				
			</div>
			
			<c:if test="${not empty error}">
				<div class="row-fluid">
					<div class="span12">
						<div class="alert alert-error">
							${error}
						</div>
					</div>
				</div>
			</c:if>
			
			<c:if test="${not empty success}">
				<div class="row-fluid">
					<div class="span12">
						<div class="alert alert-success">
							${success}
						</div>
					</div>
				</div>
			</c:if>
			
			<div class="row-fluid">
			
				<div class="span12">
					
					<spring:form modelAttribute="options" method="POST">
						
						<spring:errors path="*" element="div" class="alert alert-error" />
						
						<i> This email address will receive all feedback emails from users. This field should only be change 
						for important purposes. </i> 
						<div>
							<spring:input path="email" class="span3" placeholder="(e.g. jdelacruz@yahoo.com)" />
						</div>
						
						<br />
						
						<i> Please input your desired email subject when receiving your feedback from users. </i> 
						<div>
							<spring:input path="subject" class="span3" placeholder="(e.g. #customerfeedback)" />
						</div>
						
						<div class="form-actions">
							<button type="submit" class="btn btn-primary"><i class="icon icon-download-alt icon-white"></i> Save changes</button>
							<a class="btn" href="${pageContext.request.contextPath}/dashboard">Go back</a>
						</div>
						
					</spring:form>
					
				</div>
			
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />