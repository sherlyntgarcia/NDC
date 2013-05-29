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
						<a class="btn btn-primary" href="<c:url value="/external" />"><i class = "icon-backward icon-white"></i> External Dashboard</a>
						&nbsp;
						<a class="btn btn-primary" href="<c:url value="/external/disclosures" />"><i class = "icon-file icon-white"></i> Project Disclosures</a>
					</div>
				</div>
				
				<div style="margin-top:20px" class="row-fluid">
					<div class = "span12">
						<div>
							<ul class="nav nav-tabs">
							  <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
							  <li><a href="#share_holders" data-toggle="tab">Shareholders</a></li>
							  
							  <c:if test="${spgSubCategory.id eq 10 or spgSubCategory.id eq 11 or spgSubCategory.id eq 12 or spgSubCategory.id eq 13 or spgSubCategory.id eq 16 or spgSubCategory.id eq 17}">
							  	<li><a href="#maps" data-toggle="tab">Maps</a></li>
							  </c:if>
							</ul>
						</div>
						
						<div class="tab-content">
						  <div class="tab-pane active" id="profile">
						  	<p>
						  		<c:set var="newLineChar" value="\\n" />
								<c:set var="newLineHtml" value="<br />" />
								<c:set var="profile" value="${spgSubCategory.profile}" />
							  					
							  	<c:out value="${fn:replace(profile, newLineChar, newLineHtml )}" escapeXml="false"/>
						  	</p>
						  </div>
						  <div class="tab-pane" id="share_holders">
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
						  
						  <div class="tab-pane" id="maps">
						  	<div class="row-fluid">
						  		<div class="span12">
						  			<c:choose>
						  				<c:when test="${spgSubCategory.id eq 10}">
							  				<img src="${pageContext.request.contextPath}/resources/img/maps/gyreiprcmap.png" />
							  			</c:when>
							  			
						  				<c:when test="${spgSubCategory.id eq 11}">
							  				<img src="${pageContext.request.contextPath}/resources/img/maps/krcmap.png" />
							  			</c:when>
							  			
							  			<c:when test="${spgSubCategory.id eq 12}">
							  				<img src="${pageContext.request.contextPath}/resources/img/maps/blcmap.png" />
							  			</c:when>
							  			
							  			<c:when test="${spgSubCategory.id eq 13}">
							  				<img src="${pageContext.request.contextPath}/resources/img/maps/gyreiprcmap.png" />
							  			</c:when>
							  			
							  			<c:when test="${spgSubCategory.id eq 16}">
							  				<img src="${pageContext.request.contextPath}/resources/img/maps/lidemap.png" />
							  			</c:when>
							  			
							  			<c:when test="${spgSubCategory.id eq 17}">
							  				<img src="${pageContext.request.contextPath}/resources/img/maps/fciemap.jpg" />
							  			</c:when>
							  			
							  			<c:otherwise>
							  				Map to be uploaded
							  			</c:otherwise>
						  			</c:choose>
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