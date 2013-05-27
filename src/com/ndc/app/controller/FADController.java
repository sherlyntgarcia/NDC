package com.ndc.app.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.ndc.app.AppHelper;
import com.ndc.app.GroupHelper;
import com.ndc.app.model.ActualIncomeExpense;
import com.ndc.app.model.BUCapitalExpenditures;
import com.ndc.app.model.BUMooe;
import com.ndc.app.model.BUPersonalServices;
import com.ndc.app.model.BalanceSheet;
import com.ndc.app.model.CollectionEfficiency;
import com.ndc.app.model.IncomeStatement;
import com.ndc.app.model.Notification;
import com.ndc.app.model.ProjectedActualIncome;
import com.ndc.app.model.ProjectedActualIncome2;
import com.ndc.app.model.User;
import com.ndc.app.response.Response;
import com.ndc.app.service.ChartService;
import com.ndc.app.service.LoggerService;
import com.ndc.app.service.NotifierService;
import com.ndc.app.service.UserService;
import com.ndc.app.util.AuthenticationUtil;
import com.ndc.app.util.LoggerUtil;
import com.ndc.app.util.PropertiesUtil;

@Controller
@RequestMapping(value = "/dashboard/internal/FAD")
public class FADController {

	@Autowired
	@Qualifier("userService")
	private UserService userService;

	@Autowired
	@Qualifier("loggerService")
	private LoggerService loggerService;

	@Autowired
	@Qualifier("chartService")
	private ChartService chartService;

	@Autowired
	private LoggerUtil loggerUtil;

	@Autowired
	@Qualifier("notifierService")
	private NotifierService notifierService;

	// FAD DASHBOARD
	@RequestMapping
	public String internalFAD(Model model) {

		// get years for actual/income expense
		List<ActualIncomeExpense> expenses = chartService
				.getActualIncomeExpense();

		model.addAttribute("expenses", expenses);

		// for smileys
		model.addAttribute("budgetUtilization",
				chartService.getOverallBudgetUtilization());

		return "fad/internalDashboardFAD";

	}

	@RequestMapping(value = "/balanceSheet")
	public String internalFADBalanceSheet(Model model) {

		BalanceSheet bs = new BalanceSheet();
		bs.setYear(getCurrentYear());
		model.addAttribute("balanceSheet", bs);

		return "fad/internalDashboardFADBalanceSheet";

	}

	@RequestMapping(value = "/balanceSheet", method = RequestMethod.POST)
	public String internalFADBalanceSheet(@Valid BalanceSheet balanceSheet,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fad/internalDashboardFADBalanceSheet";
		}

		// add & log
		try {
			balanceSheet.setTotalEquity(balanceSheet.getTotalAssets()
					- balanceSheet.getTotalLiabilities());
			chartService.addBalanceSheet(balanceSheet);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW BALANCE SHEET");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FAD);
			notification.setMessage("Updated 'Balance Sheet'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.balancesheet.add"));
		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ERROR WHILE ADDING BALANCE SHEET");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.balancesheet.add"));
		}

		return "redirect:/dashboard/internal/FAD/balanceSheet";

	}

	@RequestMapping(value = "/incomeStatement")
	public String internalFADIncomeStatement(Model model) {

		IncomeStatement incomeStatement = new IncomeStatement();
		incomeStatement.setYear(getCurrentYear());

		model.addAttribute("incomeStatement", incomeStatement);

		return "fad/internalDashboardFADIncomeStatement";

	}

	@RequestMapping(value = "/incomeStatement", method = RequestMethod.POST)
	public String internalFADIncomeStatement(
			@Valid IncomeStatement incomeStatement,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fad/internalDashboardFADIncomeStatement";
		}

		// add & log
		try {

			chartService.addIncomeStatement(incomeStatement);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW INCOME STATEMENT");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FAD);
			notification.setMessage("Updated 'Income Statement'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.incomestatement.add"));

		} catch (Exception e) {
			loggerUtil
					.log(SecurityContextHolder.getContext().getAuthentication(),
							"ERROR WHILE ADDING INCOME STATEMENT");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.incomestatement.add"));
		}

		return "redirect:/dashboard/internal/FAD/incomeStatement";

	}

	@RequestMapping(value = "/projectedActualIncome")
	public String internalFADProjectedActualIncome(Model model) {

		ProjectedActualIncome pa = chartService
				.getLatestProjectedActualIncome();

		if (pa == null) {
			pa = new ProjectedActualIncome();
		}

		// get values for projected income
		ProjectedActualIncome2 pa2 = chartService
				.getLatestProjectedActualIncome2();

		// new projected income
		ProjectedActualIncome2 pa3 = new ProjectedActualIncome2();

		model.addAttribute("projectedActualIncome", pa);
		model.addAttribute("projectedActualIncome2", pa2);
		model.addAttribute("newProjectedActualIncome", pa3);

		return "fad/internalDashboardFADProjectedActualIncome";

	}

	@RequestMapping(value = "/projectedActualIncome", method = RequestMethod.POST)
	public String internalFADProjectedActualIncome(
			@Valid ProjectedActualIncome projectedActualIncome,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fad/internalDashboardFADProjectedActualIncome";
		}

		// add & log
		try {

			if (chartService.getLatestProjectedActualIncome2()
					.getProjectedIncome() != null
					&& chartService.getLatestProjectedActualIncome2()
							.getProjectedIncome().doubleValue() > projectedActualIncome
							.getactualIncome().doubleValue()) {

				projectedActualIncome.setactualIncome(projectedActualIncome
						.getactualInterest()
						.add(projectedActualIncome.getactualDividend())
						.add(projectedActualIncome.getactualGainOnSale())
						.add(projectedActualIncome.getactualRental())
						.add(projectedActualIncome.getActualOtherIncome()));

				chartService.addProjectedActualIncome(projectedActualIncome);
				loggerUtil.log(SecurityContextHolder.getContext()
						.getAuthentication(),
						"ADDED NEW PROJECTED ACTUAL INCOME");

				// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
				Notification notification = new Notification();
				notification.setGroup(GroupHelper.FAD);
				notification.setMessage("Updated 'Projected Actual Income'");

				List<User> usersNotified = userService.getTacticalUsers();

				if (usersNotified != null) {
					for (User u : usersNotified) {
						notification.setUserId(u.getId());
						notifierService.addNotification(notification);
					}
				}
				// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

				attr.addFlashAttribute("success", PropertiesUtil
						.getProperty("success.projectedactualincome.add"));

			} else {
				attr.addFlashAttribute("error", PropertiesUtil
						.getProperty("error.projectedactualincome.invalid"));
			}

		} catch (Exception e) {
			e.printStackTrace();
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR WHILE ADDING PROJECTED ACTUAL INCOME");
			attr.addFlashAttribute("error", PropertiesUtil
					.getProperty("error.projectedactualincome.add"));
		}

		return "redirect:/dashboard/internal/FAD/projectedActualIncome";

	}

	@RequestMapping(value = "/projectedActualIncome2", method = RequestMethod.POST)
	public String internalFADProjectedActualIncome2(
			@Valid ProjectedActualIncome2 projectedActualIncome2,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		ProjectedActualIncome pa = new ProjectedActualIncome();

		// get values for projected income
		ProjectedActualIncome2 pa2 = chartService
				.getLatestProjectedActualIncome2();

		// new projected income
		ProjectedActualIncome2 pa3 = new ProjectedActualIncome2();

		model.addAttribute("projectedActualIncome", pa);
		model.addAttribute("projectedActualIncome2", pa2);
		model.addAttribute("newProjectedActualIncome", pa3);

		if (bindingResult.hasErrors()) {
			return "fad/internalDashboardFADProjectedActualIncome";
		}

		// add & log
		try {

			// check if projected income is greater than actual income
			ProjectedActualIncome projectedActualIncome = chartService
					.getLatestProjectedActualIncome();
			ProjectedActualIncome2 projectedActualIncomeTwo = chartService
					.getLatestProjectedActualIncome2();

			if (projectedActualIncome != null && projectedActualIncome2 != null) {

				if (projectedActualIncome2.getProjectedIncome().doubleValue() < projectedActualIncome
						.getactualIncome().doubleValue()) {
					attr.addFlashAttribute("error", PropertiesUtil
							.getProperty("error.projectedincome.invalid"));
					return "redirect:/dashboard/internal/FAD/projectedActualIncome";
				}

				// get total
				// projectedActualIncome2.setProjectedIncome(
				// projectedActualIncome2.getProjectedInterest() +
				// projectedActualIncome2.getProjectedDividend() +
				// projectedActualIncome2.getProjectedGainOnSale() +
				// projectedActualIncome2.getProjectedRental() +
				// projectedActualIncome2.getProjectedOtherIncome()
				// );

				projectedActualIncome2
						.setProjectedIncome(projectedActualIncome2
								.getProjectedInterest()
								.add(projectedActualIncome2
										.getProjectedDividend())
								.add(projectedActualIncome2
										.getProjectedGainOnSale())
								.add(projectedActualIncome2
										.getProjectedRental())
								.add(projectedActualIncome2
										.getProjectedOtherIncome()));

				chartService.addProjectedActualIncome2(projectedActualIncome2);
				loggerUtil.log(SecurityContextHolder.getContext()
						.getAuthentication(), "ADDED NEW PROJECTED INCOME");

				// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
				Notification notification = new Notification();
				notification.setGroup(GroupHelper.FAD);
				notification.setMessage("Updated 'Projected Income'");

				List<User> usersNotified = userService.getTacticalUsers();

				if (usersNotified != null) {
					for (User u : usersNotified) {
						notification.setUserId(u.getId());
						notifierService.addNotification(notification);
					}
				}
				// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

				attr.addFlashAttribute("success", PropertiesUtil
						.getProperty("success.projectedincome.add"));

			} else {
				// just add projected income
				chartService.addProjectedActualIncome2(projectedActualIncome2);
				loggerUtil.log(SecurityContextHolder.getContext()
						.getAuthentication(), "ADDED NEW PROJECTED INCOME");

				// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
				Notification notification = new Notification();
				notification.setGroup(GroupHelper.FAD);
				notification.setMessage("Updated 'Projected Income'");

				List<User> usersNotified = userService.getTacticalUsers();

				if (usersNotified != null) {
					for (User u : usersNotified) {
						notification.setUserId(u.getId());
						notifierService.addNotification(notification);
					}
				}
				// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

				attr.addFlashAttribute("success", PropertiesUtil
						.getProperty("success.projectedincome.add"));
			}

		} catch (Exception e) {
			e.printStackTrace();
			loggerUtil
					.log(SecurityContextHolder.getContext().getAuthentication(),
							"ERROR WHILE ADDING PROJECTED INCOME");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.projectedincome.add"));
		}

		return "redirect:/dashboard/internal/FAD/projectedActualIncome";

	}

	// BUDGET UTILIZATION
	@RequestMapping(value = "/buPersonalServices")
	public String internalFADBuPersonalServices(Model model) {

		BUPersonalServices buPersonalServices = new BUPersonalServices();
		buPersonalServices.setYear(getCurrentYear());

		model.addAttribute("buPersonalServices", buPersonalServices);
		model.addAttribute("months", AppHelper.getMonths());

		return "fad/internalDashboardFADBuPersonalServices";

	}

	@RequestMapping(value = "/buPersonalServices", method = RequestMethod.POST)
	public String internalFADBuPersonalServices(
			@Valid BUPersonalServices buPersonalServices,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fad/internalDashboardFADBuPersonalServices";
		}

		// add & log
		try {

			chartService.addBUPersonalServices(buPersonalServices);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ADDED NEW BUDGET UTILIZATION (PERSONAL SERVICES)");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FAD);
			notification
					.setMessage("Updated 'Budget Utilization (Personal Services)'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute(
					"success",
					PropertiesUtil
							.getProperty("success.budgetutilizationpersonalservices.add"));

		} catch (Exception e) {
			e.printStackTrace();
			loggerUtil
					.log(SecurityContextHolder.getContext().getAuthentication(),
							"ERROR WHILE ADDING BUDGET UTILIZATION (PERSONAL SERVICES)");
			attr.addFlashAttribute("error", PropertiesUtil
					.getProperty("error.budgetutilizationpersonalservices.add"));
		}

		return "redirect:/dashboard/internal/FAD/buPersonalServices";

	}

	@RequestMapping(value = "/buMooe")
	public String internalFADBuMooe(Model model) {

		BUMooe buMooe = new BUMooe();
		buMooe.setYear(getCurrentYear());

		model.addAttribute("buMooe", buMooe);
		model.addAttribute("months", AppHelper.getMonths());

		return "fad/internalDashboardFADBuMooe";

	}

	@RequestMapping(value = "/buMooe", method = RequestMethod.POST)
	public String internalFADBuMooe(@Valid BUMooe buMooe,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fad/internalDashboardFADBuMooe";
		}

		// add & log
		try {

			chartService.addBUMooe(buMooe);
			loggerUtil
					.log(SecurityContextHolder.getContext().getAuthentication(),
							"ADDED NEW BUDGET UTILIZATION (MAINTENANCE & OTHER OPERATING EXPENSES)");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FAD);
			notification
					.setMessage("Updated 'Budget Utilization (Maintenance & Other Operating Expenses)'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success", PropertiesUtil
					.getProperty("success.budgetutilizationmooe.add"));

		} catch (Exception e) {
			e.printStackTrace();
			loggerUtil
					.log(SecurityContextHolder.getContext().getAuthentication(),
							"ERROR WHILE ADDING BUDGET UTILIZATION (MAINTENANCE & OTHER OPERATING EXPENSES)");
			attr.addFlashAttribute("error", PropertiesUtil
					.getProperty("error.budgetutilizationmooe.add"));
		}

		return "redirect:/dashboard/internal/FAD/buMooe";

	}

	@RequestMapping(value = "/buCapitalExpenditures")
	public String internalFADBuCapitalExpenditures(Model model) {

		BUCapitalExpenditures buCapitalExpenditures = new BUCapitalExpenditures();
		buCapitalExpenditures.setYear(getCurrentYear());

		model.addAttribute("buCapitalExpenditures", buCapitalExpenditures);
		model.addAttribute("months", AppHelper.getMonths());

		return "fad/internalDashboardFADBuCapitalExpenditures";

	}

	@RequestMapping(value = "/buCapitalExpenditures", method = RequestMethod.POST)
	public String internalFADBuCapitalExpenditures(
			@Valid BUCapitalExpenditures buCapitalExpenditures,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fad/internalDashboardFADBuCapitalExpenditures";
		}

		// add & log
		try {

			chartService.addBUCapitalExpenditures(buCapitalExpenditures);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ADDED NEW BUDGET UTILIZATION (CAPITAL EXPENDITURES)");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FAD);
			notification
					.setMessage("Updated 'Budget Utilization (Capital Expenditures)'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute(
					"success",
					PropertiesUtil
							.getProperty("success.budgetutilizationcapitalexpenditures.add"));

		} catch (Exception e) {
			e.printStackTrace();
			loggerUtil
					.log(SecurityContextHolder.getContext().getAuthentication(),
							"ERROR WHILE ADDING BUDGET UTILIZATION (CAPITAL EXPENDITURES)");
			attr.addFlashAttribute(
					"error",
					PropertiesUtil
							.getProperty("error.budgetutilizationcapitalexpenditures.add"));
		}

		return "redirect:/dashboard/internal/FAD/buCapitalExpenditures";

	}

	@RequestMapping(value = "/collectionEfficiency")
	public String internalFADCollectionEfficiency(Model model) {

		CollectionEfficiency collectionEfficiency = new CollectionEfficiency();
		collectionEfficiency.setYear(getCurrentYear());

		model.addAttribute("collectionEfficiency", collectionEfficiency);
		model.addAttribute("months", AppHelper.getMonths());

		return "fad/internalDashboardFADCollectionEfficiency";

	}

	@RequestMapping(value = "/collectionEfficiency", method = RequestMethod.POST)
	public String internalFADCollectionEfficiency(
			@Valid CollectionEfficiency collectionEfficiency,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fad/internalDashboardFADCollectionEfficiency";
		}

		// add & log
		try {

			chartService.addCollectionEfficiency(collectionEfficiency);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW COLLECTION EFFICIENCY");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FAD);
			notification.setMessage("Updated 'Collection Efficiency'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success", PropertiesUtil
					.getProperty("success.collectionefficiency.add"));

		} catch (Exception e) {
			e.printStackTrace();
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR WHILE ADDING COLLECTION EFFICIENCY");
			attr.addFlashAttribute("error", PropertiesUtil
					.getProperty("error.collectionefficiency.add"));
		}

		return "redirect:/dashboard/internal/FAD/collectionEfficiency";

	}

	@RequestMapping(value = "/actualIncomeExpense")
	public String internalFADActualIncomeExpense(Model model) {

		
		ActualIncomeExpense ai = chartService.getLatestActualIncomeExpense();
		
		if(ai != null) {
			
			ai.setActualAdvertising(0.0);
			ai.setActualAthletics(0.0);
			ai.setActualAuditing(0.0);
			ai.setActualBoardExpenses(0.0);
			ai.setActualChristmasAnniversary(0.0);
			ai.setActualCommunicationService(0.0);
			ai.setActualConsultancy(0.0);
			ai.setActualExtraordinary(0.0);
			ai.setActualJanitorial(0.0);
			ai.setActualLegal(0.0);
			ai.setActualLightWater(0.0);
			ai.setActualMeetings(0.0);
			ai.setActualMemberships(0.0);
			ai.setActualMessengerial(0.0);
			ai.setActualMisc(0.0);
			ai.setActualOtherMisc(0.0);
			ai.setActualRentals(0.0);
			ai.setActualRepairFacilities(0.0);
			ai.setActualRepairVehicles(0.0);
			ai.setActualSecurity(0.0);
			ai.setActualSubscription(0.0);
			ai.setActualSuppliesMaterials(0.0);
			ai.setActualTaxes(0.0);
			ai.setActualTraining(0.0);
			ai.setActualTravelling(0.0);
			ai.settotalIncome(0.0);
			
			model.addAttribute("actualIncomeExpense", ai);
			ai.setYear(getCurrentYear());
		} else {
			ActualIncomeExpense ai2 = new ActualIncomeExpense();
			model.addAttribute("actualIncomeExpense", ai2);
			ai2.setYear(getCurrentYear());
		}

		model.addAttribute("months", AppHelper.getMonths());
		

		return "fad/internalDashboardFADActualIncomeExpense";

	}

	@RequestMapping(value = "/actualIncomeExpense", method = RequestMethod.POST)
	public String internalFADActualIncomeExpense(
			@Valid ActualIncomeExpense actualIncomeExpense,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fad/internalDashboardFADActualIncomeExpense";
		}

		// add & log
		try {

			chartService.addActualIncomeExpense(actualIncomeExpense);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW ACTUAL INCOME EXPENSE");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FAD);
			notification
					.setMessage("Updated 'Actual Income and Actual Expense'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success", PropertiesUtil
					.getProperty("success.actualincomeexpense.add"));

		} catch (Exception e) {
			e.printStackTrace();
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR WHILE ADDING ACTUAL INCOME EXPENSE");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.actualincomeexpense.add"));
		}

		return "redirect:/dashboard/internal/FAD/actualIncomeExpense";

	}

	// AJAX FOR BUDGET UTILIZATION
	@RequestMapping(value = "/GetPersonalServices", method = RequestMethod.POST)
	public @ResponseBody
	String getPersonalServices(Model model) {

		Gson gson = new Gson();
		Response response = new Response();

		BUPersonalServices buPersonalServices = chartService
				.getLatestBUPersonalServices();

		if (buPersonalServices != null) {
			response.setMessage("SUCCESS");
			response.setStatus(true);
			response.setData(gson.toJson(buPersonalServices));
		} else {
			response.setMessage("FAILED");
			response.setStatus(false);
		}

		return gson.toJson(response);

	}

	@RequestMapping(value = "/GetMooe", method = RequestMethod.POST)
	public @ResponseBody
	String getMooe(Model model) {

		Gson gson = new Gson();
		Response response = new Response();

		BUMooe buMooe = chartService.getLatestBUMooe();

		if (buMooe != null) {
			response.setMessage("SUCCESS");
			response.setStatus(true);
			response.setData(gson.toJson(buMooe));
		} else {
			response.setMessage("FAILED");
			response.setStatus(false);
		}

		return gson.toJson(response);

	}

	@RequestMapping(value = "/GetCapitalExpenditures", method = RequestMethod.POST)
	public @ResponseBody
	String getCapitalExpenditures(Model model) {

		Gson gson = new Gson();
		Response response = new Response();

		BUCapitalExpenditures buCapitalExpenditures = chartService
				.getLatestBUCapitalExpenditures();

		if (buCapitalExpenditures != null) {
			response.setMessage("SUCCESS");
			response.setStatus(true);
			response.setData(gson.toJson(buCapitalExpenditures));
		} else {
			response.setMessage("FAILED");
			response.setStatus(false);
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
