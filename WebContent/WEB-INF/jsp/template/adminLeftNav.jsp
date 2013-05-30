<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div>
	<ul class="nav nav-tabs nav-stacked">
		<li> 
			<a href="<c:url value="/dashboard/admin" />">Admin Dashboard</a> 
		</li>
		
		<li class="dropdown-submenu">
			<a href="#" tabindex="-1" >Dashboards</a>
			<ul class="dropdown-menu">
				<li>
					<a target="_blank" href="<c:url value="/dashboard/internal/AMG" />">AMG</a>
				</li>
				<li>
					<a target="_blank" href="<c:url value="/dashboard/internal/FAD" />">FAD</a>
				</li>
				<li>
					<a target="_blank" href="<c:url value="/dashboard/internal/FMG" />">FMG</a>
				</li>
				<li>
					<a target="_blank" href="<c:url value="/dashboard/internal/SPG" />">SPG</a>
				</li>
				<li> 
					<a target="_blank" href="<c:url value="/dashboard/tactical" />">Tactical</a> 
				</li>
			</ul>
		</li>
			
		<li> 
			<a href="<c:url value="/dashboard/admin/manageUsers?offset=" />">Manage Users</a> 
		</li>
		
		<li> 
			<a href="<c:url value="/dashboard/admin/createAdmins" />">Create an Admin/Tactical account</a> 
		</li>
		
		<li> 
			<a href="<c:url value="/dashboard/admin/manageLogs" />">System Logs</a> 
		</li>
		
		<li> 
			<a href="<c:url value="/dashboard/admin/options" />">Options</a>
		</li>
	</ul>
</div>