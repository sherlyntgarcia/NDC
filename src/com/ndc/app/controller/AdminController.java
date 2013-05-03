package com.ndc.app.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ndc.app.AppHelper;
import com.ndc.app.GroupHelper;
import com.ndc.app.RoleHelper;
import com.ndc.app.model.Log;
import com.ndc.app.model.Options;
import com.ndc.app.model.User;
import com.ndc.app.service.ChartService;
import com.ndc.app.service.LoggerService;
import com.ndc.app.service.NotifierService;
import com.ndc.app.service.UserService;
import com.ndc.app.util.AuthenticationUtil;
import com.ndc.app.util.LoggerUtil;
import com.ndc.app.util.PropertiesUtil;

@Controller
@RequestMapping(value = "/dashboard/admin")
public class AdminController {
	
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

	// ADMIN DASHBOARD
	@RequestMapping
	public String adminDashboard(Model model) {

		List<User> admins = userService.getAllAdmins();
		model.addAttribute("admins", admins);

		return "admin/adminDashboard";

	}

	@RequestMapping(value = "/manageUsers")
	public String manageUsers(
			@RequestParam(required = false, value = "offset") Integer offset,
			Model model) {

		if (offset == null) {
			offset = 0;
		}

		Double maxSize = Double.parseDouble(PropertiesUtil
				.getProperty("PAGING.MAX.SIZE"));
		Double totalUsers = (double) userService.getAll().size();

		List<User> users = userService.getAll();
		model.addAttribute("users", users);
		model.addAttribute("totalPages", (Math.ceil(totalUsers / maxSize)));

		return "admin/adminManageUsers";

	}

	@RequestMapping(value = "/createUsers")
	public String createUsers(Model model) {

		User user = new User();
		user.setActivated(true);

		model.addAttribute("user", user);
		model.addAttribute("groups", GroupHelper.getGroups());
		model.addAttribute("roles", RoleHelper.getRoles());
		model.addAttribute("questions", AppHelper.getQuestions());

		return "admin/adminCreateUsers";

	}

	@RequestMapping(value = "/createUsers", method = RequestMethod.POST)
	public String processCreateUserForm(
			@RequestParam(required = false, value = "confirmPassword") String confirmPassword,
			@Valid User user, BindingResult bindingResult, Model model,
			RedirectAttributes attr) {

		model.addAttribute("groups", GroupHelper.getGroups());
		model.addAttribute("roles", RoleHelper.getRoles());
		model.addAttribute("questions", AppHelper.getQuestions());

		if (bindingResult.hasErrors()) {
			return "admin/adminCreateUsers";
		}

		// check if passwords match
		if (confirmPassword != null) {
			if (!confirmPassword.equals(user.getPassword())) {
				model.addAttribute("error",
						PropertiesUtil.getProperty("error.password.mismatch"));
				return "admin/adminCreateUsers";
			}
		} else {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.password.required"));
			return "admin/adminCreateUsers";
		}

		// check if username is existing
		if (userService.isUsernameExisting(user.getUsername())) {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.username.existing"));
			return "admin/adminCreateUsers";
		}

		// check if email is existing
		if (userService.isEmailExisting(user.getEmail())) {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.email.existing"));
			return "admin/adminCreateUsers";
		}

		// add user to database
		user.setRole(user.getNdcGroup().toUpperCase() + "_"
				+ user.getRole().toUpperCase());
		userService.addUser(user);

		// log
		loggerUtil.log(SecurityContextHolder.getContext().getAuthentication(),
				"ADDED USER WITH ROLE " + user.getRole());

		attr.addFlashAttribute("success",
				PropertiesUtil.getProperty("success.user.creation"));

		return "redirect:/dashboard/admin/createUsers";

	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteUsers(
			@RequestParam(required = true, value = "id") Long id, Model model,
			RedirectAttributes attr) {

		if (id == null) {
			List<User> users = userService.getAll();
			model.addAttribute("users", users);
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.delete.exception"));
			return "admin/adminManageUsers";
		}

		// delete
		User user = userService.getUserDetailsById(id);
		userService.deleteUser(user);

		// log
		loggerUtil.log(SecurityContextHolder.getContext().getAuthentication(),
				"DELETE USER '" + user.getUsername() + "'");

		attr.addFlashAttribute("success",
				PropertiesUtil.getProperty("success.user.deletion"));

		return "redirect:/dashboard/admin/manageUsers";

	}

	@RequestMapping(value = "/modifyUsers")
	public String modifyUsers(Model model) {

		model.addAttribute("activatedUsers", userService.getActivatedUsers());
		model.addAttribute("deactivatedUsers",
				userService.getDeactivatedUsers());

		return "admin/adminModifyUsers";

	}

	@RequestMapping(value = "/modifyUsers", method = RequestMethod.POST)
	public String processModifyUsers(
			@RequestParam(required = false, value = "checkboxes") Long[] checkArray,
			@RequestParam(required = true, value = "status") boolean op,
			Model model, RedirectAttributes attr) {

		model.addAttribute("activatedUsers", userService.getActivatedUsers());
		model.addAttribute("deactivatedUsers",
				userService.getDeactivatedUsers());

		// get checkboxes
		if (checkArray != null) {

			int size = checkArray.length;

			if (size > 0) {

				String str = "";
				for (Long l : checkArray) {
					str += l + " ";
				}

				if (op) {

					// deactivate users
					boolean success = userService
							.bulkDeactivateUsers(checkArray);

					if (success) {

						// log
						loggerUtil.log(SecurityContextHolder.getContext()
								.getAuthentication(),
								"DEACTIVATED USERS WITH ID: " + str);
						attr.addFlashAttribute("success", PropertiesUtil
								.getProperty("success.checkboxes.deactivated"));

					} else {
						model.addAttribute("error", PropertiesUtil
								.getProperty("error.checkboxes.empty"));
						return "admin/adminModifyUsers";
					}

				} else {

					// activate users
					boolean success = userService.bulkActivateUsers(checkArray);

					if (success) {

						// log
						loggerUtil.log(SecurityContextHolder.getContext()
								.getAuthentication(),
								"ACTIVATED USERS WITH ID: " + str);
						attr.addFlashAttribute("success", PropertiesUtil
								.getProperty("success.checkboxes.activated"));

					} else {
						model.addAttribute("error", PropertiesUtil
								.getProperty("error.checkboxes.empty"));
						return "admin/adminModifyUsers";
					}

				}

				return "redirect:/dashboard/admin/modifyUsers";

			} else {
				model.addAttribute("error",
						PropertiesUtil.getProperty("error.checkboxes.empty"));
				return "admin/adminModifyUsers";
			}

		} else {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.checkboxes.empty"));
			return "admin/adminModifyUsers";
		}

	}

	@RequestMapping(value = "/createAdmins")
	public String createAdmins(Model model) {

		User user = new User();
		// user.setRole(RoleHelper.POWER_USER);
		user.setActivated(true);
		user.setLoginAttempts(0);
		user.setNdcGroup("foo");
		user.setSecretQuestion("foo");
		user.setSecretAnswer("foo");

		List<String> admins = new ArrayList<String>();
		admins.add(RoleHelper.POWER_USER);
		admins.add(RoleHelper.TACTICAL_USER);
		model.addAttribute("admins", admins);

		model.addAttribute("user", user);

		return "admin/adminCreateAdmins";

	}

	@RequestMapping(value = "/createAdmins", method = RequestMethod.POST)
	public String processCreateAdmins(
			@RequestParam(required = false, value = "confirmPassword") String confirmPassword,
			@Valid User user, BindingResult bindingResult, Model model,
			RedirectAttributes attr) {

		model.addAttribute("user", user);

		// ///////////////////////////////////////////
		List<String> admins = new ArrayList<String>();
		admins.add(RoleHelper.POWER_USER);
		admins.add(RoleHelper.TACTICAL_USER);
		model.addAttribute("admins", admins);
		// ///////////////////////////////////////////

		if (bindingResult.hasErrors()) {
			return "admin/adminCreateAdmins";
		}

		if (confirmPassword != null) {

			if (!confirmPassword.equals(user.getPassword())) {
				model.addAttribute("error",
						PropertiesUtil.getProperty("error.password.mismatch"));
				return "admin/adminCreateAdmins";
			}

		} else {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.password.required"));
			return "admin/adminCreateAdmins";
		}

		if (userService.isUsernameExisting(user.getUsername())) {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.username.existing"));
			return "admin/adminCreateAdmins";
		}

		if (userService.isEmailExisting(user.getEmail())) {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.email.existing"));
			return "admin/adminCreateAdmins";
		}

		// add admin
		userService.addUser(user);

		// log
		String r = null;

		if (user.getRole().equals(RoleHelper.POWER_USER)) {
			r = "ADMIN";
		} else if (user.getRole().equals(RoleHelper.TACTICAL_USER)) {
			r = "TACTICAL";
		}

		loggerUtil.log(SecurityContextHolder.getContext().getAuthentication(),
				"ADDED " + r + " ACCOUNT: " + user.getUsername());
		attr.addFlashAttribute("success",
				PropertiesUtil.getProperty("success.admin.creation"));

		return "redirect:/dashboard/admin/createAdmins";

	}

	@RequestMapping(value = "/manageLogs")
	public String manageLogs(
			@RequestParam(required = false, value = "offset") Integer offset,
			Model model) {

		if (offset == null) {
			offset = 0;
		}

		// Double maxSize =
		// Double.parseDouble(PropertiesUtil.getProperty("PAGING.MAX.SIZE"));
		// Double totalLogs = (double) loggerService.getAll().size();

		List<Log> logs = loggerService.getAll();
		model.addAttribute("logs", logs);

		return "admin/adminManageLogs";

	}

	@RequestMapping(value = "/edit/{id}")
	public String editUser(@PathVariable(value = "id") Long id, Model model,
			RedirectAttributes attr) {

		User user = null;

		if (id != null) {
			user = userService.getUserDetailsById(id);

			if (user != null) {
				if (user.getRole().equals(RoleHelper.POWER_USER)
						|| user.getRole().equals(RoleHelper.TACTICAL_USER)) {
					attr.addFlashAttribute("error",
							PropertiesUtil.getProperty("error.admin.edit"));
					return "redirect:/dashboard/admin/manageUsers";
				}
			} else {
				attr.addFlashAttribute("error",
						PropertiesUtil.getProperty("error.user.anonymous"));
				return "redirect:/dashboard/admin/manageUsers";
			}
		} else {
			attr.addFlashAttribute("error",
					PropertiesUtil.getProperty("error.user.anonymous"));
			return "redirect:/dashboard/admin/manageUsers";
		}

		model.addAttribute("user", user);
		model.addAttribute("questions", AppHelper.getQuestions());
		model.addAttribute("groups", GroupHelper.getGroups());
		model.addAttribute("roles", RoleHelper.getRoles());

		return "admin/adminEditUsers";

	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public String updateUser(
			@RequestParam(value = "confirmPassword") String confirmPassword,
			@PathVariable("id") Long id, @Valid User user,
			BindingResult bindingResult, Model model, RedirectAttributes attr) {

		model.addAttribute("questions", AppHelper.getQuestions());
		model.addAttribute("groups", GroupHelper.getGroups());
		model.addAttribute("roles", RoleHelper.getRoles());

		if (bindingResult.hasErrors()) {
			return "admin/adminEditUsers";
		}

		if (!confirmPassword.equals(user.getPassword())) {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.password.mismatch"));
			return "admin/adminEditUsers";
		}
		
		// check if email is existing
		if (userService.isEmailExisting(user.getEmail())) {
			model.addAttribute("error",
					PropertiesUtil.getProperty("error.email.existing"));
			return "admin/adminCreateUsers";
		}

		// update
		user.setRole(user.getNdcGroup().toUpperCase() + "_"
				+ user.getRole().toUpperCase());
		userService.updateUser(user);

		// log this!
		loggerUtil.log(
				SecurityContextHolder.getContext().getAuthentication(),
				"UPDATED USER '" + user.getUsername() + "' WITH EMAIL '"
						+ user.getEmail());

		attr.addFlashAttribute("success",
				PropertiesUtil.getProperty("success.user.update"));

		return "redirect:/dashboard/admin/edit/" + user.getId();

	}
	
	@RequestMapping(value="/options")
	public String renderOptions(Model model) {
		
		Options o = userService.getFeedback();
		
		if(o != null)
			model.addAttribute("options", o);
		else {
			model.addAttribute("options", new Options());
		}
		
		return "admin/options";
		
	}
	
	@RequestMapping(value="/options", method = RequestMethod.POST)
	public String saveRenderOptions(@Valid Options options, BindingResult bindingResult, Model model, RedirectAttributes attr) {
		
		if(bindingResult.hasErrors()) {
			return "admin/options";
		}
		
		//add to table
		userService.addFeedback(options);
		
		// log this!
		loggerUtil.log(
			SecurityContextHolder.getContext().getAuthentication(),
				"UPDATED SYSTEM SETTINGS");
		
		attr.addFlashAttribute("success", PropertiesUtil.getProperty("success.email.options"));
		
		return "redirect:/dashboard/admin/options";
		
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
