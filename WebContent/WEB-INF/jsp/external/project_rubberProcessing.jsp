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
							Mindanao Rubber Processing Plant
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
					  			The proposed project is a rubber development undertaking which includes the establishment of post harvest facilities, acquisition of support equipment and road networking. 
								The project intends to set-up a modern rubber processing plant that produces 8 to 10 MT of processed-rubber for 8-hour operation. The processing plant will produce semi-processed rubber technically graded as a SPR 20 and SPR 5. The proposed project will also enhance the quality and sustain the supply of rubber for future business opportunities and export market share.
								Total Existing Rubber Area: 21,754 hectares					  			
					  		</p>				  		 
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
						  				<li>DR. SITTI AMINA M. JAIN </li>
						  					<ul>
												<li>DTI-IX Assistant Regional Director /</li>
												<li>DTI National Rubber Industry Cluster Manager</li>
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