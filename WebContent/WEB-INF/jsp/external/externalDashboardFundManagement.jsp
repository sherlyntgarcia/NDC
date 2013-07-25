<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:import url="../template/header.jsp" />
<div class = "admin-home">

	<div class="container-fluid">
	
		<div class="row-fluid" style="margin-bottom:20px">
			<div class="span12">
				<div class="pull-right">
					
				</div>

				  <h1>Fund Management</h1>
				  <a class="btn btn-primary btn-medium" href="<c:url value="/external" />"><i class="icon icon-backward icon-white"></i> Back to External</a>
	
			</div>
		</div>
		<div class="row">
	        <div class="span6" id="carousel-bounding-box">
	                <div id="myCarousel" class="carousel slide">
                        <!-- Carousel items -->
                        <div class="carousel-inner">
						<div class = "active item" align = "center"><img src="${pageContext.request.contextPath}/visualization/bondsissuedbarchart/400/400" onerror="$(this).attr('src','${pageContext.request.contextPath}/resources/img/err.png');" /></div>
						<div class = "item" align = "center"><img src="${pageContext.request.contextPath}/visualization/bondmaturitybarchart/400/400" onerror="$(this).attr('src','${pageContext.request.contextPath}/resources/img/err.png');" /></div>
						<div class = "item" align = "center"><img src="${pageContext.request.contextPath}/visualization/economicimpactcategoryplot/400/400" onerror="$(this).attr('src','${pageContext.request.contextPath}/resources/img/err.png');" /></div>
						<div class = "item" align = "center"><img src="${pageContext.request.contextPath}/visualization/principalcouponpaymentsbarchart/400/400" onerror="$(this).attr('src','${pageContext.request.contextPath}/resources/img/err.png');" /></div>
						<div class = "item" align = "center"><img src="${pageContext.request.contextPath}/visualization/nialoancollectionbarchart/400/400" /></div>
						<div class = "item" align = "center"><img src="${pageContext.request.contextPath}/visualization/netlendingbarchart/400/400" onerror="$(this).attr('src','${pageContext.request.contextPath}/resources/img/err.png');" /></div>
					</div>
					
					<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
				  	<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>		
			
			</div>
			
			<div class="span6">
		        <!-- Bottom switcher of slider -->
		                <ul class="thumbnails">
		                        <li class="span2">
		                                <a class="thumbnail" id="carousel-selector-0">
		                                        <img src="${pageContext.request.contextPath}/visualization/bondsissuedbarchart/650/350" onerror="$(this).attr('src','${pageContext.request.contextPath}/resources/img/err.png');" class = "thumb" />
		                                </a>
		                        </li>
		                        <li class="span2">
		                                <a class="thumbnail" id="carousel-selector-1">
		                                        <img src="${pageContext.request.contextPath}/visualization/bondmaturitybarchart/650/350" onerror="$(this).attr('src','${pageContext.request.contextPath}/resources/img/err.png');" class = "thumb" />
		                                </a>
		                        </li>
		                        <li class="span2">
		                                <a class="thumbnail" id="carousel-selector-3">
		                                        <img src="${pageContext.request.contextPath}/visualization/economicimpactcategoryplot/650/350" onerror="$(this).attr('src','${pageContext.request.contextPath}/resources/img/err.png');" class = "thumb" />
		                                </a>
		                        </li>
		                        <li class="span2">
		                                <a class="thumbnail" id="carousel-selector-4">
		                                        <img src="${pageContext.request.contextPath}/visualization/principalcouponpaymentsbarchart/650/350" onerror="$(this).attr('src','${pageContext.request.contextPath}/resources/img/err.png');" class = "thumb" />
		                                </a>
		                        </li>
		                        <li class="span2">
		                                <a class="thumbnail" id="carousel-selector-5">
		                                        <img src="${pageContext.request.contextPath}/visualization/nialoancollectionbarchart/650/350" onerror="$(this).attr('src','${pageContext.request.contextPath}/resources/img/err.png');" class = "thumb" />
		                                </a>
		                        </li>
		                        <li class="span2">
		                                <a class="thumbnail" id="carousel-selector-6">
		                                        <img src="${pageContext.request.contextPath}/visualization/netlendingbarchart/650/350" onerror="$(this).attr('src','${pageContext.request.contextPath}/resources/img/err.png');" class = "thumb" />
		                                </a>
		                        </li>
		                </ul>
		        </div>
		</div>
		
		<div class="row-fluid">
			<div class="span6">
				<div id="loanProceedsAllocationPieChartDiv"></div>
				<script>
					$(document).ready(function() {
						var url = "${pageContext.request.contextPath}/visualization/loanproceedsallocationpiechart";
									
						createLoanProceedsAllocationPieChart(url, 550, 400);
					});
				</script>
			</div>
			
			<div class="span6">
				<div id="agriAgraBondsPieChartDiv"></div>
				<script>
					$(document).ready(function() {
						var url = "${pageContext.request.contextPath}/visualization/agriagrabondspiechart";
									
						createAgriAgraBondsPieChart(url, 550, 400);
					});
				</script>
			</div>
		</div>
		
		<div class="row-fluid">
			<div class="span12">
				<div id="loanProceedsUtilizationPieChartDiv"></div>
				<script>
					$(document).ready(function() {
						var url = "${pageContext.request.contextPath}/visualization/loanproceedsutilizationpiechart";
									
						createLoanProceedsUtilizationPieChart(url, 550, 400);
					});
				</script>
			</div>
		</div>
	</div>
</div>


<c:import url="../template/footer.jsp" />