package com.ndc.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ndc.app.AppHelper;
import com.ndc.app.model.User;
import com.ndc.app.response.Response;
import com.ndc.app.service.UserService;
import com.ndc.app.util.LoggerUtil;
import com.ndc.app.util.MailUtil;
import com.ndc.app.util.PropertiesUtil;

@Controller
public class LoginController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;

	@Autowired
	private MailUtil mailUtil;
	 
	@Autowired
	@Qualifier("loggerUtil")
	private LoggerUtil loggerUtil;

	@RequestMapping(value={"/login", "/"}) 
	public String login(@RequestParam(required=false,value="error") String error, Model model) {
		
		model.addAttribute("questions", AppHelper.getQuestions());
		
		if(error != null) {
			model.addAttribute("error", PropertiesUtil.getProperty("error.login.invalid"));
		}
		
		return "login";
		
	}
	
	@RequestMapping(value="/login/forgot", method=RequestMethod.POST)
	public @ResponseBody String forgotPassword(@RequestParam(value="username") String username,
												@RequestParam(value="secretQuestion") String secretQuestion,
												@RequestParam(value="secretAnswer") String secretAnswer) {
		
		Response response = new Response();
		Gson gson = new Gson();
		
		if(username == null && secretAnswer == null) {
			
			response.setStatus(false);
			response.setMessage(PropertiesUtil.getProperty("error.forgot.not.found"));
			
		} else {
			
			boolean success = userService.isUserValidOnForgotPassword(username, secretQuestion, secretAnswer);
			
			if(success) {
				//send email
				User user = userService.getUserDetailsByUsername(username);
				
				if(user != null) {
					try {
						String generatedPassword = generatePassword();
						
						mailUtil.sendEmail(user.getEmail(), PropertiesUtil.getProperty("email.from"), PropertiesUtil.getProperty("email.subject"),
								PropertiesUtil.getProperty("email.text") + " " + generatedPassword);
						
						//update
						user.setPassword(generatedPassword);
						userService.updateUser(user);
						
						//log
						loggerUtil.log(SecurityContextHolder.getContext().getAuthentication(), "PASSWORD CHANGED FOR EMAIL '" + user.getEmail() + "'");
						
						response.setStatus(true);
						response.setMessage(PropertiesUtil.getProperty("success.forgot.email"));
						
					} catch (Exception e) {
						e.printStackTrace(System.out);
						response.setStatus(false);
						response.setMessage(PropertiesUtil.getProperty("error.forgot.email"));
					}
				} else {
					response.setStatus(false);
					response.setMessage(PropertiesUtil.getProperty("error.login.invalid"));
				}
				
			} else {
				response.setStatus(false);
				response.setMessage(PropertiesUtil.getProperty("error.forgot.not.found"));
			}
			
		}
		
		
		return gson.toJson(response);
		
	}
	
	@RequestMapping(value="/login/admin/forgot", method=RequestMethod.POST)
	public @ResponseBody String forgotAdminPassword(@RequestParam(value="username") String username,
												@RequestParam(value="email") String email) {
		
		Response response = new Response();
		Gson gson = new Gson();
		
		if(username == null && email == null) {
			
			response.setStatus(false);
			response.setMessage(PropertiesUtil.getProperty("error.forgot.not.found"));
			
		} else {
			
			boolean success = userService.isUserValidOnForgotPassword(username, email);
			
			if(success) {
				//send email
				User user = userService.getUserDetailsByUsername(username);
				
				if(user != null) {
					try {
						String generatedPassword = generatePassword();
						
						mailUtil.sendEmail(user.getEmail(), PropertiesUtil.getProperty("email.from"), PropertiesUtil.getProperty("email.subject"),
								PropertiesUtil.getProperty("email.text") + " " + generatedPassword);
						
						//update
						user.setPassword(generatedPassword);
						userService.updateUser(user);
						
						//log
						loggerUtil.log(SecurityContextHolder.getContext().getAuthentication(), "PASSWORD CHANGED FOR EMAIL '" + user.getEmail() + "'");
						
						response.setStatus(true);
						response.setMessage(PropertiesUtil.getProperty("success.forgot.email"));
						
					} catch (Exception e) {
						e.printStackTrace(System.out);
						response.setStatus(false);
						response.setMessage(PropertiesUtil.getProperty("error.forgot.email"));
					}
				} else {
					response.setStatus(false);
					response.setMessage(PropertiesUtil.getProperty("error.login.invalid"));
				}
				
			} else {
				response.setStatus(false);
				response.setMessage(PropertiesUtil.getProperty("error.forgot.not.found"));
			}
			
		}
		
		
		return gson.toJson(response);
		
	}
	
	private String generatePassword() {
		long number = (long) Math.floor(Math.random() * 9000000000L) + 1000000000L;
		return "" + number;
	}
	
	@ModelAttribute("title")
	public String getTitle() {
		return PropertiesUtil.getProperty("app.title");
	}
	
}
