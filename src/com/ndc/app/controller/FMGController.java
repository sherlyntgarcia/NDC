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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ndc.app.AppHelper;
import com.ndc.app.GroupHelper;
import com.ndc.app.model.AgriAgraBonds;
import com.ndc.app.model.BondMaturity;
import com.ndc.app.model.BondsIssued;
import com.ndc.app.model.EconomicImpact;
import com.ndc.app.model.NetLending;
import com.ndc.app.model.NiaLoanCollection;
import com.ndc.app.model.NiaLoanProceedsAllocation;
import com.ndc.app.model.NiaLoanProceedsUtilization;
import com.ndc.app.model.Notification;
import com.ndc.app.model.PdstFRates;
import com.ndc.app.model.PrincipalCouponPayments;
import com.ndc.app.model.User;
import com.ndc.app.service.ChartService;
import com.ndc.app.service.LoggerService;
import com.ndc.app.service.NotifierService;
import com.ndc.app.service.UserService;
import com.ndc.app.util.AuthenticationUtil;
import com.ndc.app.util.LoggerUtil;
import com.ndc.app.util.PropertiesUtil;

@Controller
@RequestMapping(value = "/dashboard/internal/FMG")
public class FMGController {

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

	// FMG DASHBOARD
	@RequestMapping
	public String internalFMG(Model model) {
		return "fmg/internalDashboardFMG";
	}

	@RequestMapping(value = "/bondsIssued")
	public String internalFMGBondsIssued(Model model) {

		BondsIssued bondsIssued = new BondsIssued();
		bondsIssued.setYear(getCurrentYear());

		model.addAttribute("bondsIssued", bondsIssued);

		return "fmg/internalDashboardFMGBondsIssued";

	}

	@RequestMapping(value = "/bondsIssued", method = RequestMethod.POST)
	public String internalFMGBondsIssued(@Valid BondsIssued bondsIssued,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fmg/internalDashboardFMGBondsIssued";
		}

		// add & log
		try {

			chartService.addBondsIssued(bondsIssued);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW BONDS ISSUED");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FMG);
			notification.setMessage("Updated 'Bonds Issued'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.bondsissued.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ERROR WHILE ADDING BONDS ISSUED");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.bondsissued.add"));
		}

		return "redirect:/dashboard/internal/FMG/bondsIssued";

	}

	@RequestMapping(value = "/bondMaturity")
	public String internalFMGBondMaturity(Model model) {

		BondMaturity bondMaturity = new BondMaturity();
		bondMaturity.setYear(getCurrentYear());

		model.addAttribute("bondMaturity", bondMaturity);

		return "fmg/internalDashboardFMGBondMaturity";

	}

	@RequestMapping(value = "/bondMaturity", method = RequestMethod.POST)
	public String internalFMGBondMaturity(@Valid BondMaturity bondMaturity,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fmg/internalDashboardFMGBondMaturity";
		}

		// add & log
		try {

			chartService.addBondMaturity(bondMaturity);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW BOND MATURITY");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FMG);
			notification.setMessage("Updated 'Bond Maturity'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.bondmaturity.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ERROR WHILE ADDING BOND MATURITY");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.bondmaturity.add"));
		}

		return "redirect:/dashboard/internal/FMG/bondMaturity";

	}

	@RequestMapping(value = "/principalCouponPayments")
	public String internalFMGPrincipalCouponPayments(Model model) {

		PrincipalCouponPayments pcPayments = new PrincipalCouponPayments();
		pcPayments.setYear(getCurrentYear());

		model.addAttribute("pcPayments", pcPayments);

		return "fmg/internalDashboardFMGPrincipalCouponPayments";

	}

	@RequestMapping(value = "/principalCouponPayments", method = RequestMethod.POST)
	public String internalFMGPrincipalCouponPayments(
			@Valid @ModelAttribute(value = "pcPayments") PrincipalCouponPayments principalCouponPayments,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fmg/internalDashboardFMGPrincipalCouponPayments";
		}

		// add & log
		try {

			chartService.addPrincipalCouponPayments(principalCouponPayments);
			loggerUtil
					.log(SecurityContextHolder.getContext().getAuthentication(),
							"ADDED NEW PRINCIPAL&COUPON PAYMENTS");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FMG);
			notification.setMessage("Updated 'Principal & Coupon Payments'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success", PropertiesUtil
					.getProperty("success.principalcouponpayments.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR WHILE ADDING PRINCIPAL&COUPON PAYMENTS");
			attr.addFlashAttribute("error", PropertiesUtil
					.getProperty("error.principalcouponpayments.add"));
		}

		return "redirect:/dashboard/internal/FMG/principalCouponPayments";

	}

	@RequestMapping(value = "/pdstFRates")
	public String internalFMGPdstFRates(Model model) {

		PdstFRates pdstFRates = new PdstFRates();
		pdstFRates.setYear(getCurrentYear());

		model.addAttribute("pdstFRates", pdstFRates);
		model.addAttribute("months", AppHelper.getMonths());

		return "fmg/internalDashboardFMGPdstFRates";

	}

	@RequestMapping(value = "/pdstFRates", method = RequestMethod.POST)
	public String internalFMGPdstFRates(@Valid PdstFRates pdstFRates,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fmg/internalDashboardFMGPdstFRates";
		}

		// add & log
		try {

			chartService.addPdstFRates(pdstFRates);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW PDST-F RATES");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FMG);
			notification.setMessage("Updated 'PDST-F Rates'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.pdstfrates.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ERROR WHILE ADDING PDST-F RATES");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.pdstfrates.add"));
		}

		return "redirect:/dashboard/internal/FMG/pdstFRates";

	}

	@RequestMapping(value = "/economicImpact")
	public String internalFMGEconomicImpact(Model model) {

		EconomicImpact economicImpact = new EconomicImpact();

		model.addAttribute("economicImpact", economicImpact);

		return "fmg/internalDashboardFMGEconomicImpact";

	}

	@RequestMapping(value = "/economicImpact", method = RequestMethod.POST)
	public String internalFMGEconomicImpact(
			@Valid EconomicImpact economicImpact, BindingResult bindingResult,
			Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fmg/internalDashboardFMGEconomicImpact";
		}

		// add & log
		try {

			chartService.addEconomicImpact(economicImpact);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW ECONOMIC IMPACT");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FMG);
			notification.setMessage("Updated 'Economic Impact'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.economicimpact.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ERROR WHILE ADDING ECONOMIC IMPACT");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.economicimpact.add"));
		}

		return "redirect:/dashboard/internal/FMG/economicImpact";

	}

	@RequestMapping(value = "/niaLoanProceedsUtilization")
	public String internalFMGNiaLoadProceedsUtilization(Model model) {

		NiaLoanProceedsUtilization niaLoanProceedsUtilization = new NiaLoanProceedsUtilization();

		model.addAttribute("niaLoanProceedsUtilization",
				niaLoanProceedsUtilization);

		return "fmg/internalDashboardFMGNiaLoanProceedsUtilization";

	}

	@RequestMapping(value = "/niaLoanProceedsUtilization", method = RequestMethod.POST)
	public String internalFMGNiaLoadProceedsUtilization(
			@Valid NiaLoanProceedsUtilization niaLoanProceedsUtilization,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fmg/internalDashboardFMGNiaLoanProceedsUtilization";
		}

		// add & log
		try {

			chartService
					.addNiaLoanProceedsUtilization(niaLoanProceedsUtilization);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ADDED NEW UTILIZATION OF NIA LOAN PROCEEDS");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FMG);
			notification
					.setMessage("Updated 'Nia Loan Proceeds (Utilization)'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success", PropertiesUtil
					.getProperty("success.nialoanproceedsutilization.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR WHILE ADDING UTILIZATION OF NIA LOAN PROCEEDS");
			attr.addFlashAttribute("error", PropertiesUtil
					.getProperty("error.nialoanproceedsutilization.add"));
		}

		return "redirect:/dashboard/internal/FMG/niaLoanProceedsUtilization";

	}

	@RequestMapping(value = "/niaLoanProceedsAllocation")
	public String internalFMGNiaLoadProceedsAllocation(Model model) {

		NiaLoanProceedsAllocation niaLoanProceedsAllocation = new NiaLoanProceedsAllocation();

		model.addAttribute("niaLoanProceedsAllocation",
				niaLoanProceedsAllocation);

		return "fmg/internalDashboardFMGNiaLoanProceedsAllocation";

	}

	@RequestMapping(value = "/niaLoanProceedsAllocation", method = RequestMethod.POST)
	public String internalFMGNiaLoadProceedsAllocation(
			@Valid NiaLoanProceedsAllocation niaLoanProceedsAllocation,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fmg/internalDashboardFMGNiaLoanProceedsAllocation";
		}

		// add & log
		try {

			chartService
					.addNiaLoanProceedsAllocation(niaLoanProceedsAllocation);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ADDED NEW ALLOCATION OF NIA LOAN PROCEEDS");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FMG);
			notification.setMessage("Updated 'Nia Loan Proceeds (Allocation)'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success", PropertiesUtil
					.getProperty("success.nialoanproceedsallocation.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR WHILE ADDING ALLOCATION OF NIA LOAN PROCEEDS");
			attr.addFlashAttribute("error", PropertiesUtil
					.getProperty("error.nialoanproceedsallocation.add"));
		}

		return "redirect:/dashboard/internal/FMG/niaLoanProceedsAllocation";

	}

	@RequestMapping(value = "/niaLoanCollection")
	public String internalFMGNiaLoanCollection(Model model) {

		NiaLoanCollection niaLoanCollection = new NiaLoanCollection();
		model.addAttribute("niaLoanCollection", niaLoanCollection);

		return "fmg/internalDashboardFMGNiaLoanCollection";

	}

	@RequestMapping(value = "/niaLoanCollection", method = RequestMethod.POST)
	public String internalFMGNiaLoanCollection(
			@Valid NiaLoanCollection niaLoanCollection,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fmg/internalDashboardFMGNiaLoanCollection";
		}

		// add & log
		try {

			chartService.addNiaLoanCollection(niaLoanCollection);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW COLLECTION OF NIA LOAN");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FMG);
			notification.setMessage("Updated 'Nia Loan (Collection)'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.nialoancollection.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"ERROR WHILE ADDING COLLECTION OF NIA LOAN");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.nialoancollection.add"));
		}

		return "redirect:/dashboard/internal/FMG/niaLoanCollection";

	}

	@RequestMapping(value = "/netLending")
	public String internalFMGNetLending(Model model) {

		NetLending netLending = new NetLending();
		netLending.setYear(getCurrentYear());

		model.addAttribute("netLending", netLending);

		return "fmg/internalDashboardFMGNetLending";

	}

	@RequestMapping(value = "/netLending", method = RequestMethod.POST)
	public String internalFMGNetLending(@Valid NetLending netLending,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fmg/internalDashboardFMGNetLending";
		}

		// add & log
		try {

			chartService.addNetLending(netLending);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW NET LENDING");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FMG);
			notification.setMessage("Updated 'Net Lending'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.netlending.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ERROR WHILE ADDING NET LENDING");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.netlending.add"));
		}

		return "redirect:/dashboard/internal/FMG/netLending";

	}

	@RequestMapping(value = "/agriAgraBonds")
	public String internalFMGAgriAgraBonds(Model model) {

		AgriAgraBonds agriAgraBonds = new AgriAgraBonds();
		agriAgraBonds.setYear(getCurrentYear());

		model.addAttribute("agriAgraBonds", agriAgraBonds);

		return "fmg/internalDashboardFMGAgriAgraBonds";

	}

	@RequestMapping(value = "/agriAgraBonds", method = RequestMethod.POST)
	public String internalFMGAgriAgraBonds(@Valid AgriAgraBonds agriAgraBonds,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "fmg/internalDashboardFMGAgriAgraBonds";
		}

		// add & log
		try {

			// total amount must be greater than the sum of the latest three(3)
			// amounts...

			chartService.addAgriAgraBonds(agriAgraBonds);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW AGRI-AGRA BONDS");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.FMG);
			notification.setMessage("Updated 'Agri-Agra Bonds'");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}
			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.agriagrabonds.add"));

		} catch (Exception e) {
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ERROR WHILE ADDING AGRI-AGRA BONDS");
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.agriagrabonds.add"));
		}

		return "redirect:/dashboard/internal/FMG/agriAgraBonds";

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
