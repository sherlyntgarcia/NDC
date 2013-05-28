<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

<div class="row-fluid">
					<div class="span6">
						<img alt="Bonds Issued is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/FMG/bondsIssued'" src="${pageContext.request.contextPath}/visualization/bondsissuedbarchart/450/400" />
					</div>
					
					<div class="span6">
						<img alt="Bond Maturity is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/FMG/bondMaturity'" src="${pageContext.request.contextPath}/visualization/bondmaturitybarchart/450/400" />
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span6">
						<img alt="Economic Impact is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/FMG/economicImpact'" src="${pageContext.request.contextPath}/visualization/economicimpactcategoryplot/450/400" />
					</div>
					
					<div class="span6">
						<img alt="Principal & Coupon Payments is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/FMG/principalCouponPayments'" src="${pageContext.request.contextPath}/visualization/principalcouponpaymentsbarchart/450/400" />
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span6">
						<img alt="Nia Loan Collection is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/FMG/niaLoanCollection'" src="${pageContext.request.contextPath}/visualization/nialoancollectionbarchart/450/400" />
					</div>
					
					<div class="span6">
						<img alt="Net Lending is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/FMG/netLending'" src="${pageContext.request.contextPath}/visualization/netlendingbarchart/450/400" />
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span10 offset2">
						<img alt="PDST-F Rates is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/FMG/pdstFRates'" src="${pageContext.request.contextPath}/visualization/pdstfrateschart/550/400" />
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span10 offset2">
						<div id="agriAgraBondsPieChartDiv" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/FMG/agriAgraBonds'"></div>
						
						<script>
							$(document).ready(function() {
								var url = "${pageContext.request.contextPath}/visualization/agriagrabondspiechart";
								
								createAgriAgraBondsPieChart(url, 600, 400);
							});
						</script>
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span10 offset2">
						<div id="loanProceedsAllocationPieChartDiv"></div>
						
						<script>
							$(document).ready(function() {
								var url = "${pageContext.request.contextPath}/visualization/loanproceedsallocationpiechart";
								
								createLoanProceedsAllocationPieChart(url, 600, 400);
							});
						</script>
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span10 offset2">
						<div id="loanProceedsUtilizationPieChartDiv"></div>
						
						<script>
							$(document).ready(function() {
								var url = "${pageContext.request.contextPath}/visualization/loanproceedsutilizationpiechart";
								
								createLoanProceedsUtilizationPieChart(url, 600, 400);
							});
						</script>
					</div>
				</div>