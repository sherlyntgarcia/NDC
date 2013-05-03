package com.ndc.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ndc.app.model.Log;
import com.ndc.app.service.LoggerService;

@Controller
@RequestMapping(value="/dashboard/admin/export/logs*")
public class ContentController {
	
	@Autowired
	@Qualifier("loggerService")
	private LoggerService loggerService; 

	@RequestMapping
	public String generateLogs(Model model) {
		
		List<Log> logs = loggerService.getAll();
		model.addAttribute("generatedLogs", logs);
		
		return "admin/adminManageLogs";
		
	}
	
}
