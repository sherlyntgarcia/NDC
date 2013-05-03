<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:import url="../template/header.jsp" />
<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			<security:authorize access =  "!hasRole('TACTICAL_USER')">
				<a href = "<c:url value = "/external/"/>" class = 'btn btn-primary'><i class = "icon icon-backward icon-white"></i> Back</a>
			</security:authorize>
			<security:authorize access =  "isAuthenticated() and hasRole('TACTICAL_USER')">
				<a href = "<c:url value = "/dashboard/tactical/"/>" class = 'btn btn-primary'><i class = "icon icon-backward icon-white"></i> Back</a>
			</security:authorize>
			<div class="container" id = "mcontainer">
				<div style="margin-left:-200px; position: absolute;">
					<ul style="list-style:none;">
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png"></div><div style="margin-left: 35px; height: 35px;"> - Lease/Sale</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/nego.png"></div><div style="margin-left: 35px; height: 35px;"> - Negiotiated Sale</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/bid.png"></div><div style="margin-left: 35px; height: 35px;"> - Sale Thru Public Bidding</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png"></div><div style="margin-left: 35px; height: 35px;"> - Project Development</div></li>
					</ul>
				</div>
				<div class="projectTitle" id="iligan">
				<div><a href="${pageContext.request.contextPath}/resources/img/sites/iligan/site_image.PNG" class="groupIligan">Poblacion, Iligan City</a></div>
				<div style="display:none">
					<a href="${pageContext.request.contextPath}/resources/img/sites/iligan/map_image.PNG" class="groupIligan" title="Map Image"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/iligan/ct1_image.PNG" class="groupIligan" title="Certificate of Title"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/iligan/ct2_image.PNG" class="groupIligan" title="Certificate of Title"></a>
				</div>
			</div>
			<div class="projectTitle" id="zamboanga">
				<div><a href="${pageContext.request.contextPath}/resources/img/sites/zamboanga/site_image.png" class="groupZamboanga">Campo Islam, Zamboanga City</a></div>
				<div style="display:none">
					<a href="${pageContext.request.contextPath}/resources/img/sites/zamboanga/map_image.png" class="groupZamboanga" title="Map Image"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/zamboanga/ct1_image.png" class="groupZamboanga" title="Certificate of Title"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/zamboanga/ct2_image.png" class="groupZamboanga" title="Certificate of Title"></a>
				</div>
			</div>
			<div class="projectTitle" id="davao">
				<div><a href="${pageContext.request.contextPath}/resources/img/sites/davao/site_image.PNG" class="groupDavao">Toril, Davao City</a></div>
				<div style="display:none;">
					<a href="${pageContext.request.contextPath}/resources/img/sites/davao/map_image.PNG" class="groupDavao" title="Map Image"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct1_image.png" class="groupDavao" title="Certificate Title"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct2_image.png" class="groupDavao" title="Certificate Title"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct3_image.png" class="groupDavao" title="Certificate Title"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct4_image.png" class="groupDavao" title="Certificate Title"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct5_image.png" class="groupDavao" title="Certificate Title"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct6_image.png" class="groupDavao" title="Certificate Title"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct7_image.png" class="groupDavao" title="Certificate Title"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct8_image.png" class="groupDavao" title="Certificate Title"></a>
				</div>
			</div>
			<div class="projectTitle" id="cotabato">
				<div><a href="${pageContext.request.contextPath}/resources/img/sites/cotabato/site_image.PNG" class="groupCotabato" title="Site Image">Parang, Cotabato</a></div>
				<div style="display:none">
					<a href="${pageContext.request.contextPath}/resources/img/sites/cotabato/map_image.PNG" class="groupCotabato" title="Map Image"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/cotabato/ct1_image.png" class="groupCotabato" title="Certificate of Title"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/cotabato/ct2_image.png" class="groupCotabato" title="Certificate of Title"></a>
					<a href="${pageContext.request.contextPath}/resources/img/sites/cotabato/ct3_image.png" class="groupCotabato" title="Certificate of Title"></a>
				</div>
			</div>
		
			<div id="iligan" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="zamboanga" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="davao" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="cotabato" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/bid.png" /></a></div>
			</div> <!-- /container -->
			
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />