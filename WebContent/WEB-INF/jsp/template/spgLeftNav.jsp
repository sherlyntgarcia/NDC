<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div>
	<ul class="nav nav-tabs nav-stacked">
		<li> <a href="<c:url value="/dashboard" />">View Dashboard</a> </li>
		<li class="dropdown-submenu">
			<a href="#" tabindex="-1" >New</a>
			<ul class="dropdown-menu">
				<li>
					<a href = "#" style="font-weight:bold">Projects for Implementation</a>
					<ul class="dropdown-submenu">
						<li><a href = "<c:url value="/external/project_ndcSchool" />">NDC School Building Program</a></li>												
					</ul>
				</li>
				<li>
					<a href = "#" style="font-weight:bold">Projects Under Evaluation</a>
					<ul class="dropdown-submenu">
						<li><a href = "<c:url value="/external/project_FCIE"/>">FCIE Expansion Project</a></li>
						<li><a href = "<c:url value="/external/project_foodExchange"/>">Davao Food Exchange Terminal</a></li>
						<li><a href = "<c:url value="/external/project_mini-hydro"/>">Mini-Hydro Projects</a></li>												
					</ul>
				</li>	
				<li>
					<a href = "#" style="font-weight:bold">Projects Identified</a>
					<ul class="dropdown-submenu">
						<li><a href = "<c:url value="/external/project_redondo"/>">Redondo Wind Power Project</a></li>	
						<li><a href = "<c:url value="/external/project_biomass"/>">Biomass Development Project</a></li>
						<li><a href = "<c:url value="/external/project_rubberProcessing"/>">Mindanao Rubber Processing Plant</a></li>													
					</ul>
				</li>											
			</ul>
		</li>
		<li class="dropdown-submenu">
		
			<a href="#" tabindex="-1" >Existing</a>
			
			<c:choose>
				<c:when test="${not empty spgCategories}">
					<ul class="dropdown-menu">
						<c:forEach var="spgCategory" items="${spgCategories}">
							<li class="dropdown-submenu">
								<a href="#" tabindex="-1" > ${spgCategory.name} </a>
								<c:choose>
									<c:when test="${not empty spgCategory.subCategories}">
										<ul class="dropdown-menu">
											<c:forEach var="subcategory" items="${spgCategory.subCategories}">
												<c:if test="${subcategory.id ne 10 and subcategory.id ne 11 and subcategory.id ne 12 and subcategory.id ne 13}">
												<li>
													<a href="<c:url value="/dashboard/internal/SPG/existing/${subcategory.id}" />">${subcategory.name}</a>
												</li>
												</c:if>
											</c:forEach>
										</ul>
									</c:when>
									
									<c:otherwise>
										<ul class="dropdown-menu">
											<li>
												<a href="#" style="color:#CCC"> No existing projects available </a>
											</li>
										</ul>
									</c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
					</ul>
				</c:when>
				
				<c:otherwise>
					<ul class="dropdown-menu">
						<li class="dropdown-submenu">
							<a href="#" style="color:#CCC"> No categories available. </a>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>

		</li>
		<li> <a href="<c:url value="/dashboard/internal/SPG/shareholders" />">Shareholders</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/SPG/upload" />">Upload File/s</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/SPG/disclosures" />">Disclosures</a> </li>
		<li class="dropdown-submenu"> 
		
			<a href="#" tabindex="-1" >Financial Performance</a>
			
			<ul class="dropdown-menu">
				<li>
					<a href = "<c:url value="/dashboard/internal/SPG/incomeStatement" />">Income Statement</a>												
				</li>
				
				<li>
					<a href = "<c:url value="/dashboard/internal/SPG/balanceSheet" />">Balance Sheet</a>												
				</li>
				
				<li>
					<a href = "<c:url value="/dashboard/internal/SPG/cashFlow" />">Cash Flow</a>												
				</li>									
			</ul>
			
		</li>
		<li> <a href="<c:url value="/external" />">Go to External Dashboard</a> </li>
	</ul>
	
</div>