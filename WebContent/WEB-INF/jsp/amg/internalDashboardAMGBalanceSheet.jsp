<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

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
					<p class="lead">Create New Visual for 'Balance Sheet'</p>
					
					<hr />
						
						<p>
							NOTE: 
							<ul>
								<li> Please enter the actual amount of value. </li>
								<li> Data will apply for the year <b><c:out value="${spgBalanceSheet.year}" /></b>. </li>
								<li> To prevent inaccurate data, do not use copy & paste feature while adding amounts. </li>
								<li>
									<p> Currency: </p>
									<ul>
										<li> ASEAN Bintulu - Malaysian Ringgit(RM) </li>
										<li> ASEAN PT Aceh Fertilizer - Indonesian Rupiah(IDR) </li>
										<li> ASEAN Potash - Thai Baht(THB) </li>
										<li> Others - Philippines Peso(PHP) </li>
									</ul>
								</li>
							</ul>
						</p>
				</div>
				
				<div class="row-fluid">
					<div class="span12">
						
						<spring:form method="POST" modelAttribute="spgBalanceSheet">
						
							<spring:errors path="*" element="div" class="alert alert-error" />
							
							<c:if test="${not empty error}">
								<div class="alert alert-error">
									${error}
								</div>
							</c:if>
							
							<c:if test="${not empty success}">
								<div class="alert alert-success">
									${success}
								</div>
							</c:if>
							
							<label>Year</label>
							<div>
								<spring:input path="year" class="span3" readonly="true" />
							</div>
							
							<label>Select an existing project</label>
							<div>
								<spring:select path="projectId" class="span4">
									<c:choose>
										<c:when test="${not empty spgSubCategories}">
											<c:forEach var="s" items="${spgSubCategories}">
												<c:if test="${s.id eq 10 or s.id eq 11 or s.id eq 12 or s.id eq 13 or s.id eq 15 or s.id eq 16}">
													<spring:option value="${s.id}">${s.name}</spring:option>
												</c:if>
											</c:forEach>
										</c:when>
										
										<c:otherwise>
											<spring:option value="">-----</spring:option>
										</c:otherwise>
									</c:choose>
								</spring:select>
							</div>
						
							<label>Total Assets</label>
							<div>
								<spring:input path="totalAssets" class="span3" placeholder="(e.g. 3000000)" constraint="number" />
							</div>
							
							<label>Total Liabilities</label>
							<div>
								<spring:input path="totalLiabilities" class="span3" placeholder="(e.g. 2500000)" constraint="number" />
							</div>
							
							<label>Debt to Assets</label>
							<div>
								<div class="input-append">
								  <spring:input class="span3" path="debtToAssets" placeholder="(e.g. 10)" constraint="number" />
								  <span class="add-on">%</span>
								</div>
							</div>
							
							<div class="form-actions">
								<button type="submit" class="btn btn-primary"><i class="icon icon-download-alt icon-white"></i> Save changes</button>
								<a href="${pageContext.request.contextPath}/dashboard/internal/AMG" class="btn">Go back</a>
							</div>
						
						</spring:form>
						
					</div>
				</div>
				
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />