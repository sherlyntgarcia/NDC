package com.ndc.app.controller;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ndc.app.RoleHelper;
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
@RequestMapping(value = "/dashboard")
public class DashboardController {

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

	@RequestMapping
	public String dashboard(Model model) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		if (auth != null) {
			for (GrantedAuthority ga : auth.getAuthorities()) {

				/*
				 * IF USER IS A POWER_USER(ADMIN), redirect to /dashboard/admin
				 * (ACCESS: POWER_USER) IF USER IS NOT A POWER_USER: Identify
				 * HIS/HER GROUP: 1.) AMG - redirect to /dashboard/internal/AMG
				 * 2.) FAD - redirect to /dashboard/internal/FAD 3.) FMG -
				 * redirect to /dashboard/internal/FMG 4.) SP - redirect to
				 * /dashboard/internal/SP
				 */

				if (ga.getAuthority().equals(RoleHelper.POWER_USER)) {
					return "redirect:/dashboard/admin";
				} else if (ga.getAuthority().equals(RoleHelper.TACTICAL_USER)) {
					return "redirect:/dashboard/tactical";
				} else {
					String username = auth.getName();
					String group = null;
					User user = userService.getUserDetailsByUsername(username);

					if (user != null) {

						group = user.getNdcGroup();

						if (group.equals("AMG")) {
							return "redirect:/dashboard/internal/AMG";
						} else if (group.equals("FAD")) {
							return "redirect:/dashboard/internal/FAD";
						} else if (group.equals("FMG")) {
							return "redirect:/dashboard/internal/FMG";
						} else if (group.equals("SPG")) {
							return "redirect:/dashboard/internal/SPG";
						} else {

							SecurityContextHolder.clearContext(); // clear
																	// session
																	// of user
							return "error/genericError";

						}

					}
				}
			}
		} else {

			SecurityContextHolder.clearContext(); // clear session of user
			return "error/genericError";

		}

		return "login";

	}

	@RequestMapping(value = "/editProfile")
	public @ResponseBody
	String getProfile(@RequestParam(value = "username") String username) {

		Gson gson = new Gson();
		User user = userService.getUserDetailsByUsername(username);

		return gson.toJson(user);

	}

	@RequestMapping(value = "/editProfileSubmit", method=RequestMethod.POST)
	public @ResponseBody
	String getProfile(@RequestParam(value = "id") Long id,
			@RequestParam(value = "firstName") String firstName,
			@RequestParam(value = "middleName") String middleName,
			@RequestParam(value = "lastName") String lastName,
			@RequestParam(value = "password") String password) {

		Gson gson = new Gson();
		Response response = new Response();

		if (id != null) {

			User user = userService.getUserDetailsById(id);
			user.setFirstName(firstName);
			user.setMiddleName(middleName);
			user.setLastName(lastName);
			user.setPassword(password);

			// update
			userService.updateUser(user);

			// log
			loggerUtil.log(SecurityContextHolder.getContext()
					.getAuthentication(), user.getUsername()
					+ " UPDATED HIS/HER ACCOUNT");

			response.setMessage("Update successful!");
			response.setStatus(true);

			// clear session
			SecurityContextHolder.clearContext();

		} else {

			response.setMessage("An error has occurred.");
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
