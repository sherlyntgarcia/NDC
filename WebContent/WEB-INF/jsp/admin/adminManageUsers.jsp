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
			
				<div class="span12">
					<p class="lead">
						Manage Users
					</p>
				</div>
				
			</div>
			
			<div class="row-fluid" style="margin-top:10px;margin-bottom:10px">
			
				<div class="span12">
					<a class="btn btn-primary" href="<c:url value="/dashboard/admin/createUsers" />"><i class="icon icon-white icon-plus-sign"></i> Create New User</a>
					<a class="btn btn-primary" href="<c:url value="/dashboard/admin/modifyUsers" />"><i class="icon icon-wrench icon-white"></i> Activate/Deactivate Users</a>
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
					
					<c:choose>
					
						<c:when test="${not empty users}">
							<div>
								<table class="table table-bordered userTable" style="cursor:pointer;min-width:100%">
									<thead>
										<tr>
											<th style="width:100px">ID</th>
											<th style="width:200px">Actions</th>
											<th style="width:250px">Name</th>
											<th style="width:100px">Username</th>
											<th style="width:100px">Email</th>
											
										</tr>
									</thead>
									<tbody>
									<c:forEach var="user" items="${users}">
										
										<c:choose>
											<c:when test="${user.activated}">
												<c:set var="rowClassn" value="success" />
											</c:when>
											
											<c:otherwise>
												<c:set var="rowClassn" value="error" />
											</c:otherwise>
										</c:choose>
										
										<tr class="${rowClassn}">
											<td>${user.id}</td>
											<td>
												<a systemID="${user.id}" href="#deleteModal" style="display:none" class="btn btn-danger btn-small deleteBtn">
													<i class="icon icon-white icon-remove"></i> Delete
												</a>
												
												<a href="<c:url value="/dashboard/admin/edit/${user.id}" />" class="btn btn-primary btn-small">
													<i class="icon icon-white icon-edit"></i> Edit
												</a>
											</td>
											<td>${user.firstName} ${user.middleName} ${user.lastName}</td>
											<td>${user.username}</td>
											<td>${user.email}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							
						</c:when>
						
						<c:otherwise>
							<div class="alert alert-success">
								<span style="font-weight: bold">No users available.</span>
							</div>
						</c:otherwise>
					
					</c:choose>
					
				</div>
			
			</div>
		
		</div>
	
	</div>
	</div>

<c:import url="../template/footer.jsp" />