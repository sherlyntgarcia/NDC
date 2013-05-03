<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
						<p class="lead">AMG Internal Dashboard</p>
						<hr />
						<p>You can click the <span class="badge badge-important">graphs</span> to update.</p>
						<hr />
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span6">
						<img alt="Occupancy is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/occupancy'" src="${pageContext.request.contextPath}/visualization/occupancypiechart/450/400" />
					</div>
					
					<div class="span6">
						<img alt="Maintenance Cost is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/maintenanceCost'" src="${pageContext.request.contextPath}/visualization/maintenancecostlinechart/450/400" />
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span6">
						<img alt="Sources Funds is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/sourcesFunds'" src="${pageContext.request.contextPath}/visualization/sourcesfundsbarchart/450/400" />
					</div>
					
					<div class="span6">
						<img alt="Status Assets is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/statusAssets'" src="${pageContext.request.contextPath}/visualization/statusassetsbarchart/450/400" />
					</div>
				</div>
				
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />