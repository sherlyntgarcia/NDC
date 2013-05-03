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
							FCIE Expansion Project
						</p>
						<hr>
					</div>
					<div class = "span2">
						<a class="btn btn-primary" href="<c:url value="/external" />"><i class = "icon-backward icon-white"></i> External Dashboard</a>
					</div>
					<div class = "span8">				
						<div>
							<ul class="nav nav-tabs">
							  <li class="active"><a href="#description" data-toggle="tab">Project Description</a></li>					  							  
							  <li><a href="#contact" data-toggle="tab">Account Officer / Contact Person</a></li>
							</ul>
						</div>
						
						<div class="tab-content">
						  <div class="tab-pane active" id="description" style = "margin-left: 5%">
						  		<p>
						  			The project involves the development of the NDC-owned 19.17 hectares<br/>
						  			property located in Lankaan II, Dasmari&ntilde;as, Cavite into an industrial<br/> 
						  			economic zone as expansion of the First Cavite Industrial Estate (FCIE).  
						  		</p>
						  	<ul class = 'list-style'>
									<li>Target Beneficiaries</li>
										<ul>
											<li>Local and foreign manufacturers, local workers</li>
										</ul>
									<li>Project Budget</li>
										<ul>
											<li>P550 Million including value of land</li>
										</ul>
									<li>NDC's Participation</li>
											<ul>
												<li>NDC property as equity</li>
											</ul>
									<li>Project Timeline</li>
											<ul>
												<li>Not yet established</li>
											</ul>	
									<li>Project Status</li>
											<ul>
												<li>The project is now under evaluation. The implementation<br/> 
													framework has been presented to the Management Committee <br/>
													on Nov. 9, 2012. The project will be implemented in a <br/>
													joint venture with the private sector, wherein, NDC will<br/>
													contribute the property, while the private partner will <br/>
													shoulder the development cost.</li>
												<li>The ManCom has approved the hiring of a consultant to update<br/>
													the old Feasibility Study of the Project </li>
											</ul>																
						  		</ul>						  		 
						  </div>						 						  
						  <div class="tab-pane" id="contact" style = "margin-left: 5%">
						  	<ul>
						  		<li>Account Officer</li>
						  			<ul>
						  				<li>JONATHAN C. EUGENIO</li>
						  					<ul>
												<li>Contact No.: 8404838 loc. 277</li>
												<li>Mobile No.: 09182535547</li>
											</ul>
						  			</ul>						 
										</ul>
									</ul>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
					

<c:import url="../template/footer.jsp" />