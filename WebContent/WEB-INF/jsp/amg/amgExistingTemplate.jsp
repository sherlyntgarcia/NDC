<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="../template/header.jsp" />
<div class = "admin-home">

	<div class="container-fluid">
		<div class="row-fluid">
		
			<div class="span12">
			
				<div class="row-fluid">
					<div class="span12">
						<p class="lead">
							${spgSubCategory.name}
						</p>
						<hr />
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span12">
						<security:authorize access="!hasRole('AMG_STRATEGIC_USER') and !hasRole('AMG_OPERATIONAL_USER') and !hasRole('POWER_USER')" >
							<a class="btn btn-primary" href="<c:url value="/external" />"><i class = "icon-backward icon-white"></i> External Dashboard</a>
						</security:authorize>
						
						<!-- for AMG users -->
						<security:authorize access="hasRole('AMG_STRATEGIC_USER') or hasRole('AMG_OPERATIONAL_USER')" >
							<a class="btn btn-primary" href="<c:url value="/dashboard/internal/AMG" />"><i class = "icon-backward icon-white"></i> Internal Dashboard</a>
						</security:authorize>
						
<%-- 						<security:authorize access="hasRole('POWER_USER')" > --%>
<%-- 							<a class="btn btn-primary" href="<c:url value="/dashboard/" />"><i class = "icon-backward icon-white"></i> Internal Dashboard</a> --%>
<%-- 						</security:authorize> --%>
					</div>
				</div>
				
				<div style="margin-top:20px" class="row-fluid">
					<div class = "span12">
						<div>
							<ul class="nav nav-tabs">
							  <li class = "active"><a href="#profile" data-toggle="tab">Profile</a></li>
							  <li><a href="#graphs" data-toggle="tab">Shareholders</a></li>
							  <li><a href="#financial" data-toggle="tab">Financial Performance</a></li>
							  <li><a href="#milestone" data-toggle="tab">Milestone Alerts</a></li>
							</ul>
						</div>
						
						<div class="tab-content">
						
						  <div class="tab-pane active" id="profile">
						  	<div class="row-fluid">
						  		<div class="span12">
						  			<p style="margin-left: 20px">
							  			<c:choose>
							  				<c:when test="${not empty spgSubCategory.profile}">
							  					<c:set var="newLineChar" value="\\n" />
												<c:set var="newLineHtml" value="<br />" />
												<c:set var="profile" value="${spgSubCategory.profile}" />
							  					
							  					<c:out value="${fn:replace(profile, newLineChar, newLineHtml )}" escapeXml="false"/>
							  				</c:when>
							  					
							  				<c:otherwise>
							  					None
							  				</c:otherwise>
							  			</c:choose>
							  		</p>
						  		</div>
						  	</div>
						  </div>
						  	
						  <div class="tab-pane" id="graphs">
						  	
							  	<div class="row-fluid">
							  		<div class="span12">
								  		<div id="shareholdersPieChartDiv"></div>
							
										<script>
											$(document).ready(function() {
												var url = "${pageContext.request.contextPath}/visualization/shareholderspiechart";
												var id = Number("${spgSubCategory.id}");
												
												createShareholdersPieChart(url, 1300, 400, id);
											});
										</script>
							  		</div>
							  	</div>
						  	
						  </div>
						  
						  <div class="tab-pane" id="financial">
						  	<div class="row-fluid">
							  	<div class = "span12">
							  		<img alt="Income Statement is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/incomeStatement'" src="${pageContext.request.contextPath}/visualization/spgincomestatementbarlinechart/450/400/${spgSubCategory.id}" />
							  	</div>
						  	</div>
						  	
						  	<div class="row-fluid">
							  	<div class = "span12">
							  		<img alt="Balance Sheet is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/balanceSheet'" src="${pageContext.request.contextPath}/visualization/spgbalancesheetbarlinechart/450/400/${spgSubCategory.id}" />
						  		</div>
					  		</div>
					  		
					  		<div class="row-fluid">
							  	<div class = "span12">
							  		<img alt="Cash Flow is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/cashFlow'" src="${pageContext.request.contextPath}/visualization/spgcashflowlinechart/450/400/${spgSubCategory.id}" />						  	
							  	</div>
						  	</div>
						  </div>
						  
						  <div class="tab-pane" id="milestone">
						  	<div class="row-fluid">
						  		<div class="span12">
						  			<p style="margin-left: 20px">
							  			<c:choose>
							  				<c:when test="${not empty spgSubCategory.milestone}">
							  					${spgSubCategory.milestone}
							  				</c:when>
							  				
							  				<c:otherwise>
							  					None
							  				</c:otherwise>
							  			</c:choose>
							  		</p>
						  		</div>
						  	</div>
						  </div>				 						  
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="../template/footer.jsp" />