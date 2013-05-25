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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ndc.app.GroupHelper;
import com.ndc.app.model.MaintenanceCost;
import com.ndc.app.model.Notification;
import com.ndc.app.model.Occupancy;
import com.ndc.app.model.Shareholders;
import com.ndc.app.model.SourcesFunds;
import com.ndc.app.model.SpgBalanceSheet;
import com.ndc.app.model.SpgCashFlow;
import com.ndc.app.model.SpgCategory;
import com.ndc.app.model.SpgIncomeStatement;
import com.ndc.app.model.SpgSubCategory;
import com.ndc.app.model.StatusAssets;
import com.ndc.app.model.User;
import com.ndc.app.service.ChartService;
import com.ndc.app.service.LoggerService;
import com.ndc.app.service.NotifierService;
import com.ndc.app.service.SpgService;
import com.ndc.app.service.UserService;
import com.ndc.app.util.AuthenticationUtil;
import com.ndc.app.util.LoggerUtil;
import com.ndc.app.util.PropertiesUtil;

@Controller
@RequestMapping(value = "/dashboard/internal/AMG")
public class AMGController {

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
	
	@Autowired
	@Qualifier("spgService")
	private SpgService spgService;

	// AMG DASHBOARD
	@RequestMapping
	public String internalAMG(Model model) {
		return "amg/internalDashboardAMG";
	}

	@RequestMapping(value = "/occupancy")
	public String internalAMGOccupancy(Model model) {

		Occupancy occupancy = new Occupancy();
		model.addAttribute("occupancy", occupancy);

		return "amg/internalDashboardAMGOccupancy";

	}

	@RequestMapping(value = "/occupancy", method = RequestMethod.POST)
	public String internalAMGOccupancy(@Valid Occupancy occupancy,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "amg/internalDashboardAMGOccupancy";
		}

		try {

			// add occupancy and log and notify
			chartService.addOccupancyChart(occupancy);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW OCCUPANCY CHART");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.AMG);
			notification.setMessage("Updated 'Occupancy Chart'");

			List<User> usersNotified = userService.getTacticalUsers();
			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.occupancy.add"));

		} catch (Exception e) {
			e.printStackTrace();
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR OCCURRED WHILE ADDING OCCUPANCY CHART");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.occupancy.add"));
		}

		return "redirect:/dashboard/internal/AMG/occupancy";

	}

	@RequestMapping(value = "/maintenanceCost")
	public String internalAMGMaintenanceCost(Model model) {

		MaintenanceCost maintenanceCost = new MaintenanceCost();
		maintenanceCost.setYear(getCurrentYear());

		model.addAttribute("maintenanceCost", maintenanceCost);

		return "amg/internalDashboardAMGMaintenanceCost";

	}

	@RequestMapping(value = "/maintenanceCost", method = RequestMethod.POST)
	public String internalAMGMaintenanceCost(
			@Valid MaintenanceCost maintenanceCost,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "amg/internalDashboardAMGMaintenanceCost";
		}

		try {

			// add maintenance cost and log
			chartService.addMaintenanceCost(maintenanceCost);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW MAINTENANCE COST");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.AMG);
			notification.setMessage("Updated 'Occupancy Chart'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.maintenancecost.add"));

		} catch (Exception e) {
			e.printStackTrace();
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR OCCURRED WHILE ADDING MAINTENANCE COST");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.maintenancecost.add"));
		}

		return "redirect:/dashboard/internal/AMG/maintenanceCost";

	}

	@RequestMapping(value = "/sourcesFunds")
	public String internalAMGSourcesFunds(Model model) {

		SourcesFunds sourcesFunds = new SourcesFunds();
		sourcesFunds.setYear(getCurrentYear());

		model.addAttribute("sourcesFunds", sourcesFunds);

		return "amg/internalDashboardAMGSourcesFunds";

	}

	@RequestMapping(value = "/sourcesFunds", method = RequestMethod.POST)
	public String internalAMGSourcesFunds(@Valid SourcesFunds sourcesFunds,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "amg/internalDashboardAMGSourcesFunds";
		}

		try {

			// add sources of funds and log
			chartService.addSourcesFunds(sourcesFunds);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW SOURCES & USES OF FUNDS");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.AMG);
			notification.setMessage("Updated 'Sources & Uses of Funds'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.sourcesfunds.add"));

		} catch (Exception e) {
			e.printStackTrace();
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR OCCURRED WHILE ADDING SOURCES & USES OF FUNDS");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.sourcesfunds.add"));
		}

		return "redirect:/dashboard/internal/AMG/sourcesFunds";

	}

	@RequestMapping(value = "/statusAssets")
	public String internalAMGStatusAssets(Model model) {

		StatusAssets statusAssets = new StatusAssets();
		statusAssets.setYear(getCurrentYear());

		model.addAttribute("statusAssets", statusAssets);

		return "amg/internalDashboardAMGStatusAssets";

	}

	@RequestMapping(value = "/statusAssets", method = RequestMethod.POST)
	public String internalAMGStatusAssets(@Valid StatusAssets statusAssets,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "amg/internalDashboardAMGStatusAssets";
		}

		try {

			// add status of assets and log
			chartService.addStatusAssets(statusAssets);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW STATUS OF ASSETS");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.AMG);
			notification.setMessage("Updated 'Status of Assets'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.statusassets.add"));

		} catch (Exception e) {
			e.printStackTrace();
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR OCCURRED WHILE ADDING STATUS OF ASSETS");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.statusassets.add"));
		}

		return "redirect:/dashboard/internal/AMG/statusAssets";

	}
	
	@RequestMapping(value = "/shareholders")
	public String internalAMGShareholders(Model model) {

		Shareholders shareholders = new Shareholders();
		model.addAttribute("shareholders", shareholders);

		model.addAttribute("particulars", spgService.getAllParticulars());

		return "amg/internalDashboardAMGShareholders";

	}
	
	@RequestMapping(value = "/shareholders", method = RequestMethod.POST)
	public String internalAMGShareholders(@Valid Shareholders shareholders,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "amg/internalDashboardAMGShareholders";
		}

		// add & log
		try {

			chartService.addShareholders(shareholders);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW SHAREHOLDER");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.AMG);
			notification.setMessage("Updated 'Shareholder'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.shareholder.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ERROR WHILE ADDING SHAREHOLDER");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.shareholder.add"));
		}

		return "redirect:/dashboard/internal/AMG/shareholders";

	}
	
	@RequestMapping(value="/existing/{id}", method=RequestMethod.GET)
	public String displayAMGProject(@PathVariable(value="id") Long id, Model model) {
		
		try {
			if(id != null) {
				SpgSubCategory spgSubCategory = spgService.getSubCategoryById(id);
				
				if(spgSubCategory == null)
					return "error/exceptionView";
				
				model.addAttribute("spgSubCategory", spgSubCategory);
				model.addAttribute("shareholders", chartService.getShareholdersByProjectId(spgSubCategory.getId()));
			}
		} catch(Exception e) {
			e.printStackTrace();
			return "error/exceptionView";
		}
		
		return "amg/amgExistingTemplate";
		
	}
	
	@RequestMapping(value = "/incomeStatement")
	public String internalAMGIncomeStatement(Model model) {

		SpgIncomeStatement spgIncomeStatement = new SpgIncomeStatement();
		spgIncomeStatement.setYear(getCurrentYear()-1);

		model.addAttribute("spgIncomeStatement", spgIncomeStatement);
	
		return "amg/internalDashboardAMGIncomeStatement";

	}
	
	@RequestMapping(value = "/incomeStatement", method = RequestMethod.POST)
	public String internalAMGIncomeStatement(
			@Valid SpgIncomeStatement spgIncomeStatement,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "amg/internalDashboardAMGIncomeStatement";
		}

		// add & log
		try {

			chartService.addSpgIncomeStatement(spgIncomeStatement);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW SPG INCOME STATEMENT");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.AMG);
			notification.setMessage("Updated 'Income Statement'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success", PropertiesUtil
					.getProperty("success.spgincomestatement.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR WHILE ADDING SPG INCOME STATEMENT");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.spgincomestatement.add"));
		}

		return "redirect:/dashboard/internal/AMG/incomeStatement";

	}
	
	@RequestMapping(value = "/balanceSheet")
	public String internalAMGBalanceSheet(Model model) {

		SpgBalanceSheet spgBalanceSheet = new SpgBalanceSheet();
		spgBalanceSheet.setYear(getCurrentYear()-1);

		model.addAttribute("spgBalanceSheet", spgBalanceSheet);

		return "amg/internalDashboardAMGBalanceSheet";

	}

	@RequestMapping(value = "/balanceSheet", method = RequestMethod.POST)
	public String internalAMGBalanceSheet(
			@Valid SpgBalanceSheet spgBalanceSheet,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "amg/internalDashboardAMGBalanceSheet";
		}

		// add & log
		try {

			chartService.addSpgBalanceSheet(spgBalanceSheet);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW SPG BALANCE SHEET");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.AMG);
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
					PropertiesUtil.getProperty("success.spgbalancesheet.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR WHILE ADDING SPG BALANCE SHEET");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.spgbalancesheet.add"));
		}

		return "redirect:/dashboard/internal/AMG/balanceSheet";

	}
	
	@RequestMapping(value = "/cashFlow")
	public String internalAMGCashFlow(Model model) {

		SpgCashFlow spgCashFlow = new SpgCashFlow();
		spgCashFlow.setYear(getCurrentYear()-1);

		model.addAttribute("spgCashFlow", spgCashFlow);

		return "amg/internalDashboardAMGCashFlow";

	}

	@RequestMapping(value = "/cashFlow", method = RequestMethod.POST)
	public String internalAMGCashFlow(@Valid SpgCashFlow spgCashFlow,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "amg/internalDashboardAMGCashFlow";
		}

		// add & log
		try {

			chartService.addSpgCashFlow(spgCashFlow);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW SPG CASH FLOW");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.AMG);
			notification.setMessage("Updated 'Cash Flow'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.spgcashflow.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ERROR WHILE ADDING SPG CASH FLOW");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.spgcashflow.add"));
		}

		return "redirect:/dashboard/internal/AMG/cashFlow";

	}
	
	@RequestMapping(value="/luzon")
	public String internalAMGLuzon(Model model) {
		return "amg/luzon_map";
	}
	
	@RequestMapping(value="/visayas")
	public String internallAMGVisayas(Model model) {
		return "amg/visayas_map";
	}
	
	@RequestMapping(value="/mindanao")
	public String internalAMGMindanao(Model model) {
		return "amg/mindanao_map";
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
	
//	@ModelAttribute("realEstateCategory")
//	public SpgCategory getCategory() {
//		return spgService.getCategoryByName("REAL ESTATE");
//	}
	
	@ModelAttribute("spgSubCategories")
	public List<SpgSubCategory> getSubCategories() {
		return spgService.getSubCategories();
	}

}
