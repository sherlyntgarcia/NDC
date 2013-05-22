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
							Redondo Wind Power Project
						</p>
						<hr>
					</div>
					
					<c:import url="../template/spgProjectsLink.jsp" />
					
					<div class = "span8">				
						<div>
							<ul class="nav nav-tabs">
							  <li class="active"><a href="#description" data-toggle="tab">Project Description/Concept</a></li>					  							  
							  <li><a href="#contact" data-toggle="tab">Client Contact Person</a></li>
							</ul>
						</div>
						
						<div class="tab-content">
						  <div class="tab-pane active" id="description" style = "margin-left: 5%">
						  		Wind power electric generation project with a capacity of 50MW (2MW <br/>
						  		each @ 25 Windmill Turbine Generators). The project is being proposed <br/>
						  		by the Pan Energy Corporation wherein NDC was invited to invest into the <br/>
						  		project via equity participation. The project will be located in the towns <br/>
						  		of Subic & San Antonio in Zambales.  
						  	<ul class = 'list-style'>
									<li><p class="para">Target Beneficiaries</p></li>
										<ul>
											<li>Electric power consumers of Olongapo City-Zambales area</li>
										</ul>									
									<li><p class="para">Project Status</p></li>
											<ul>
												<li>The Preliminary Feasibility Study was already completed <br/>
													obtaining information from satellite data.</li>
												<li>Start of the Final Feasibility Study awaits permits from <br/>
												LGU and DENR for the installation of Met-Mast, an instrumentation <br/>
												use to measure wind speed, pressure, direction, temperature, etc. </li>
												<li>On-going securing necessary permits to install the Met-Mast</li>
											</ul>																
						  		</ul>						  		 
						  </div>						 						  
						  <div class="tab-pane" id="contact" style = "margin-left: 5%">
						  	<ul>
<!-- 						  		<li>Account Officer</li> -->
<!-- 						  			<ul> -->
<!-- 						  				<li>JONATHAN C. EUGENIO</li> -->
<!-- 						  					<ul> -->
<!-- 												<li>Contact No.: 8404838 loc. 277</li> -->
<!-- 												<li>Mobile No.: 09182535547</li> -->
<!-- 											</ul> -->
<!-- 						  			</ul>	 -->
						  			<li>Client Contact Person</li>
						  			<ul>
						  				<li>Pan Energy Corporation</li>
						  					<ul>
												<li>Tel. No.: (632)7063270</li>
												<li>Mobile No.: 09175298844</li>
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