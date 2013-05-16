<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<security:authorize access="!hasRole('SPG_STRATEGIC_USER') and !hasRole('SPG_OPERATIONAL_USER') and !hasRole('POWER_USER')" >
	<c:redirect url="/dashboard" />
</security:authorize>

<c:import url="../template/header.jsp" />
<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			
			<div class="row-fluid">
				<div class="span12">
					<label class="label label-info" style="padding:10px;font-size:15px">Internal Dashboard (SPG)</label> 
				</div>
			</div>
			
		</div>
		
		<div class="row-fluid" style="margin-top:10px">
	
			<div class="span3">
			
				<c:import url="../template/spgLeftNav.jsp" />
			
			</div>
			
			<div class="span9">
			
				<div class="row-fluid">
					<div class="span12">
						<p class="lead">Project Disclosures</p>
						<hr />
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span12">
						
						<c:choose>
							<c:when test="${not empty documents}">
					
								<table class="table table-bordered table-striped" style="table-layout:fixed;width:100%">
								
									<thead>
										<tr>
											<th>Category</th>
											<th>Filename</th>
											<th>Updated By</th>
											<th>Description</th>
										</tr>
									</thead>
									
									<tbody>
										<c:forEach var="document" items="${documents}">
											<tr>
												<td>${document.category}</td>
												<td>
													<c:choose>
														<c:when test="${document.category eq 'ASEAN'}">
															Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
														</c:when>
														
														<c:when test="${document.category eq 'Mining'}">
															Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
														</c:when>
														
														<c:when test="${document.category eq 'Energy'}">
															Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
														</c:when>
														
														<c:when test="${document.category eq 'Industrial'}">
															Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
														</c:when>
														
														<c:when test="${document.category eq 'Real Estate'}">
															Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
														</c:when>
														
														<c:when test="${document.category eq 'Others'}">
															Download it <a target="_blank" href="${pageContext.request.contextPath}/download/${document.category}/${document.filename}">here</a>
														</c:when>
														
														<c:otherwise>
															Not available
														</c:otherwise>
													</c:choose>
												</td>
												<td>${document.updatedBy}</td>
												<td style="word-wrap:break-word">
													${document.description}
												</td>
											</tr>
										</c:forEach>
									</tbody>
								
								</table>
							
							</c:when>
							
							<c:otherwise>
								<div class="alert alert-error">
									No disclosures found.
								</div>
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>
			
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />