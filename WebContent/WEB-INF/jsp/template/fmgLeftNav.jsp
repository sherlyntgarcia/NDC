<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div>
	<ul class="nav nav-tabs nav-stacked">
		<li> <a href="<c:url value="/dashboard/internal/FMG" />">View Dashboard</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FMG/bondsIssued" />">Bonds Issued</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FMG/bondMaturity" />">Bond Maturity</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FMG/principalCouponPayments" />">Principal/Coupon Payments</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FMG/pdstFRates" />">PDST-F Rates</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FMG/economicImpact" />">Economic Impact</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FMG/niaLoanProceedsUtilization" />">NIA Loan Proceeds (Utilization)</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FMG/niaLoanProceedsAllocation" />">NIA Loan Proceeds (Allocation)</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FMG/niaLoanCollection" />">NIA Loan (Collection)</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FMG/netLending" />">Net Lending</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FMG/agriAgraBonds" />">Agri-Agra Bonds</a> </li>
		<li> <a href="<c:url value="/external" />">Go to External Dashboard</a> </li>
	</ul>
</div>