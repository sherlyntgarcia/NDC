<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:import url="../template/header.jsp" />
<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			
			<a href = "<c:url value = "/dashboard/internal/AMG"/>" class = 'btn btn-primary'><i class = "icon icon-backward icon-white"></i> Back</a>
			
			<div class="container" id = "vcontainer">
				<div style="margin-left:-300px; position: absolute;">
					<ul style="list-style:none;">
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/underlease.png"></div><div style="margin-left: 35px; height: 35px;"> - Under Lease</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png"></div><div style="margin-left: 35px; height: 35px;"> - For Sale/Lease</div></li>
<%-- 						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/forcmp.png"></div><div style="margin-left: 35px; height: 35px;"> - For CMP</div></li> --%>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/withcourt.png"></div><div style="margin-left: 35px; height: 35px;"> - With Court Cases</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/forreloc.png"></div><div style="margin-left: 35px; height: 35px;"> - For Relocation Survey</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/fortitling.png"></div><div style="margin-left: 35px; height: 35px;"> - For Titling</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/withjoint.png"></div><div style="margin-left: 35px; height: 35px;"> - With Joint Venture</div></li>
						<li><div style="width:20px; position: absolute;"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png"></div><div style="margin-left: 35px; height: 35px;"> - For Project Development</div></li>
					</ul>
				</div>
				
				
				<div class="projectTitle" id="guadalupecebu">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/cebu/guadalupe/site1_image.PNG" class="groupCebu1" title="Site Image">Guadalupe, Cebu City</a></div>
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
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/cebu/sambag/site1_image.PNG" class="groupCebu2" title="Site Image">Sambag, Cebu City</a></div>
					<div style="display:none;">
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/sambag/site2_image.PNG" class="groupCebu2" title="View from Janquera Street"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/sambag/site3_image.PNG" class="groupCebu2" title="R.R. Landon Street"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/sambag/site4_image.PNG" class="groupCebu2" title="Janquera Street"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cebu/sambag/map_image.PNG" class="groupCebu2" title="Certificate Title"></a>
					</div>
				</div>
				<div class="projectTitle" id="rizalbacolod">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/rizalbacolod/site_image.png" class="groupRizalBacolod" title="Site Image">Cor Lacson & Rizal Sts Bacolod City</a></div>
					<div style="display:none;">
						<a href="${pageContext.request.contextPath}/resources/img/sites/rizalbacolod/ct1_image.png" class="groupRizalBacolod" title="Along Lacson & Rizal St."></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/rizalbacolod/ct2_image.png" class="groupRizalBacolod" title="Corner View"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/rizalbacolod/ct3_image.png" class="groupRizalBacolod" title="Certificate of Title"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/rizalbacolod/ct4_image.png" class="groupRizalBacolod" title="Certificate Title (Cont.)"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/rizalbacolod/ct5_image.png" class="groupRizalBacolod" title="Certificate Title (Cont.)"></a>
					</div>
				</div>
				<div class="projectTitle" id="bantayancebu">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/bantayancebu/site_image.png" class="groupBantayanCebu" title="Site Image">Sta. Fe, Bantayan, Cebu City</a></div>
					<div style="display:none;">
						<a href="${pageContext.request.contextPath}/resources/img/sites/bantayancebu/ct1_image.png" class="groupBantayanCebu" title="Inner & Front View"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/bantayancebu/ct2_image.png" class="groupBantayanCebu" title="Road-Right-of-Way"></a>
					</div>
				</div>
				<div class="projectTitle" id="poblacionbacolod">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/poblacionbacolod/site_image.png" class="groupPoblacionBacolod" title="Site Image">San Juan St., Poblacion, Bacolod City</a></div>
					<div style="display:none;">
						<a href="${pageContext.request.contextPath}/resources/img/sites/poblacionbacolod/ct1_image.png" class="groupPoblacionBacolod" title="Pictures"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/poblacionbacolod/ct2_image.png" class="groupPoblacionBacolod" title="Certificate of Title"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/poblacionbacolod/ct3_image.png" class="groupPoblacionBacolod" title="Certificate of Title (Cont.)"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/poblacionbacolod/ct4_image.png" class="groupPoblacionBacolod" title="Certificate of Title (Cont.)"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/poblacionbacolod/ct5_image.png" class="groupPoblacionBacolod" title="Certificate of Title (Cont.)"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/poblacionbacolod/ct6_image.png" class="groupPoblacionBacolod" title="Certificate of Title (Cont.)"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/poblacionbacolod/ct7_image.png" class="groupPoblacionBacolod" title="Certificate of Title (Cont.)"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/poblacionbacolod/ct8_image.png" class="groupPoblacionBacolod" title="Certificate of Title (Cont.)"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/poblacionbacolod/ct9_image.png" class="groupPoblacionBacolod" title="Certificate of Title (Cont.)"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/poblacionbacolod/ct10_image.png" class="groupPoblacionBacolod" title="Certificate of Title (Cont.)"></a>
					</div>
				</div>
			
				<div id="sambagcebu" title="Sambag, Cebu City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
				<div id="guadalupecebu" title="Guadalupe, Cebu City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
				<div id="rizalbacolod" title="Cor Lacson & Rizal Sts Bacolod City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
				<div id="bantayancebu" title="Sta. Fe., Bantayan, Cebu City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
				<div id="poblacionbacolod" title="San Juan St., Poblacion, Bacolod City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
			
			</div>
			
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />