package com.ndc.app.util;

import java.util.Date;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import com.ndc.app.service.UserService;

@Component
public class MailUtil {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	//forgot password
	public void sendEmail(final String to, final String from, final String subject, final String text) throws Exception {
		
		MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				mimeMessageHelper.setFrom(from);
				mimeMessageHelper.setTo(to);
				mimeMessageHelper.setSubject(subject);
				mimeMessageHelper.setText(text, true);
			}
			
		};
		
		mailSender.send(mimeMessagePreparator);
		
	}
	
	//send customer feedback
	public void sendCustomerFeedback(final HttpServletRequest request) throws Exception {
		
		MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				String email = userService.getFeedback().getEmail();
				String subject = userService.getFeedback().getSubject();
				
				if(email == null)
					email = PropertiesUtil.getProperty("tactical.email");
				if(subject == null)
					subject = "Customer Feedback";
				
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				mimeMessageHelper.setTo(email);
				mimeMessageHelper.setFrom("National-Development-Company");
				mimeMessageHelper.setSentDate(new Date());
				mimeMessageHelper.setSubject(subject);
				
				String content = "";
				
				content += "<b>Name of Respondent:</b> " + clean(request.getParameter("nameOfRespondent")) + "<br />";
				content += "<b>Name of Organization:</b> " + clean(request.getParameter("nameOfOrganization")) + "<br />";
				content += "<b>Position:</b> " + clean(request.getParameter("position")) + "<br /><br /><br />";
				
				content += "<p style='font-weight:bold'>Did NDC complete the transaction within the indicated time or promised duration?</p>";
				content += "<p>- " + clean(request.getParameter("p1q1")) + "</p> <br />";
				
				content += "<p style='font-weight:bold'>Were the NDC personnel able to retrieve the data that you need?</p>";
				content += "<p>- " + clean(request.getParameter("p1q2")) + "</p> <br />";
				
				content += "<p style='font-weight:bold'>Were the personnel respectful?</p>";
				content += "<p>- " + clean(request.getParameter("p1q3")) + "</p> <br />";
				
				content += "<p style='font-weight:bold'>Were the personnel courteous towards you?</p>";
				content += "<p>- " + clean(request.getParameter("p1q4")) + "</p> <br />";
				
				content += "<p style='font-weight:bold'>Did you feel comfortable in using the facilities at NDC?</p> <br />";
				content += "<p>- " + clean(request.getParameter("p1q5")) + "</p> <br />";
				
				content += "<p style='font-weight:bold'>Did you feel at ease when you were in the NDC premises?</p>";
				content += "<p>- " + clean(request.getParameter("p1q6")) + "</p> <br />";
				
				content += "<p style='font-weight:bold'>When getting approval for proposal? If there were turned-down projects of there were changes in the decisions, was NDC fair to you? </p>";
				content += "<p>- " + clean(request.getParameter("p1q7")) + "</p> <br />";
				
				content += "<p style='font-weight:bold'>What were the means that you were provided feedback on your project related transactions? </p>";
				content += "<p>- " + clean(request.getParameter("p1q8")) + "</p> <br />";
				
				content += "<p style='font-weight:bold'>Did you ultimately get what you want or needed? </p>";
				content += "<p>- " + clean(request.getParameter("p1q9")) + "</p> <br />";
				
				content += "<p style='font-weight:bold'>Do you feel that NDC can still make some improvement, so that their servide delivery can be more satisfactory to clients? </p>";
				content += "<p>- " + clean(request.getParameter("p1q10")) + "</p> <br />";
				
				content += "<p style='font-weight:bold'>If you choose an agency that you can provide the similar function, would you prefer to still transact with NDC? </p>";
				content += "<p>- " + clean(request.getParameter("p1q11")) + "</p> <br />";
				
				content += "<div>";
				content += "<table>";
				content += "<tr><th>Legends:</th><td>&nbsp;</td></tr>";
				content += "<tr><td>Ecstatic</td><td>1</td></tr>";
				content += "<tr><td>Happy</td><td>2</td></tr>";
				content += "<tr><td>So-so</td><td>3</td></tr>";
				content += "<tr><td>Sad</td><td>4</td></tr>";
				content += "<tr><td>Irate</td><td>5</td></tr>";
				content += "</table>";
				content += "</div>";
				
				content += "<table border='1' style='padding:5px;margin-top:20px'>";
				content += "<tr><th>PROJECTS DEVELOPMENT</th><th>Response</th></tr>";
				content += "<tr><td>Project Proposal Initial Review and Validation</td><td style='text-align:center'>" + clean(request.getParameter("p2q1")) + "</td></tr>";
				content += "<tr><td>Financial Statement and Due Diligence on Proponent and Project Disposal</td><td style='text-align:center'>" + clean(request.getParameter("p2q2")) + "</td></tr>";
				content += "<tr><td>Presentation to Management Committee and Decision</td><td style='text-align:center'>" + clean(request.getParameter("p2q3")) + "</td></tr>";
				content += "<tr><td>NDC Presentation to NDC Board for decision</td><td style='text-align:center'>" + clean(request.getParameter("p2q4")) + "</td></tr>";
				content += "<tr><td>Board approval on the project(including final terms and conditions and authority of the General Manager)</td><td style='text-align:center'>" + clean(request.getParameter("p2q5")) + "</td></tr>";
				content += "</table> <br /> <br />";
				
				content += "<table border='1' style='padding:5px'>";
				content += "<tr><th>PROJECT MANAGEMENT</th><th>Response</th></tr>";
				content += "<tr><td>Establish Milestones/Targets Monitoring and Management</td><td style='text-align:center'>" + clean(request.getParameter("p2q6")) + "</td></tr>";
				content += "<tr><td>Management Committee or Board Decision for adjustments or changes in investments</td><td style='text-align:center'>" + clean(request.getParameter("p2q7")) + "</td></tr>";
				content += "<tr><td>Implementation Monitoring and Management</td><td style='text-align:center'>" + clean(request.getParameter("p2q8")) + "</td></tr>";
				content += "<tr><td>Restructuring/Full payment/Full redemption of shares or Recommend for Divestment</td><td style='text-align:center'>" + clean(request.getParameter("p2q9")) + "</td></tr>";
				content += "</table> <br /> <br />";
				
				content += "<table border='1' style='padding:5px'>";
				content += "<tr><th>FUND/ASSET MANAGEMENT</th><th>Response</th></tr>";
				content += "<tr><td>Submit Project Proposal/Funding Requirement</td><td style='text-align:center'>" + clean(request.getParameter("p2q10")) + "</td></tr>";
				content += "<tr><td>Check availability of funds</td><td style='text-align:center'>" + clean(request.getParameter("p2q11")) + "</td></tr>";
				content += "<tr><td>Negotiate and finalize the terms and conditions of the bond/loan</td><td style='text-align:center'>" + clean(request.getParameter("p2q12")) + "</td></tr>";
				content += "<tr><td>Approval from concerned regulatory bodies/agencies</td><td style='text-align:center'>" + clean(request.getParameter("p2q13")) + "</td></tr>";
				content += "<tr><td>Release of bond/loan proceeds</td><td style='text-align:center'>" + clean(request.getParameter("p2q14")) + "</td></tr>";
				content += "<tr><td>Report status of:</td><td style='text-align:center'>" + clean(request.getParameter("p2q15")) + "</td><tr> <td colspan='2'> a. Utilization of bonds </td> </tr> <tr> <td colspan='2'> b. Repayment of loan </td> </tr>";
				content += "</table> <br /> <br />";
				
				content += "Thank you!";
				
				mimeMessageHelper.setText(content, true);
			}
			
		};
		
		mailSender.send(mimeMessagePreparator);
		
	}
	
	private String clean(String str) {
		if(str == null || str.equals("")) {
			return "No answer";
		} else {
			return str;
		}
	}

}
