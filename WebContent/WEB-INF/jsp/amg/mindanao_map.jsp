<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:import url="../template/header.jsp" />
<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			
			<a href = "<c:url value = "/dashboard/internal/AMG"/>" class = 'btn btn-primary'><i class = "icon icon-backward icon-white"></i> Back</a>
			
			<div class="container" id = "mcontainer">
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
<!-- 				<div class="projectTitle" id="davao"> -->
<%-- 					<div><a href="${pageContext.request.contextPath}/resources/img/sites/davao/site_image.PNG" class="groupDavao">Toril, Davao City</a></div> --%>
<!-- 					<div style="display:none;"> -->
<%-- 						<a href="${pageContext.request.contextPath}/resources/img/sites/davao/map_image.PNG" class="groupDavao" title="Map Image"></a> --%>
<%-- 						<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct1_image.png" class="groupDavao" title="Certificate Title"></a> --%>
<%-- 						<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct2_image.png" class="groupDavao" title="Certificate Title"></a> --%>
<%-- 						<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct3_image.png" class="groupDavao" title="Certificate Title"></a> --%>
<%-- 						<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct4_image.png" class="groupDavao" title="Certificate Title"></a> --%>
<%-- 						<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct5_image.png" class="groupDavao" title="Certificate Title"></a> --%>
<%-- 						<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct6_image.png" class="groupDavao" title="Certificate Title"></a> --%>
<%-- 						<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct7_image.png" class="groupDavao" title="Certificate Title"></a> --%>
<%-- 						<a href="${pageContext.request.contextPath}/resources/img/sites/davao/ct8_image.png" class="groupDavao" title="Certificate Title"></a> --%>
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="projectTitle" id="cotabato">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/cotabato/site_image.PNG" class="groupCotabato" title="Site Image">Parang, Cotabato</a></div>
					<div style="display:none">
						<a href="${pageContext.request.contextPath}/resources/img/sites/cotabato/map_image.PNG" class="groupCotabato" title="Map Image"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cotabato/ct1_image.png" class="groupCotabato" title="Certificate of Title"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cotabato/ct2_image.png" class="groupCotabato" title="Certificate of Title"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/cotabato/ct3_image.png" class="groupCotabato" title="Certificate of Title"></a>
					</div>
				</div>
				<div class="projectTitle" id="fortichbukidnon">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/fortichbukidnon/site_image.png" class="groupFortichBukidnon" title="Site Image">Manolo Fortich and Libona, Bukidnon</a></div>
					<div style="display:none">
						<a href="${pageContext.request.contextPath}/resources/img/sites/fortichbukidnon/ct1_image.png" class="groupFortichBukidnon" title="Site Image (Cont.)"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/fortichbukidnon/ct2_image.png" class="groupFortichBukidnon" title="Pictures"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/fortichbukidnon/ct3_image.png" class="groupFortichBukidnon" title="Pictures"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/fortichbukidnon/ct4_image.png" class="groupFortichBukidnon" title="Pictures"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/fortichbukidnon/ct5_image.png" class="groupFortichBukidnon" title="Pictures"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/fortichbukidnon/ct6_image.png" class="groupFortichBukidnon" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="langihanbutuan">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/langihanbutuan/site_image.png" class="groupLangihanButuan" title="Site Image">Langihan District, Butuan City</a></div>
					<div style="display:none">
						<a href="${pageContext.request.contextPath}/resources/img/sites/langihanbutuan/ct1_image.png" class="groupLangihanButuan" title="Site Image (Cont.)"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/langihanbutuan/ct2_image.png" class="groupLangihanButuan" title="Pictures"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/langihanbutuan/ct3_image.png" class="groupLangihanButuan" title="Pictures"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/langihanbutuan/ct4_image.png" class="groupLangihanButuan" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="talakagbukidnon">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/talakagbukidnon/site_image.png" class="groupTalakagBukidnon" title="Site Image">Talakag, Bukidnon City</a></div>
					<div style="display:none">
						<a href="${pageContext.request.contextPath}/resources/img/sites/talakagbukidnon/ct1_image.png" class="groupTalakagBukidnon" title="Pictures"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/talakagbukidnon/ct2_image.png" class="groupTalakagBukidnon" title="Certificate of Title"></a>
					</div>
				</div>
				<div class="projectTitle" id="torildavao">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/torildavao/site_image.png" class="groupTorilDavao" title="Site Image">Bgy. Daliao, Toril, Davao City</a></div>
					<div style="display:none">
						<a href="${pageContext.request.contextPath}/resources/img/sites/torildavao/ct1_image.png" class="groupTorilDavao" title="Pictures"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/torildavao/ct2_image.png" class="groupTorilDavao" title="Pictures (Cont.)"></a>
					</div>
				</div>
				<div class="projectTitle" id="bugocagayandeoro">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/bugocagayandeoro/site_image.png" class="groupBugoCagayanDeOro" title="Site Image">Bgy. Bugo, Cagayan De Oro City</a></div>
					<div style="display:none">
						<a href="${pageContext.request.contextPath}/resources/img/sites/bugocagayandeoro/ct1_image.png" class="groupBugoCagayanDeOro" title="Lot Plan"></a>
						<a href="${pageContext.request.contextPath}/resources/img/sites/bugocagayandeoro/ct2_image.png" class="groupBugoCagayanDeOro" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="puertocagayandeoro">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/puertocagayandeoro/site_image.png" class="groupPuertoCagayanDeOro" title="Site Image">Puerto, Cagayan De Oro City</a></div>
					<div style="display:none">
						<a href="${pageContext.request.contextPath}/resources/img/sites/puertocagayandeoro/ct1_image.png" class="groupPuertoCagayanDeOro" title="Lot Plan"></a>
					</div>
				</div>
				<div class="projectTitle" id="macasandigcagayandeoro">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/macasandigcagayandeoro/site_image.png" class="groupMacasandigCagayanDeOro" title="Site Image">Bgy. Macasandig, Cagayan De Oro City</a></div>
					<div style="display:none">
						<a href="${pageContext.request.contextPath}/resources/img/sites/macasandigcagayandeoro/ct1_image.png" class="groupMacasandigCagayanDeOro" title="Pictures"></a>
					</div>
				</div>
				<div class="projectTitle" id="iponancagayandeoro">
					<div><a href="${pageContext.request.contextPath}/resources/img/sites/iponancagayandeoro/site_image.png" class="groupIponanCagayanDeOro" title="Site Image">Bgy. Iponan, Cagayan De Oro City</a></div>
					<div style="display:none">
						<a href="${pageContext.request.contextPath}/resources/img/sites/iponancagayandeoro/ct1_image.png" class="groupIponanCagayanDeOro" title="Pictures"></a>
					</div>
				</div>
		
				<div id="iligan" title="Poblacion, Iligan City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
				<div id="zamboanga" title="Campo Islam, Zamboanga City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
<%-- 				<div id="davao" title="Toril, Davao City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div> --%>
				<div id="cotabato" title="Parang, Cotabato" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
				<div id="fortichbukidnon" title="Manolo Fortich and Libona, Bukidnon" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
				<div id="langihanbutuan" title="Langihan District, Butuan City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/fortitling.png" /></a></div>
				<div id="talakagbukidnon" title="Talakag, Bukidnon City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/fortitling.png" /></a></div>
				<div id="torildavao" title="Bgy. Daliao, Toril, Davao City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/ongoing.png" /></a></div>
				<div id="bugocagayandeoro" title="Bgy. Bugo, Cagayan De Oro City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/underlease.png" /></a></div>
				<div id="puertocagayandeoro" title="Puerto, Cagayan De Oro City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/dev.png" /></a></div>
				<div id="macasandigcagayandeoro" title="Bgy. Macasandig, Cagayan De Oro City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
				<div id="iponancagayandeoro" title="Bgy. Iponan, Cagayan De Oro City" class="fixed"><a href="#" class="pin"><img src="${pageContext.request.contextPath}/resources/img/pins/leasesale.png" /></a></div>
			</div> <!-- /container -->
			
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />