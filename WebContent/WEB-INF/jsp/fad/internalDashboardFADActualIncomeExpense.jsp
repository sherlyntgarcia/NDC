
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
						<p class="lead">Create New Visual for 'Actual Income Vs Expense'</p>
						
						<hr />
						
						<p>
							NOTE: 
							<ul>
								<li> Please enter the actual amount of value. </li>
								<li> To prevent inaccurate data, do not use copy & paste feature while adding amounts. </li>
							</ul>
						</p>
					</div>
				</div>
				<spring:form modelAttribute="actualIncomeExpense" method="POST">
				
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

					<div class="row-fluid">

						<div class="span6">

							<label>Year</label>
							<div>
								<spring:input path="year" readonly="true" class="span6"
									constraint="number" placeholder="Year..." />
							</div>

							<label>Month</label>
							<div>
								<spring:select items="${months}" path="month" class="span6"
									constraint="number" placeholder="Month..." />
							</div>
							
						</div>
						
					</div>
					
					<hr />
					
					<div class="row-fluid">
					
						<div class="span6">
						
							<p class="lead"> Budget </p>
							<hr />

							<label>Budget Advertising</label>
							<div>
								<spring:input path="budgetAdvertising" class="span6"
									constraint="number" placeholder="(e.g. 250000)" />
							</div>

							<label>Budget Athletics</label>
							<div>
								<spring:input path="budgetAthletics" class="span6"
									constraint="number" placeholder="(e.g. 300000)" />
							</div>

							<label>Budget Auditing</label>
							<div>
								<spring:input path="budgetAuditing" class="span6"
									constraint="number" placeholder="(e.g. 200000)" />
							</div>

							<label>Budget Consultancy</label>
							<div>
								<spring:input path="budgetConsultancy" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Board Expenses</label>
							<div>
								<spring:input path="budgetBoardExpenses" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Christmas and Anniversary</label>
							<div>
								<spring:input path="budgetChristmasAnniversary" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Communication Service</label>
							<div>
								<spring:input path="budgetCommunicationService" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Extraordinary and Miscellaneous Expense</label>
							<div>
								<spring:input path="budgetExtraordinary" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Janitorial Services</label>
							<div>
								<spring:input path="budgetJanitorial" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Legal Services</label>
							<div>
								<spring:input path="budgetLegal" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Light and Water</label>
							<div>
								<spring:input path="budgetLightWater" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Meetings/Planning and Conference</label>
							<div>
								<spring:input path="budgetMeetings" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Membership Dues and Contributions to Organizations</label>
							<div>
								<spring:input path="budgetMemberships" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Messengerial Services</label>
							<div>
								<spring:input path="budgetMessengerial" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Miscellaneous Other Services</label>
							<div>
								<spring:input path="budgetMisc" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Other Miscellaneous Expense</label>
							<div>
								<spring:input path="budgetOtherMisc" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Rentals and Storage Fees</label>
							<div>
								<spring:input path="budgetRentals" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Repair and Maintenance of Facilities</label>
							<div>
								<spring:input path="budgetRepairFacilities" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Repair and Maintenance of Vehicles</label>
							<div>
								<spring:input path="budgetRepairVehicles" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Security Services</label>
							<div>
								<spring:input path="budgetSecurity" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Subscription</label>
							<div>
								<spring:input path="budgetSubscription" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Supplies and Materials</label>
							<div>
								<spring:input path="budgetSuppliesMaterials" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Taxes, Insurance and Other Fees</label>
							<div>
								<spring:input path="budgetTaxes" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Training and Personnel Development</label>
							<div>
								<spring:input path="budgetTraining" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>
							
							<label>Budget Travelling Expenses</label>
							<div>
								<spring:input path="budgetTravelling" class="span6"
									constraint="number" placeholder="(e.g. 150000)" />
							</div>

							<label>Total Budget</label>
							<div>
								<spring:input readonly="true" path="totalExpense" class="span6"
									constraint="number" />
							</div>
						</div>
						<!-- Column Separator -->

						<div class="span6">

							<p class="lead"> Actual </p>
							<hr />

							<label>Actual Advertising</label>
							<div>
								<spring:input path="actualAdvertising" class="span6"
									constraint="number" placeholder="(e.g. 300000)" />
							</div>

							<label>Actual Athletics</label>
							<div>
								<spring:input path="actualAthletics" class="span6"
									constraint="number" placeholder="(e.g. 200000)" />
							</div>

							<label>Actual Auditing</label>
							<div>
								<spring:input path="actualAuditing" class="span6"
									constraint="number" placeholder="(e.g. 75000)" />
							</div>

							<label>Actual Consultancy</label>
							<div>
								<spring:input path="actualConsultancy" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Board Expenses</label>
							<div>
								<spring:input path="actualBoardExpenses" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Christmas and Anniversary</label>
							<div>
								<spring:input path="actualChristmasAnniversary" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Communication Service</label>
							<div>
								<spring:input path="actualCommunicationService" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Extraordinary and Miscellaneous Expense</label>
							<div>
								<spring:input path="actualExtraordinary" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Janitorial Services</label>
							<div>
								<spring:input path="actualJanitorial" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Legal Services</label>
							<div>
								<spring:input path="actualLegal" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Light and Water</label>
							<div>
								<spring:input path="actualLightWater" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Meetings/Planning and Conference</label>
							<div>
								<spring:input path="actualMeetings" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Membership Dues and Contributions to Organizations</label>
							<div>
								<spring:input path="actualMemberships" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Messengerial Services</label>
							<div>
								<spring:input path="actualMessengerial" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Miscellaneous Other Services</label>
							<div>
								<spring:input path="actualMisc" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Other Miscellaneous Expense</label>
							<div>
								<spring:input path="actualOtherMisc" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Rentals and Storage Fees</label>
							<div>
								<spring:input path="actualRentals" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Repair and Maintenance of Facilities</label>
							<div>
								<spring:input path="actualRepairFacilities" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Repair and Maintenance of Vehicles</label>
							<div>
								<spring:input path="actualRepairVehicles" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Security Services</label>
							<div>
								<spring:input path="actualSecurity" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Subscription</label>
							<div>
								<spring:input path="actualSubscription" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Supplies and Materials</label>
							<div>
								<spring:input path="actualSuppliesMaterials" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Taxes, Insurance and Other Fees</label>
							<div>
								<spring:input path="actualTaxes" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Training and Personnel Development</label>
							<div>
								<spring:input path="actualTraining" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>
							
							<label>Actual Travelling Expenses</label>
							<div>
								<spring:input path="actualTravelling" class="span6"
									constraint="number" placeholder="(e.g. 80000)" />
							</div>

							<label>Total Actual</label>
							<div>
								<spring:input readonly="true" path="totalIncome" class="span6"
									constraint="number" />
							</div>
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

<c:import url="../template/footer.jsp" />
