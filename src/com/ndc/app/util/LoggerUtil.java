package com.ndc.app.util;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import com.ndc.app.model.Log;
import com.ndc.app.service.LoggerService;

@Component
public class LoggerUtil {
	
	@Autowired
	@Qualifier("loggerService")
	private LoggerService loggerService;
	
	private static final Logger logger = Logger.getLogger(LoggerUtil.class);
	
	public void log(Authentication auth, String message) {
		
		Log log = new Log();
		log.setAccessTime(new Date());
		log.setDescription(message);
		
		if(auth != null) {
			log.setLoggedBy(auth.getName());
		} else {
			log.setLoggedBy("NDC User");
		}
		
		loggerService.insertLog(log);
		
		//console-based log
		logger.info("//////////////////////////////////////////////////////////");
		logger.info("Log Details:");
		logger.info("Logged by: " + log.getLoggedBy());
		logger.info("Time logged: " + log.getAccessTime());
		logger.info("Description: " + log.getDescription());
		logger.info("//////////////////////////////////////////////////////////");
		
	}

}
