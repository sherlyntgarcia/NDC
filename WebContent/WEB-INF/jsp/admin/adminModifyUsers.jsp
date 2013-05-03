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
						Activate/Deactivate Users
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
			
				<div class="span6">
					
					<label class="label label-error">Deactivated users</label>
					
					<div class="row-fluid" style="margin-top: 10px">
						<div class="span12">
							<c:choose>
								<c:when test="${not empty deactivatedUsers}">
									<form method="POST">
										<c:forEach var="user" items="${deactivatedUsers}">
											<div>
												<label class="checkbox">
													<input type="checkbox" name="checkboxes" value="${user.id}" /> ${user.firstName} / ${user.username} (${user.role})
												</label>
											</div>
										</c:forEach>
										
										<br />
										
										<input type="hidden" name="status" value="false" />
										<button type="submit" class="btn btn-primary btn-small"><i class="icon icon-ok icon-white"></i> Activate User/s</button>
																				
									</form>
								</c:when>
								
								<c:otherwise>
									<div class="alert alert-warning">
										No deactivated users available.
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					
				</div>
				
				<div class="span6">
					
					<label class="label label-success">Activated users</label>
					
					<div class="row-fluid" style="margin-top: 10px">
						<div class="span12">
							<c:choose>
								<c:when test="${not empty activatedUsers}">
									<form method="POST">
										<c:forEach var="user" items="${activatedUsers}">
											<div>
												<label class="checkbox">
													<input type="checkbox" name="checkboxes" value="${user.id}" /> ${user.firstName} / ${user.username} (${user.role})
												</label>
											</div>
										</c:forEach>
										
										<br />
										
										<input type="hidden" name="status" value="true" />
										<button type="submit" class="btn btn-primary btn-small"><i class="icon icon-off icon-white"></i> Deactivate User/s</button>
										
									</form>
								</c:when>
								
								<c:otherwise>
									<div class="alert alert-warning">
										No activated users available.
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					
				</div>
			
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />