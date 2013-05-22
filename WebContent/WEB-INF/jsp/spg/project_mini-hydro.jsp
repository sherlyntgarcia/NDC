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
							Mini-Hydro Projects	
						</p>
						<hr>
					</div>
					
					<c:import url="../template/spgProjectsLink.jsp" />
					
					<div class = "span8">				
						<div>
							<ul class="nav nav-tabs">
							  <li class="active"><a href="#description" data-toggle="tab">Project Description</a></li>					  							  
							  <li><a href="#contact" data-toggle="tab">Client Contact Person</a></li>
							</ul>
						</div>
						
						<div class="tab-content">
						  <div class="tab-pane active" id="description" style = "margin-left: 5%">
						  		<ul>
						  			<li><p class="para"> A national program in the development and installation of mini-hydropower plants in existing and planned irrigation systems. Rationale to pursue the project: </p></li>
						  			<ul>
						  				<li>To stimulate mini-hydro development, the Philippine government enacted Republic Act 7156, or the Mini-hydro Law. The law stipulates special incentives and privileges, such as tax and duty-free imports, lower sales tax, 10% VAT exemption, and seven-year income tax holiday.</li>
					  					<li>Mini-hydro electric power plants are environment friendly and considered as renewable energy because it does not destroy water sheds since the water used to run its generators are from run-of-river. Mini-hydro plant has a priority dispatch over other types of electric power plant in the country.</li>
					  					<li>Additional electricity to ease the power deficit and rural electrification on off-grid areas. </li>
					  					<li>The project will contribute funding to the regional offices of NIA which is used for efficient water management and livelihood programs for the farmers. To serve as display and auction/sales area with physical structure facilities for trading and distribution outlets.</li>					  					
						  			</ul>
						  			<li><p class="para">Project Implementation</p></li>
						  			<ul>
						  				<li><u>Phase 1: Construction of hydropower plants to pilot sites</u></li>
						  				<ul>
						  					<li>National Irrigation Administration (NIA) and PNOC Renewables Corporation (PNOC RC) entered into a memorandum of agreement to establish and operate hydropower plant projects on the following pilot sites. </li>
					  						<ul>
					  							<li>Munoz Hydropower Project</li>
					  							<li>Rizal Hydropower Project</li>
					  							<li>Penaranda Hydropower Project</li>
					  							<li>Maburak Hydropower Project</li>
					  							<li>Pampanga River Irrigation System Dam</li>
												<li>Aulo Dam</li>
					  							
					  						</ul>
						  				</ul>
						  				<li><u>Phase 2: Cover other existing irrigation systems with hydropower potential </u></li>
						  			</ul>
						  			<li><p class="para">Sources of Revenue</p></li>
						  				<ul>
						  					<li>The sources of revenue for the project will come from the sale of electricity to cooperatives.</li>
						  				</ul>
						  		</ul>
						  	</div>
						  	<div class="tab-pane active" id="description" style = "margin-left: 5%">
						  	<ul class = 'list-style'>
									<li><p class="para">Target Beneficiaries</p></li>
										<ul>
											<li>Local electricity consumers</li>
										</ul>
									<li><p class="para">Project Budget</p></li>
										<ul>
											<li>P 200 million cover 3 pilot sites (Penaranda, Rizal, Muñoz)  </li>
										</ul>
									<li><p class="para">NDC's Participation</p></li>
											<ul>
												<li>NDC has yet to negotiate the amount of its participation.</li>
											</ul>
									<li><p class="para">Project Timeline</p></li>
											<ul>
												<li>Not yet established</li>
											</ul>	
									<li><p class="para">Project Status</p></li>
											<ul>
												<li>November 7, 2012, NIA and PNOC RC signed the memorandum of agreement to establish and operate hydropower plants projects within the existing irrigation systems.</li>
												<li>November 7, 2012, DOE and DA signed the memorandum of understanding to express support and assistance to the recently formed cooperation of its attached agencies to establish and operated hydropower plants.</li>
											</ul>	
									<li><p class="para">Next Steps</p></li>
											<ul>
												<li>Installation of equipment to pilot sites which would determine its power potential.</li>
											</ul>																
						  		</ul>						  		 
						  </div>						 						  
						  <div class="tab-pane" id="contact" style = "margin-left: 5%">
						  	<ul>
<!-- 						  		<li>Account Officer</li> -->
<!-- 						  			<ul> -->
<!-- 						  				<li>RYAN J. MACAILING</li> -->
<!-- 						  					<ul> -->
<!-- 												<li>Contact No.: 8404838 loc. 257</li> -->
<!-- 												<li>Mobile No.:  09175822467</li> -->
<!-- 											</ul> -->
									<li>Client Contact Person</li>
						  			<ul>
										<li>JOB JACOB A. GONZALES, Project Manager</li>
										<ul>
											<li>Tel. No.:  7897662</li>
											<li>Mobile No. 09175822467</li>
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