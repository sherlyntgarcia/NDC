<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
							<div class="span6">
								<img alt="Maintenance Cost is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/maintenanceCost'" src="${pageContext.request.contextPath}/visualization/maintenancecostlinechart/450/400" />
							</div>
							
							<div class="span6">
								<img alt="Status Assets is not available" onclick="window.location.href='${pageContext.request.contextPath}/dashboard/internal/AMG/statusAssets'" src="${pageContext.request.contextPath}/visualization/statusassetsbarchart/450/400" />
							</div>
						</div>