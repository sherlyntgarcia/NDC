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
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/underlease.png"></div><div style="margin-left: 35px; height: 35px;"> - Under Lease</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png"></div><div style="margin-left: 35px; height: 35px;"> - Sale/Lease/Project Development</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/withjoint.png"></div><div style="margin-left: 35px; height: 35px;"> - With Joint Venture</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/ongoing.png"></div><div style="margin-left: 35px; height: 35px;"> - On-Going Projects</div></li>
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
				<div class="projectTitle" id="barrancamandaluyong">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/barrancamandaluyong/site_image.png" class="groupBarrancaMandaluyong" title="Location & Vicinity Map">Bo. Barranca, Mandaluyong</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/barrancamandaluyong/ct1_image.png" class="groupBarrancaMandaluyong" title="Pictures"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/barrancamandaluyong/ct2_image.png" class="groupBarrancaMandaluyong" title="Certificate of Title"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/barrancamandaluyong/ct3_image.png" class="groupBarrancaMandaluyong" title="Certificate of Title (Cont.)"></a>
					</div>
				</div>
				<div class="projectTitle" id="mcarthurtarlac">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/mcarthurtarlac/site_image.png" class="groupMcArthurTarlac" title="Location & Vicinity Map">Mc Arthur Highway, Tarlac City</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/mcarthurtarlac/ct1_image.png" class="groupMcArthurTarlac" title="Pictures"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/mcarthurtarlac/ct2_image.png" class="groupMcArthurTarlac" title="Pictures (Cont.)"></a>
					</div>
				</div>
				<div class="projectTitle" id="tordesillasmakati">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/tordesillasmakati/site_image.png" class="groupTordesillasMakati" title="Location & Vicinity Map">Tordesillas St., Salcedo Vill., Makati City</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/tordesillasmakati/ct1_image.png" class="groupTordesillasMakati" title="Along Tordesillas Makati"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/tordesillasmakati/ct2_image.png" class="groupTordesillasMakati" title="Along Soliman Street"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/tordesillasmakati/ct3_image.png" class="groupTordesillasMakati" title="Certificate of Title"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/tordesillasmakati/ct4_image.png" class="groupTordesillasMakati" title="Certificate of Title (Cont.)"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/tordesillasmakati/ct5_image.png" class="groupTordesillasMakati" title="Certificate of Title (Cont.)"></a>
					</div>
				</div>
				<div class="projectTitle" id="northaveqc">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/northavequezoncity/site_image.png" class="groupNorthAveQc" title="Site Image">North Ave., Quezon City</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/northavequezoncity/ct1_image.png" class="groupNorthAveQc" title="Pictures"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/northavequezoncity/ct2_image.png" class="groupNorthAveQc" title="Certificate of Title"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/northavequezoncity/ct3_image.png" class="groupNorthAveQc" title="Certificate of Title (Cont.)"></a>
					</div>
				</div>
				<div class="projectTitle" id="shawblvdpasig">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/shawblvdpasig/site_image.png" class="groupShawBlvdPasig" title="Site Image">Shaw Blvd., Bagong Ilog, Pasig City</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/shawblvdpasig/ct1_image.png" class="groupShawBlvdPasig" title="Pictures"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/shawblvdpasig/ct2_image.png" class="groupShawBlvdPasig" title="Certificate of Title"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/shawblvdpasig/ct3_image.png" class="groupShawBlvdPasig" title="Certificate of Title (Cont.)"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/shawblvdpasig/ct4_image.png" class="groupShawBlvdPasig" title="Certificate of Title (Cont.)"></a>
					</div>
				</div>
				<div class="projectTitle" id="angellinaomalate">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/angellinaomalate/site_image.png" class="groupAngelLinaoMalate" title="Site Image">Angel Linao St., Malate Dist. Manila</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/angellinaomalate/ct1_image.png" class="groupAngelLinaoMalate" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="tandangkutyorizal">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/tandangkutyorizal/site_image.png" class="groupTandangKutyoRizal" title="Site Image">Brgy. Tandang Kutyo, Tanay, Rizal</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/tandangkutyorizal/ct1_image.png" class="groupTandangKutyoRizal" title="View of Prop. on a Vantage Point"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/tandangkutyorizal/ct2_image.png" class="groupTandangKutyoRizal" title="Vicinity within the existing Brgy. Road"></a>
					</div>
				</div>
				<div class="projectTitle" id="bonotlegazpi">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/bonotlegazpi/site_image.png" class="groupBonotLegazpi" title="Site Image">Brgy. Bonot, Legazpi City</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/bonotlegazpi/ct1_image.png" class="groupBonotLegazpi" title="View from the Road Lot"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/bonotlegazpi/ct2_image.png" class="groupBonotLegazpi" title="Vicinity Penaranda St. Ext."></a>
					</div>
				</div>
				<div class="projectTitle" id="malhacanbulacan">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/malhacanbulacan/site_image.png" class="groupMalhacanBulacan" title="Site Image">Brgy. Malhacan, Meycauayan, Bulacan</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/malhacanbulacan/ct1_image.png" class="groupMalhacanBulacan" title="Subject Prop. with Dilapidated Structures"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/malhacanbulacan/ct2_image.png" class="groupMalhacanBulacan" title="View from the Fronting Road"></a>
					</div>
				</div>
<!-- 				<div class="projectTitle" id="onedtimakati"> -->
<%-- 					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/onedtimakati/site_image.png" class="groupOneDtiMakati" title="Site Image">One-DTI</a></div> --%>
<!-- 					<div style="display:none"> -->
<%-- 						<a href ="${pageContext.request.contextPath}/resources/img/sites/onedtimakati/ct1_image.png" class="groupOneDtiMakati" title="Subject Prop. with Dilapidated Structures"></a> --%>
<%-- 						<a href ="${pageContext.request.contextPath}/resources/img/sites/onedtimakati/ct2_image.png" class="groupOneDtiMakati" title="View from the Fronting Road"></a> --%>
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="projectTitle" id="dmacapagalpasay">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/dmacapagalpasay/site_image.png" class="groupDMacapagalPasay" title="Site Image">Central Business Park, D. Macapagal Pasay</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/dmacapagalpasay/ct1_image.png" class="groupDMacapagalPasay" title="Pictures"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/dmacapagalpasay/ct2_image.png" class="groupDMacapagalPasay" title="Certificate of Title"></a>
					</div>
				</div>
				<div class="projectTitle" id="lankaancavite">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/lankaancavite/site_image.png" class="groupLankaanCavite" title="Site Image">Bgy. Lankaan II, Dasmarinas Cavite</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/lankaancavite/ct1_image.png" class="groupLankaanCavite" title="Pictures"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/lankaancavite/ct2_image.png" class="groupLankaanCavite" title="Pictures (Cont.)"></a>
					</div>
				</div>
	
			<div id="isabela" title="Bo. Soyung, Echague, Isabela" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="sanfernandopampanga" title="San Juan, San Fernando City, Pampanga" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="angelespampanga" title="Sto. Domingo, Angeles City, Pampanga" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="manila" title="Beata St., Pandacan, Manila" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="antipolo" title="San Jose, Antipolo" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="laguna" title="Sta. Rosa, Laguna" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="nuevaecija" title="Bongabon, Nueva Ecija" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="cavite" title="Humayao, Dasmarinas Cavite" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="alasasinbataan" title="Alas-asin, Mariveles, Bataan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="biaanbataan" title="Brgy. Bia-an, Mariveles Bataan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="mabucobataan" title="San Pedro St., Brgy. Mabuco, Hermosa, Bataan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="barrancamandaluyong" title="Bo. Barranca Mandaluyong" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="mcarthurtarlac" title="Mc Arthur Highway, Tarlac City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="tordesillasmakati" title="Tordesillas St., Salcedo Village, Makati City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="northaveqc" title="North Ave., Quezon City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="shawblvdpasig" title="Shaw Blvd., Bagong Ilog, Pasig City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
<%-- 			<div id="onedtimakati" title="One-DTI" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div> --%>
			<div id="dmacapagalpasay" title="Central Business Park, D. Macapagal Pasay" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
			<div id="lankaancavite" title="Bgy. Lankaan II, Dasmarinas Cavite" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/ongoing.png" /></a></div>
		</div> <!-- /container -->
			
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />