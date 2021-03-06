<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:import url="../template/header.jsp" />
<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
		
			<a href = "<c:url value = "/dashboard/internal/AMG"/>" class = 'btn btn-primary'><i class = "icon icon-backward icon-white"></i> Back</a>

			<div class="container" id = "container">
				<div style="margin-left:-300px; position: absolute;">
					<ul style="list-style:none;">
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/underlease.png"></div><div style="margin-left: 35px; height: 35px;"> - Under Lease</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png"></div><div style="margin-left: 35px; height: 35px;"> - For Sale/Lease</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/withcourt.png"></div><div style="margin-left: 35px; height: 35px;"> - With Court Cases</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/forreloc.png"></div><div style="margin-left: 35px; height: 35px;"> - For Relocation Survey</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/fortitling.png"></div><div style="margin-left: 35px; height: 35px;"> - For Titling</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/withjoint.png"></div><div style="margin-left: 35px; height: 35px;"> - With Joint Venture</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png"></div><div style="margin-left: 35px; height: 35px;"> - For Project Development</div></li>
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
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/site_image.PNG" class="groupPampanga2">San Juan, San Fernando City, Pampanga</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/map_image.PNG" class="groupPampanga2" title="Map Image">San Juan, San Fernando City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct1_image.PNG" class="groupPampanga2" title="Certificate of Title">San Juan, San Fernando City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct2_image.PNG" class="groupPampanga2" title="Certificate of Title">San Juan, San Fernando City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct3_image.PNG" class="groupPampanga2" title="Certificate of Title">San Juan, San Fernando City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct4_image.PNG" class="groupPampanga2" title="Certificate of Title">San Juan, San Fernando City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct5_image.png" class="groupPampanga2" title="Certificate of Title">San Juan, San Fernando City, Pampanga</a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pampanga/sanfernando/ct6_image.PNG" class="groupPampanga2" title="Certificate of Title">San Juan, San Fernando City, Pampanga</a>
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
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/biaanbataan/site_image.png" class="groupBiaanBataan" title="Site Image">Bgy. Bia-an, Mariveles, Bataan</a></div>
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
				<div class="projectTitle" id="sandionisiopque">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/sandionisiopque/site_image.png" class="groupSanDionisioPque" title="Site Image">San Dionisio, Paranaque</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/sandionisiopque/ct1_image.png" class="groupSanDionisioPque" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="delmonteqc">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/delmontequezoncity/site_image.png" class="groupDelMonteQc" title="Site Image">San Francisco Del Monte, Quezon City</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/delmontequezoncity/ct1_image.png" class="groupDelMonteQc" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="dmacapagalpasay">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/dmacapagalpasay/site_image.png" class="groupDMacapagalPasay" title="Site Image">Central Business Park, D. Macapagal, Pasay</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/dmacapagalpasay/ct1_image.png" class="groupDMacapagalPasay" title="Pictures"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/dmacapagalpasay/ct2_image.png" class="groupDMacapagalPasay" title="Certificate of Title"></a>
					</div>
				</div>
				<div class="projectTitle" id="lankaancavite">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/lankaancavite/site_image.png" class="groupLankaanCavite" title="Site Image">Bgy. Lankaan II, Dasmarinas, Cavite</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/lankaancavite/ct1_image.png" class="groupLankaanCavite" title="Pictures"></a>
<%-- 						<a href ="${pageContext.request.contextPath}/resources/img/sites/lankaancavite/ct2_image.png" class="groupLankaanCavite" title="Pictures (Cont.)"></a> --%>
					</div>
				</div>
				<div class="projectTitle" id="gilpuyatmakati">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/gilpuyatmakati/site_image.png" class="groupGilPuyatMakati" title="Site Image">I&I Bldg., Sen. Gil Puyat Ave., Makati City</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/gilpuyatmakati/ct1_image.png" class="groupGilPuyatMakati" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="pasongtamomakati">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/pasongtamomakati/site_image.png" class="groupPasongTamoMakati" title="Site Image">Pasong Tamo Ext., Makati City</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/pasongtamomakati/ct1_image.png" class="groupPasongTamoMakati" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="kamagongmakati">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/kamagongmakati/site_image.png" class="groupKamagongMakati" title="Site Image">Kamagong cor. Sampaloc, Makati City</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/kamagongmakati/ct1_image.png" class="groupKamagongMakati" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="bambanglaguna">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/bambanglaguna/site_image.png" class="groupBambangLaguna" title="Site Image">National Road, Bgy. Bambang, Los Banos Laguna</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/bambanglaguna/ct1_image.png" class="groupBambangLaguna" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="sanfelipepampanga">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/sanfelipepampanga/site_image.png" class="groupSanFelipePampanga" title="Site Image">San Felipe, San Fernando City, Pampanga</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/sanfelipepampanga/ct1_image.png" class="groupSanFelipePampanga" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="batangasmarivelesbataan">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/batangasmarivelesbataan/site_image.png" class="groupBatangasMarivelesBataan" title="Site Image">Bgy. Batangas II, Mariveles, Bataan</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/batangasmarivelesbataan/ct1_image.png" class="groupBatangasMarivelesBataan" title="Lot Plan"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/batangasmarivelesbataan/ct2_image.png" class="groupBatangasMarivelesBataan" title="Pictures"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/batangasmarivelesbataan/ct3_image.png" class="groupBatangasMarivelesBataan" title="Pictures (Cont.)"></a>
					</div>
				</div>
				<div class="projectTitle" id="doloressanfernando">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/doloressanfernando/site_image.png" class="groupDoloresSanFernando" title="Site Image">Bgy. Dolores, San Fernando City, Pampanga</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/doloressanfernando/ct1_image.png" class="groupDoloresSanFernando" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="delmontebulacan">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/delmontebulacan/site_image.png" class="groupDelMonteBulacan" title="Site Image">Bgy. Paradise III, San Jose Del Monte City, Bulacan</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/delmontebulacan/ct1_image.png" class="groupDelMonteBulacan" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="aureasannicolaspampanga">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/aureasannicolaspampanga/site_image.png" class="groupAureaSanNicolasPampanga" title="Site Image">Aurea Subdivision, San Nicolas, San Fernando City, Pampanga</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/aureasannicolaspampanga/ct1_image.png" class="groupAureaSanNicolasPampanga" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="purezamanila">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/purezamanila/site_image.png" class="groupPurezaManila" title="Site Image">Pureza St., Sta. Mesa, Manila</a></div>
				</div>
				<div class="projectTitle" id="calataganbatangas">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/calataganbatangas/site_image.png" class="groupCalataganBatangas" title="Site Image">Bgy. Sambungan, Calatagan, Batangas</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/calataganbatangas/ct1_image.png" class="groupCalataganBatangas" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="fernandinosannicolaspampanga">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/fernandinosannicolaspampanga/site_image.png" class="groupFernandinoSanNicolasPampanga" title="Site Image">Fernandino Subd., San Nicolas, San Fernando, Pampanga</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/fernandinosannicolaspampanga/ct1_image.png" class="groupFernandinoSanNicolasPampanga" title="Pictures"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/fernandinosannicolaspampanga/ct2_image.png" class="groupFernandinoSanNicolasPampanga" title="Pictures (Cont.)"></a>
					</div>
				</div>
				<div class="projectTitle" id="sucatmuntinlupa">
					<div><a href ="${pageContext.request.contextPath}/resources/img/sites/sucatmuntinlupa/site_image.png" class="groupSucatMuntinlupa" title="Site Image">Bgy. Sucat, Muntinlupa City</a></div>
					<div style="display:none">
						<a href ="${pageContext.request.contextPath}/resources/img/sites/sucatmuntinlupa/ct1_image.png" class="groupSucatMuntinlupa" title="Location Map"></a>
						<a href ="${pageContext.request.contextPath}/resources/img/sites/sucatmuntinlupa/ct2_image.png" class="groupSucatMuntinlupa" title="Pictures"></a>
					</div>
				</div>
			
			<div id="isabela" title="Bo. Soyung, Echague, Isabela" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="sanfernandopampanga" title="San Juan, San Fernando City, Pampanga" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="manila" title="Beata St., Pandacan, Manila" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="antipolo" title="San Jose, Antipolo" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="laguna" title="Sta. Rosa, Laguna" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="nuevaecija" title="Bongabon, Nueva Ecija" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="cavite" title="Humayao, Dasmarinas Cavite" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/ongoing.png" /></a></div>
			<div id="alasasinbataan" title="Alas-asin, Mariveles, Bataan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="biaanbataan" title="Brgy. Bia-an, Mariveles Bataan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="mabucobataan" title="San Pedro St., Brgy. Mabuco, Hermosa, Bataan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="barrancamandaluyong" title="Bo. Barranca Mandaluyong" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="mcarthurtarlac" title="Mc Arthur Highway, Tarlac City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="tordesillasmakati" title="Tordesillas St., Salcedo Village, Makati City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="northaveqc" title="North Ave., Quezon City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="shawblvdpasig" title="Shaw Blvd., Bagong Ilog, Pasig City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="angellinaomalate" title="Angel Linao St., Malate Dist. Manila" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="tandangkutyorizal" title="Brgy. Tandang Kutyo, Tanay, Rizal" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/forreloc.png" /></a></div>
			<div id="bonotlegazpi" title="Brgy. Bonot, Legazpi City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/fortitling.png" /></a></div>
			<div id="malhacanbulacan" title="Brgy. Malhacan, Meycauayan, Bulacan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/fortitling.png" /></a></div>
			<div id="sandionisiopque" title="San Dionisio, Paranaque" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/withcourt.png" /></a></div>
			<div id="delmonteqc" title="San Francisco Del Monte, Quezon City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/fortitling.png" /></a></div>
			<div id="dmacapagalpasay" title="Central Business Park, D. Macapagal Pasay" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="lankaancavite" title="Bgy. Lankaan II, Dasmarinas Cavite" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="gilpuyatmakati" title="I&I Bldg., Sen. Gil Puyat Ave., Makati City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="pasongtamomakati" title="Pasong Tamo Ext., Makati City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="kamagongmakati" title="Kamagong cor. Sampaloc, Makati City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			<div id="bambanglaguna" title="National Road, Bgy. Bambang, Los Banos Laguna" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="sanfelipepampanga" title="San Felipe, San Fernando City, Pampanga" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="batangasmarivelesbataan" title="Bgy. Batangas II, Mariveles, Bataan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="doloressanfernando" title="Bgy. Dolores, San Fernando City, Pampanga" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="delmontebulacan" title="Bgy. Paradise III, San Jose Del Monte City, Bulacan" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="aureasannicolaspampanga" title="Aurea Subdivision, San Nicolas, San Fernando City, Pampanga" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="purezamanila" title="Pureza St., Sta. Mesa, Manila" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/withcourt.png" /></a></div>
			<div id="calataganbatangas" title="Brgy. Sambungan, Calatagan, Batangas" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/withcourt.png" /></a></div>
			<div id="fernandinosannicolaspampanga" title="Fernandino Subd., San Nicolas, San Fernando, Pampanga" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			<div id="sucatmuntinlupa" title="Bgy. Sucat, Muntinlupa City" class="fixed"><a href="#" class="pin"><img src ="${pageContext.request.contextPath}/resources/img/pins/withjoint.png" /></a></div>
		</div> <!-- /container -->
			
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />