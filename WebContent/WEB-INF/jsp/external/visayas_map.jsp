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
			<div class="container" id = "vcontainer">
				<div style="margin-left:-200px; position: absolute;">
					<ul style="list-style:none;">
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png"></div><div style="margin-left: 35px; height: 35px;"> - Lease/Sale</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/nego.png"></div><div style="margin-left: 35px; height: 35px;"> - Negiotiated Sale</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/bid.png"></div><div style="margin-left: 35px; height: 35px;"> - Sale Thru Public Bidding</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png"></div><div style="margin-left: 35px; height: 35px;"> - Project Development</div></li>
					</ul>
				</div>
				
				
				<div class="projectTitle" id="guadalupecebu">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/cebu/guadalupe/site1_image.PNG" class="groupCebu1">Guadalupe, Cebu City</a></div>
					<div style="display:none;">
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/guadalupe/site2_image.PNG" class="groupCebu1" title="Fronting Street"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/guadalupe/map_image.PNG" class="groupCebu1" title="Map Image"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/guadalupe/ct1_image.png" class="groupCebu1" title="Certificate Title"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/guadalupe/ct2_image.png" class="groupCebu1" title="Certificate Title"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/guadalupe/ct3_image.png" class="groupCebu1" title="Certificate Title"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/guadalupe/ct4_image.png" class="groupCebu1" title="Certificate Title"></a>
					</div>
				</div>
				<div class="projectTitle" id="sambagcebu">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/cebu/sambag/site1_image.PNG" class="groupCebu2">Sambag, Cebu City</a></div>
					<div style="display:none;">
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/sambag/site2_image.PNG" class="groupCebu2" title="View from Janquera Street"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/sambag/site3_image.PNG" class="groupCebu2" title="R.R. Landon Street"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/sambag/site4_image.PNG" class="groupCebu2" title="Janquera Street"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/sambag/map_image.PNG" class="groupCebu2" title="Certificate Title"></a>
					</div>
				</div>
			
			<div id="sambagcebu" class="fixed">
					<a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/bid.png" /></a>
			</div>
			<div id="guadalupecebu" class="fixed">
					<a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/nego.png" /></a></div>
			</div> <!-- /container -->
			
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />