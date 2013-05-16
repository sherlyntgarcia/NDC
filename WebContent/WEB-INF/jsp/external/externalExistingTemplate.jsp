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
					<div class="span12">
						<p class="lead">
							${spgSubCategory.name}
						</p>	
						<hr />
					</div>
				</div>
				
				<div class="row-fluid">
					<div class="span2">
						<a class="btn btn-primary" href="<c:url value="/external" />"><i class = "icon-backward icon-white"></i> External Dashboard</a>
						
						<br /> <br />
						
						<ul class="nav nav-tabs nav-stacked">
							<li><a href="${pageContext.request.contextPath}/external/disclosures">Disclosure</a></li> <!-- pdf -->
						</ul>
					</div>
					<div class = "span8">
						<div>
							<ul class="nav nav-tabs">
							  <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
							  <li><a href="#share_holders" data-toggle="tab">Shareholders</a></li>
							</ul>
						</div>
						
						<div class="tab-content">
						  <div class="tab-pane active" id="profile">
						  	<p>
						  		${spgSubCategory.profile}
						  	</p>
						  </div>
						  <div class="tab-pane" id="share_holders">
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
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="../template/footer.jsp" />