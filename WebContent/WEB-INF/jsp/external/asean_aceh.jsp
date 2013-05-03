<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:import url="../template/header.jsp" />
<div class = "admin-home">

	<div class="container-fluid">
		<div class="row-fluid">
		
			<div class="span12">
				
				<div class="row-fluid">
					<div>
						<p class="lead">
							Asean Aceh Fertillizer
						</p>
						<hr>
					</div>
					<div class="span2">
						<a class="btn btn-primary" href="<c:url value="/external" />"><i class = "icon-backward icon-white"></i> External Dashboard</a>
						
						<br /> <br />
						
						<ul class="nav nav-tabs nav-stacked">
							<li><a href="${pageContext.request.contextPath}/resources/files/ABF Operational Performance.pdf">Disclosure</a></li> <!-- pdf -->
							<li><a href="${pageContext.request.contextPath}/resources/files/Financial Performance Investment.xlsx">Financial Performance</a></li> <!-- excel file -->
						</ul>
					</div>
					<div class = "span8">
						<div>
							<ul class="nav nav-tabs">
							  <li><a href="#profile" data-toggle="tab">Profile</a></li>
							  <li><a href="#share_holders" data-toggle="tab">Share Holders</a></li>
							  <li><a href="#milestone" data-toggle="tab">Milestone Alerts</a></li>
							</ul>
						</div>
						
						<div class="tab-content">
						  <div class="tab-pane active" id="profile" style = "margin-left: 5%">
						  	<p>
						  		Established on April 12, 1979 in Indonesia. A joint venture company between ASEAN countries to produce urea fertilizer and ammonia liquid as byproduct.

								Started operation in 1983 and stopped in 2003 when it failed to secure its gas supply from ExxonMobil Indonesia.
								
								On 14 January 2006, the company began the process for its liquidation after being idle for three years.
								
								The company is now under liquidation.
														  		
						  		
						  	</p>
						  </div>
						  <div class="tab-pane" id="share_holders" style = "margin-left: 5%">
						  	<table class="table table-striped">
								<tr>
									<th>Shareholders</th>
									<th>Shares</th>
									<th>Percentage</th>
								</tr>
								<tr>
									<td>Philippines</td>
									<td>28,600</td>
									<td>9.53%</td>
								</tr>
								<tr>
									<td>Malaysia</td>
									<td>212,000</td>
									<td>70.67%</td>
								</tr>
								<tr>
									<td>Indonesia</td>
									<td>28,600</td>
									<td>9.53%</td>
								</tr>
								<tr>
									<td>Thailand</td>
									<td>28,600</td>
									<td>9.53%</td>
								</tr>
								<tr>
									<td>Singapore</td>
									<td>2,200</td>
									<td>0.73%</td>
								</tr>
								<tr>
									<td><b>TOTAL</b></td>
									<td><b>300,000</b></td>
									<td><b>100.00%</b></td>
								</tr>
							</table>
						  </div>						 
						  <div class="tab-pane" id="milestone" style = "margin-left: 5%">
						  	<p>
						  		Prorata Preemptive Rights to Issuance of Unissued Common Shares and Re-Issuance of Common Treasury Shares<br/>
									<div style = "text-indent: 5%">
										<i class = 'icon-ok'></i> NDC Preemptive Right = 6.55%  of outstanding common stock (or 10,802,709 shares of the Issue Shares)<br/>
									</div>
									<div style = "text-indent: 5%">
										at an issue price of P4.85 per share or and aggregate price of P52,393,137.65
									</div>
									<br/>

								Deadline of Availment: December 21, 2012
						  		
						  	</p>
						  </div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="../template/footer.jsp" />