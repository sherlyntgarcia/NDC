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
							NDC School Building Program	
						</p>
						<hr>
					</div>
					
					<c:import url="../template/spgProjectsLink.jsp" />
					
					<div class = "span8">				
						<div>
							<ul class="nav nav-tabs">
							  <li class="active"><a href="#description" data-toggle="tab">Project Description</a></li>
							  <li><a href="#status" data-toggle="tab">Status Updates</a></li>
							  <li><a href="#intervension" data-toggle="tab">Issues/Needed Interventions</a></li>
							  <li><a href="#contact" data-toggle="tab">Account Officer / Contact Person</a></li>
							</ul>
						</div>
						
						<div class="tab-content">
						  <div class="tab-pane active" id="description" style = "margin-left: 5%">
						  		The NDC School Building Program is a loan program extended to the Local Government Units (LGUs) for the <br/>
						  			construction of school buildings. The basic terms of the loan are as follows:
								<ul class = 'list-style'>
									<li>Interest Rate - 7.4% per annum, fixed for the entire term of the loan, inclusive of VAT</li>
									<li>Loan Maturity - 7 1/2 years inclusive of Grace Period</li>
									<li>Grace Period - 6 months from the first loan drawdown</li>
									<li>Collaterals:</li>
											<ul>
												<li>Deed of Assignment of IRA with Hold-Out in favor of NDC to the extent of one (1)-month amortization.</li>
												<li>Special Deposit Account with a maintaining balance equivalent to three (3) months amortization.</li>
											</ul>
									<li>Schedule of Loan Release - The loan release is based on a progress billing subject to compliance of LGU<br/> 
										to the loan documentary requirements and milestones accomplishments. </li>
						  		</ul>
						  		<ul class = 'list-style'>
									<li>Target Beneficiaries</li>
										<ul>
											<li>School-aged children in public schools</li>
										</ul>
									<li>Project Budget</li>
										<ul>
											<li>P100 Million</li>
										</ul>
									<li>NDC's Participation</li>
											<ul>
												<li>NDC to provide the loan to the LGUs</li>
											</ul>
									<li>Project Timeline</li>
											<ul>
												<li>Program Start  - November 23, 2010</li>
												<li>Program End   - Continuing activity until upon advise by the NDC Board/Management</li>
											</ul>									
						  		</ul>
						  		<span class="label label-important">Note</span> Individual construction schedules shall be available upon submission of an LGU availee. 
						  </div>						 
						  <div class="tab-pane" id="status" style = "margin-left: 5%">
						  	<ul>
						  		<li>A meeting with Palawan State University (PSU) President Sespeñe and Mr. Biolena was held on <br/>
						  		 September 25, 2012. PSU expressed interest to obtain loan for the construction of school building for PSU.</li>
						  		<li>NDC sent a letter to PSU on October 2, 2012 re: Legal authority, willingness to hold-out trust fund<br/> 
						  			deposit at DBP, Board of Regents approval, financial standing.</li>
						  		<li>NDC received Letter of Interest from PSU on October 10, 2012 requesting a loan for the construction of <br/>
						  			25 classrooms.</li>
						  		<li>NDC still awaits response to NDC's letter of Oct. 2, 2012. The response will be sent after the meeting<br/>
						  			of the Board of Regents in December 2012.</li>
						  	</ul>
						  </div>
						   <div class="tab-pane" id="intervension" style = "margin-left: 5%">
						  	<ul>
						  		<li>The LGUs are not keen on availing of the Program due to the proposed initiative of the DepEd to construct<br/> 
						  			classrooms through Public-Private-Partnership (PPP).</li>
						  		<li>PSU proposed loan to be directly paid by the school not by LGU. Issue on the collateral to be settled first.</li>						  		
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
						  		<li>Client Contact Person</li>
						  			<ul>
						  				<li>Current Loan Applicant</li>
						  				<ul>
							  				<li>Palawan State University</li>
							  					<ul>
													<li>Contact No.: (048)4332379</li>
													<li>Mobile No.: 09177247658</li>
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