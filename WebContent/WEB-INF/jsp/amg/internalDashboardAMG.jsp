<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<security:authorize access="!hasRole('AMG_STRATEGIC_USER') and !hasRole('AMG_OPERATIONAL_USER') and !hasRole('POWER_USER')" >
	<c:redirect url="/dashboard" />
</security:authorize>

<c:import url="../template/header.jsp" />
<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			
			<div class="row-fluid">
				<div class="span12">
					<label class="label label-info" style="padding:10px;font-size:15px">Internal Dashboard (AMG)</label> 
				</div>
			</div>
			
		</div>
		
		<div class="row-fluid" style="margin-top:10px">
	
			<div class="span3">
			
				<c:import url="../template/amgLeftNav.jsp" />
			
			</div>
			
			<div class="span9">
				
				<div class="row-fluid">
					<div class="span12">
						<p class="lead">AMG Internal Dashboard</p>
						<ul class="nav nav-tabs">
						  <li class="active"><a href="#amgTab1" data-toggle="tab"> Philippine Map </a></li>
						  <li><a href="#amgTab2" data-toggle="tab"> Dashboard </a></li>
						  <li><a href="#amgTab3" data-toggle="tab"> Guidelines/Policies of Disposal/Lease </a></li>
						</ul>
					</div>
				</div>
				
				<div class="tab-content">
				
					<div class="tab-pane active" id="amgTab1">
						
						<div class="row-fluid">
							<div class="span12">
								<div class="span5">
									<div style="margin-top: 20px">
										<p class="lead">Legends</p>
										<span class="label label-important">Note:</span> You can click the legend to go that specific region.
										<hr />
										<ul class="unstyled">
											<li>
												<img onclick="window.location.href='${pageContext.request.contextPath}/external/luzon'" style="width:100px;height:70px" src="${pageContext.request.contextPath}/resources/img/luzon_legend.png" />
												- <span style="font-weight: bold">Luzon</span></li>
											<li>
												<img onclick="window.location.href='${pageContext.request.contextPath}/external/visayas'" style="width:100px;height:70px" src="${pageContext.request.contextPath}/resources/img/visayas_legend.png" />
												- <span style="font-weight: bold">Visayas</span></li>
											<li>
												<img onclick="window.location.href='${pageContext.request.contextPath}/external/mindanao'" style="width:100px;height:70px" src="${pageContext.request.contextPath}/resources/img/mindanao_legend.png" />
												- <span style="font-weight: bold">Mindanao</span></li>
										</ul>
									</div>
								</div>
								
								<div class="span7">
									<img
										src="${pageContext.request.contextPath}/resources/img/maps/whole_map_main.png"
										usemap="#pinas" border="0" style="width: 450px; height: 600px"
										alt="" />
									<map name="pinas">
										<area shape="poly"
											coords="4,444,27,426,50,391,51,376,68,364,84,349,83,324,82,306,91,299,101,295,109,270,121,266,148,292,153,275,167,275,191,249,211,258,219,297,231,287,258,284,248,255,268,248,266,217,256,202,267,179,258,152,225,175,215,166,187,168,175,177,147,156,141,140,167,96,168,62,163,16,154,3,102,2,94,25,76,84,73,109,85,157,70,190,84,223,85,257,68,293,56,311,30,371,2,422,1,438,"
											href="<c:url value = "/external/luzon"/>" alt="" title="Luzon" />
										<area shape="poly"
											coords="290,243,261,249,268,276,251,295,205,303,142,299,138,311,140,352,146,368,167,362,170,393,190,427,221,426,260,398,271,366,294,362,303,353,314,308,306,266,"
											href="<c:url value = "/external/visayas"/>" alt=""
											title="Visayas" />
										<area shape="poly"
											coords="331,342,312,380,299,411,276,412,269,446,247,457,234,441,206,438,191,460,167,485,153,549,135,581,159,597,171,567,183,554,181,520,203,521,230,515,242,498,255,505,246,530,253,550,312,574,329,544,338,545,344,508,355,486,349,416,343,371,"
											href="<c:url value = "/external/mindanao"/>" alt=""
											title="Mindanao" />
		
										<!-- <area shape="poly" coords="6,484,35,468,67,430,65,413,88,401,86,392,110,381,107,338,127,323,132,301,173,312,185,322,195,301,211,303,234,273,266,283,275,328,289,310,321,317,314,278,334,271,333,241,326,226,324,210,336,198,326,173,311,177,308,196,283,195,271,182,254,192,238,185,207,168,188,166,180,155,191,126,214,111,215,81,211,63,201,49,210,26,197,8,186,14,175,15,174,7,154,2,147,7,127,4,116,33,116,99,103,93,91,122,107,175,130,198,139,225,168,239,169,254,125,282,110,280,109,311,91,322,76,339,78,361,68,366,42,404,41,418,3,470," href="<c:url value = "/external/luzon"/>" alt="" title="Luzon"   />
										<area shape="poly" coords="393,343,377,307,385,301,366,268,341,274,324,274,330,300,331,323,312,322,292,343,257,331,240,340,232,336,182,327,171,335,183,345,171,379,179,400,208,391,217,401,232,404,219,415,211,432,240,465,258,459,276,463,278,447,286,442,300,447,322,436,322,413,300,385,326,375,349,394,364,396,377,388,373,375,378,364,362,348,371,344," href="<c:url value = "/external/visayas"/>"  alt="" title="Visayas"   />
										<area shape="poly" coords="413,372,388,407,385,438,365,450,346,442,345,482,313,494,294,474,265,472,245,498,212,532,197,596,178,627,199,640,230,601,232,563,243,550,254,564,292,556,294,541,314,530,324,535,313,568,320,589,391,622,413,587,429,584,429,555,447,512,434,442,431,400," href="<c:url value = "/external/mindanao"/>" alt="" title="Mindanao"   /> -->
									</map>
								</div>
							</div>
						</div>
						
					</div>
					
					<div class="tab-pane" id="amgTab2">
				
						<hr />
							<p>You can click the <span class="badge badge-important">graphs</span> to update.</p>
						<hr />
				
						<div class="row-fluid">
							<div class="span12">
								<div id="occupancyPieChartDiv"></div>
						
								<script>
									$(document).ready(function() {
										var url = "${pageContext.request.contextPath}/visualization/occupancypiechart";
										
										createOccupancyPieChart(url, 850, 400);
									});
								</script>
							</div>
							
							
						</div>
				
						<div class="row-fluid">
<!-- 							<div class="span6"> -->
<%-- 								<img alt="Sources Funds is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/sourcesFunds'" src="${pageContext.request.contextPath}/visualization/sourcesfundsbarchart/450/400" /> --%>
<!-- 							</div> -->
							<div class="span6">
								<img alt="Maintenance Cost is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/maintenanceCost'" src="${pageContext.request.contextPath}/visualization/maintenancecostlinechart/450/400" />
							</div>
							
							<div class="span6">
								<img alt="Status Assets is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/statusAssets'" src="${pageContext.request.contextPath}/visualization/statusassetsbarchart/450/400" />
							</div>
						</div>
					
					</div>
					
					<div class="tab-pane" id="amgTab3">
						None
					</div>
					
				</div>
				
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />