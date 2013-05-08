<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div>
	<ul class="nav nav-tabs nav-stacked">
		<li> <a href="<c:url value="/dashboard/internal/FAD" />">View Dashboard</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FAD/balanceSheet" />">Balance Sheet</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FAD/incomeStatement" />">Income Statement</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FAD/projectedActualIncome" />">Income: Actual vs Budget</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FAD/actualIncomeExpense" />">Expense: Actual vs Budget</a> </li>
		<li> <a href="<c:url value="/dashboard/internal/FAD/collectionEfficiency" />">Collection Efficiency</a> </li>
		<li class="dropdown-submenu"> 
			<a href="#">Budget Utilization</a>
			<ul class="dropdown-menu">
		      <li><a href = "<c:url value = "/dashboard/internal/FAD/buPersonalServices"/>">Personal Services</a></li>
		      <li><a href = "<c:url value = "/dashboard/internal/FAD/buMooe"/>">Maintenance and Other Operating Expenses</a></li>
		      <li><a href = "<c:url value = "/dashboard/internal/FAD/buCapitalExpenditures"/>">Capital Expenditures</a></li>
		    </ul>	
		</li>
		<li> <a href="${pageContext.request.contextPath}/resources/files/Template T3132.xlsx">Reports</a> </li>
		<li> <a href="<c:url value="/external" />">Go to External Dashboard</a> </li>
	</ul>
</div>