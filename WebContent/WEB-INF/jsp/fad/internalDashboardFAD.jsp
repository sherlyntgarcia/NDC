<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<security:authorize access="!hasRole('FAD_STRATEGIC_USER') and !hasRole('FAD_OPERATIONAL_USER') and !hasRole('POWER_USER')" >
	<c:redirect url="/dashboard" />
</security:authorize>

<c:import url="../template/header.jsp" />
<div class = "admin-home">
	<div class="row-fluid">
	
		<div class="span12">
			
			<div class="row-fluid">
				<div class="span12">
					<label class="label label-info" style="padding:10px;font-size:15px">Internal Dashboard (FAD)</label> 
				</div>
			</div>
			
		</div>
		
		<div class="row-fluid" style="margin-top:10px">
	
			<div class="span3">
			
				<c:import url="../template/fadLeftNav.jsp" />
			
			</div>
			
			<div class="span9">
			
				<div class="row-fluid">
					<div class="span12">
						<p class="lead">FAD Internal Dashboard</p>
						
						<hr />
						
						<p>You can click the <span class="badge badge-important">graphs</span> to update.</p>
						
					</div>
				</div>
				
					<div class="row-fluid">
						<div class="span6">
						
							<div style="margin-top:20px;margin-bottom:20px">
								<img alt="Projected Actual Income is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/FAD/projectedActualIncome'" src="${pageContext.request.contextPath}/visualization/projectedactualincomechart/450/400" />
						
								<div class="form-inline" align = "center">
									<button id="projectedActualIncomeExpenseChart" type="button" class="btn btn-primary">View Income</button>
								</div>
							</div>
							
							<div style="margin-top:20px;margin-bottom:20px">
								<img alt="Actual Income Expense is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/FAD/actualIncomeExpense'" src="${pageContext.request.contextPath}/visualization/actualincomeexpensechart/450/400" /> 
							
								<br />
							
								<c:choose>
									<c:when test="${not empty expenses}">
										<div class="form-inline" style="margin-top:10px">
											<select name="months" title="This will only display the list of data available on the graph above">
												<c:forEach var="expense" items="${expenses}">
													<c:if test="${not empty expense}">
														<c:set var="month" value="${expense.month}" />
														<c:choose>
															<c:when test="${month eq 0}">
																<c:set var="mo" value="January" />
															</c:when>
															<c:when test="${month eq 1}">
																<c:set var="mo" value="February" />
															</c:when>
															<c:when test="${month eq 2}">
																<c:set var="mo" value="March" />
															</c:when>
															<c:when test="${month eq 3}">
																<c:set var="mo" value="April" />
															</c:when>
															<c:when test="${month eq 4}">
																<c:set var="mo" value="May" />
															</c:when>
															<c:when test="${month eq 5}">
																<c:set var="mo" value="June" />
															</c:when>
															<c:when test="${month eq 6}">
																<c:set var="mo" value="July" />
															</c:when>
															<c:when test="${month eq 7}">
																<c:set var="mo" value="August" />
															</c:when>
															<c:when test="${month eq 8}">
																<c:set var="mo" value="September" />
															</c:when>
															<c:when test="${month eq 9}">
																<c:set var="mo" value="October" />
															</c:when>
															<c:when test="${month eq 10}">
																<c:set var="mo" value="November" />
															</c:when>
															<c:when test="${month eq 11}">
																<c:set var="mo" value="December" />
															</c:when>
															<c:otherwise>
																<c:set var="mo" value="[Error]" />
															</c:otherwise>
														</c:choose>
														<option title="${mo}" value="${expense.id}">${mo} ${expense.year}</option>
													</c:if>
												</c:forEach>
											</select>
											
											<button id="viewExpenses" type="submit" class="btn btn-primary">View Expenses</button>
										</div>
									</c:when>
									
								</c:choose>
							
							</div>
							
						</div>
						
						<div class="span6">
							
							<div style="margin-top:20px;margin-bottom:20px">
								<img alt="Collection Efficiency is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/FAD/collectionEfficiency'" src="${pageContext.request.contextPath}/visualization/collectionefficiencychart/450/400" />
							</div>
							
							<div style="margin-top:20px;margin-bottom:20px">
								<img alt="Budget Utilization is not available" src="${pageContext.request.contextPath}/visualization/budgetutilizationchart/450/400" />
				
								<c:choose>
									<c:when test="${not empty budgetUtilization}">
										<c:set var="budgetMinusActualPS" value="${budgetUtilization.budgetPersonalServices - budgetUtilization.actualPersonalServices}" />
										<c:set var="budgetMinusActualMOOE" value="${budgetUtilization.budgetMooe - budgetUtilization.actualMooe}" />
										<c:set var="budgetMinusActualCE" value="${budgetUtilization.budgetCapitalExpenditures - budgetUtilization.actualCapitalExpenditures}" />
										
										<table class="table table-bordered" style="margin-top:10px">
											<tr>
												<th style="width:200px">Personal Services</th>
												<th style="width:200px">Mooe</th>
												<th style="width:200px">Capital Expenditures</th>
											</tr>
											<tr>
												<th>
													<c:choose>
														<c:when test="${budgetMinusActualPS < 0}">
															<img width="30px" height=30px" class="personalServices" title="Personal Services" src="<c:url value="/resources/img/sad_face.png" />" />
														</c:when>
														
														<c:when test="${budgetMinusActualPS eq 0}">
															<img width="30px" height="30px" class="personalServices" title="Personal Services" src="<c:url value="/resources/img/straight_face.png" />" />
														</c:when>
														
														<c:otherwise>
															<img width="30px" height="30px" class="personalServices" title="Personal Services" src="<c:url value="/resources/img/happy_face.png" />" />
														</c:otherwise>
													</c:choose>
												</th>
												<th>
													<c:choose>
														<c:when test="${budgetMinusActualMOOE < 0}">
															<img width="30px" height="30px" class="mooe" title="MOOE" src="<c:url value="/resources/img/sad_face.png" />" />
														</c:when>
														
														<c:when test="${budgetMinusActualMOOE eq 0}">
															<img width="30px" height="30px" class="mooe" title="MOOE" src="<c:url value="/resources/img/straight_face.png" />" />
														</c:when>
														
														<c:otherwise>
															<img width="30px" height="30px" class="mooe" title="MOOE" src="<c:url value="/resources/img/happy_face.png" />" />
														</c:otherwise>
													</c:choose>
												</th>
												<th>
													<c:choose>
														<c:when test="${budgetMinusActualCE < 0}">
															<img width="30px" height="30px" class="capitalExpenditures" title="Capital Expenditures" src="<c:url value="/resources/img/sad_face.png" />" />
														</c:when>
														
														<c:when test="${budgetMinusActualCE eq 0}">
															<img width="30px" height="30px" class="capitalExpenditures" title="Capital Expenditures" src="<c:url value="/resources/img/straight_face.png" />" />
														</c:when>
														
														<c:otherwise>
															<img width="30px" height="30px" class="capitalExpenditures" title="Capital Expenditures" src="<c:url value="/resources/img/happy_face.png" />" />
														</c:otherwise>
													</c:choose>
												</th>
											</tr>
										</table>
									</c:when>
									
								</c:choose>
								
							</div>
							
						</div>
					</div>
			</div>
		
		</div>
	
	</div>
</div>

<c:import url="../template/footer.jsp" />