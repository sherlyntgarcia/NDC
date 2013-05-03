<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<c:import url="../template/header.jsp" />
	<div class = 'admin-home'>
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
				<div class="form-actions" style = "margin-top:0%">
					<div class="span12">
						<p class="lead">
							Create a new Admin/Tactical account
						</p>
						<hr />
					</div>
				</div>
			</div>
			
			<div class="row-fluid" style = "border:1px solid #e5e5e5;">
			
			<spring:form method="POST" modelAttribute="user">
			
				<div style="margin-left: 12%;margin-top: 4%;">
					
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
					
						<div class="row-fluid">
						
							<div class="span12">
							
								<spring:hidden path="activated" />
								<spring:hidden path="loginAttempts" />
								<spring:hidden path="ndcGroup" />
								<spring:hidden path="secretQuestion" />
								<spring:hidden path="secretAnswer" />
								
								<label>Role</label>
								<div>
									<spring:select items="${admins}" path="role" class="span6" />
								</div>
							
								<label>First Name</label>
								<div>
									<spring:input path="firstName" class="span6" placeholder="(e.g. Juan)" />
								</div>
								
								<label>Middle Name</label>
								<div>
									<spring:input path="middleName" class="span6" placeholder="(e.g. Alfonso)" />
								</div>
								
								<label>Last Name</label>
								<div>
									<spring:input path="lastName" class="span6" placeholder="(e.g. Dela Cruz)" />
								</div>
								
								<label>Username</label>
								<div>
									<spring:input path="username" maxlength="10" class="span6" placeholder="(e.g. jdelacruz)" />
								</div>
								
								<label>Password</label>
								<div>
									<spring:password path="password" maxlength="10" class="span6" placeholder="(e.g. delacruz123)" />
								</div>
								
								<label>Confirm Password</label>
								<div>
									<input type="password" maxlength="10" name="confirmPassword" class="span6" placeholder="(e.g. delacruz123)" />
								</div>
							
								<label>Email</label>
								<div>
									<spring:input path="email" class="span6" placeholder="(e.g. jdelacruz@yahoo.com)" />
								</div>
								
							</div>
							
						</div>
						
						</div>
						<div class="form-actions" style = "margin-bottom:0px; margin-top:0px; margin-right:-2px">
							<div class="row-fluid">								
								<button type="submit" class="btn btn-primary"><i class="icon icon-white icon-plus"></i> Create User</button>
								<a href="<c:url value="/dashboard/admin/manageUsers" />" class="btn">Go back</a>
							</div>
						</div>
						
						</spring:form>
					
				</div>
			
			</div>
		
		</div>
	</div>
	</div>

<c:import url="../template/footer.jsp" />