<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
	
	<div id="push"></div>
	
			<div class="row-fluid">
				<div class="span12">
					<div id="footer" style = "background: lightgreen; margin-left: 25px; margin-right: 25px; margin-top: -25px;	">
				      <div class="container">
				        <p class="muted credit">&copy; National Development Company</p>
				      </div>
			    	</div>
				</div>
			</div>

		<!-- AMG External Modal -->
		<div id="dialog-form1" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="leasing" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			</div>
			<div class="modal-body">
				<img src="${pageContext.request.contextPath}/resources/img/external_dashboard/pf_leasing.PNG">
			</div>
			<div class="modal-footer">				
					<button class="btn" data-dismiss="modal" aria-hidden="true">Back</button>			
			</div>
		</div>
		
		<div id="dialog-form2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="negotiated" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			</div>
			<div class="modal-body">
				<img src="${pageContext.request.contextPath}/resources/img/external_dashboard/pf_negotiated.PNG">
			</div>
			<div class="modal-footer">				
					<button class="btn" data-dismiss="modal" aria-hidden="true">Back</button>			
			</div>
		</div>
		
		<div id="dialog-form3" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="accreditation" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			</div>
			<div class="modal-body">
				<img src="${pageContext.request.contextPath}/resources/img/external_dashboard/pf_accreditation.PNG">
			</div>
			<div class="modal-footer">				
					<button class="btn" data-dismiss="modal" aria-hidden="true">Back</button>			
			</div>
		</div>
		
		<!-- end -->
		
		
		<!-- FAD Modals -->
		
		<div id="dialog-form4" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="fad_2009" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			</div>
			<div class="modal-body">
				<img src="${pageContext.request.contextPath}/resources/img/external_dashboard/FAD/fad_2009.PNG">
			</div>
			<div class="modal-footer">				
					<button class="btn" data-dismiss="modal" aria-hidden="true">Back</button>			
			</div>
		</div>
		
		<div id="dialog-form5" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="fad_2010" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			</div>
			<div class="modal-body">
				<img src="${pageContext.request.contextPath}/resources/img/external_dashboard/FAD/fad_2010.PNG">
			</div>
			<div class="modal-footer">				
					<button class="btn" data-dismiss="modal" aria-hidden="true">Back</button>			
			</div>
		</div>
		
		<div id="dialog-form6" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="fad_2011" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			</div>
			<div class="modal-body">
				<img src="${pageContext.request.contextPath}/resources/img/external_dashboard/FAD/fad_2011.PNG">
			</div>
			<div class="modal-footer">				
					<button class="btn" data-dismiss="modal" aria-hidden="true">Back</button>			
			</div>
		</div>
		
		<div id="dialog-form7" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="approved_budget" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
			</div>
			<div class="modal-body">
				<img src="${pageContext.request.contextPath}/resources/img/external_dashboard/FAD/approved_budget.PNG">
			</div>
			<div class="modal-footer">				
					<button class="btn" data-dismiss="modal" aria-hidden="true">Back</button>			
			</div>
		</div>
		
		
		<!-- end -->
		
		
		<!-- Delete MODAL -->
		<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="deleteModalLabel">User deletion</h3>
			</div>
			
			<div class="modal-body">
				<p>Do you want to delete this user?</p>
			</div>
			
			<div class="modal-footer">
				<form method="POST" action="${pageContext.request.contextPath}/dashboard/admin/delete">
					<input type="hidden" name="id" id="deleteId" value="" />
					<button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
					<button class="btn btn-primary" type="submit">Yes, delete this user.</button>
				</form>
			</div>
			
		</div>
		
		<!-- Feedback MODAL -->
		<div id="feedbackModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="feedbackModalLabel" aria-hidden="true">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="feedbackModalLabel">Customer Feedback</h3>
			</div>
			
			<form id="feedbackForm" method="POST" action="${pageContext.request.contextPath}/external/submit">
			
			<div class="modal-body">
					<div>
						<p style="font-weight:bold">
							Instructions: Please complete the following questions to reflect your opinions as accurately as 
							possible and to answer  factual questions to the best of your knowledge. Your information
							will be kept strictly confidential.
						</p>
					</div>
					
					<div> <p class="lead" style="font-weight:bold;text-decoration:underline">Part I</p> </div>
					
					<div style="margin-top:10px">
						<label>A. Did NDC complete the transaction within the indicated time or promised duration?</label>
						<div style="margin-top:10px">
							<textarea id="p1q1" name="p1q1" style="width:500px;height:90px;resize:none"></textarea>
						</div>
					</div>
					
					<div style="margin-top:10px">
						<label>B. Were the NDC personnel able to retrieve the data that you need?</label>
						<div style="margin-top:10px">
							<textarea id="p1q2" name="p1q2" style="width:500px;height:90px;resize:none"></textarea>
						</div>
					</div>
					
					<div style="margin-top:10px">
						<label>C. Were the personnel respectful?</label>
						<div style="margin-top:10px">
							<textarea id="p1q3" name="p1q3" style="width:500px;height:90px;resize:none"></textarea>
						</div>
					</div>
					
					<div style="margin-top:10px">
						<label>D. Were the personnel courteous towards you?</label>
						<div style="margin-top:10px">
							<textarea id="p1q4" name="p1q4" style="width:500px;height:90px;resize:none"></textarea>
						</div>
					</div>
					
					<div style="margin-top:10px">
						<label>E. Did you feel comfortable in using the facilities at NDC?</label>
						<div style="margin-top:10px">
							<textarea id="p1q5" name="p1q5" style="width:500px;height:90px;resize:none"></textarea>
						</div>
					</div>
					
					<div style="margin-top:10px">
						<label>F. Did you feel at ease when you were in the NDC premises?</label>
						<div style="margin-top:10px">
							<textarea id="p1q6" name="p1q6" style="width:500px;height:90px;resize:none"></textarea>
						</div>
					</div>
					
					<div style="margin-top:10px">
						<label>
							G. When getting approval for proposal? if there were turned-down projects or there were
							changes in the decisions, was NDC fair to you?
						</label>
						<div style="margin-top:10px">
							<textarea id="p1q7" name="p1q7" style="width:500px;height:90px;resize:none"></textarea>
						</div>
					</div>
					
					<div style="margin-top:10px">
						<label>
							H. What were the means that you were provided feedback on your project related transactions?
						</label>
						<div style="margin-top:10px">
							<textarea id="p1q8" name="p1q8" style="width:500px;height:90px;resize:none"></textarea>
						</div>
					</div>
					
					<div style="margin-top:10px">
						<label>I. Did you ultimately get what you want or needed?</label>
						<div style="margin-top:10px">
							<textarea id="p1q9" name="p1q9" style="width:500px;height:90px;resize:none"></textarea>
						</div>
					</div>
					
					<div style="margin-top:10px">
						<label>
							J. Do you feel that NDC can still make some improvement, so that their service delivery
							can be more satisfactory to clients?
						</label>
						<div style="margin-top:10px">
							<textarea id="p1q10" name="p1q10" style="width:500px;height:90px;resize:none"></textarea>
						</div>
					</div>
					
					<div style="margin-top:10px">
						<label>
							K. If you choose an agency that you can provide the similar function, would you prefer
							to still transact with NDC?
						</label>
						<div style="margin-top:10px">
							<textarea id="p1q11" name="p1q11" style="width:500px;height:90px;resize:none"></textarea>
						</div>
					</div>
					
					<div> <p class="lead" style="font-weight:bold;text-decoration:underline">Part II</p> </div>
					
					<div>
						<p style="font-weight:bold">
							Instructions: Please fill-out only the portion of your transactions with NDC. Your 
							information will be kept strictly confidential.
						</p>
					</div>
					
					<div style="margin-top:10px">
						<table class="table table-bordered">
							<tr>
								<td>
									<span style="font-weight:bold">PROJECT DEVELOPMENT</span>
								</td>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
							</tr>
							<tr>
								<td style="text-align:left">
									Project Proposal Initial Review and Validation
								</td>
								<td><input name="p2q1" value="1" type="radio" /></td>
								<td><input name="p2q1" value="2" type="radio" /></td>
								<td><input name="p2q1" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q1" value="4" type="radio" /></td>
								<td><input name="p2q1" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									Financial Statement and Due Diligence on Proponent and
									Project Proposal
								</td>
								<td><input name="p2q2" value="1" type="radio" /></td>
								<td><input name="p2q2" value="2" type="radio" /></td>
								<td><input name="p2q2" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q2" value="4" type="radio" /></td>
								<td><input name="p2q2" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									Presentation to Management Committee and Decision
								</td>
								<td><input name="p2q3" value="1" type="radio" /></td>
								<td><input name="p2q3" value="2" type="radio" /></td>
								<td><input name="p2q3" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q3" value="4" type="radio" /></td>
								<td><input name="p2q3" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									NDC Presentation to NDC Board for decision
								</td>
								<td><input name="p2q4" value="1" type="radio" /></td>
								<td><input name="p2q4" value="2" type="radio" /></td>
								<td><input name="p2q4" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q4" value="4" type="radio" /></td>
								<td><input name="p2q4" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									Board approval on the project (including final terms and
									conditions and authority of the General Manager)
								</td>
								<td><input name="p2q5" value="1" type="radio" /></td>
								<td><input name="p2q5" value="2" type="radio" /></td>
								<td><input name="p2q5" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q5" value="4" type="radio" /></td>
								<td><input name="p2q5" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td>
									<span style="font-weight:bold">PROJECT MANAGEMENT</span>
								</td>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
							</tr>
							<tr>
								<td style="text-align:left">
									Establish Milestones/Targets Monitoring and Management
								</td>
								<td><input name="p2q6" value="1" type="radio" /></td>
								<td><input name="p2q6" value="2" type="radio" /></td>
								<td><input name="p2q6" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q6" value="4" type="radio" /></td>
								<td><input name="p2q6" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									Management Committee or Board Decision for adjustments or 
									changes in investment
								</td>
								<td><input name="p2q7" value="1" type="radio" /></td>
								<td><input name="p2q7" value="2" type="radio" /></td>
								<td><input name="p2q7" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q7" value="4" type="radio" /></td>
								<td><input name="p2q7" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									Implementation Monitoring and Management
								</td>
								<td><input name="p2q8" value="1" type="radio" /></td>
								<td><input name="p2q8" value="2" type="radio" /></td>
								<td><input name="p2q8" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q8" value="4" type="radio" /></td>
								<td><input name="p2q8" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									Restructuring/Full payment/Full redemption of shares or 
									Recommend for Divestment
								</td>
								<td><input name="p2q9" value="1" type="radio" /></td>
								<td><input name="p2q9" value="2" type="radio" /></td>
								<td><input name="p2q9" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q9" value="4" type="radio" /></td>
								<td><input name="p2q9" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td>
									<span style="font-weight:bold">FUND/ASSET MANAGEMENT</span>
								</td>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
							</tr>
							<tr>
								<td style="text-align:left">
									Submit Project Proposal/Funding Requirement
								</td>
								<td><input name="p2q10" value="1" type="radio" /></td>
								<td><input name="p2q10" value="2" type="radio" /></td>
								<td><input name="p2q10" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q10" value="4" type="radio" /></td>
								<td><input name="p2q10" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									Check availability of Funds
								</td>
								<td><input name="p2q11" value="1" type="radio" /></td>
								<td><input name="p2q11" value="2" type="radio" /></td>
								<td><input name="p2q11" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q11" value="4" type="radio" /></td>
								<td><input name="p2q11" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									Negotiate and finalize the terms and conditions of the 
									bond/loan
								</td>
								<td><input name="p2q12" value="1" type="radio" /></td>
								<td><input name="p2q12" value="2" type="radio" /></td>
								<td><input name="p2q12" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q12" value="4" type="radio" /></td>
								<td><input name="p2q12" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									Approval from concerned regulatory bodies/agencies
								</td>
								<td><input name="p2q13" value="1" type="radio" /></td>
								<td><input name="p2q13" value="2" type="radio" /></td>
								<td><input name="p2q13" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q13" value="4" type="radio" /></td>
								<td><input name="p2q13" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									Release of bond/loan proceeds
								</td>
								<td><input name="p2q14" value="1" type="radio" /></td>
								<td><input name="p2q14" value="2" type="radio" /></td>
								<td><input name="p2q14" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q14" value="4" type="radio" /></td>
								<td><input name="p2q14" value="5" type="radio" /></td>
							</tr>
							<tr>
								<td style="text-align:left">
									Report status of: <br />
									a. Utilization of bonds
									b. Repayment of Loan
								</td>
								<td><input name="p2q15" value="1" type="radio" /></td>
								<td><input name="p2q15" value="2" type="radio" /></td>
								<td><input name="p2q15" checked="checked" value="3" type="radio" /></td>
								<td><input name="p2q15" value="4" type="radio" /></td>
								<td><input name="p2q15" value="5" type="radio" /></td>
							</tr>
						</table>
						
						<div style="margin-top:20px">
							<div class="row-fluid">
								<div class="span4">
									<span style="font-weight:bold">Legend:</span>
									<br />
									<table class="\">
										<tr>
											<td style="width:70px"> Ecstatic </td>
											<td> 1 </td>
										</tr>
										<tr>
											<td> Happy </td>
											<td> 2 </td>
										</tr>
										<tr>
											<td> So-so </td>
											<td> 3 </td>
										</tr>
										<tr>
											<td> Sad </td>
											<td> 4 </td>
										</tr>
										<tr>
											<td> Irate </td>
											<td> 5 </td>
										</tr>
									</table>
								</div>
								<div class="span8">
									<div>
										<span style="font-weight:bold">Profile of the Respondent:</span>
									</div>
									
									<div>
										Name of Respondent: <input required="required" id="nameOfRespondent" name="nameOfRespondent" type="text" placeholder="Your name" />
									</div>
									
									<div>
										Name of Organization: <input required="required" type="text" id="nameOfOrganization" name="nameOfOrganization" placeholder="Your organization name" />
									</div>
									
									<div>
										Position: <input type="text" required="required" id="position" name="position" placeholder="Your position" />
									</div>
								</div>
							</div>
						</div>
					
				</div>
				
			</div>
			
			<div class="modal-footer">
				<div class="form-actions">
					<button id="feedbackButton" data-loading-text="Processing..." type="submit" class="btn btn-primary">Submit Feedback</button>
					<a href="#" class="btn" data-dismiss="modal">Close</a>
				</div>
			</div>
			
			</form>
			
		</div>
		
		<!-- Edit Profile MODAL -->
		<div id="editProfileModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel" aria-hidden="true">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="editProfileModalLabel">Edit your Profile '<span id="editUsername"></span>'</h3>
			</div>
			
			<form id="editProfileForm" method="POST">
			
				<div class="modal-body">
					
					<div id="editProfileMessage"></div>
					
					<input type="hidden" id="foo" value="" />
					
					<label>First Name</label>
					<div>
						<input type="text" id="editFirstName" required="required" name="firstName" class="span3" />
					</div>
					
					<label>Middle Name</label>
					<div>
						<input type="text" id="editMiddleName" required="required" name="middleName" class="span3" />
					</div>
					
					<label>Last Name</label>
					<div>
						<input type="text" id="editLastName" required="required" name="lastName" class="span3" />
					</div>
					
					<label>Password</label>
					<div>
						<input type="password" id="editPassword" maxlength="10" required="required" name="password" placeholder="Change password..." class="span3" />
					</div>
					
					<label>Confirm Password</label>
					<div>
						<input type="password" id="editConfirmPassword" maxlength="10" required="required" placeholder="Confirm password..." name="confirmPassword" class="span3" />
					</div>
					
				</div>
				
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
					<button id="editProfileSubmit" data-loading-text="Processing..." class="btn btn-primary" type="submit">Yes, modify my account.</button>
				</div>
			
			</form>
			
		</div>
		
		<!-- Projected Actual Income Expense MODAL -->
		<div id="projectedActualIncomeExpenseSubModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="projectedActualIncomeExpenseSubModalLabel" aria-hidden="true">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="projectedActualIncomeExpenseSubModalLabel">Income: Actual vs Budget</h3>
			</div>
			
			<form method="POST">
			
				<div class="modal-body">
					<img alt="Projected Income vs Actual Income is not available" src="${pageContext.request.contextPath}/visualization/projectedactualincomesubchart/550/400" />
				</div>
				
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
				</div>
			
			</form>
			
		</div>
		
		<!-- Actual Income vs Actual Expense MODAL -->
		<div id="actualIncomeExpenseModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="actualIncomeExpenseModalLabel" aria-hidden="true">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="actualIncomeExpenseModalLabel"> Expense: Actual vs Budget </h3>
			</div>
			
			<div class="modal-body">
				<!-- dynamic image here -->
			</div>
				
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
			
		</div>
		
		<!-- Notification MODAL -->
		<div id="notificationModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="notificationModal" aria-hidden="true">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="notificationModalLabel"> Notifications </h3>
			</div>
			
			<div class="modal-body">
				
				<!-- dynamic table here -->
				
			</div>
				
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true" onClick = "window.location.reload(true)">Close</button>
			</div>
			
		</div>
		
		<!-- Personal Services MODAL -->
		<div id="personalServicesModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="personalServicesModal" aria-hidden="true">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="personalServicesModalLabel"> Personal Services </h3>
			</div>
			
			<div class="modal-body">
				
				<!-- dynamic table here -->
				<table class='table table-bordered table-striped'>
					<tr>
						<th>Particulars</th>
						<th>Budget</th>
						<th>Actual</th>
						<th>Unutilized</th>
						<th>% of Utilization</th>
					</tr>
					
					<tr>
						<td>TOTAL</td>
						<td><span id="budgetPersonalServices"></span></td>
						<td><span id="actualPersonalServices"></span></td>
						<td><span id="unutilizedPersonalServices"></span></td>
						<td><span id="percentOfUtilizationPersonalServices"></span></td>
					</tr>
				</table>
				
			</div>
				
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
			
		</div>
		
		<!-- MOOE MODAL -->
		<div id="mooeModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="mooeModal" aria-hidden="true">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="mooeModalLabel"> Maintenance & Other Operating Expenses </h3>
			</div>
			
			<div class="modal-body">
				
				<!-- dynamic table here -->
				<table class='table table-bordered table-striped'>
					<tr>
						<th>Particulars</th>
						<th>Budget</th>
						<th>Actual</th>
						<th>Unutilized</th>
						<th>% of Utilization</th>
					</tr>
					
					<tr>
						<td>TOTAL</td>
						<td><span id="budgetMooe"></span></td>
						<td><span id="actualMooe"></span></td>
						<td><span id="unutilizedMooe"></span></td>
						<td><span id="percentOfUtilizationMooe"></span></td>
					</tr>
				</table>
				
			</div>
				
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
			
		</div>
		
		<!-- Capital Expenditures MODAL -->
		<div id="capitalExpendituresModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="capitalExpendituresModal" aria-hidden="true">
			
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="capitalExpendituresModalLabel"> Capital Expenditures </h3>
			</div>
			
			<div class="modal-body">
				
				<!-- dynamic table here -->
				<table class='table table-bordered table-striped'>
					<tr>
						<th>Particulars</th>
						<th>Budget</th>
						<th>Actual</th>
						<th>Unutilized</th>
						<th>% of Utilization</th>
					</tr>
					
					<tr>
						<td>TOTAL</td>
						<td><span id="budgetCapitalExpenditures"></span></td>
						<td><span id="actualCapitalExpenditures"></span></td>
						<td><span id="unutilizedCapitalExpenditures"></span></td>
						<td><span id="percentOfUtilizationCapitalExpenditures"></span></td>
					</tr>
				</table>
				
			</div>
				
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
			
		</div>
		
		<script type="text/javascript">
			var contextPath = "${pageContext.request.contextPath}";
		</script>
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.colorbox.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/webapp.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/highcharts.src.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dashboard_default_options.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dashboard_fmg_scripts.js"></script>
	</body>
</html>