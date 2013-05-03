<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<div>
	<ul class="nav nav-tabs nav-stacked">
		<li> <a href="<c:url value="/dashboard/" />">View Dashboard</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/AMG/occupancy" />">Occupancy</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/AMG/maintenanceCost" />">Maintenance Cost</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/AMG/sourcesFunds" />">Sources & Uses of Funds</a>
		<li> <a href="<c:url value="/dashboard/internal/AMG/statusAssets" />">Status of Assets</a> </li>
		<li> <a href="<c:url value="/external" />">Go to External Dashboard</a> </li>
	</ul>
</div>

<security:authentication var="username" property="principal.username" />

<security:authorize access="${username eq 'vel'}">
<c:if test="${not empty realEstateCategory}">
	You have special access to:
	<div>
		<ul class="nav nav-tabs nav-stacked">
			<li class="dropdown-submenu">
				<a href="#" tabindex="-1" > ${realEstateCategory.name} </a>
				
				<c:choose>
					<c:when test="${not empty realEstateCategory.subCategories}">
						<ul class="dropdown-menu">
							<c:forEach var="sub" items="${realEstateCategory.subCategories}">
								<!-- display only limited subcategories -->
								<c:if test="${sub.id eq 10 or sub.id eq 11 or sub.id eq 12 or sub.id eq 13}">
									<li>
										<a href="<c:url value="/dashboard/internal/SPG/existing/${sub.id}" />">${sub.name}</a>
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
		</ul>
	</div>
</c:if>
</security:authorize>