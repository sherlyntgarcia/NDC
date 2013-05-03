package com.ndc.app.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ndc.app.AppHelper;
import com.ndc.app.util.PropertiesUtil;

@Controller
public class ResourceController {
	
	@RequestMapping(value = "/download/{category}/{fileName}", method = RequestMethod.GET)
	public String getFile(@PathVariable(value="category") String category, @PathVariable(value="fileName") String fileName, HttpServletResponse response) throws IOException {
		
		//choose an upload dir
		String uploadDir = PropertiesUtil.getProperty("default.upload.dir");
		if(category.equals(AppHelper.ASEAN)) {
			uploadDir = PropertiesUtil.getProperty("upload.dir.asean"); 
		} else if(category.equals(AppHelper.MINING)) {
			uploadDir = PropertiesUtil.getProperty("upload.dir.mining");
		} else if(category.equals(AppHelper.ENERGY)) {
			uploadDir = PropertiesUtil.getProperty("upload.dir.energy");
		} else if(category.equals(AppHelper.INDUSTRIAL)) {
			uploadDir = PropertiesUtil.getProperty("upload.dir.industrial");
		} else if(category.equals(AppHelper.REAL_ESTATE)) {
			uploadDir = PropertiesUtil.getProperty("upload.dir.realestate");
		} else if(category.equals(AppHelper.OTHERS)) {
			uploadDir = PropertiesUtil.getProperty("upload.dir.others");
		}
		
		File file = new File(uploadDir + fileName);
		OutputStream outputStream = response.getOutputStream();
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
		response.setContentType("application/pdf");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		IOUtils.copy(fileInputStream, outputStream);
		
		outputStream.flush();
		outputStream.close();
		fileInputStream.close();
		
		return null;
		
	}

}
