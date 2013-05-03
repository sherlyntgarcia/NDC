<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>

<security:authorize
	access="!hasRole('FAD_STRATEGIC_USER') and !hasRole('FAD_OPERATIONAL_USER') and !hasRole('POWER_USER')">
	<c:redirect url="/dashboard" />
</security:authorize>

<c:import url="../template/header.jsp" />
<div class="admin-home">
	<div class="row-fluid">

		<div class="span12">

			<div class="row-fluid">
				<div class="span12">
					<label class="label label-info"
						style="padding: 10px; font-size: 15px">Internal Dashboard
						(FAD)</label>
				</div>
			</div>

		</div>

		<div class="row-fluid" style="margin-top: 10px">

			<div class="span3">

				<c:import url="../template/fadLeftNav.jsp" />

			</div>

			<div class="span9">

				<div class="row-fluid">
					<div class="span12">
						<p class="lead">Create New Visual for 'Projected/Actual
							Income'
						</p>
						
						<hr />
						
						<p>
							NOTE: 
							<ul>
								<li> Please enter the actual amount of value. </li>
								<li> To prevent inaccurate data, do not use copy & paste feature while adding amounts. </li>
								<li> You can update your projected income for the year. Click <a data-toggle="modal" href="#projectedIncomeModal">here</a>! </li>
							</ul>
						</p>
					</div>
				</div>
				
				<spring:form modelAttribute="projectedActualIncome" method="POST">
				
					<div class="row-fluid">
						<div class="span12">
							<spring:errors path="*" element="div" class="alert alert-error" />
	
								<c:if test="${not empty success}">
									<div class="alert alert-success">${success}</div>
								</c:if>
	
								<c:if test="${not empty error}">
									<div class="alert alert-error">${error}</div>
								</c:if>
						</div>
					</div>

					<div class="row-fluid" style="margin-top:10px">
						<div class="span6">
							
							<label>Actual Income</label>
							<div>
								<spring:input path="actualIncome" class="span6"
									constraint="number" placeholder="(e.g. 275000)" readonly="true" />
							</div>

							<label>Actual Dividend</label>
							<div>
								<spring:input path="actualDividend" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>

							<label>Actual Interest</label>
							<div>
								<spring:input path="actualInterest" class="span6"
									constraint="number" placeholder="(e.g. 180000)" />
							</div>
							
							<label>Actual Rental</label>
							<div>
								<spring:input path="actualRental" class="span6"
									constraint="number" placeholder="(e.g. 190000)" />
							</div>

							<label>Actual Gain on Sale</label>
							<div>
								<spring:input path="actualGainOnSale" class="span6"
									constraint="number" placeholder="(e.g. 250000)" />
							</div>
							
							<label>Other Income (Actual)</label>
							<div>
								<spring:input path="actualOtherIncome" class="span6"
									constraint="number" placeholder="(e.g. 30000)" />
							</div>
							
						</div>

						<!-- Column Separator -->

						<div class="span6" style="margin-top:20px;margin-left:-30px">

							<c:choose>
								<c:when test="${not empty projectedActualIncome2}">
								
									<table class="table table-striped table-bordered">
										<caption style="font-weight:bold;font-size:20px">PROJECTED INCOME</caption>
										<tr>
											<th>Particulars</th>
											<th>Amount</th>
										</tr>
										
										<tr>
											<td style="text-align:left">Projected Income</td>
											<td style="text-align:right">Php <fmt:formatNumber value="${projectedActualIncome2.projectedIncome}" /></td>
										</tr>
										
										<tr>
											<td style="text-align:left">Projected Dividend</td>
											<td style="text-align:right">Php <fmt:formatNumber value="${projectedActualIncome2.projectedDividend}" /></td>
										</tr>
										
										<tr>
											<td style="text-align:left">Projected Interest</td>
											<td style="text-align:right">Php <fmt:formatNumber value="${projectedActualIncome2.projectedInterest}" /></td>
										</tr>
										
										<tr>
											<td style="text-align:left">Projected Rental</td>
											<td style="text-align:right">Php <fmt:formatNumber value="${projectedActualIncome2.projectedRental}" /></td>
										</tr>
										
										<tr>
											<td style="text-align:left">Projected Gain on Sale</td>
											<td style="text-align:right">Php <fmt:formatNumber value="${projectedActualIncome2.projectedGainOnSale}" /></td>
										</tr>
										
										<tr>
											<td style="text-align:left">Other Income (Projected)</td>
											<td style="text-align:right">Php <fmt:formatNumber value="${projectedActualIncome2.projectedOtherIncome}" /></td>
										</tr>
									</table>
								
								</c:when>
								
								<c:otherwise>
									<div class="alert alert-error">
										No projected income is set!
									</div>
								</c:otherwise>
							</c:choose>
							
						</div>
					</div>
					
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Save
							changes</button>
						<a class="btn"
							href="${pageContext.request.contextPath}/dashboard/internal/FAD">Go
							back</a>
					</div>
				</spring:form>

			</div>


		</div>

	</div>

</div>

<!-- Projected Income MODAL -->
<div id="projectedIncomeModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="projectedIncomeModal" aria-hidden="true">
			
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="projectedIncomeLabel"> Set your Projected Income </h3>
	</div>
			
	<spring:form modelAttribute="newProjectedActualIncome" method="POST" action="${pageContext.request.contextPath}/dashboard/internal/FAD/projectedActualIncome2">
			
		<div class="modal-body">
			
			<p>
				NOTE:
				<ul>
					<li> This is updated on a yearly basis. </li>
					<li> To prevent inaccurate data, do not use copy & paste feature while adding amounts. </li>
				</ul>
			</p>
					
			<label>Projected Income</label>
			<div>
				<spring:input id="projectedIncome" path="projectedIncome" constraint="number" readonly="true" class="span3" placeholder="Projected Income..." />
			</div>
					
			<label>Projected Dividend</label>
			<div>
				<spring:input id="projectedDividend" path="projectedDividend" constraint="number" class="span3" placeholder="Projected Dividend..." />
			</div>
					
			<label>Projected Interest</label>
			<div>
				<spring:input id="projectedInterest" path="projectedInterest" constraint="number" class="span3" placeholder="Projected Interest..." />
			</div>
					
			<label>Projected Rental</label>
			<div>
				<spring:input id="projectedRental" path="projectedRental" constraint="number" class="span3" placeholder="Projected Rental..." />
			</div>
					
			<label>Projected Gain on Sale</label>
			<div>
				<spring:input id="projectedGainOnSale" path="projectedGainOnSale" constraint="number" class="span3" placeholder="Projected Gain on Sale..." />
			</div>
					
			<label>Other Income (Projected)</label>
			<div>
				<spring:input id="projectedOtherIncome" path="projectedOtherIncome" constraint="number" class="span3" placeholder="Other Income (Projected)..." />
			</div>
					
	</div>
				
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary">Save Changes</button>
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	</div>
			
	</spring:form>
			
</div>

<c:import url="../template/footer.jsp" />