<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:import url="../template/header.jsp" />
<div class="admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			
			<div class="row-fluid">
				<div class="span12">
					<label class="label label-info" style="padding:10px;font-size:15px">Admin Dashboard</label> 
				</div>
			</div>
			
		</div>
	
	</div>
	
	<div class="row-fluid" style="margin-top:10px">
	
		<div class="span3">
		
			<c:import url="../template/adminLeftNav.jsp" />
		
		</div>
		
		<div class="span9">
			
			<div class="row-fluid" style="margin-top:10px;margin-bottom:10px">
				<div class="span12">
					<a class="btn btn-primary" href="<c:url value="/dashboard/admin/modifyUsers" />"><i class="icon icon-wrench icon-white"></i> Activate/Deactivate Users</a>
				</div>
			</div>
			
			<div class="row-fluid">
				<div class="span12">
					
					<c:choose>
						<c:when test="${not empty admins}">
							
							<label class="label label-success">Website Administrators/Tactical Users</label>
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Name</th>
										<th>Username</th>
										<th>Role</th>
									</tr>																																																																					
								</thead>
								<tbody>
								<c:forEach var="admin" items="${admins}">
								
									<c:choose>
										<c:when test="${admin.activated}">
											<c:set var="rowClassn" value="success" />
										</c:when>
										
										<c:otherwise>
											<c:set var="rowClassn" value="error" />
										</c:otherwise>
									</c:choose>
								
									<tr class="${rowClassn}">
										<td>${admin.id}</td>
										<td>${admin.firstName} ${admin.middleName} ${admin.lastName}</td>
										<td>${admin.username}</td>
										<td>${admin.role}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							
						</c:when>
						
						<c:otherwise>
							<div class="alert alert-warning">
								No administrators available.
							</div>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
		
		</div>
	
	</div>
</div>
<c:import url="../template/footer.jsp" />