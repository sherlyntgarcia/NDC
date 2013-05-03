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
			<div class="container" id = "container">
				<div style="margin-left:-200px; position: absolute;">
					<ul style="list-style:none;">
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png"></div><div style="margin-left: 35px; height: 35px;"> - Lease/Sale</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/nego.png"></div><div style="margin-left: 35px; height: 35px;"> - Negiotiated Sale</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/bid.png"></div><div style="margin-left: 35px; height: 35px;"> - Sale Thru Public Bidding</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png"></div><div style="margin-left: 35px; height: 35px;"> - Project Development</div></li>
					</ul>
				</div>
				<div class="projectTitle" id="isabela">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/isabela/site_image.PNG" class="groupIsabela" title="Site Map">Bo. Soyung, Echague, Isabela</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/isabela/map_image.PNG" class="groupIsabela" title="Map Image"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/isabela/ct1_image.PNG" class="groupIsabela" title="Certificate of Title"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/isabela/ct2_image.PNG" class="groupIsabela" title="Certificate of Title"></a>
					</div>
				</div>
				<div class="projectTitle" id="nuevaecija">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/nuevaecija/site1_image.PNG" class="groupNuevaecija" title="North View">Bongabon, Nueva Ecija</a></div>
					<div style="display:none;">
						<a href="${pageContext.request.contextPath}/resources/img/sites/nuevaecija/site2_image.PNG" class="groupNuevaecija" title="South View"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/nuevaecija/site3_image.PNG" class="groupNuevaecija" title="7 Parcels Northern Side"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/nuevaecija/site4_image.PNG" class="groupNuevaecija" title="7 Parcels Southern Side"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/nuevaecija/map_image.PNG" class="groupNuevaecija" title="Map Image"></a>
					</div>
				</div>
				<div class="projectTitle" id="pampanga">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/angeles/site_image.PNG" class="groupPampanga1" title="Site Image">Sto. Domingo, Angeles City, Pampanga</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/angeles/map_image.PNG" class="groupPampanga1" title="Map Image">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/angeles/ct1_image.PNG" class="groupPampanga1" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/angeles/ct2_image.PNG" class="groupPampanga1" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/angeles/ct3_image.PNG" class="groupPampanga1" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/angeles/ct4_image.png" class="groupPampanga1" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/angeles/ct5_image.png" class="groupPampanga1" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/angeles/ct6_image.png" class="groupPampanga1" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/angeles/ct7_image.png" class="groupPampanga1" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
					</div>
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/site_image.PNG" class="groupPampanga2">San Juan, San Fernando City, Pampanga</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/map_image.PNG" class="groupPampanga2" title="Map Image">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct1_image.PNG" class="groupPampanga2" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct2_image.PNG" class="groupPampanga2" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct3_image.PNG" class="groupPampanga2" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct4_image.PNG" class="groupPampanga2" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct5_image.png" class="groupPampanga2" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct6_image.PNG" class="groupPampanga2" title="Certificate of Title">Sto. Domingo, Angeles City, Pampanga</a>
					</div>
				</div>
				<div class="projectTitle" id="antipolo">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/antipolo/site1_image.PNG" class="groupAntipolo">San Jose, Antipolo</a></div>
					<div style="display:none;">
						<a href="${pageContext.request.contextPath}/resources/img/sites/antipolo/site2_image.PNG" class="groupAntipolo" title="Fronting Jackson Ville Street"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/antipolo/map_image.PNG" class="groupAntipolo" title="Map Image"></a>
					</div>
				</div>
				<div class="projectTitle" id="laguna">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/laguna/site_image.PNG" class="groupLaguna" title="Site Image">Sta. Rosa, Laguna</a></div>
					<div style="display:none;">
						<a href="${pageContext.request.contextPath}/resources/img/sites/laguna/map_image.PNG" class="groupLaguna" title="Map Image"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/laguna/ct1_image.png" class="groupLaguna" title="Certificate of Title"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/laguna/ct2_image.png" class="groupLaguna" title="Certificate of Title"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/laguna/ct3_image.png" class="groupLaguna" title="Certificate of Title"></a>
					</div>
				</div>
				<div class="projectTitle" id="manila">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/manila/site_image.PNG" class="groupManila" title="Site Image">Beata St., Pandacan, Manila</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/manila/map_image.PNG" class="groupManila" title="Map Image"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/manila/ct1_image.PNG" class="groupManila" title="Certificate of Title"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/manila/ct2_image.PNG" class="groupManila" title="Certificate of Title"></a>
					</div>
				</div>
				<div class="projectTitle" id="cavite">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/cavite/site_image.PNG" class="groupCavite" title="Site Image">Humayao, Dasmariñas, Cavite</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/cavite/map_image.PNG" class="groupCavite" title="Map Image"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/cavite/ct1_image.png" class="groupCavite" title="Certificate of Title"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/cavite/ct2_image.png" class="groupCavite" title="Certificate of Title"></a>
					</div>
				</div>
			
			<div id="isabela" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="sanfernandopampanga" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="angelespampanga" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/bid.png" /></a></div>
			<div id="manila" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="antipolo" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="laguna" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="nuevaecija" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/nego.png" /></a></div>
			<div id="cavite" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
		</div> <!-- /container -->
			
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />