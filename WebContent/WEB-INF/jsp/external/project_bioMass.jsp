<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%-- <security:authorize access="!hasRole('SPG_STRATEGIC_USER') and !hasRole('SPG_OPERATIONAL_USER') and !hasRole('POWER_USER')" > --%>
<%-- 	<c:redirect url="/dashboard" /> --%>
<%-- </security:authorize> --%>

<c:import url="../template/header.jsp" />
<div class = "admin-home">

	<div class="container-fluid">
		<div class="row-fluid">
		
			<div class="span12">
				
				<div class="row-fluid">	
					<div>
						<p class="lead">
							Biomass Development Project
						</p>
						<hr>
					</div>
					
					<c:import url="../template/spgProjectsLink.jsp" />
					
					<div class = "span8">				
						<div>
							<ul class="nav nav-tabs">
							  <li class="active"><a href="#description" data-toggle="tab">Project Description</a></li>
							  <li><a href="#status" data-toggle="tab">Status Updates</a></li>
							  <li><a href="#contact" data-toggle="tab">Account Officer / Contact Person</a></li>
							</ul>
						</div>
						
						<div class="tab-content">
						  <div class="tab-pane active" id="description" style = "margin-left: 5%">
						  		The project will fund the establishment of a 2MW biomass-fired power generation project.  Initial target areas are those remote islands which experience intermittent supply of electricity such as Tablas Island, Romblon.
								<ul class = 'list-style'>
									<li><p class="para">The key features of the project include the following:</p></li>
									<ul>
										<li>The proponent will use bamboo chips as feedstock for a gasification system for rural electricity.</li>
										<li>Through gasification, carbon materials like bamboo chips are processed at high temperatures using controlled amounts of oxygen or steam to extract energy.</li>
										<li>The unique technology component is the production and propagation of high density short rotation biomass energy crops (bamboo and trees) as feedstock.  Through Licensed Tree Adaptation Process (TAP), specific tree species can grow 50% larger than the standard variety at a 30% to 40% increased growth rate.</li>
										
									</ul>
						  		</ul>
						  		<ul class = 'list-style'>
									<li><p class="para">Target Beneficiaries</p></li>
										<ul>
											<li>Electric power consumers of Tablas Island, Romblon</li>
										</ul>															
						  		</ul>
						  		<span class="label label-important">Note</span> Individual construction schedules shall be available upon submission of an LGU availee. 
						  </div>						 
						  <div class="tab-pane" id="status" style = "margin-left: 5%">
						  	The proponent submitted the project proposal to other private investors.  Their approval is expected by February 2013.  Local technology partners are also being invited to participate in the project. 
						  </div>						  
						  <div class="tab-pane" id="contact" style = "margin-left: 5%">
						  	<ul>
						  		<li>Account Officer</li>
						  			<ul>
						  				<li>ROMMEL R. SERRANO</li>
						  					<ul>
												<li>Contact No.: 8404838 loc. 256</li>
												<li>Mobile No.: 09178192975</li>
											</ul>
						  			</ul>
						  		<li>Client Contact Person</li>
					  				<ul>
						  				<li>MIGUEL Z. PATOLOT, Chairman</li>
						  					<ul>
												<li>Primary Biomass Energy Development, Inc.<br/>
													Unit 3104, Antel Global Corporate Center<br/>
													No. 3 Julia Vargas Ave., Ortigas Center<br/>
													Pasig City
												</li>
												
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