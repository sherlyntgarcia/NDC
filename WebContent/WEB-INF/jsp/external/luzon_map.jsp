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
				<div style="margin-left:-300px; position: absolute;">
					<ul style="list-style:none;">
<%-- 						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png"></div><div style="margin-left: 35px; height: 35px;"> - Lease/Sale</div></li> --%>
<%-- 						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/nego.png"></div><div style="margin-left: 35px; height: 35px;"> - Negiotiated Sale</div></li> --%>
<%-- 						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/bid.png"></div><div style="margin-left: 35px; height: 35px;"> - Sale Thru Public Bidding</div></li> --%>
<%-- 						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png"></div><div style="margin-left: 35px; height: 35px;"> - Project Development</div></li> --%>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/underlease.png"></div><div style="margin-left: 35px; height: 35px;"> - Under Lease</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png"></div><div style="margin-left: 35px; height: 35px;"> - For Sale/Lease</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/forcmp.png"></div><div style="margin-left: 35px; height: 35px;"> - For CMP</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/withcourt.png"></div><div style="margin-left: 35px; height: 35px;"> - With Court Cases</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/forreloc.png"></div><div style="margin-left: 35px; height: 35px;"> - For Relocation Survey</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/fortitling.png"></div><div style="margin-left: 35px; height: 35px;"> - For Titling</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/withjoint.png"></div><div style="margin-left: 35px; height: 35px;"> - With Joint Venture</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png"></div><div style="margin-left: 35px; height: 35px;"> - For Project Development</div></li>
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
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/cavite/site_image.PNG" class="groupCavite" title="Site Image">Humayao, Dasmariņas, Cavite</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/cavite/map_image.PNG" class="groupCavite" title="Map Image"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/cavite/ct1_image.png" class="groupCavite" title="Certificate of Title"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/cavite/ct2_image.png" class="groupCavite" title="Certificate of Title"></a>
					</div>
				</div>
				<div class="projectTitle" id="alasasinbataan">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/alasasinbataan/site_image.png" class="groupAlasAsinBataan" title="Site Image">Alas-asin, Mariveles, Bataan</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/alasasinbataan/ct1_image.png" class="groupAlasAsinBataan" title="Front View of the Property"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/alasasinbataan/ct2_image.png" class="groupAlasAsinBataan" title="Inner View of the Property"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/alasasinbataan/ct3_image.png" class="groupAlasAsinBataan" title="View from Alas-Asin Road"></a>
					</div>
				</div>
				<div class="projectTitle" id="biaanbataan">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/biaanbataan/site_image.png" class="groupBiaanBataan" title="Site Image">Bgy. Bia-an, Mariveles Bataan</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/biaanbataan/ct1_image.png" class="groupBiaanBataan" title="Vicinity/Brgy. Road"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/biaanbataan/ct2_image.png" class="groupBiaanBataan" title="Bataan-Bagac Road/Conc. Portion of the Provincial Road"></a>
					</div>
				</div>
				<div class="projectTitle" id="mabucobataan">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/mabucobataan/site_image.png" class="groupMabucoBataan" title="Site Image">San Pedro St., Bgy. Mabuco, Hermosa, Bataan</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/mabucobataan/ct1_image.png" class="groupMabucoBataan" title="Front View of the Prop. / View from San Pedro St."></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/mabucobataan/ct2_image.png" class="groupMabucoBataan" title="San Pedro St. / Inner View of the Prop."></a>
					</div>
				</div>
			
			<div id="isabela" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="sanfernandopampanga" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="angelespampanga" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="manila" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="antipolo" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="laguna" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="nuevaecija" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="cavite" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="alasasinbataan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/forcmp.png" /></a></div>
			<div id="biaanbataan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/forcmp.png" /></a></div>
			<div id="mabucobataan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/forcmp.png" /></a></div>
		</div> <!-- /container -->
			
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />