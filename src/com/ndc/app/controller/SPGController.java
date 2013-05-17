package com.ndc.app.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ndc.app.AppHelper;
import com.ndc.app.GroupHelper;
import com.ndc.app.model.Document;
import com.ndc.app.model.Notification;
import com.ndc.app.model.Shareholders;
import com.ndc.app.model.SpgBalanceSheet;
import com.ndc.app.model.SpgCashFlow;
import com.ndc.app.model.SpgCategory;
import com.ndc.app.model.SpgIncomeStatement;
import com.ndc.app.model.SpgSubCategory;
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
@RequestMapping(value = "/dashboard/internal/SPG")
public class SPGController {

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

	// SPG DASHBOARD
	@RequestMapping
	public String internalSPG(Model model) {
		return "spg/internalDashboardSPG";
	}

	@RequestMapping(value = "/shareholders")
	public String internalSPGShareholders(Model model) {

		Shareholders shareholders = new Shareholders();
		model.addAttribute("shareholders", shareholders);

		model.addAttribute("particulars", spgService.getAllParticulars());

		return "spg/internalDashboardSPGShareholders";

	}

	@RequestMapping(value = "/shareholders", method = RequestMethod.POST)
	public String internalSPGShareholders(@Valid Shareholders shareholders,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "spg/internalDashboardSPGShareholders";
		}

		// add & log
		try {

			chartService.addShareholders(shareholders);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW SHAREHOLDER");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.SPG);
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

		return "redirect:/dashboard/internal/SPG/shareholders";

	}

	@RequestMapping(value = "/incomeStatement")
	public String internalSPGIncomeStatement(Model model) {

		SpgIncomeStatement spgIncomeStatement = new SpgIncomeStatement();
		spgIncomeStatement.setYear(getCurrentYear()-1);

		model.addAttribute("spgIncomeStatement", spgIncomeStatement);
	
		return "spg/internalDashboardSPGIncomeStatement";

	}

	@RequestMapping(value = "/incomeStatement", method = RequestMethod.POST)
	public String internalSPGIncomeStatement(
			@Valid SpgIncomeStatement spgIncomeStatement,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "spg/internalDashboardSPGIncomeStatement";
		}

		// add & log
		try {

			chartService.addSpgIncomeStatement(spgIncomeStatement);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW SPG INCOME STATEMENT");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.SPG);
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

		return "redirect:/dashboard/internal/SPG/incomeStatement";

	}

	@RequestMapping(value = "/balanceSheet")
	public String internalSPGBalanceSheet(Model model) {

		SpgBalanceSheet spgBalanceSheet = new SpgBalanceSheet();
		spgBalanceSheet.setYear(getCurrentYear()-1);

		model.addAttribute("spgBalanceSheet", spgBalanceSheet);

		return "spg/internalDashboardSPGBalanceSheet";

	}

	@RequestMapping(value = "/balanceSheet", method = RequestMethod.POST)
	public String internalSPGBalanceSheet(
			@Valid SpgBalanceSheet spgBalanceSheet,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "spg/internalDashboardSPGBalanceSheet";
		}

		// add & log
		try {

			chartService.addSpgBalanceSheet(spgBalanceSheet);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW SPG BALANCE SHEET");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.SPG);
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

		return "redirect:/dashboard/internal/SPG/balanceSheet";

	}

	@RequestMapping(value = "/cashFlow")
	public String internalSPGCashFlow(Model model) {

		SpgCashFlow spgCashFlow = new SpgCashFlow();
		spgCashFlow.setYear(getCurrentYear()-1);

		model.addAttribute("spgCashFlow", spgCashFlow);

		return "spg/internalDashboardSPGCashFlow";

	}

	@RequestMapping(value = "/cashFlow", method = RequestMethod.POST)
	public String internalSPGCashFlow(@Valid SpgCashFlow spgCashFlow,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		if (bindingResult.hasErrors()) {
			return "spg/internalDashboardSPGCashFlow";
		}

		// add & log
		try {

			chartService.addSpgCashFlow(spgCashFlow);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), "ADDED NEW SPG CASH FLOW");

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.SPG);
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

		return "redirect:/dashboard/internal/SPG/cashFlow";

	}

	@RequestMapping(value = "/upload")
	public String internalSPGUpload(Model model) {

		Document document = new Document();
		model.addAttribute("document", document);

		String[] categories = PropertiesUtil
				.getProperty("disclosure.categories").toString().split(",");
		model.addAttribute("categories", categories);

		return "spg/internalDashboardSPGUpload";

	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String internalSPGUpload(@Valid Document document,
			BindingResult bindingResult,
			@RequestParam(value = "file") MultipartFile file, Model model,
			HttpServletRequest request, RedirectAttributes attr) {

		String[] categories = PropertiesUtil
				.getProperty("disclosure.categories").toString().split(",");
		model.addAttribute("categories", categories);

		if (bindingResult.hasErrors()) {
			return "spg/internalDashboardSPGUpload";
		}

		if (file.isEmpty()) {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.file.empty"));
			return "spg/internalDashboardSPGUpload";
		}

		if (!file.getContentType().equals("application/pdf")) {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.file.invalid"));
			return "spg/internalDashboardSPGUpload";
		}

		try {

			document.setDateUpdated(new Date());
			document.setUpdatedBy(AuthenticationUtil.getAuthenticationDetails()
					.getName());
			document.setDescription(document.getDescription());
			document.setFilename(AppHelper.generateFilename() + ".pdf");

			userService.addDocument(document);
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(),
					"UPLOADED NEW DOCUMENT '" + document.getFilename() + "'");

			String uploadDir = PropertiesUtil.getProperty("default.upload.dir");

			if (document.getCategory().equals(AppHelper.ASEAN)) {
				uploadDir = PropertiesUtil.getProperty("upload.dir.asean");
			} else if (document.getCategory().equals(AppHelper.MINING)) {
				uploadDir = PropertiesUtil.getProperty("upload.dir.mining");
			} else if (document.getCategory().equals(AppHelper.ENERGY)) {
				uploadDir = PropertiesUtil.getProperty("upload.dir.energy");
			} else if (document.getCategory().equals(AppHelper.INDUSTRIAL)) {
				uploadDir = PropertiesUtil.getProperty("upload.dir.industrial");
			} else if (document.getCategory().equals(AppHelper.REAL_ESTATE)) {
				uploadDir = PropertiesUtil.getProperty("upload.dir.realestate");
			} else if (document.getCategory().equals(AppHelper.OTHERS)) {
				uploadDir = PropertiesUtil.getProperty("upload.dir.others");
			}

			File f = new File(uploadDir + document.getFilename());
			FileUtils.writeByteArrayToFile(f, file.getBytes());

			// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
			Notification notification = new Notification();
			notification.setGroup(GroupHelper.SPG);
			notification
					.setMessage("Updated New Document <a target='_blank' href='"
							+ uploadDir
							+ document.getFilename()
							+ "'> "
							+ document.getFilename() + " </a>");
			notification
					.setMessage("Updated New Document <a target='_blank' href='"
							+ request.getContextPath()
							+ "/download/"
							+ document.getCategory()
							+ "/"
							+ document.getFilename()
							+ "'> "
							+ document.getFilename() + " </a>");

			List<User> usersNotified = userService.getTacticalUsers();

			if (usersNotified != null) {
				for (User u : usersNotified) {
					notification.setUserId(u.getId());
					notifierService.addNotification(notification);
				}
			}

			// /////////////////////////////////////////////////////////////////////////////////////////////////////////////

			attr.addFlashAttribute("success",
					PropertiesUtil.getProperty("success.file.upload"));
			attr.addFlashAttribute("fileLocation", f.getAbsolutePath());

		} catch (Exception e) {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.file.exception"));
			return "spg/internalDashboardSPGUpload";
		}

		return "redirect:/dashboard/internal/SPG/upload";

	}

	@RequestMapping(value = "/disclosures")
	public String internalSPGDisclosures(Model model) {

		List<Document> documents = userService.getAllDocuments();
		model.addAttribute("documents", documents);

		return "spg/internalDashboardSPGDisclosures";

	}
	
	@RequestMapping(value="/existing/{id}", method=RequestMethod.GET)
	public String displaySpgProject(@PathVariable(value="id") Long id, Model model) {
		
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
		
		return "spg/spgExistingTemplate";
		
	}
	
	@RequestMapping(value="/project_ndcSchool")
	public String ndcSchool(Model model) {
		return "spg/project_ndcSchool";
	}
	
	@RequestMapping(value="/project_FCIE")
	public String FCIE(Model model) {
		return "spg/project_FCIE";
	}
	
	@RequestMapping(value="/project_foodExchange")
	public String foodExchange(Model model) {
		return "spg/project_foodExchange";
	}
	
	@RequestMapping(value="/project_mini-hydro")
	public String miniHydro(Model model) {
		return "spg/project_mini-hydro";
	}
	
	@RequestMapping(value="/project_redondo")
	public String redondo(Model model) {
		return "spg/project_redondo";
	}
	
	@RequestMapping(value="/project_biomass")
	public String biomass(Model model) {
		return "spg/project_bioMass";
	}
	
	@RequestMapping(value="/project_rubberProcessing")
	public String rubberProcessing(Model model) {
		return "spg/project_rubberProcessing";
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
	
	@ModelAttribute("spgCategories")
	public List<SpgCategory> getCategories() {
		return spgService.getCategories();
	}

}
