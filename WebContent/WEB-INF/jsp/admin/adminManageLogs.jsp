<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						System Logs
					</p>
				</div>
				
			</div>
			
			<c:if test="${not empty logs}">
				<div class="row-fluid" style="margin-top:10px;margin-bottom:10px">
					<div class="span12">
						<a target="_blank" class="btn btn-primary" href="<c:url value="/dashboard/admin/export/logs.xls" />"><i class="icon icon-white icon-book"></i> Export to Excel</a>
						<a target="_blank" class="btn btn-primary" href="<c:url value="/dashboard/admin/export/logs.pdf" />"><i class="icon icon-white icon-file"></i> Export to PDF</a>
					</div>
				</div>
			</c:if>
			
			<div class="row-fluid">
			
				<div class="span12">
					
					<c:choose>
						<c:when test="${not empty logs}">
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Triggered by</th>
										<th>Access Time</th>
										<th>Description</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="log" items="${logs}">
									<tr>
										<td>${log.id}</td>
										<td>${log.loggedBy}</td>
										<td><fmt:formatDate pattern="MMM dd, yyyy hh:mm:ss a" value="${log.accessTime}" /></td>
										<td>${log.description}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							
						</c:when>
						
						<c:otherwise>
							<div class="alert alert-warning">
								No logs available at this time.
							</div>
						</c:otherwise>
					</c:choose>
					
				</div>
			
			</div>
		
		</div>
	
	</div>
</div>
<c:import url="../template/footer.jsp" />