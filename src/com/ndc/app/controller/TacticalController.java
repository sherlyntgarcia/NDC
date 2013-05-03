package com.ndc.app.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ndc.app.GroupHelper;
import com.ndc.app.model.ActualIncomeExpense;
import com.ndc.app.model.Document;
import com.ndc.app.model.Notification;
import com.ndc.app.response.Response;
import com.ndc.app.service.ChartService;
import com.ndc.app.service.NotifierService;
import com.ndc.app.service.UserService;
import com.ndc.app.util.AuthenticationUtil;
import com.ndc.app.util.PropertiesUtil;

@Controller
@RequestMapping(value="/dashboard/tactical")
public class TacticalController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;

	@Autowired
	@Qualifier("chartService")
	private ChartService chartService;

	@Autowired
	@Qualifier("notifierService")
	private NotifierService notifierService;

	// TACTICAL DASHBOARD
	@RequestMapping
	public String tacticalDashboard(Model model) {

		Long id = userService.getUserDetailsByUsername(
				AuthenticationUtil.getAuthenticationDetails().getName())
				.getId();

		if (id != null) {
			model.addAttribute("amgNotif", notifierService
					.getNotificationOfUserByGroup(id, GroupHelper.AMG));
			model.addAttribute("fmgNotif", notifierService
					.getNotificationOfUserByGroup(id, GroupHelper.FMG));
			model.addAttribute("fadNotif", notifierService
					.getNotificationOfUserByGroup(id, GroupHelper.FAD));
			model.addAttribute("spgNotif", notifierService
					.getNotificationOfUserByGroup(id, GroupHelper.SPG));

			model.addAttribute("amgNotifCount", notifierService
					.getNotificationOfUserByGroup(id, GroupHelper.AMG).size());
			model.addAttribute("fmgNotifCount", notifierService
					.getNotificationOfUserByGroup(id, GroupHelper.FMG).size());
			model.addAttribute("fadNotifCount", notifierService
					.getNotificationOfUserByGroup(id, GroupHelper.FAD).size());
			model.addAttribute("spgNotifCount", notifierService
					.getNotificationOfUserByGroup(id, GroupHelper.SPG).size());
		}

		// get years for actual/income expense
		List<ActualIncomeExpense> expenses = chartService
				.getActualIncomeExpense();

		// for smileys :)
		model.addAttribute("budgetUtilization",
				chartService.getOverallBudgetUtilization());
		
		List<Document> documents = userService.getAllDocuments();
		model.addAttribute("documents", documents);

		model.addAttribute("expenses", expenses);
		model.addAttribute("userId", id);

		return "tactical/tacticalDashboard";

	}

	@RequestMapping(value = "/refresh")
	public @ResponseBody
	String refreshNotif(@RequestParam(value = "userId") Long userId,
			@RequestParam(value = "groupId") String groupName) {

		Response response = new Response();
		Gson gson = new Gson();

		try {

			notifierService.refreshNotification(userId, groupName);
			response.setStatus(true);
			response.setMessage("SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(false);
			response.setMessage("FAILED");
		}

		return gson.toJson(response);

	}

	@RequestMapping(value = "/viewNotif")
	public @ResponseBody
	String viewNotifications(
			@RequestParam(value = "groupName") String groupName,
			@RequestParam(value = "userId") Long userId) {

		Gson gson = new Gson();
		Response response = new Response();
		List<Notification> notifications = notifierService
				.getNotificationOfUserByGroup(userId, groupName);

		if (notifications != null) {

			response.setStatus(true);
			response.setMessage("SUCCESS");
			response.setData(gson.toJson(notifications));

		} else {

			response.setStatus(false);
			response.setMessage("FAILED");

		}

		return gson.toJson(response);

	}
	
	@ModelAttribute("title")
	public String getTitle() {
		return PropertiesUtil.getProperty("app.title");
	}

	@ModelAttribute("loggedInUser")
	public Authentication getAuthenticationDetails() {
		return AuthenticationUtil.getAuthenticationDetails();
	}

	@ModelAttribute("currentYear")
	public int getCurrentYear() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());

		return cal.get(Calendar.YEAR);
	}

	@ModelAttribute("currentMonth")
	public int getCurrentMonth() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());

		return cal.get(Calendar.MONTH);
	}

}
