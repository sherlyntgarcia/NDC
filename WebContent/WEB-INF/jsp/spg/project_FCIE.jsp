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
					
					<c:import url="../template/spgProjectsLink.jsp" />
					
					<div class = "span8">				
						<div>
							<ul class="nav nav-tabs">
							  <li class="active"><a href="#description" data-toggle="tab">Project Description</a></li>					  							  
							  <li><a href="#status" data-toggle="tab">Status Updates</a></li>
							  <li><a href="#contact" data-toggle="tab">Client Contact Person</a></li>
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
									<li><p class="para">Target Beneficiaries</p></li>
										<ul>
											<li>Local and foreign manufacturers, local workers</li>
										</ul>
									<li><p class="para">Project Budget</p></li>
										<ul>
											<li>P550 Million including value of land</li>
										</ul>
									<li><p class="para">NDC's Participation</p></li>
											<ul>
												<li>NDC property as equity</li>
											</ul>
									<li><p class="para">Project Timeline</p></li>
											<ul>
												<li>Not yet established</li>
											</ul>												
						  		</ul>						  		 
						  </div>		
						  
						  <div class="tab-pane" id="status" style = "margin-left: 5%">
						  	<p class="lead"> Project Status </p>
						  	<ul>
						  		<li>The project is now under evaluation. The implementation framework has been presented to the Management Committee
									on Nov. 9, 2012. The project will be implemented in a joint venture with the private sector, wherein, NDC will
									contribute the property, while the private partner will shoulder the development cost.</li>
								<li>The feasibility study of the project done in year 2000 will be updated.</li>
						  	</ul>
							
							<p class="lead"> Next Steps </p>
							<ul>
								<li> To meet with the Local Government Unit of Dasmarinas, Cavite to seek endorsement 
									of the Project.</li>
								<li> To enter into an agreement with FCIE, Inc. for the development of the property 
									as an expansion of FCIE.
							</ul>	
						  </div>
						  				 						  
						  <div class="tab-pane" id="contact" style = "margin-left: 5%">
<!-- 						  	<ul> -->
<!-- 						  		<li>Account Officer</li> -->
<!-- 						  			<ul> -->
<!-- 						  				<li>JONATHAN C. EUGENIO</li> -->
<!-- 						  					<ul> -->
<!-- 												<li>Contact No.: 8404838 loc. 277</li> -->
<!-- 												<li>Mobile No.: 09182535547</li> -->
<!-- 											</ul> -->
<!-- 						  			</ul>						  -->
<!-- 										</ul> -->
<!-- 									</ul> -->
<!-- 								</ul> -->
								<ul>
									<li> Client Contact Person </li>
									<ul>
										<li> SATURNINO H. MEJIA (President) </li>
										<ul>
											<li> Contact No.: 8404856 </li>
										</ul>
										
										<li> RUFINO A. MALANYAON (Estate Manager) </li>
										<ul>
											<li> Contact No.: (046) 4021001/003 </li>
											<li> Mobile No.: 09053378831 </li>
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